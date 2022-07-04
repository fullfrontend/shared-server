configure_ufw() {
  info "Configuring UFW"
  ufw allow OpenSSH >&3
  ufw allow 'Apache Full' >&3
  ufw allow ftp >&3
  ufw allow ftps >&3
  if [ "$environment" = "prod" ]; then
    info "Enabling UFW"
    ufw enable
  fi
}
