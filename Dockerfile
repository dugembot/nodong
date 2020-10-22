FROM node:lts-buster
WORKDIR /opt

RUN apt -qq update && \
    apt -qq install -y git && \
    mkdir -p /app && git clone git clone https://github.com/maple3142/aria2c-ariang /app && \
    apt -qq –-purge remove git -y && \
    apt -qq autoremove -y && \
    apt -qq clean autoclean && \
    rm -rf /var/cache/apt/archives/*.deb \
       /var/lib/apt/lists/*

ADD . /opt

WORKDIR /app
RUN bash setup.sh && \
    yarn

ENV PORT=8080
EXPOSE 8080
CMD ["bash", "start.sh"]
