FROM ubuntu:latest
MAINTAINER Ron Bruintjes <ronaldb64@gmail.com>
## Install BOINC
RUN apt-get update && apt-get install -y boinc-client && rm -rf /var/lib/apt/lists/*
## Set working directory
WORKDIR /var/lib/boinc-client
## Run BOINC by default, expects env var for url and account key
CMD /etc/init.d/boinc-client start; sleep 10; /usr/bin/boinccmd --project_attach ${boincurl} ${boinckey}; tail -f /var/lib/boinc-client/std*.txt
