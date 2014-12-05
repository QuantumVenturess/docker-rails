#!/bin/bash
source /etc/profile.d/rvm.sh
bundle exec unicorn -d -p 8080 -c /opt/app/config/unicorn.rb
