## simplesync

simplesync is a Docker-based solution for synchronizing files between two directories using `rsync`. 
It runs a cron job inside a Docker container to periodically sync files from a source directory to a target directory.
Also provides basic logging functionality.

### docker-compose

```yaml
---
services:
  simplesync:
    build: .
    container_name: simplesync
    environment:
      - PUID=1000
      - PGID=1000
      - CRON_SCHEDULE=*/5 * * * *
    volumes:
      - /path/to/source:/source:ro
      - /path/to/target:/target
      - /path/to/backup:/backup
      - /path/to/logs:/logs
    restart: unless-stopped
```

#### User / Group Identifiers

When using volumes, permissions issues can arise between the host OS and the container, we avoid this issue by allowing
you to specify the user `PUID` and group `PGID`. Ensure any volume directories on the host are owned by the same user
you specify and any permissions issues will vanish like magic.
