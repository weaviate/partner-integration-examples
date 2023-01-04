FROM mcr.microsoft.com/devcontainers/python:0-3.9

# Copy environment.yml (if found) to a temp location so we update the environment. Also
# copy "noop.txt" so the COPY instruction does not fail if no environment.yml exists.
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt \
    && rm -rf /tmp/requirements.txt

WORKDIR /workspaces/haystack/
COPY ./haystack ./haystack
RUN pip install -U pip

RUN wget --no-check-certificate https://dl.xpdfreader.com/xpdf-tools-linux-4.04.tar.gz && \
    tar -xvf xpdf-tools-linux-4.04.tar.gz && sudo cp xpdf-tools-linux-4.04/bin64/pdftotext /usr/local/bin
    
RUN apt update && \
    apt-get install -y libsndfile1 ffmpeg

RUN cd ./haystack && \
    pip install -e .[all] && \
    cd ./rest_api && \
    pip install -e .[all]
# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
