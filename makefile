get-submodules:
	git submodule update --init --recursive

update-submodules: get-submodules
	pushd docarray/docarray && \
		git fetch && \
		git merge origin/main
	
	pushd haystack/haystack && \
		git fetch && \
		git merge origin/main
	
	pushd txtai/txtai && \
		git fetch && \
		git merge origin/master