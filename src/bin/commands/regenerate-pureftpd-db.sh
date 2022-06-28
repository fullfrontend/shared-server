regenerate_pureftpd_db() {
  # Regenerating PureFTPd user db
  info "Regenerating PureFTPd user db"
  pure-pw mkdb
  service pure-ftpd restart
}
