FROM ubuntu:20.04 as base

RUN apt-get update && apt-get install -y curl

RUN mkdir downloads

RUN curl --silent -o /downloads/krakend_1.4.0_amd64.tar.gz https://repo.krakend.io/bin/krakend_1.4.0_amd64.tar.gz

RUN mkdir /etc/krakend

RUN tar -xzf /downloads/krakend_1.4.0_amd64.tar.gz -C /etc/krakend/

FROM ubuntu:20.04 as final

COPY --from=base /etc/krakend /etc/krakend

