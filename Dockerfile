FROM ubuntu:16.04
MAINTAINER laudai

RUN apt-get update

RUN apt-get install vim tmux zsh git htop curl wget -y
RUN cd && git clone https://github.com/laudai/dotfile.git && \
    mv dotfile .dotfile

# get xmrig-cpu
RUN apt-get install git build-essential cmake libuv1-dev libmicrohttpd-dev -y

WORKDIR /root
RUN git clone https://github.com/xmrig/xmrig.git && \
    cd /root/xmrig && \
    git checkout v2.6.2 && \
	mkdir build

WORKDIR /root/xmrig/build
RUN cmake ..
RUN make

ENTRYPOINT /usr/bin/zsh
WORKDIR /home

CMD ["/usr/bin/zsh"]
