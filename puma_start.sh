#!/usr/bin/env bash

source ~/.rvm/scripts/rvm
cd "${0%/*}"

bundle exec puma -e production -d
