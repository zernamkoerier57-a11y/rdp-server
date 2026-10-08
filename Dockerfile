FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xrdp \
    xfce4 \
    xfce4-terminal \
    sudo \
    curl \
    wget \
    && apt-get clean

RUN useradd -m -s /bin/bash rdpuser && \
    echo "rdpuser:password123" | chpasswd && \
    adduser rdpuser sudo

RUN echo "startxfce4" > /home/rdpuser/.xsession

EXPOSE 3389

CMD service xrdp start && tail -f /dev/null
