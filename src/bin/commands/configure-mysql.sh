configure_mysql() {

  info "Configuring MySQL"
  MYSQL_ROOT_PWD=$(generate_pwd)

  # Check if root password is already set
  if mysql -u root -e ";" >/dev/null; then
    cat <<EOF >mysql-root-pass.txt
$MYSQL_ROOT_PWD
EOF
    info "Setting MySQL Root password" 2
    mysql -u root -e "flush privileges;"
    mysql -u root -e "USE mysql"
    mysql -u root -e "ALTER USER  'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';"
    mysql -u root -p${MYSQL_ROOT_PWD} -e "flush privileges;"
    systemctl restart mysql
  else

    info "Recovering MySQL Root password" 2
    # Remove new lines and store in global
    MYSQL_ROOT_PWD=$(cat mysql-root-pass.txt | tr -d '\n')
  fi

}
