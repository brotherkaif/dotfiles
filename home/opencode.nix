{ config, pkgs, lib, ... }:

{
  xdg.configFile."opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    model = "mlx/default_model";
    small_model = "mlx/default_model";

    provider = {
      mlx = {
        npm = "@ai-sdk/openai-compatible";
        name = "MLX (Local)";
        options = {
          baseURL = "http://127.0.0.1:8080/v1";
        };
        models = {
          "default_model" = {
            name = "Default MLX Model";
          };
        };
      };
      ollama = {
        npm = "@ai-sdk/openai-compatible";
        name = "Ollama (Local)";
        options = {
          baseURL = "http://localhost:11434/v1";
        };
        models = {
          "gemma4:12b" = {
            name = "Gemma 4 12B";
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
