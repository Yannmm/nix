FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libvips \
    && rm -rf /var/lib/apt/lists/*
