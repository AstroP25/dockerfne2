FROM alpine:3.18
#Set build args (fnerouter/fneparrot)
ARG FNE=fnerouter TARGETARCH
#Set environmental variables for building purposes
ENV VERSION=2.0.19672 
ENV PACK=${FNE}_${VERSION} 
ENV CFG=$FNE-cfg.yml EXE="dotnet $FNE.dll -l -c configs/$CFG"
#Add .NET Runtime and build arg defined package to filesystem
ADD dotnet-runtime-3.1.32-linux-musl-$TARGETARCH.tar.gz /usr/bin/
ADD $PACK.tar.gz /opt/$PACK/
#Change working directory and notifiy of config volume
WORKDIR /opt/$PACK
VOLUME /opt/$PACK/configs
#Install dependencies
RUN apk --no-cache update \
&& apk upgrade \
&& apk add libstdc++ libgcc icu-libs libintl libssl1.1 
#Execute application
CMD ${EXE}