#!/bin/bash

case $1 in
    uninstall)
        sudo apt-get --purge remove "$2"
        ;;
    remove)
        sudo apt-get autoremove "$2"
        ;;
    clean)
        dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P
        ;;
    *)
        echo "uninstall: apt-get --purge remove <package>"
        echo "remove: apt-get autoremove <package>" 
        echo "clean: dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P"
        exit 2
esac
