# nginx-docker

This repository contains a boilerplate project to create a docker container using Nginx with PHP 7 support. The container is built on Alpine to minimise the footprint.

## Usage

Build the image:

    docker build -t nginx-docker .

Run the container and map the web root directory to a local folder:

    docker run -p 8000:80 -v $PWD/rootfs/var/www:/var/www/default nginx-docker

Then open your browser and access http://localhost:8000 and you should be met with a sample page. As the local web folder is mapped to the web root in the runnning container changes can be made on the host and then displayed after refreshing the browser.

To remove all containers and this image:

    docker rm $(docker ps -aq)
    docker rmi nginx-docker

## History

* 2018-08-18 Initial version
