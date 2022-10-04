FROM alpine:latest
ARG FIN_DIR=/usr/src/eeprom-generator/
ENV FIN_DIR ${FIN_DIR}
WORKDIR ${FIN_DIR}
COPY . .
RUN echo 'root:password' | chpasswd
RUN apk add openssh lsof openrc && \
    rc-update add sshd

RUN ${FIN_DIR}init.sh 

CMD /bin/sh

EXPOSE 22
