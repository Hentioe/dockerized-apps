FROM bluerain/java-10-buildpack:jre


ARG MAJOR=9
ARG VERSION=9.0.6
ARG FILE_NAME="apache-tomcat-$VERSION.tar.gz"
ARG URL="http://apache.01link.hk/tomcat/tomcat-$MAJOR/v$VERSION/bin/$FILE_NAME"

ARG HOME_PATH=/usr/local/tomcat
ARG WORK_PATH=/home/app


WORKDIR $WORK_PATH

RUN mkdir -p $HOME_PATH $WORK_PATH \
    && wget -O $FILE_NAME $URL
RUN tar -zxvf $FILE_NAME -C $HOME_PATH \
    && rm $FILE_NAME \
    && cd $HOME_PATH && mv `echo *`/* "$HOME_PATH/" \
    && mv $HOME_PATH/webapps/ROOT  "$WORK_PATH/" \
    && rm $HOME_PATH/webapps -R \
    && ln -s $WORK_PATH $HOME_PATH/webapps \
    && ln -s "$HOME_PATH/bin/catalina.sh" /usr/bin/catalina.sh


ENV TOMCAT_HOME=$HOME_PATH
ENV PATH="$TOMCAT_HOME/bin:$PATH"


EXPOSE 8080


CMD ["catalina.sh", "run"]