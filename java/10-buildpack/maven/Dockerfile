FROM bluerain/java-10-buildpack:jdk


ARG VERSION=3.5.3
ARG FILE_NAME="apache-maven-$VERSION-bin.tar.gz"
ARG URL="http://apache.communilink.net/maven/maven-3/$VERSION/binaries/$FILE_NAME"

ARG HOME_PATH=/usr/local/maven
ARG WORD_PATH=/home/maven


WORKDIR $WORD_PATH


RUN wget -O $FILE_NAME $URL \
    && mkdir $HOME_PATH  \
    && tar -zxvf $FILE_NAME -C $HOME_PATH \
    && rm $FILE_NAME \
    && cd $HOME_PATH && mv `echo *`/* "$HOME_PATH/" \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s "$HOME_PATH/bin/mvn" /usr/bin/mvn

ENV MAVEN_HOME=$HOME_PATH
ENV MAVEN_CONFIG="$ROOT/.m2"
ENV PATH=$MAVEN_HOME/bin:$PATH

ENTRYPOINT ["mvn"]