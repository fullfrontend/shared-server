configure_pureftpd() {
  info "Config PureFTPd"
  echo "yes" >/etc/pure-ftpd/conf/ChrootEveryone
  echo "yes" >/etc/pure-ftpd/conf/CreateHomeDir
  echo "yes" >/etc/pure-ftpd/conf/NoAnonymous
  echo "33" >/etc/pure-ftpd/conf/MinUID
  echo "40110 40210" >/etc/pure-ftpd/conf/PassivePortRange

  if [ ! -e /etc/pure-ftpd/conf/PureDB ]; then
    rm -rf /etc/pure-ftpd/conf/PureDB
  fi
  ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/50pure

  #create_ftp_mysql

  if [ "$environment" = "prod" ]; then
    echo "2" >/etc/pure-ftpd/conf/TLS
  fi

  #regenerate_pureftpd_db
}
