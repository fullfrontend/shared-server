configure_apache() {
  info "Configuring apache"
  a2dissite 000-default >&4
  a2dismod php8.1 >&4
  a2dismod mpm_prefork >&4
  a2enmod mpm_event proxy_fcgi setenvif ssl >&4
  a2enconf php8.1-fpm >&4
}
