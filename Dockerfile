FROM node:20.14-bullseye-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    build-essential \
    libvips-dev \
    && rm -rf /var/lib/apt/lists/*

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN npm install -g pnpm && pnpm add -g turbo@2.0.14