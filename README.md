#DVM Project dvmfne2
This project builds opearational containers based off of the packaged DVM Project's fnerouter and fneparrot applications. 

## Build instructions
Clone and change into repository directory.

```git clone https://github.com/AstroP25/dockerfne2.git```

```cd dockerfne2```

Build using the Docker (or Podman) build command, default FNE arg is fnerouter so without specifiying a fnerouter container will be build. The Dockerfile checks the target CPU architecture (if not specified assumed to be the source architecture) and creates an Alpine Linux container and imports the appropriate dotnet-3.1-runtime in addition to teh appropriate runtime package (may update at a later date to entirely build from Project DVM repo in the build environment).

```docker build -t fnerouter:latest .```

To build fneparrot issue the following with the build argument.

```docker build --build-arg FNE=fneparrot -t fneparrot:latest .```

## Executing container
To run the container, issue the following.

```docker run -it -d --rm -v $(pwd)/configs:configs --name fnerouter fnerouter:latest```