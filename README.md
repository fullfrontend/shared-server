# How to setup a shared LAMP server on Ubuntu 22.04

A fun project and POC made in 2 days... But still in progress...

/!\ Pure-FTPd users loading from MySQL not yet active. 

## Purpose of the project

At [Charlewood](https://www.charlewood.com/), we are learning how to setup Wordpress, configure it, etc. I've done 
it dozen of times, so I'm automating the creation of a server where they can upload their work. I also need to learn 
new things.

Rules:
* don't use Docker or K8s, be low tech
* each user have it's own database
* each user has access by FTP
* each user is CHROOTed to his own folder
* each user has access to http(s)://[name].stage.fullfrontend.be
* SSL certificates should be valid

I also use some deep knowledge of Bash scripting, so please, learn from it.

## How to develop and test

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Download [Ubuntu 22.04 Server Edition ISO](https://ubuntu.com/download/server)
3. Create a new VM
4. Install Ubuntu in the VM
5. Once installed SFTP the files to the user folder
6. Then launch `sudo ./installer -e dev -v complete`

## Doc

See you later...

## View logs

FTP: 
```
tail -n 100 /var/log/syslog | grep ftp
```


