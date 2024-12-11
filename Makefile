# Location of our ZS source dir
zs_directory := /d/dev/zs
zs_binary_name := myzs.exe

pub_directory := .pub

.PHONY: build-site
build-site:
	echo hello
	${zs_directory}/${zs_binary_name} -p build

.PHONY: build-zs
build-zs:
	echo "building zs..."
	cd ${zs_directory} && $(MAKE) build
	echo "zs build complete"

.PHONY: clean
clean:
	rm -rf ${pub_directory}