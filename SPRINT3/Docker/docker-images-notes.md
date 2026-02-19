## Image vs Container
- Image = blueprint (read-only template)
- Container = running instance created from image
- One image can create multiple containers

## Key Commands
- docker images: list local images
- docker pull <name>: download from Docker Hub
- docker pull <name>:<tag>: specific version
- docker rmi <name>: delete image (i = image, vs rm = container)

## Tags & Versions
- latest = default tag, latest version
- Always use specific version in production (nginx:1.25 not nginx:latest)
- latest can change anytime and break things

## Layers & Caching
- Each image is built from layers
- docker pull shows each layer downloading separately
- Different images can share layers (nginx and redis both use debian)
- If image already exists locally, docker pull skips download (caching)
- Saves disk space and network bandwidth
