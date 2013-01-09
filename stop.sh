#!/bin/sh
cd /srv/http/otte.rs
exec thin stop --pid /run/otters/otte.rs.pid
