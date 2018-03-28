FROM bluerain/java-10-buildpack:jdk


ARG VERSION=4.6
ARG FILE_NAME="gradle-$VERSION-bin.zip"
ARG URL="https://services.gradle.org/distributions/$FILE_NAME"

ARG HOME_PATH=/usr/local/gradle
ARG WORK_PATH=/home/src
ARG CONFIG_DIR=/root/.gradle
ARG CACHE_DIR=/home/cache


RUN apt-get update \
    && apt-get install unzip

RUN wget -O $FILE_NAME $URL \
    && mkdir $HOME_PATH

RUN unzip $FILE_NAME -d $HOME_PATH \
    && rm $FILE_NAME \
    && cd $HOME_PATH && mv `echo *`/* "$HOME_PATH/" \
    && mkdir -p $CONFIG_DIR $CACHE_DIR \
    && ln -s $CACHE_DIR "$CONFIG_DIR/caches" \
    && ln -s "$HOME_PATH/bin/gradle" /usr/bin/gradle \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/apt/lists/partial/*


WORKDIR $WORK_PATH


ENV GRADLE_HOME=$HOME_PATH
ENV PATH=$GRADLE_HOME/bin:$PATH


VOLUME $CACHE_DIR


ENTRYPOINT ["gradle"]