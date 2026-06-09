FROM docker/sandbox-templates:shell
ARG MY_PI_VERSION=latest

LABEL org.opencontainers.image.title="Docker Sandbox Template for My Pi Coding Agent"
LABEL org.opencontainers.image.description="Sandboxed environment for running My Pi coding agent"
LABEL org.opencontainers.image.version="${MY_PI_VERSION}"
LABEL org.opencontainers.image.licenses="MIT"
LABEL com.docker.sandboxes="templates"
LABEL com.docker.sandboxes.base="docker/sandbox-templates:shell"
LABEL com.docker.sandboxes.flavor="my-pi"

USER agent
RUN sudo apt update && sudo apt install build-essential -y && sudo apt clean
COPY pnpm-workspace.yaml ./
COPY internal-package.json ./package.json
RUN npm i -g corepack && corepack enable
RUN pnpm i
COPY pnpm-lock.yaml ./
CMD [ "pnpm", "my-pi" ]