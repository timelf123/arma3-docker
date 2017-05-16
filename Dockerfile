FROM ubuntu

MAINTAINER "Tim Elfelt" <timelf123@gmail.com>

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get install -y lib32gcc1 lib32stdc++6 wget

RUN cd /root \
	&& wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz \
	&& tar -zxvf steamcmd_linux.tar.gz \
	&& rm -f steamcmd_linux.tar.gz

RUN /root/steamcmd.sh +login anonymous +quit
RUN echo 233780 > steam_appid.txt

VOLUME /profiles
VOLUME /server
ENV DEBIAN_FRONTEND=noninteractive
ENV VALIDATE=1

EXPOSE 2302/udp
EXPOSE 2303/udp
EXPOSE 2304/udp
EXPOSE 2305/udp

COPY credentials.sh /
COPY installserver.sh /

RUN /installserver.sh \
	&& rm -f /credentials.sh \
	&& rm -f /installserver.sh

WORKDIR /arma3

CMD ["./arma3server", "-par=params", "-profiles=/profiles"]
