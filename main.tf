terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_container" "joyenergy" {
  image = "joyenergy"
  name  = "joyenergy"
  restart = "always"
  volumes {
    container_path  = "/app"
    host_path = "/home/speedlight/Downloads/repos/frontend-developer-joyofenergy" 
    read_only = false
  }
  ports {
    internal = 8080
    external = 8080
  }
}
