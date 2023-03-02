# Classe containers
class containers() {
  # docker::run { 'grafana':
  #   image   => 'grafana/grafana-oss:9.2.3',
  #   ports   => '4000:3000',
  #   volumes => ['/home/vagrant/docker/grafana-data:/var/lib/grafana']
  # }

  docker::run {'gitlab':
    hostname=>'projet.ynov',
    net=>'projet-devops',
    image=>'gitlab/gitlab-ce:15.5.4-ce.0',
    volumes=>['gitlab-config:/etc/gitlab','gitlab-logs:/var/log/gitlab','gitlab-data:/opt/opt/gitlab'],
    restart_service  => true,
    ports=>['9091:443','9092:80','9093:22'],
  }

  docker::run {'jenkins':
    net=>'projet-devops',
    image => 'jenkins:docker',
    volumes=>['/var/jenkins_home:/var/jenkins_home','/var/run/docker.sock:/var/run/docker.sock'],
    restart_service  => true,
    ports=>['9094:8080','9095:50000'],
  }
}
