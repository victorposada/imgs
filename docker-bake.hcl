group "default" {
  targets = ["helm"]
}

variable "REGISTRY" {
    default = "ghcr.io/victorposada/imgs/"
}

target "helm" {
  dockerfile = "Dockerfile.webapp"
  tags = ["docker.io/username/webapp"]
}

target "webapp-release" {
  inherits = ["webapp-dev"]
  platforms = ["linux/amd64", "linux/arm64"]
}

target "db" {
  dockerfile = "Dockerfile.db"
  tags = ["docker.io/username/db"]
}