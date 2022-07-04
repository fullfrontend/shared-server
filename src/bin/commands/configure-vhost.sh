configure_vhost() {

  info "Configuring apache"
  cat <<EOF >/etc/apache2/sites-available/$1.conf
  <VirtualHost *:80>
    ServerName $1.stage.fullfrontend.be
    ServerAlias www.$1.stage.fullfrontend.be
    DocumentRoot "/var/www/html/$1/public"
    DirectoryIndex index.html index.php
    <Directory "/var/www/html/$1/public">
      Options FollowSymLinks
      AllowOverride all
      Require all granted
    </Directory>
    ErrorLog /var/log/apache2/$1.stage.fullfrontend.be_error.log
    CustomLog /var/log/apache2/$1.stage.fullfrontend.be_access.log combined
  </VirtualHost>
EOF

  info "Enabling apache site"
  a2ensite $1 >&3
  systemctl restart apache2 >&5

  info "Getting ssl certs"
  if [ "$environment" = "prod" ]; then
    certbot --apache --non-interactive --agree-tos --redirect -m "cedric@fullfrontend.be" -d $1.stage.fullfrontend.be -d www.$1.stage.fullfrontend.be
    systemctl restart apache2 >&5
  fi
}
