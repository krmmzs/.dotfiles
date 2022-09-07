#!/bin/sh

value=`cat subscription.txt`
echo $value
mv ./config.yaml config_old.yaml &&
wget -O config.yaml "$value"
