FROM maven:3.5.0-jdk-8

# copy maven repository setting
COPY ./settings.xml  /usr/share/maven/conf/

# copy project build code
COPY build.sh /build.sh

RUN chmod +x /build.sh

# install docker
RUN apt-get -y update; \
    apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get -y update

RUN apt-get -y install docker-ce


VOLUME [ "/var/lib/docker", "/opt/mvn_repo"]