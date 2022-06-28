# How to setup a shared LAMP server on Ubuntu 22.04

A fun project and POC made in 2 days...


## How to develop and test

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Download [Ubuntu 22.04 Server Edition ISO](https://ubuntu.com/download/server)
3. Create a new VM
4. Install Ubuntu in the VM
5. Once installed SFTP the files to the user folder


## View logs

FTP: 
```
tail -n 100 /var/log/syslog | grep ftp
```

