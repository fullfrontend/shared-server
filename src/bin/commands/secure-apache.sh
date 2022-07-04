secure_apache() {
  info "Securing Apache"

  #if [ "$environment" = "prod" ]; then
  #  fail "Should secure apache"
  #fi
  systemctl restart apache2 >&5
}
