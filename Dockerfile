FROM alpine:latest
ENV FIN_DIR=/usr/src/eeprom-generator
ENV ITERATIONS=299
ENV SLEEP_TIME=0.5
WORKDIR ${FIN_DIR}
COPY . .
RUN echo 'root:password' | chpasswd
RUN apk add openrc --no-cache && \
    apk add openssh openssh-server && \
    rc-update add sshd && \
    rc-status && \
    touch /run/openrc/softlevel

RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

RUN ${FIN_DIR}/init.sh

WORKDIR /root
ENTRYPOINT rc-service -q sshd restart > /dev/null; $FIN_DIR/update.sh & /bin/sh
CMD [ "/bin/sh", "-c" ]

EXPOSE 22
