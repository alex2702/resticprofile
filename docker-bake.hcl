variable "VERSION" {
  default = "latest"
}

target "docker-metadata-action" {}

target "_common" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64"]
}

target "image-normal" {
  inherits = ["_common"]
  tags = [
    "ghcr.io/alex2702/resticprofile:latest",
    "ghcr.io/alex2702/resticprofile:${VERSION}"
  ]
}

group "default" {
  targets = ["image-normal"]
}
