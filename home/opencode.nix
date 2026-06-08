{ config, pkgs, lib, ... }:

{
  xdg.configFile."opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    model = "ollama/qwen2.5-coder:14b";
    small_model = "ollama/qwen2.5:7b";
    provider = {
      ollama = {
        npm = "@ai-sdk/openai-compatible";
        name = "Ollama";
        options = {
          baseURL = "http://localhost:11434/v1";
        };
        models = {
          "qwen2.5:1.5b" = {
            name = "Qwen 2.5 1.5B";
          };
          "qwen2.5:7b" = {
            name = "Qwen 2.5 7B";
          };
          "qwen2.5-coder:14b" = {
            name = "Qwen Coder 14B (Agentic)";
          };
          "qwen3:30b" = {
            name = "Qwen 3 30B";
          };
        };
      };
    };
  };
}
