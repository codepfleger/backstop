FROM ruby:2.3

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
RUN bundle install
RUN gem uninstall rake
RUN rbenv global 2.1.1
RUN rbenv rehash
RUN rbenv uninstall rake
RUN rbenv global 2.2.0
RUN rbenv rehash
RUN gem install rake

COPY . /usr/src/app

EXPOSE 3000
CMD ["rackup", "-o", "0.0.0.0", "-p", "3000", "-s", "thin" ]
