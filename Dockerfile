FROM node:20.14-bullseye-slim

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    build-essential \
    libvips-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g pnpm \
    && pnpm add -g turbo@2.3.3 \
    && apt-get purge -y --auto-remove build-essential \
    && apt-get clean
