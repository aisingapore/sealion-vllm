# AI Singapore SEA-LION model served by vLLM inference server with Docker Compose

## Requirements
- [Docker](https://docs.docker.com/engine/install/)
- GPU: compute capability 7.0 or higher (e.g., V100, T4, RTX20xx, A100, L4, H100, etc.)
- CUDA 12.1
- Check https://docs.vllm.ai/en/latest/getting_started/installation.html#requirements for the up to date requirements
- 80GB of disk storage for the model and docker image

## SEA-LION
This section describes the setup of the SEA-LION models.

### Llama-SEA-LION-v3-8B-IT
- Download [Llama-SEA-LION-v3-8B-IT](https://huggingface.co/aisingapore/Llama-SEA-LION-v3-8B-IT).
- Copy the model or add a symbolic link in the `models` directory. The path is `./models/Llama-SEA-LION-v3-8B-IT`. For example, if the model was downloaded to `~/downloads/Llama-SEA-LION-v3-8B-IT`, the symbolic link is added by:
  ```bash
  ln -s ~/downloads/Llama-SEA-LION-v3-8B-IT models/
  ```

### Gemma-SEA-LION-v3-9B-IT
- Download [Gemma-SEA-LION-v3-9B-IT](https://huggingface.co/aisingapore/Gemma-SEA-LION-v3-9B-IT).
- Copy the model or add a symbolic link in the `models` directory. The path is `./models/Gemma-SEA-LION-v3-9B-IT`. For example, if the model was downloaded to `~/downloads/Gemma-SEA-LION-v3-9B-IT`, the symbolic link is added by:
  ```bash
  ln -s ~/downloads/Gemma-SEA-LION-v3-9B-IT models/
  ```
- Set `MODEL_NAME`.
  ```bash
   export MODEL_NAME=Gemma-SEA-LION-v3-9B-IT
   ```

## Start vLLM
- Start the service.
  ```bash
  docker compose up
  ```
- [vLLM](https://docs.vllm.ai/en/stable/) is deployed as a server that implements the OpenAI API protocol. By default, it starts the server at http://localhost:8000. This server can be queried in the same format as OpenAI API. For example, list the models:
  ```bash
  curl http://localhost:8000/v1/models
  ```
- Test the service. Update the model name accordingly.
  ```bash
  curl http://localhost:8000/v1/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "Llama-SEA-LION-v3-8B-IT",
        "prompt": "Artificial Intelligence is",
        "max_tokens": 20,
        "temperature": 0.8,
        "repetition_penalty": 1.2
    }'
  ```

## Customisation
- To use another model:
  - Download the model to the ```models``` directory.
  - Update the ```$MODEL_NAME``` environment variable. For example, if the model is downloaded to ```./models/foo-model-30b```:
    ```bash
    export MODEL_NAME=foo-model-30b
    ```
