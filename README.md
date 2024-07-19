# AI Singapore SEA-LION model served by vLLM inference server with Docker Compose

## Requirements
- [Docker](https://docs.docker.com/engine/install/)
- GPU: compute capability 7.0 or higher (e.g., V100, T4, RTX20xx, A100, L4, H100, etc.)
- CUDA 12.1
- Check https://docs.vllm.ai/en/latest/getting_started/installation.html#requirements for the up to date requirements

## Quick Start
- Download [SEA-LION-7B-Instruct-GPTQ](https://huggingface.co/aisingapore/sea-lion-7b-instruct-gptq)
- Copy the model or add a symbolic link in the ```models``` directory. The path is ```./models/sea-lion-7b-instruct-gptq```. For example, if the model was downloaded to ```~/models/sea-lion-7b-instruct-gptq```, the symbolic link is added by:
  ```bash
  ln -s ~/models/sea-lion-7b-instruct-gptq models/
  ```
- Start the service.
  ```bash
  docker compose up
  ```
- [vLLM](https://docs.vllm.ai/en/stable/) is deployed as a server that implements the OpenAI API protocol. By default, it starts the server at http://localhost:8000. This server can be queried in the same format as OpenAI API. For example, list the models:
  ```bash
  curl http://localhost:8000/v1/models
  ```
- Test the service.
  ```bash
  curl http://localhost:8000/v1/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "sea-lion-7b-instruct-gptq",
        "prompt": "Artificial Intelligence is",
        "max_tokens": 100,
        "temperature": 0.8,
        "repetition_penalty": 1.2
    }'
  ```
  <img width="1094" alt="sealion-vllm-test" src="https://github.com/aisingapore/sealion-vllm/assets/62876165/99153fd5-afd7-404f-96ec-cd57e07ce45e">



## Customisation
- To use another model:
  - Download the model to the ```models``` directory.
  - Update the ```$MODEL_NAME``` environment variable. For example, if the model is downloaded to ```./models/foo-model-30b```:
    ```bash
    export $MODEL_NAME=foo-model-30b
    ```

## Acknowledgements
- Kudos to the [SEA-LION Team](https://huggingface.co/aisingapore/sea-lion-7b-instruct-gptq#the-team) for their good work and adding [vLLM support](https://github.com/aisingapore/sealion/tree/vllm/vllm).
- [vLLM](https://github.com/vllm-project/vllm) for providing a fast and easy-to-use library for LLM inference and serving.
