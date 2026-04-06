{ config, pkgs, lib, ... }:

{
  xdg.configFile."crush/crush.json".text = builtins.toJSON {
    "$schema" = "https://charm.land/crush.json";
    providers = {
      ollama = {
        name = "Ollama";
        base_url = "http://localhost:11434/v1/";
        type = "openai-compat";
        models = [
          {
            name = "Qwen 2.5 1.5B";
            id = "qwen2.5:1.5b";
            context_window = 32768;
            default_max_tokens = 4096;
          }
          {
            name = "Qwen 2.5 7B";
            id = "qwen2.5:7b";
            context_window = 32768;
            default_max_tokens = 8192;
          }
          {
            name = "Qwen Coder 7B (Agentic)";
            id = "qwen2.5-coder:7b-instruct";
            context_window = 32768;
            default_max_tokens = 8192;
          }
          {
            name = "Qwen 3 30B";
            id = "qwen3:30b";
            context_window = 256000;
            default_max_tokens = 20000;
          }
        ];
      };
    };
  };
}
