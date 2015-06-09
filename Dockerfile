FROM ubuntu
MAINTAINER "Tim <tim@midokura.com>"

RUN apt-get update && apt-get install -y wget vim
ENV CURRENT-VERSION="v0.5.1-tracing"
RUN wget https://github.com/github/git-lfs/releases/download/${CURRENT-VERSION}/git-lfs-linux-amd64-0.5.1.tar.gz
RUN tar -xvf git-lfs-linux-amd64-0.5.1.tar.gz
RUN git-lfs-linux-amd64-0.5.1/install

WORKDIR /current-repo
VOLUME ["/current-repo"]

ENTRYPOINT ["git lfs"]
CMD ["--help"]
