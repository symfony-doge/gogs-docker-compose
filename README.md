# Gogs docker-compose

Why you probably will pick this configuration for your [Gogs](https://github.com/gogs/gogs) instance:

- **It is extremely lightweight**. Only `app` and `db`, 1 CPU + 100 MB RAM is pretty enough for personal usage (say goodbye to GitLab-like hippopotamuses).
- **Time saver**. A predefined config based on `docker-compose.yml` and automated scripts for quick editing.
- **Installs in one-line**. `bin/install_http.sh` (standalone) or `bin/install_unix_socket.sh` for pairing with nginx.
- **Easy tuning**. There are scripts for managing common use-cases without digging deeply into the application context (`toggle_registration.sh`, for example).

### Requirements

- [Docker](https://docs.docker.com/install) daemon [17.05.0-ce](https://docs.docker.com/engine/release-notes/#17050-ce) or newer.
- [Docker-compose](https://docs.docker.com/compose), compatible with [version 2](https://docs.docker.com/compose/compose-file/compose-file-v2) reference file.

### Installation

Clone the repository and run an automated setup script:

```
$ git clone git@github.com:symfony-doge/gogs-docker-compose.git gogs-docker-compose && cd "$_"
$ bin/install_http.sh
```

Then you can access your Gogs instance by [http://localhost:9090](http://localhost:9090).
Create admin user via web UI (first user with ID=1 will automatically become an admin).
You can also disable registration by running:

```
$ bin/toggle_registration.sh && docker-compose restart
```

Note: use only docker-compose commands like `down` and `up` after successful installation.

There is also a deploy script for nginx + unix socket setup called `bin/install_unix_socket.sh`,
but you need to configure nginx by yourself (see `nginx.conf.example`).

Have fun!
