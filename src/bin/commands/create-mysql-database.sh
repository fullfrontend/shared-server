create_mysql_database() {
  info "Creating database and user"
  info "MYSQL_ROOT_PWD: ${MYSQL_ROOT_PWD}"

  mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE DATABASE ${1}_wp;"
  mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE USER '${1}'@'localhost' IDENTIFIED BY '${2}';"
  mysql -u root -p${MYSQL_ROOT_PWD} -e "GRANT ALL PRIVILEGES ON ${1}_wp.* TO '${1}'@'localhost';"
  mysql -u root -p${MYSQL_ROOT_PWD} -e "FLUSH PRIVILEGES;"
}
