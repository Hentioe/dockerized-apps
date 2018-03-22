FROM buildpack-deps:stretch-curl


ARG FILE_NAME=jdk-10_linux-x64_bin.tar.gz
ARG FILE_HASH=76eac37278c24557a3c4199677f19b62
ARG ARCH=10+46
ARG URL=http://192.168.50.1:5000/dl/jdk-10_linux-x64_bin.tar.gz
ARG ROOT=/usr/local/jdk

WORKDIR $ROOT

RUN wget --no-check-certificate -c \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -O $FILE_NAME $URL && \
    tar -zxvf $FILE_NAME -C $ROOT && \
    rm $FILE_NAME && \
    cd $ROOT && mv `echo *`/* $ROOT/ && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s ${ROOT}/bin/java /usr/bin/java && ln -s ${ROOT}/bin/javac /usr/bin/javac

ENV JAVA_HOME=$ROOT
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$JAVA_HOME/bin:$PATH

CMD javac