FROM node:8.10-alpine


ARG WORK_PATH=/home/src
ARG CACHE_DIR=/home/cache
ARG YARN_CONFIG_DIR=/usr/local/share/.cache/yarn


COPY ./build.sh /usr/bin/build


RUN chmod +x /usr/bin/build \
    && mkdir -p $WORK_PATH $CACHE_DIR $YARN_CONFIG_DIR \
    && ln -s $CACHE_DIR "$YARN_CONFIG_DIR/v1"


WORKDIR $WORK_PATH


ENV SCRIPT=build


CMD build $SCRIPT