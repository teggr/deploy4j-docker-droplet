# deploy4j-docker-droplet
A Docker container that can be used to test deploy4j as it's close to a Digital Ocean droplet after initialisation

## Overview

This project provides a simple Docker image based on Ubuntu with SSH support. It's designed to simulate a Digital Ocean droplet environment for testing deployment tools like deploy4j.

## Features

- Based on latest Ubuntu image
- SSH server configured and ready to use
- Support for SSH public key authentication
- Root login enabled with SSH keys
- Scripts for building and running on both Linux and Windows

## Prerequisites

- Docker installed on your system
- SSH key pair (public and private keys)

## Building the Docker Image

### On Linux/macOS

```bash
./build.sh
```

### On Windows

```cmd
build.bat
```

This will build a Docker image named `deploy4j-docker-droplet:latest`.

## Running the Container

The container requires you to mount your SSH public key for authentication.

### On Linux/macOS

```bash
./run.sh /path/to/your/public/key.pub
```

Example:
```bash
./run.sh ~/.ssh/id_rsa.pub
```

### On Windows

```cmd
run.bat C:\path\to\your\public\key.pub
```

Example:
```cmd
run.bat C:\Users\YourUser\.ssh\id_rsa.pub
```

The container will:
- Start in detached mode
- Map SSH port 22 to host port 2222
- Mount your public key to `/root/.ssh/authorized_keys`
- Be named `deploy4j-droplet`

## Connecting via SSH

Once the container is running, connect using:

```bash
ssh -p 2222 root@localhost
```

## Stopping the Container

```bash
docker stop deploy4j-droplet
```

## Removing the Container

```bash
docker rm deploy4j-droplet
```

## Pushing to Docker Hub

To push the image to Docker Hub:

1. Tag the image with your Docker Hub username:
   ```bash
   docker tag deploy4j-docker-droplet:latest <your-dockerhub-username>/deploy4j-docker-droplet:latest
   ```

2. Login to Docker Hub:
   ```bash
   docker login
   ```

3. Push the image:
   ```bash
   docker push <your-dockerhub-username>/deploy4j-docker-droplet:latest
   ```

## Technical Details

### Dockerfile

- Base image: `ubuntu:latest`
- Installed packages: `openssh-server`
- SSH configuration:
  - Root login with public key authentication enabled
  - Password authentication disabled
  - Public key authentication enabled
- Exposed port: 22
- Command: SSH daemon in foreground mode

### Scripts

- `build.sh` / `build.bat`: Build the Docker image
- `run.sh` / `run.bat`: Run the container with public key mounting

## Troubleshooting

### Cannot connect via SSH

1. Ensure the container is running: `docker ps`
2. Check the container logs: `docker logs deploy4j-droplet`
3. Verify your public key is correctly mounted: `docker exec deploy4j-droplet cat /root/.ssh/authorized_keys`

### Permission denied (publickey)

1. Ensure you're using the correct private key that matches the mounted public key
2. Check SSH key permissions: `chmod 600 ~/.ssh/id_rsa` (private key should be readable only by owner)

## License

See LICENSE file for details.
