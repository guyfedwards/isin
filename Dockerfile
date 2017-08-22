FROM ruby:2.4.1-alpine3.6

# RUN apk update \
#     && apk upgrade \
#     && apk add coreutils \
#     && rm -rf /var/cache/apk/*

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN bundle install

EXPOSE 2345

CMD ["ruby", "/app/main.rb"]
# CMD ["ruby ./app/main.rb"]
