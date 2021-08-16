# Fibra Amiga Quiz

### Execute for development

```shell
docker-compose up
```

### For production on Docker Swarm
First change my docker username on `docker-stack.yml` to yours.
```shell
docker-compose -f docker-stack.yml build
docker-compose -f docker-stack.yml push
docker stack deploy --compose-file docker-stack.yml fibra-amiga
```