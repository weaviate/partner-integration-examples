# Introduction

This repository contains examples on how to integrate weaviate with frameworks that support using weaviate as a document store. 

The examples are designed to run inside [development containers](https://containers.dev/).

# Usage

## First Steps

1. Clone this repo
2. Run `make get-submodules`

## Running an example (with VS Code + Docker)

The environment to run an example is brought up in the same way. For example, to run the txtai examples:

1. Use VS Code to open the [txtai](./txtai/) folder
2. You will be asked if you would like to reopen in the folder in a container.
3. Select `Reopen in Container`.
4. Open the [notebooks](./txtai/notebooks/) folder and run through each example.

Update the `docker-compose.yml` and/or `Dockerfile` files in the [.devcontainer](./txtai/.devcontainer) folder if you would like to edit the environment.