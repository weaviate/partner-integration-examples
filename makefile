SHELL:=/bin/bash

get-submodules:
	git submodule update --init --recursive

update-submodules:
	pushd docarray/docarray && \
		git pull origin main
	
	pushd haystack/haystack && \
		git pull origin main
	
	pushd txtai/txtai && \
		git pull origin master