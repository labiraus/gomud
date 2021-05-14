# gomud

A learning exercise in Golang microservices including deployment on Kind

## dockerfile

install tooling
grab script file

## script

read incoming file
download files
construct files
output files

## run command

Cannot be run on git bash
navigate to ./tools/protogen
docker build -t protogen:latest .
docker run -v $(pwd)/temp:/test protogen:latest
docker run -v $(pwd)/temp:/test -a stdin -a stdout -i -t  protogen:latest sh
