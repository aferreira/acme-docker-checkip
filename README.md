
acme-docker-checkip - Docker container (demo) for checkip service

### DESCRIPTION

This is a toy repository illustrating a very simple
web application built as a Docker image. Uses

    perl

    Mojolicious

The application mimicks services like

    http://checkip.amazonaws.com/
    http://icanhazip.com/

### BUILDING

    # From a local directory
    docker build -t checkip .

    # Or, directly from github
    docker build -t checkip https://github.com/aferreira/acme-docker-checkip.git

### RUNNING

    # Dettached launch
    docker run -p 8080:8080 -d --name checkip-c0 checkip

    # Following the logs
    docker logs -f checkip-c0

### TESTING

    curl -D - -XGET "http://$HOST:8080/'

with an output like

    HTTP/1.1 200 OK
    Content-Type: text/plain
    Server: Mojolicious (Perl)
    Content-Length: 11
    Date: Mon, 22 May 2017 17:35:36 GMT
   
    172.17.0.1

The IP is reported from the point of view of the network
where the application is running. That is why it is only useful
when seen from the internet.
