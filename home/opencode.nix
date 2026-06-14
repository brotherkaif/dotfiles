{ config, pkgs, lib, ... }:

{
  xdg.configFile."opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    model = "ollama/gemma4:12b";
    small_model = "ollama/qwen2.5-coder:7b";

    provider = {
      ollama = {
        name = "Ollama";
        options = {
          baseURL = "http://localhost:11434/v1";
        };
        models = {
          "gemma4:12b" = {
            name = "Gemma 4 12B (Primary)";
          };
          "qwen2.5-coder:7b" = {
            name = "Qwen 2.5 Coder 7B";
          };
          "qwen2.5-coder:14b" = {
            name = "Qwen 2.5 Coder 14B";
          };
          "deepseek-r1:7b" = {
            name = "DeepSeek R1 7B";
          };
          "deepseek-r1:14b" = {
            name = "DeepSeek R1 14B";
          };
        };
      };
    };
  };
}
