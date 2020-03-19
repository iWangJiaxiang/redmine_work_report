#
# docker build --build-arg=COMMIT=$(git rev-parse --short HEAD) \
# --build-arg=BRANCH=$(git name-rev --name-only HEAD) -t akiko/redmine_banner:latest .
#
#
FROM ruby:2.5
LABEL maintainer="Wang Jiaxiang <mail@wjx.me>" \
  description="Image to run Redmine and test plugin."

ARG BRANCH="master"
ARG COMMIT="commit_sha"

ENV COMMIT_SHA=${COMMIT}
ENV COMMIT_BRANCH=${BRANCH}

RUN mkdir /app

### get Redmine source
### Replace shell with bash so we can source files ###
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

### install default sys packeges ###

RUN  echo \
  deb http://ftp.cn.debian.org/debian/ buster main contrib non-free \
  deb http://ftp.cn.debian.org/debian/ buster-updates main contrib non-free \
  deb http://ftp.cn.debian.org/debian/ buster-backports main contrib non-free \
  deb http://ftp.cn.debian.org/debian-security buster/updates main contrib non-free \
  >/etc/apt/sources.list && \apt-get update
RUN apt-get install -qq -y --no-install-recommends \
  git vim subversion      \
  sqlite3 && rm -rf /var/lib/apt/lists/*

RUN cd /app && svn co http://svn.redmine.org/redmine/branches/4.1-stable/ redmine
WORKDIR /app/redmine

# add database.yml (for development, development with mysql, test)
RUN echo $'test:\n\
  adapter: sqlite3\n\
  database: /app/data/redmine_test.db\n\
  encoding: utf8mb4\n\
development:\n\
  adapter: sqlite3\n\
  database: /app/data/redmine_development.db\n\
  encoding: utf8mb4\n'\
  >> config/database.yml

# 配置ruby软件源
RUN bundle config --global mirror.https://rubygems.org https://gems.ruby-china.com
RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
RUN gem update bundler
# VScode Debug依赖
RUN gem install ruby-debug-ide debase

RUN bundle install --without postgresql rmagick mysql
RUN bundle exec rake db:migrate && bundle exec rake redmine:plugins:migrate \
  && bundle exec rake generate_secret_token

# app port
EXPOSE 3000
# debug ports
EXPOSE 1234
EXPOSE 26162

CMD ["rails", "server", "-b", "0.0.0.0"]
