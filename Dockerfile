# pull base image.
FROM openjdk:8-jdk

# maintainer details
MAINTAINER Mahima Ganapati Pushpa "mahima.srikanta@gmail.com"

# update packages and install maven
RUN  \
  export DEBIAN_FRONTEND=noninteractive && \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y vim wget curl git maven default-jdk

ADD bin /home/helloworld/bin
ADD src /home/helloworld/src
ADD pom.xml /home/helloworld/.
RUN \
    cd /home/helloworld/ && \
    mvn clean package && \
    cp /home/helloworld/target/dependency/jetty-runner.jar /home/helloworld/bin && \
    cp /home/helloworld/target/helloworld.war /home/helloworld/bin

EXPOSE 8080

ENTRYPOINT /home/helloworld/bin/run.sh