# Copyright 2020 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#CMDS=cosi-controller-manager
all: reltools build
.PHONY: reltools
reltools: release-tools/build.make
release-tools/build.make:
	$(eval CURDIR := $(shell pwd))
	$(eval TMP := $(shell mktemp -d))
	$(shell cd ${TMP} && git clone git@github.com:kubernetes-sigs/container-object-storage-interface-spec.git)
	$(shell cp -r ${TMP}/container-object-storage-interface-spec/release-tools ${CURDIR}/)
	$(shell rm -rf ${TMP})  


# TODO uncomment and create a ./cmd/<executable_main_module>
#CMDS=<executable_main_module>

include release-tools/build.make