@path = "/srv/http/otte.rs"

worker_processes 1
working_directory @path
listen "/tmp/otte.rs.unicorn.sock", :backlog => 64
timeout 30
pid "/run/otters/otte.rs.unicorn.pid"
stderr_path "#@path/log/unicorn.stderr.log"
stdout_path "#@path/log/unicorn.stdout.log"
preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true
check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
