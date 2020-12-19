# Create local registry

```
$ docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

# Create buildx environment

```
$ docker buildx create --name builder --driver-opt network=host
$ docker buildx use builder
```
