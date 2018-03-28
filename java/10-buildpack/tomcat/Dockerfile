FROM bluerain/java-10-buildpack:jre


ARG MAJOR=9
ARG VERSION=9.0.6
ARG FILE_NAME="apache-tomcat-$VERSION.tar.gz"
ARG URL="http://apache.01link.hk/tomcat/tomcat-$MAJOR/v$VERSION/bin/$FILE_NAME"

ARG HOME_PATH=/usr/local/tomcat
ARG WORK_PATH=/home/app
ARG LOGS_DIR=/home/logs
ARG WEBAPPS_DIR="$HOME_PATH/webapps"


RUN mkdir -p $HOME_PATH $WORK_PATH $LOGS_DIR \
    && wget -O $FILE_NAME $URL \
    && tar -zxvf $FILE_NAME -C $HOME_PATH \
    && rm $FILE_NAME \
    && cd $HOME_PATH && mv `echo *`/* "$HOME_PATH/" \
    && mv "$WEBAPPS_DIR/ROOT"  "$WORK_PATH/" \
    && rm $WEBAPPS_DIR "$HOME_PATH/logs" -R \
    && ln -s $WORK_PATH $WEBAPPS_DIR \
    && ln -s $LOGS_DIR "$HOME_PATH/logs" \
    && ln -s "$HOME_PATH/bin/catalina.sh" /usr/bin/catalina.sh


WORKDIR $WORK_PATH


ENV TOMCAT_HOME=$HOME_PATH
ENV PATH="$TOMCAT_HOME/bin:$PATH"


EXPOSE 8080


VOLUME $LOGS_DIR


CMD ["catalina.sh", "run"]