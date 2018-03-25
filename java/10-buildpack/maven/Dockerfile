FROM bluerain/java-10-buildpack:jdk


ARG VERSION=3.5.3
ARG FILE_NAME="apache-maven-$VERSION-bin.tar.gz"
ARG URL="http://apache.communilink.net/maven/maven-3/$VERSION/binaries/$FILE_NAME"

ARG HOME_PATH=/usr/local/maven
ARG WORD_PATH=/home/src
ARG CONFIG_DIR=/root/.m2
ARG CACHE_DIR=/home/cache


RUN wget -O $FILE_NAME $URL \
    && mkdir $HOME_PATH \
    && tar -zxvf $FILE_NAME -C $HOME_PATH
RUN rm $FILE_NAME \
    && cd $HOME_PATH && mv `echo *`/* "$HOME_PATH/" \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s "$HOME_PATH/bin/mvn" /usr/bin/mvn \
    && mkdir -p $CONFIG_DIR $CACHE_DIR \
    && ln -s $CACHE_DIR "$CONFIG_DIR/repository"


WORKDIR $WORD_PATH


ENV MAVEN_HOME=$HOME_PATH
ENV MAVEN_CONFIG="$WORD_PATH/.m2"
ENV PATH=$MAVEN_HOME/bin:$PATH


ENTRYPOINT ["mvn"]