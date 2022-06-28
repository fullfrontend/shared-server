create_ftp_user(){
  info "Create ftp user"

  (
    echo $2
    echo $2
  ) | pure-pw useradd $1 -u ftpuser -d /var/www/html/$1 >/dev/null 2>&1

}
