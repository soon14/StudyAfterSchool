docker pull onlyoffice/documentserver


mkdir /onlyoffice
cd /onlyoffice
mkdir log
mkdir data
mkdir lib
mkdir db


```
version: '3.7'

services:
  onlyoffice:
    image: onlyoffice/documentserver
    container_name: onlyoffice
    restart: always
    ports:
        - 6831:80
    volumes:
        - /onlyoffice/log:/var/log/onlyoffice
        - /onlyoffice/data:/var/www/onlyoffice/Data
        - /onlyoffice/lib:/var/lib/onlyoffice
        - /onlyoffice/db:/var/lib/postgresql
```
