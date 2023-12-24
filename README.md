## Custom Ollama Docker image with pre-load models

Build Ollama Docker image with pulling LLMs as build-time variable.

### Usage example

If you want to pull the phi:2.7b and phi:2.7b-chat-v2-q4_0 SMLs and build an image named epflsisb/custom-ollama:latest

```
git clone
docker build --build-arg models="phi:2.7b phi:2.7b-chat-v2-q4_0" -t epflsisb/custom-ollama:latest .
```

The to run a container

```
docker run -d --name custom-ollama -p 11434:11434 epflsisb/custom-ollama:latest
```

Example of request on server 

```
import requests
import json

url = "http://localhost:11434/api/generate"

payload = json.dumps({
  "model": "phi:2.7b",
  "prompt": "Instruct: give a short definition of AI.\nOutput:",
  "format": "json",
  "stream": False
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
```
Example of response

```
{"model":"phi:2.7b","created_at":"2023-12-24T10:36:54.255670429Z","response":"{\n  \"text\": \"Artificial Intelligence (AI) refers to the simulation of human intelligence in machines that are programmed to think and learn like humans, enabling them to perform tasks that normally require human intelligence.\"\n}\n","done":true,"context":[11964,25,317,8537,1022,257,11040,2836,290,281,11666,4430,8796,13,383,8796,3607,7613,7429,284,262,2836,338,2683,13,198,12982,25,20689,25,1577,257,1790,6770,286,9552,13,198,26410,25,198,48902,29164,198,50286,1,5239,1298,366,8001,9542,9345,357,20185,8,10229,284,262,18640,286,1692,4430,287,8217,326,389,27402,284,892,290,2193,588,5384,11,15882,606,284,1620,8861,326,7685,2421,1692,4430,526,198,92,198],"total_duration":9715838716,"load_duration":1183750570,"prompt_eval_count":43,"prompt_eval_duration":2654856000,"eval_count":46,"eval_duration":5873091000}
```
### On Docker Hub

An image is available on Docker Hub, builded with :

- the 4-bit quantizied version of the Phi-2 Microsoft LLM : [phi:2.7b](https://ollama.ai/library/phi:2.7b) (3B parameters, 1.6GB)
- the Nous Research 4-bit quantizied variant of llama-2 : [nous-hermes:7b-llama2](https://ollama.ai/library/nous-hermes:7b-llama2) (7B parameters, 3.8GB)

[https://hub.docker.com/repository/docker/epflsisb/custom-ollama/general](https://hub.docker.com/repository/docker/epflsisb/custom-ollama/general)

### Ollama 

List of availables models : [https://ollama.ai/library](https://ollama.ai/library)

Prompting the models : see tags doc for each model, for example [https://ollama.ai/library/phi:2.7b](https://ollama.ai/library/phi:2.7b)

