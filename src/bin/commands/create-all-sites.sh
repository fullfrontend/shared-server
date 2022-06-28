create_all_sites() {

  if [ $# -eq 0 ]; then
    fail 'You must pass users to create entries'
  fi

  local USERS=$@
  info "Users: ${USERS[@]}" 2


  cat <<EOF >Users.md
# User access credentials

EOF

  # Config individual sites
  info "Start Configuring individual sites"
  for i in ${USERS[@]}; do
    create_individual_site $i
  done

}
