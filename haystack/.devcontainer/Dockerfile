FROM deepset/haystack-cpu:a2c160e7d8e706cd8184eb984db5882350d9d876

# Copy environment.yml (if found) to a temp location so we update the environment. Also
# copy "noop.txt" so the COPY instruction does not fail if no environment.yml exists.
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt \
    && rm -rf /tmp/requirements.txt

WORKDIR /workspaces/haystack/
COPY ./haystack ./haystack
RUN pip install -U pip
RUN cd ./haystack && \
    pip install -e .[all]
# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
