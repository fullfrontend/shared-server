create_individual_site() {

  local USER=$1

  FTP_PWD=$(generate_pwd)
  DB_PWD=$(generate_pwd)

  info "Creating user $USER"
  info "FTP_PWD: $FTP_PWD" 2
  info "DB_PWD: $DB_PWD" 2

  useradd -G ftpgroup,www-data --system $USER

  (
    echo ${FTP_PWD}
    echo ${FTP_PWD}
  ) | pure-pw useradd $USER -u $USER -g ftpgroup -d /var/www/html/$USER >/dev/null 2>&1

  info "Creating folder & default file"
  mkdir -p /var/www/html/$USER/public
  chmod -R 755 /var/www/html/$USER
  chown -R www-data:www-data /var/www/html/$USER

  create_default_index $USER

  configure_vhost $USER

  create_mysql_database $USER $DB_PWD

  cat <<EOF >>Users.md
## $USER

* WEB: http://${USER}.stage.fullfrontend.be/

* FTP:
  * URL: ftp.stage.fullfrontend.be
  * Port: 21
  * User: $USER
  * Password: $FTP_PWD

* MYSQL:
  * PHPMyAdmin: http://${USER}.stage.fullfrontend.be/phpmyadmin
  * Host: localhost
  * Database: ${USER}_wp
  * Username: ${USER}
  * Password: $DB_PWD


EOF

}
