#!/bin/bash

bundle install
gem build cz_faker.gemspec
gem install cz_faker-${CI_COMMIT_TAG}.gem
