FROM ubuntu:24.04 as base

# sudo su
RUN apt install -y ca-certificates gnupg && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv 5DE6FD698AD6FDD2 && \
    echo "deb https://repo.krakend.io/apt stable main" \
       | tee /etc/apt/sources.list.d/krakend.list && \
    apt-get update && \
    apt-get install -y krakend=2.9.1


FROM ubuntu:20.04 as final

COPY --from=base /etc/krakend /etc/krakend

