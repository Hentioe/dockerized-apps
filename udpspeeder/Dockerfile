FROM alpine:3.8


ARG TAG_NAME=20180522.0
ARG FILE_NAME=speederv2_binaries.tar.gz
ARG DL_ADRESS="https://github.com/wangyu-/UDPspeeder/releases/download/$TAG_NAME/$FILE_NAME"
ARG ARCH=amd64
ARG BIN_NAME="speederv2_$ARCH"


WORKDIR /home


RUN wget $DL_ADRESS -O $FILE_NAME \
    && tar -zxvf $FILE_NAME \
    && find ./ -type f -not -name "$BIN_NAME" -delete \
    && ln -s "/home/$BIN_NAME" /usr/bin/speeder


ENTRYPOINT [ "speeder" ]