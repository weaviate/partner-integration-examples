---
sidebar_label: 'Profiling'
---

# Introduction

This document will explain how to profile a running txtai [API server](https://neuml.github.io/txtai/api/) using [py-spy](https://github.com/benfred/py-spy).

:::tip
You can also use py-spy to profile a python script. Just run `py-spy record -o profile.svg -- python myscript.py`
:::

## Step 1: Start the server

Run this command to start the server:

```bash
CONFIG=/workspaces/txtai/notebooks/weaviate/app.yml uvicorn txtai.api:app
```

## Step 2: Note the server's PID

The server will print it's PID as part of the boot process. For example, in the following output:

```bash
INFO:     Started server process [18007]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
INFO:     Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
```
the server's PID is 18007.

## Step 3: Start recording with py-spy at the server's PID

Run this command to profile the server and save the output to a file named `profile.svg`:

```bash
sudo py-spy record -o profile-weaviate.svg --pid 18007
```

## Step 4: Make a few calls to the server

For example, if you would like to profile the `index` workflow, then run the following commands about 10 times:

```bash
curl -X 'POST' \
  'http://localhost:8000/workflow' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "index",
  "elements": [
     "Correct", "Not what we hoped"
  ]
}'
```

## Step 5: Stop recording with py-spy

Press `Ctrl+c` to stop the recording.

## Step 6: Analyze the results

Analyze the flamegraph in `profile.svg` to idenfity the bottleneck(s) in the code.