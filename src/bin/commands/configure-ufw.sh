configure_ufw() {
  info "Configuring UFW"
  ufw allow OpenSSH >&3
  ufw allow 'Apache Full' >&3
  ufw allow ftp >&3
  ufw allow ftps >&3
  ufw allow proto tcp to any port 40110:40210 comment 'FTP Passive'>&3
  if [ "$environment" = "prod" ]; then
    info "Enabling UFW"
    ufw enable
  fi
}
