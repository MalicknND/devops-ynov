FROM  jenkins/jenkins:2.361.4-lts
USER root
WORKDIR /
ENV  APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
RUN ln -sf /usr/share/zoneinfo/Europe/Paris /etc/timezone
RUN apt-get update && \
    apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get -y install docker-ce docker-ce-cli
RUN   apt-get update &&\
    apt-get install docker-compose-plugin 
RUN    docker compose version
RUN usermod -aG docker jenkins
USER jenkins