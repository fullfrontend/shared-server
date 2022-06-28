configure_pureftpd() {
  info "Config PureFTPd"
  echo "yes" >/etc/pure-ftpd/conf/ChrootEveryone
  echo "yes" >/etc/pure-ftpd/conf/CreateHomeDir
  echo "yes" >/etc/pure-ftpd/conf/UnixAuthentication
  echo "no" >/etc/pure-ftpd/conf/PAMAuthentication

  if [ "$environment" = "prod" ]; then
    echo "2" >/etc/pure-ftpd/conf/TLS
  fi

  if ! grep -q "ftpgroup" /etc/group; then
    groupadd ftpgroup
  fi
}
