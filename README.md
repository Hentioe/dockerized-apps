# dockerfiles
为个人需求而编写开源的 Docker 镜像列表。

注：以下主要分为应用镜像（封装 APP 的镜像）和构建镜像（封装编译工具链的镜像）

## Java

### 基础镜像：

|封装环境|名称+标签|FROM|
|-------|--------|--------|
|JDK|bluerain/java-10-buildpack:jdk|buildpack-deps:stretch-curl|
|JRE|bluerain/java-10-buildpack:jre|buildpack-deps:stretch-curl|

注：基于 Oracle Java 构建（非 OpenJdk），版本分支：10


### 构建镜像：

|封装环境|名称+标签|FROM|
|-------|--------|--------|
|Maven|bluerain/java-10-buildpack:maven|bluerain/java-10-buildpack:jdk|
|Gradle|bluerain/java-10-buildpack:gradle|bluerain/java-10-buildpack:jdk|

#### 使用方式：

Maven（执行 mvn package 命令）:

````
docker run -i --rm -v $PWD:/home/src bluerain/java-10-buildpack:maven package
````

持久化缓存到指定 VOLUME:

````
docker run -i --rm -v $PWD:/home/src -v cache-maven:/home/cache bluerain/java-10-buildpack:maven package
````

Gradle:

````
docker run -i --rm -v $PWD:/home/src bluerain/java-10-buildpack:gradle build
````

持久化缓存到指定 VOLUME:

````
docker run -i --rm -v $PWD:/home/src -v cache-gradle:/home/cache bluerain/java-10-buildpack:gradle build
````

### 应用镜像

|封装环境|名称+标签|FROM|
|-------|--------|--------|
|Tomcat|bluerain/java-10-buildpack:tomcat|bluerain/java-10-buildpack:jre|

注：当前版本分支：9

持久化 logs 到指定 VOLUMN:

````
docker run -ti -name tomcat -v logs-tomcat:/home/logs bluerain/java-10-buildpack:tomcat
````

封装 APP 镜像的 COPY 指令：

````
COPY ./<YOUR_WAR_PATH>.war /home/app/ROOT.war
````
