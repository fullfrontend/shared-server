create_default_index() {

  cat <<EOF >/var/www/html/$1/public/index.html
<!doctype html>
<html>
  <head>
    <title>$1.stage.fullfrontend.be</title>
  </head>
  <body>
    <h1>Welcome to $1.stage.fullfrontend.be</h1>
    <p>Under construction</p>
  </body>
</html>
EOF
}
