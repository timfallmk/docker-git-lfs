FROM ubuntu
MAINTAINER "Tim <tim@midokura.com>"

RUN apt-get update && apt-get install -y wget vim git
# ENV CURRENT-VERSION="v0.5.1-tracing"
RUN wget https://github.com/github/git-lfs/releases/download/v0.5.1-tracing/git-lfs-linux-amd64-0.5.1.tar.gz
RUN tar -xvf git-lfs-linux-amd64-0.5.1.tar.gz
RUN cd git-lfs-0.5.1
RUN /bin/bash install.sh

WORKDIR /current-repo
VOLUME ["/current-repo"]

ENTRYPOINT ["bash git lfs"]
CMD ["--help"]
