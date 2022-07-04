configure_pureftpd() {
  info "Config PureFTPd"
  echo "yes" >/etc/pure-ftpd/conf/ChrootEveryone
  echo "yes" >/etc/pure-ftpd/conf/CreateHomeDir
  echo "yes" >/etc/pure-ftpd/conf/NoAnonymous
  echo "33" >/etc/pure-ftpd/conf/MinUID

  if [ ! -e /etc/pure-ftpd/conf/PureDB ]; then
    ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/50pure
  fi

  #create_ftp_mysql

  if [ "$environment" = "prod" ]; then
    echo "2" >/etc/pure-ftpd/conf/TLS
  fi

  #regenerate_pureftpd_db
}
