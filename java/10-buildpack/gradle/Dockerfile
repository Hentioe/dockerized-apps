FROM bluerain/java-10-buildpack:jdk


ARG VERSION=4.6
ARG FILE_NAME="gradle-$VERSION-bin.zip"
ARG URL="https://services.gradle.org/distributions/$FILE_NAME"

ARG HOME_PATH=/usr/local/gradle
ARG WORK_PATH=/home/gradle


WORKDIR $WORK_PATH


RUN apt-get install unzip \
    && wget -O $FILE_NAME $URL \
    && mkdir $HOME_PATH  \
    && unzip $FILE_NAME -d $HOME_PATH \
    && rm $FILE_NAME \
    && cd $HOME_PATH && mv `echo *`/* "$HOME/" \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s "$HOME_PATH/bin/gradle" /usr/bin/gradle

ENV GRADLE_HOME=$HOME_PATH
ENV PATH=$GRADLE_HOME/bin:$PATH

ENTRYPOINT ['gradle']
CMD ['gradle']