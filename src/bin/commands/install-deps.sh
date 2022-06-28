install_deps() {
  # Install deps
  info "Installing Dependencies"
  DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common >&5
  add-apt-repository -y ppa:ondrej/php >&5
  apt-get update >&5
  DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 mariadb-server php8.1-fpm php8.1 libapache2-mod-php8.1 php8.1-common php8.1-mysql php8.1-xml \
    php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-intl \
    php8.1-bcmath unzip pure-ftpd certbot python3-certbot-apache -y >&5
  systemctl enable apache2 >&4
}
