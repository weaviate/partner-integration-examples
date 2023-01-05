get-submodules:
	git submodule update --init --recursive

update-submodules:
	git submodule update --remote --recursive