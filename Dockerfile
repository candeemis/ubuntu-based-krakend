FROM ubuntu:24.04 AS base

RUN apt-get update && apt-get install -y curl

RUN mkdir downloads

FROM base AS base2

RUN curl --silent -o /downloads/krakend_2.9.1_amd64_generic-linux.tar.gz https://repo.krakend.io/bin/krakend_2.9.1_amd64_generic-linux.tar.gz

RUN mkdir /etc/krakend

RUN tar -xzf /downloads/krakend_2.9.1_amd64_generic-linux.tar.gz -C /etc/krakend/

FROM ubuntu:24.04 AS final

COPY --from=base2 /etc/krakend /etc/krakend

