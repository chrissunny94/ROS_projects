#!/bin/sh
git config --global user.name "Chris Sunny Thaliyath (RBEI/ESU1)"
git config --global user.email "Thaliyath.ChrisSunny@in.bosch.com"
#git config --global credential.helper cache
#git config --global credential.helper cache
# Set git to use the credential memory cache

git config --global credential.helper 'cache --timeout=3600'
# Set the cache to timeout after 1 hour (setting is in seconds)

#git pull origin TorqueBasedSteeringWithPid
git checkout master
git add .
git add -A

git commit -m "$1"
git push -u origin master
