FROM dangerous/ruby

RUN mkdir /opt/app
WORKDIR /opt/app

RUN mkdir /opt/app/shared
RUN mkdir /opt/app/shared/log
RUN mkdir /opt/app/shared/pids

ADD code/Gemfile /opt/app/Gemfile
ADD code/Gemfile.lock /opt/app/Gemfile.lock
RUN /bin/bash -l -c "bundle install"

ADD code /opt/app

ADD config/start-server.sh /usr/bin/start-server
ADD config/unicorn.rb /opt/app/config/unicorn.rb
RUN chmod +x /usr/bin/start-server

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Publish port 8080
EXPOSE 8080

# Start the Unicorn server
ENTRYPOINT /usr/bin/start-server
