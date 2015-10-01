FROM ubuntu:14.04
MAINTAINER Daniel Johansson <donnex@donnex.net>

RUN apt-get update && \
    apt-get install -y ruby ruby-dev build-essential libnotify-bin git-core curl && \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
    sudo apt-get install -y nodejs && \
    gem install sass && \
    gem install compass && \
    gem install breakpoint && \
    npm install -g gulp && \
    npm install -g bower && \
    npm install -g bower-installer && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /gulp

RUN npm install \
    gulp \
    gulp-jshint \
    gulp-compass \
    gulp-autoprefixer \
    gulp-concat \
    gulp-minify-css \
    gulp-notify \
    gulp-uglify \
    gulp-add-src \
    run-sequence \
    jshint-stylish \
    gulp-livereload

RUN useradd -ms /bin/bash assets
USER assets

ENTRYPOINT ["/usr/bin/gulp"]
