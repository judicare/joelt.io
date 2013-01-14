#!/bin/sh
# Your assigned port range is 39410-39419, and you may use these for anything you want.
# Your HTTP server should use port 39410. If you want to start more processes, just let me know.

# We need to check out your source code.
cd /mnt/storage/otte.rs.git
GIT_WORK_TREE=/srv/http/otte.rs git checkout -f HEAD

# I've set this up to install gems with bundler, and then start any rack app with a config.ru.
cd /srv/http/otte.rs
bundle install --deployment || exit 1

# Looks like we have to do a few special things for rails
RAILS_ENV=production bundle exec rake assets:precompile db:migrate || exit 1

exec bundle exec thin start --port 39410 --env production --daemonize --pid /run/otters/otte.rs.pid
