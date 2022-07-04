configure_apache() {
  info "Configuring apache"
  a2dissite 000-default >&5
  a2dismod php8.1 >&5
  a2dismod mpm_prefork >&5
  a2enmod mpm_event proxy_fcgi setenvif ssl >&5
  a2enconf php8.1-fpm >&5
  systemctl restart apache2 >&5
}
