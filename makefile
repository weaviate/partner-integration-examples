get-submodules:
	git submodule update --init --recursive

update-submodules: get-submodules
	git submodule update --remote