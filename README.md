# ubuntu-based-krakend

[Krakend version 2.1.2](https://www.krakend.io/) on top of Ubuntu in [Docker container](https://hub.docker.com/r/candeemis/ubuntu-based-krakend)

This image can be used as a base image in multi-staged builds for preprocessing/compiling Krakend configs e.g flexible configuration in order to use them in the later/final stage in production.

ℹ️ `krakend` executable is available in `/etc/krakend/usr/bin` directory.

## Example:
```dockerfile
FROM candeemis/ubuntu-based-krakend:latest as base

WORKDIR /home
 
COPY ./configs /home/configs
RUN FC_SETTINGS="./configs/settings/<NAME OF SETTINGS FILE>" FC_TEMPLATES="./configs/templates" FC_ENABLE=1 FC_OUT="./krakend.json" /etc/krakend/usr/bin/krakend check -c ./configs/krakend.json

WORKDIR /home

FROM devopsfaith/krakend:2.1.2 as final

COPY --chown=krakend:krakend --from=base /home/krakend.json /etc/krakend/

CMD [ "run", "-c", "/etc/krakend/krakend.json" ]
```

## Contributions
Issues and PRs submissions is highly appreciated 🙏 
