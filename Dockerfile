FROM dangerous/ruby

RUN mkdir /opt/web_app
WORKDIR /opt/web_app

RUN mkdir /opt/web_app/shared
RUN mkdir /opt/web_app/shared/log
RUN mkdir /opt/web_app/shared/pids

ADD rails_app/Gemfile /opt/web_app/Gemfile
ADD rails_app/Gemfile.lock /opt/web_app/Gemfile.lock
RUN /bin/bash -l -c "bundle install"

ADD rails_app /opt/web_app

ADD config/server/start-server.sh /usr/bin/start-server
ADD config/server/unicorn.rb /opt/web_app/config/unicorn.rb
RUN chmod +x /usr/bin/start-server

EXPOSE 8080

ENTRYPOINT /usr/bin/start-server
