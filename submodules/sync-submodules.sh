#!/bin/bash
sync_submodules() {
	git submodule deinit --all -f
	git submodule init
	git submodule update
}

sync_submodules
