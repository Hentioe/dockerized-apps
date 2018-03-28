FROM buildpack-deps:stretch-curl


ARG FILE_NAME=jdk-10_linux-x64_bin.tar.gz
ARG FILE_HASH=76eac37278c24557a3c4199677f19b62
ARG ARCH=10+46
ARG URL="http://download.oracle.com/otn-pub/java/jdk/${ARCH}/${FILE_HASH}/${FILE_NAME}"

ARG HOME_PATH=/usr/local/java
ARG OPTS=-Dfile.encoding=UTF8


RUN wget --no-check-certificate -c \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -O $FILE_NAME $URL

RUN mkdir $HOME_PATH  \
    && tar -zxvf $FILE_NAME -C $HOME_PATH \
    && cd $HOME_PATH && mv `echo *`/* "$HOME_PATH/" \
    && ln -s "$HOME_PATH/bin/java" /usr/bin/java \
    && ln -s "$HOME_PATH/bin/javac" /usr/bin/javac \
    && rm $FILE_NAME


ENV JAVA_TOOL_OPTIONS=$OPTS
ENV JAVA_HOME=$HOME
ENV CLASSPATH=".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar"
ENV PATH="$JAVA_HOME/bin:$PATH"


CMD ["javac"]