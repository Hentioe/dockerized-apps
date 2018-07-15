FROM alpine:3.8


ARG TAG_NAME=20180225.0
ARG FILE_NAME=udp2raw_binaries.tar.gz
ARG DL_ADRESS="https://github.com/wangyu-/udp2raw-tunnel/releases/download/$TAG_NAME/$FILE_NAME"
ARG ARCH=amd64_hw_aes
ARG BIN_NAME="udp2raw_$ARCH"


WORKDIR /home


RUN apk add --no-cache iptables \
    && wget $DL_ADRESS -O $FILE_NAME \
    && tar -zxvf $FILE_NAME \
    && find ./ -type f -not -name "$BIN_NAME" -delete \
    && ln -s "/home/$BIN_NAME" /usr/bin/udp2raw-tunnel


ENTRYPOINT [ "udp2raw-tunnel" ]