install_pma() {
  # Setup PHPMyAdmin
  info "Setup PHPMyAdmin"
  DEBIAN_FRONTEND=noninteractive apt-get install -y phpmyadmin >&5
  if [ ! -e /etc/apache2/conf-available/phpmyadmin.conf ]; then
    ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf >&5
  fi
  a2enconf phpmyadmin.conf >&5
  systemctl restart apache2 >&5
}
