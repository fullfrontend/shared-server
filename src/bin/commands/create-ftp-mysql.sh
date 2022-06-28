create_ftp_mysql() {

  info "Creating FTP MySQL database"

  FTP_MYSQL_PWD=$(generate_pwd)

  if [ ! mysql -u root -p${MYSQL_ROOT_PWD} -e "USE ftpd;" >/dev/null ]; then
    info "Database does not exist, creating."
    mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE DATABASE ftpd;"
    mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE USER 'vhosts'@'localhost' IDENTIFIED BY '$FTP_MYSQL_PWD';"
    mysql -u root -p${MYSQL_ROOT_PWD} -e "GRANT SELECT ON ftpd.* TO 'vhosts'@'localhost';"
    mysql -u root -p${MYSQL_ROOT_PWD} -e "FLUSH PRIVILEGES;"

    mysql -u root -p${MYSQL_ROOT_PWD} -e "USE ftpd;"
    mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE TABLE users ( user varchar(30) NOT NULL, password varchar(64) NOT NULL, home varchar(128) NOT NULL, bandwidth_limit_upload smallint(5) NOT NULL default 0, bandwidth_limit_download smallint(5) NOT NULL default 0, ip_allow varchar(15) NOT NULL default 'any', quota smallint(5) NOT NULL default '0', quota_files int(11) NOT NULL default 0, active enum('yes','no') NOT NULL default 'yes', PRIMARY KEY (user), UNIQUE KEY User (user) ) ENGINE=MyISAM;"
  fi

}
