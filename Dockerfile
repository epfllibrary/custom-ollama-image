# syntax=docker/dockerfile:1
FROM ollama/ollama as ollama

ARG models

RUN ollama serve & sleep 2 && for model in $models; do ollama pull $model ; done;

EXPOSE 11434

CMD ["serve"]