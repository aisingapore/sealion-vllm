# SEA-LION is compatible with vLLM 0.3.3 and earlier
FROM vllm/vllm-openai:v0.3.3

# Install the einops package
RUN pip install einops
