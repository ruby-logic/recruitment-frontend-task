#!/usr/bin/env bash

source ~/.rvm/scripts/rvm
cd "${0%/*}"

bundle exec pumactl -p tmp/pids/puma.pid restart
