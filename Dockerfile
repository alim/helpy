# This Dockerfile should be run from the parent directory of the helpy
# application.
FROM ruby:2.3.1

ENV HOME_DIR=/home/helpy
RUN mkdir $HOME_DIR

WORKDIR /home/helpy
COPY . $HOME_DIR

RUN bundle install

# Pre-compile Assets
RUN bundle exec rake assets:precompile

CMD ["support/start_app"]
