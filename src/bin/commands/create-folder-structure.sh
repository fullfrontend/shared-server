create_folder_structure() {

  info "Creating folder & default file"
  mkdir -p /var/www/html/$1/public
  chmod -R 755 /var/www/html/$1
  chown -R www-data:www-data /var/www/html/$1

  create_default_index $1
}
