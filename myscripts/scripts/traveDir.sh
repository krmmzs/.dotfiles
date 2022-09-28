#!/bin/bash

function traverse() {
for file in "$1"/*
do
    if [ ! -d "${file}" ] ; then
        echo "${file} is a file"
    else
        echo "entering recursion with: ${file}"
        traverse "${file}"
    fi
done
}

function main() {
    if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then
        echo "Usage: $0 DIRECTORY" >&2
        exit 1
    fi
    traverse "$1"
}

main "$1"
