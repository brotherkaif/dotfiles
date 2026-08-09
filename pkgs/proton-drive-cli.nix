# proton-drive-cli: official command-line client for Proton Drive
# https://proton.me/download/drive/cli/index.html
# Not packaged in nixpkgs, so we fetch Proton's pre-built single binary.
# It's a Bun-bundled binary; credentials are stored via the Secret Service
# (libsecret) on Linux and Keychain natively on macOS.
# Headless/SSH note: without a running Secret Service daemon, log in/run with
#   PROTON_DRIVE_CREDENTIALS_STORE=unsafe_file proton-drive auth login   # plaintext file store
#   pass init <key> && PROTON_DRIVE_CREDENTIALS_STORE=pass ...           # password store
# or wrap in `dbus-run-session -- proton-drive auth login` (KDE Plasma
# provides a Secret Service via ksecretsservice when unlocked).
{
  lib,
  fetchurl,
  stdenvNoCC,
  autoPatchelfHook,
  makeWrapper,
  libsecret,
  glib,
  pcre2,
  libffi,
  libselinux,
  libgpg-error,
  util-linux,
  libgcrypt,
  xdg-utils,
  writableTmpDirAsHomeHook,
}:

let
  # Published binaries and their SHA-512 checksums, per
  # https://proton.me/download/drive/cli/index.html (release 2026-07-31).
  sources = {
    x86_64-linux = {
      url = "https://proton.me/download/drive/cli/0.7.0/linux-x64/proton-drive";
      hash = "sha512-Wlr/y+wE6pJqMtEOI2wTQiJ/G21BbLeX+I+UOyxPHc9TtYl6EV8cGqnOjOkv1jfhxQvSI7BIZld2gfBYTszbxg==";
    };
    aarch64-linux = {
      url = "https://proton.me/download/drive/cli/0.7.0/linux-arm64/proton-drive";
      hash = "sha512-c8aAFxcbV/ThEmsUd90Smo2OcYn+QjhxRfzLSAijrB2jIO8Q2DdUNkcG3oDsxwDdjgQyHw1gwgLiDVRvkwTvww==";
    };
    aarch64-darwin = {
      url = "https://proton.me/download/drive/cli/0.7.0/darwin-arm64/proton-drive";
      hash = "sha512-e1/0/1nn0WSmKYpiObjS97H/seupTlPek6Y367EMYtEAYywo6sFE5yJ1XChFT+kze5zD9dCcmW4X7tmgeZLS7Q==";
    };
    x86_64-darwin = {
      url = "https://proton.me/download/drive/cli/0.7.0/darwin-x64/proton-drive";
      hash = "sha512-FGu65y4KbZtp/ohxERW1f8LnAEHUFWwEooCEUDPsLRlr2v6ziOKJjbXfn8uJB+h4x/eSDP5EgwfvDL01mRMzjw==";
    };
  };

  source =
    sources.${stdenvNoCC.hostPlatform.system}
    or (throw "proton-drive-cli: unsupported platform ${stdenvNoCC.hostPlatform.system}");

  secretsLibs = [ libsecret glib pcre2 libffi libselinux libgpg-error util-linux libgcrypt ];
in

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "proton-drive-cli";
  version = "0.7.0";

  src = fetchurl {
    inherit (source) url hash;
  };

  dontUnpack = true;

  strictDeps = true;
  __structuredAttrs = true;

  nativeBuildInputs =
    [ makeWrapper ]
    ++ lib.optionals stdenvNoCC.hostPlatform.isLinux [ autoPatchelfHook ];
  buildInputs = lib.optionals stdenvNoCC.hostPlatform.isLinux secretsLibs;

  installPhase = ''
    runHook preInstall
    install -Dm755 $src $out/bin/proton-drive
    runHook postInstall
  '';

  postFixup = lib.optionalString stdenvNoCC.hostPlatform.isLinux ''
    wrapProgram $out/bin/proton-drive \
      --suffix LD_LIBRARY_PATH : "${lib.makeLibraryPath secretsLibs}" \
      --suffix PATH : ${lib.makeBinPath [ xdg-utils ]}
  '';

  dontStrip = true;

  nativeInstallCheckInputs = lib.optionals stdenvNoCC.hostPlatform.isLinux [ writableTmpDirAsHomeHook ];
  doInstallCheck = stdenvNoCC.hostPlatform.isLinux;
  installCheckPhase = ''
    runHook preInstallCheck

    # Verify the linked binary runs and reports its version. The `unsafe_file`
    # store avoids needing a D-Bus Secret Service daemon inside the sandbox.
    set +e
    PROTON_DRIVE_CREDENTIALS_STORE=unsafe_file PROTON_DRIVE_UNSAFE_CACHE=1 \
      $out/bin/proton-drive version > $TMPDIR/version.out 2>&1
    status=$?
    set -e
    echo "proton-drive version (exit $status):" >&2
    cat $TMPDIR/version.out >&2
    grep -q "cli-drive@${finalAttrs.version}" $TMPDIR/version.out

    runHook postInstallCheck
  '';

  meta = {
    description = "Command-line interface for Proton Drive";
    homepage = "https://proton.me/download/drive/cli/index.html";
    license = lib.licenses.mit;
    mainProgram = "proton-drive";
    platforms = builtins.attrNames sources;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
})