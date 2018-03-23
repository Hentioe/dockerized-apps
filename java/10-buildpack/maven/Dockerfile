FROM bluerain/java-10-buildpack:jdk


ARG VERSION=3.5.3
ARG FILE_NAME="apache-maven-$VERSION-bin.tar.gz"
#"http://apache.communilink.net/maven/maven-3/$VERSION/binaries/$FILE_NAME"
ARG URL=http://192.168.50.1:5000/dl/apache-maven-3.5.3-bin.tar.gz
ARG HOME=/usr/local/maven
ARG ROOT=/root


WORKDIR $ROOT


RUN wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -O $FILE_NAME $URL \
    && mkdir $HOME  \
    && tar -zxvf $FILE_NAME -C $HOME \
    && rm $FILE_NAME \
    && cd $HOME && mv `echo *`/* "$HOME/" \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s "$HOME/bin/mvn" /usr/bin/mvn

ENV MAVEN_HOME=$HOME
ENV MAVEN_CONFIG="$ROOT/.m2"
ENV PATH=$MAVEN_HOME/bin:$PATH

ENTRYPOINT ['mvn']
CMD ['mvn']