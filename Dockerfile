FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

RUN apt-get upgrade && apt-get update
RUN apt-get install -y --no-install-recommends \
    sudo ssh \
    screen cmake unzip git curl wget vim tree htop \
    build-essential \
    cmake pkg-config \
    libgtk2.0-dev pkg-config\
    automake libssl-dev libcurl4-nss-dev

RUN groupadd -g 1942 ubuntu
RUN useradd -m -u 1942 -g 1942 -d /home/ubuntu ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN chown -R ubuntu:ubuntu /home/ubuntu

USER ubuntu
WORKDIR /home/ubuntu
ENV HOME /home/ubuntu

RUN echo 'CUDA=/usr/local/cuda' >> $HOME/.bashrc
RUN echo 'export PATH=$PATH:$CUDA/bin' >> $HOME/.bashrc

RUN wget  --no-check-certificate https://github.com/Nanashi-Meiyo-Meijin/ccminer/archive/v2.2-mod-r2.tar.gz
RUN tar zxvf v2.2-mod-r2.tar.gz
RUN cd ccminer-2.2-mod-r2/ && \
    bash autogen.sh && ./configure && \
    make -j2
