# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "C:/temp/client2"

# Give the agent a unique name. Defaults to hostname
name = "client2"

# Enable the client
client {
    enabled = true

    # For demo assume we are talking to server1. For production,
    # this should be like "nomad.service.consul:4647" and a system
    # like Consul used for service discovery.
    servers = ["172.30.192.1:4647"]
    options = {
      "docker.endpoint" = "npipe:////./pipe/docker_engine"
      #"docker.endpoint" = "npipe:////./pipe/docker_engine_windows"
    }
    network_interface = "イーサネット"
}

# Modify our port to avoid a collision with server1
ports {
    http = 5657
}

# Disable the dangling container cleanup to avoid interaction with other clients
plugin "docker" {
  config {
    gc {
      dangling_containers {
        enabled = false
      }
    }
  }
}
