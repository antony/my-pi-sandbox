# casing

A small sandbox for running **My Pi** in a Docker-based shell environment.

## Overview

This workspace packages the [`my-pi`](internal-package.json) CLI into a container built from [Dockerfile](Dockerfile). The image is based on Docker's shell sandbox template and is set up to install and run `my-pi` with `pnpm`.

## What the container does

The build in [Dockerfile](Dockerfile) does the following:

- Starts from `docker/sandbox-templates:shell`
- Installs `build-essential`
- Copies [pnpm-workspace.yaml](pnpm-workspace.yaml)
- Copies [internal-package.json](internal-package.json) into the image as `package.json`
- Enables Corepack
- Installs dependencies with `pnpm`
- Uses [pnpm-lock.yaml](pnpm-lock.yaml) for dependency locking
- Starts the container with:

  `pnpm my-pi`

## Project package setup

The package definition in [internal-package.json](internal-package.json) shows that this sandbox:

- Is named `casing`
- Uses `pnpm@11.5.2`
- Expects Node.js `>=25.x`
- Downloads the runtime automatically on failure
- Installs [`my-pi`](internal-package.json) as its main dependency

## Requirements

- Docker
- `docker buildx`
- Internet access during build, so `pnpm` can install dependencies

## Build the image

Build then run the sandbox image:

```sh
pnpm build
pnpm dev
```