FROM debian:jessie

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list

RUN apt-get update &&\
    apt-get install -y sudo time git-core subversion build-essential g++ bash make libssl-dev patch && \
    apt-get install -y libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python xz-utils && \
    apt-get clean && \
    useradd -m hiro && \
    echo 'hiro ALL=NOPASSWD: ALL' > /etc/sudoers.d/hiro

USER hiro
WORKDIR /home/hiro

# set dummy git config
RUN git config --global user.name "hiro" && git config --global user.email "user@example.com"
