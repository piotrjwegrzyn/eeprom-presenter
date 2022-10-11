FROM alpine:latest
ENV FIN_DIR=/usr/src/eeprom-presenter
ENV ITERATIONS=299
ENV SLEEP_TIME=1
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
RUN echo -e "Welcome to eeprom-presenter based on Alpine Linux!\n" > /etc/motd
RUN echo -e "Type \"show-eeprom <IFACE>\" to get current EEPROM from interface\n" >> /etc/motd
RUN echo "export FIN_DIR=${FIN_DIR}" >> /etc/profile

RUN ${FIN_DIR}/init.sh

WORKDIR /root
ENTRYPOINT rc-service -q sshd restart &> /dev/null; $FIN_DIR/update.sh & /bin/sh
CMD [ "/bin/sh", "-c" ]

EXPOSE 22
