FROM ruby:3.2.2
# yarnとnode.jsをインストールするための記述
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn
# 作業をするディレクトリ
WORKDIR /app
# ./srcを/appにコピー
COPY ./src /app
# ライブラリのインストール先を指定してbundle install
RUN bundle config --local set path 'vender/bundle' \
    && bundle install