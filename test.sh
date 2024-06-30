curl http://localhost:8000/v1/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "sea-lion-7b-instruct-gptq",
        "prompt": "Artificial Intelligence is",
        "max_tokens": 100,
        "temperature": 0.8,
        "repetition_penalty": 1.2
    }'