#!/bin/sh
# Your assigned port range is 39410-39419, and you may use these for anything you want.
# Your HTTP server should use port 39410. If you want to start more processes, just let me know.

# I've set this up to install gems with bundler, and then start any rack app with a config.ru.
cd /srv/http/otte.rs
bundle install --deployment || exit 1
exec bundle exec thin start -p 39410 --pid /run/otters/otte.rs.pid
