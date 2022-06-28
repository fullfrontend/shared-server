

configure_php() {
  # config php
  info "Configuring PHP"
  cat <<EOF >/etc/php/8.1/fpm/conf.d/00-additional-rules.ini
memory_limit = -1
upload_max_filesize = 32M
post_max_size = 48M
max_execution_time = 600
max_input_vars = 3000
max_input_time = 1000
EOF
}
