group "default" {
  targets = ["base", "helm"]
}

variable "REGISTRY" {
    default = "ghcr.io/victorposada/imgs"
}

variable "ALPINE_VERSIONS" {
    default = ["3.20", "3.19"]
}

variable "HELM_PACKAGES" {
    default = "helm "
}

target "base" {
    name = "base-alpine-${replace(alpine, ".", "")}"
    matrix = {
        alpine = ALPINE_VERSIONS
    }
    dockerfile = "./base/Dockerfile"
    tags = ["${REGISTRY}/base/alpine:${alpine}"]
}

target "helm" {
    name = "helm-alpine-${replace(alpine, ".", "")}"
    matrix = {
        alpine = ALPINE_VERSIONS
    }
    contexts = {
        base = "docker-image://alpine:${alpine}"
    }
    args = {
        packages = "${HELM_PACKAGES}"
    }
    dockerfile = "./helm/Dockerfile"
    tags = ["${REGISTRY}/helm/helm-alpine:${alpine}"]
}

