#!/usr/bin/env bash
FROM python:3.8.1-slim

ENV PYTHONUNBUFFERED 1
EXPOSE 8000
EXPOSE 80
WORKDIR /app


RUN mkdir src
COPY ./requirements.txt .
COPY ./src ./src

RUN apt-get update && \
    apt-get -y install gcc mono-mcs
RUN pip install -r requirements.txt

CMD ["uvicorn", "--host", "0.0.0.0", "--port", "8000", "src.main:app"]
