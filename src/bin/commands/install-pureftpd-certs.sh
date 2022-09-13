install_pureftpd_certs() {
  # Install certs for PureFTPd
  info "Install certs for PureFTPd"

  if [ "$environment" = "prod" ]; then
    certbot certonly --standalone --non-interactive --agree-tos --cert-name ftp.stage.fullfrontend.be -n -m "cedric@fullfrontend.be" -d ftp.stage.fullfrontend.be --pre-hook "service apache2 stop" --post-hook "service apache2 start"
    if [ -e "/etc/ssl/private/pure-ftpd.pem" ]; then
      rm /etc/ssl/private/pure-ftpd.pem
    fi
    cat  /etc/letsencrypt/live/ftp.stage.fullfrontend.be/fullchain.pem /etc/letsencrypt/live/ftp.stage.fullfrontend.be/privkey.pem > /etc/ssl/private/pure-ftpd.pem
    chmod 600 /etc/ssl/private/pure-ftpd.pem

    service pure-ftpd restart
    info "Cert installed"
  fi
}
