update() {
  # Install updates
  info "Updating box"
  apt-get update >&5
  DEBIAN_FRONTEND=noninteractive apt-get upgrade -y >&5
  DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y >&5
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y >&5
  DEBIAN_FRONTEND=noninteractive apt-get autoclean -y >&5
}
