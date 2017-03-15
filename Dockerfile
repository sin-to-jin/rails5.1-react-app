# これは開発環境用です
FROM ruby:2.4.0
LABEL maintainer "Keita Moromizato <keita.moromi@gmail.com>"

ENV APP_ROOT /var/app
ENV BUNDLE_PATH vendor/bundle
WORKDIR $APP_ROOT

RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN \
  npm install yarn -g && \
  echo 'gem: --no-document' >> ~/.gemrc && \
  cp ~/.gemrc /etc/gemrc && \
  chmod uog+r /etc/gemrc && \
  bundle config --global build.nokogiri --use-system-libraries && \
  bundle config --global jobs 4 && \
  gem install rails -v 5.1.0.beta1

EXPOSE 3000
CMD ['bin/rails', 's', '-b', '0.0.0.0']
