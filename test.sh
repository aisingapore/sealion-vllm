#!/bin/bash

# Set the default value of MODEL_NAME
: ${MODEL_NAME:="Llama-SEA-LION-v3-8B-IT"}

curl http://localhost:8000/v1/completions \
    -H "Content-Type: application/json" \
    -d "{
        \"model\": \"${MODEL_NAME}\",
        \"prompt\": \"Artificial Intelligence is\",
        \"max_tokens\": 20,
        \"temperature\": 0.8,
        \"repetition_penalty\": 1.2
    }"
