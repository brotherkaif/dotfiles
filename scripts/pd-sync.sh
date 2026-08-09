#!/usr/bin/env bash
# pd-sync — two-way sync between local directories and Proton Drive,
# wrapping the official `proton-drive` CLI (filesystem upload/download).
#
# usage: pd-sync <push|pull> <profile>
#   push  — upload local dir  → remote dir   (proton-drive filesystem upload)
#   pull  — download remote dir → local dir  (proton-drive filesystem download)
#   profile: music-dj | music-library | docs-dj-branding
#
# First-time authentication (browser OAuth, once per machine):
#   macOS:              proton-drive auth login
#   NixOS (desktop):    proton-drive auth login
#   NixOS (headless):   dbus-run-session -- proton-drive auth login
# Credentials live in Keychain Services (macOS) or libsecret (Linux).

set -euo pipefail

if [[ $# -ne 2 ]]; then
	echo "usage: pd-sync <push|pull> <profile>" >&2
	echo "profiles: music-dj, music-library, docs-dj-branding" >&2
	exit 1
fi

op="$1"
profile="$2"

case "${profile}" in
	music-dj)
		local_dir="${HOME}/Music/DJ"
		remote_dir="/my-files/03 RESOURCES/Music/DJ"
		;;
	music-library)
		local_dir="${HOME}/Music/LIBRARY"
		remote_dir="/my-files/03 RESOURCES/Music/LIBRARY"
		;;
	docs-dj-branding)
		local_dir="${HOME}/Documents/DJ/Branding"
		remote_dir="/my-files/02 AREAS/DJ/Branding"
		;;
	*)
		echo "pd-sync: unknown profile '${profile}'" >&2
		echo "valid profiles: music-dj, music-library, docs-dj-branding" >&2
		exit 1
		;;
esac

if [[ ! -d "${local_dir}" ]]; then
	echo "pd-sync: local directory '${local_dir}' does not exist" >&2
	exit 1
fi

case "${op}" in
	push)
		cmd=(proton-drive filesystem upload "${local_dir}" "${remote_dir}")
		;;
	pull)
		# proton-drive treats the local arg as the PARENT folder of where the
		# remote node is placed. The leaf names match on both sides for every
		# profile, so pass the local dir's parent and let the CLI recreate the
		# leaf at the exact local path (remote .../DJ → local .../DJ, not .../DJ/DJ).
		cmd=(proton-drive filesystem download "${remote_dir}" "${local_dir%/*}")
		;;
	*)
		echo "pd-sync: unknown operation '${op}' (expected push or pull)" >&2
		exit 1
		;;
esac

echo "> ${cmd[*]}"
"${cmd[@]}"