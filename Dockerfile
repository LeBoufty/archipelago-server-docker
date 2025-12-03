FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    tar \
    ca-certificates \
    unzip \
    && rm -rf /var/lib/apt/lists/*

COPY release/*.tar.gz /tmp/archipelago.tar.gz

RUN mkdir -p /opt/Archipelago \
    && tar -xzf /tmp/archipelago.tar.gz -C /opt \
    && rm /tmp/archipelago.tar.gz

RUN ls -R /opt/Archipelago

RUN find /opt/Archipelago -maxdepth 1 -type f -exec chmod +x {} \;

COPY Players/ /opt/Archipelago/Players
COPY runserver.sh /opt/Archipelago/runserver.sh

WORKDIR /opt/Archipelago

RUN chmod +x runserver.sh

EXPOSE 38281

CMD ["./runserver.sh"]
