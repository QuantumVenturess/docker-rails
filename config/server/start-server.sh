#!/bin/bash
cd /opt/web_app
source /etc/profile.d/rvm.sh
bundle exec unicorn -d -p 8080 -c /opt/web_app/config/unicorn.rb
