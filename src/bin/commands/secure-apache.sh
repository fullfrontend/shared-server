secure_apache() {
  info "Securing Apache"

  if [ "$environment" = "prod" ]; then
    fail "Should secure apache"
  fi

}
