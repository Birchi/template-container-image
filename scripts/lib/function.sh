#!/bin/bash
#####################################################################
#
# Copyright (c) 2022-present, Birchi (https://github.com/Birchi)
# All rights reserved.
#
# This source code is licensed under the MIT license.
#
#####################################################################
function detect_os() {
    os="LINUX"
    case "$(uname -s)" in
        "Darwin") os="MacOS" ;;
    esac
    echo ${os}
}

function log() {
    log_level=${1}
    log_message=$2
    if [[ "$(detect_os)" == "MacOS" ]] ; then
        echo -e "$(date +"%Y-%m-%d %H:%M:%S") ${log_level}\t $log_message"
    else
        echo -e "$(date +"%Y-%m-%d %H:%M:%S.%3N") ${log_level}\t $log_message"
    fi
}

function validation_error() {
    echo $1
    exit 1
}

function error() {
    log ERROR "$1"
    exit 1
}

function detect_container_engine() {
    if command -v docker &> /dev/null ; then
        echo "docker"
    elif command -v podman &> /dev/null ; then
        echo "podman"
    else
        echo "Cannot detect container engine."
        exit 1
    fi
}

function get_image_id_by_image_name () {
    $(detect_container_engine) image ls -a --filter "reference=${1}:${2:-latest}" -q
}

function get_image_names_by_image_id () {
    $(detect_container_engine) image ls -a | grep "$1" | awk '{print $1":"$2}'
}

function get_containers_by_image_id () {
    $(detect_container_engine) container ls -a --filter "ancestor=$1" -q
}