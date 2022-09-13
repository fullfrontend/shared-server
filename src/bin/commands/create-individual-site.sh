create_individual_site() {

  local USER=$1

  if [ -d /var/www/html/$USER/public ]; then
    fail "User $USER already exists"
  fi


  FTP_PWD=$(generate_pwd)
  DB_PWD=$(generate_pwd)

  info "Creating user $USER"
  info "FTP_PWD: $FTP_PWD" 2
  info "DB_PWD: $DB_PWD" 2

  create_folder_structure $USER

  create_ftp_user $USER $FTP_PWD

  configure_vhost $USER

  create_mysql_database $USER $DB_PWD

  cat <<EOF >>Users.md
## $USER

* WEB: http://${USER}.stage.fullfrontend.be/

* FTP:
  * URL: ftp.stage.fullfrontend.be
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
