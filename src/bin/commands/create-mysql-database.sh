create_mysql_database (){
    info "Creating database and user"

    mysql -e "CREATE DATABASE ${1}_wp;"
    mysql -e "CREATE USER '${1}'@'localhost' IDENTIFIED BY '${2}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${1}_wp.* TO '${1}'@'localhost';"
    mysql -e "FLUSH PRIVILEGES;"
}
