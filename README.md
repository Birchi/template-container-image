# General
## Description
## Scripts
### Build
```
./scripts/build.sh --name my_image --version latest --build-file-path "./Dockerfile"
```
### Cleanup
```
./scripts/cleanup.sh --name my_image --version latest
```
### Deploy
```
./scripts/deploy.sh --name my_image --version latest --registry my.registry.com --registry-username username --registry-password password
```
### Start
```
./scripts/start.sh --name my_container --image my_image --version latest
```
### Enter
```
./scripts/enter.sh --name my_container --workdir / --shell /bin/bash
```