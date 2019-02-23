# frozen_string_literal: true

app_name = 'requisicao_service'
app_path = "/opt/vagas/#{app_name}"

# Should be 'production' by default, otherwise use other env
rails_env = 'production'

# Set unicorn options
worker_processes 3
preload_app true
timeout 5
listen "/tmp/#{app_name}.socket", backlog: 64

# Spawn unicorn master worker for user apps (group: apps)
user app_name

# Fill path to your app
working_directory app_path

# Log everything to one file
stderr_path "/var/log/#{app_name}/error.log"
stdout_path '/dev/null'

# Set master PID location
pid "/tmp/#{app_name}.pid"
