#!/bin/bash
#####################################################################
#
# Copyright (c) 2022-present, Birchi (https://github.com/Birchi)
# All rights reserved.
#
# This source code is licensed under the MIT license.
#
#####################################################################
# Container
container_name=my_container
# Image
image_name=my_image
image_version=latest
# Build
build_file_path=./Dockerfile
build_cleanup_old_images=true
# Start
start_parameters=
start_cleanup_old_containers=true
start_cleanup_container_same_name=true
