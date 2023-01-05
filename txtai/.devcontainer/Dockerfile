FROM mcr.microsoft.com/devcontainers/python:0-3.9

# Copy environment.yml (if found) to a temp location so we update the environment. Also
# copy "noop.txt" so the COPY instruction does not fail if no environment.yml exists.
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt \
    && rm -rf /tmp/requirements.txt

WORKDIR /workspaces/txtai/
COPY ./txtai ./txtai
RUN pip install -U pip

RUN cd ./txtai && \
    pip install -e .[dev]
# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
