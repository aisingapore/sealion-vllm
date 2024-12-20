#!/bin/bash

# Set the default value of MODEL_NAME
: ${MODEL_NAME:="llama3-8b-cpt-sea-lionv2.1-instruct"}

curl http://localhost:8000/v1/completions \
    -H "Content-Type: application/json" \
    -d "{
        \"model\": \"${MODEL_NAME}\",
        \"prompt\": \"Artificial Intelligence is\",
        \"max_tokens\": 20,
        \"temperature\": 0.8,
        \"repetition_penalty\": 1.2
    }"
