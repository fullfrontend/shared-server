show_help(){
  cat <<EOF
  Usage: ${0##*/}  [-hv] [-e ENVIRONMENT] COMMAND

  Options
      -h,--help                       display this help and exit
      -e,--environment ENVIRONMENT    work with ENVIRONMENT configuration
      -v                              verbose mode
EOF
}
