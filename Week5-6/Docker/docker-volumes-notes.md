# Docker Volumes & Data Persistence Notes

## Why Containers Lose Data
- Containers start clean every time from the image
- Any file created inside a container is lost when container is removed
- Proved: created file in container, deleted container, new container = file gone

## Three Types of Storage
- Named Volume: Docker manages the folder, portable, works on any machine
- Bind Mount: maps specific host folder to container, good for development
- tmpfs: stored in RAM, deleted when container stops

## Named Volume
- docker volume create <name>: creates volume
- docker volume ls: lists volumes
- -v <name>:/path mounts volume to container path
- Data survives container deletion, reattach to new container
- Portable: same command works on every machine (each starts empty)

## Bind Mount
- -v /host/path:/container/path (full path = bind mount)
- Changes sync both ways in real time
- Great for development: edit code on host, container sees immediately
- Not portable: path must exist on host machine

## Practical: Postgres with Volume
- Created pgdata volume, ran postgres with -v pgdata:/var/lib/postgresql
- -e flag sets environment variable (POSTGRES_PASSWORD required)
- Created table, inserted data, deleted container
- New container with same volume = data survived
- Volume stores data locally only, not shared between machines
