FROM alpine:latest
ENV FIN_DIR=/usr/src/eeprom-generator
ENV ITERATIONS=5
ENV SLEEP_TIME=0.5
WORKDIR ${FIN_DIR}
COPY . .
RUN echo 'root:password' | chpasswd
RUN apk add openssh openrc && \
    rc-update add sshd

RUN ${FIN_DIR}/init.sh

WORKDIR /root
ENTRYPOINT $FIN_DIR/update.sh & /bin/sh
CMD [ "/bin/sh", "-c" ]

EXPOSE 22
