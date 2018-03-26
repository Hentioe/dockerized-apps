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

Maven（mvn package）:

```` bash
docker run -i --rm -v $PWD:/home/src bluerain/java-10-buildpack:maven package
````

持久化 Maven 缓存到指定 VOLUME:

```` bash
docker run -i --rm -v $PWD:/home/src -v cache-maven:/home/cache bluerain/java-10-buildpack:maven package
````

Gradle(gradle build):

```` bash
docker run -i --rm -v $PWD:/home/src bluerain/java-10-buildpack:gradle build
````

持久化 Gradle 缓存到指定 VOLUME:

```` bash
docker run -i --rm -v $PWD:/home/src -v cache-gradle:/home/cache bluerain/java-10-buildpack:gradle build
````

### 应用镜像

|封装环境|名称+标签|FROM|
|-------|--------|--------|
|Tomcat|bluerain/java-10-buildpack:tomcat|bluerain/java-10-buildpack:jre|

注：当前版本分支：9

持久化 Tomcat 日志到指定 VOLUMN:

```` bash
docker run -ti --name tomcat -d -v logs-tomcat:/home/logs bluerain/java-10-buildpack:tomcat
````

封装 APP 镜像的 COPY 指令：

```` dockerfile
COPY ./<YOUR_WAR_PATH> /home/app/ROOT.war
````

## Golang

### 构建镜像


|封装环境|名称+标签|FROM|
|-------|--------|--------|
|Go+Glide|bluerain/golang-10.10-alpine:glide|alpine:3.7|

注：当前分支版本：1.10

#### 使用方式：

```` bash
docker run -i --rm -v $PWD:/home/src bluerain/golang-1.10-alpine:glide
````

注意了，因为挂载到 `/home/src` 的目录会链接到容器中的 `$GOPATH/src/targetProject` 中，所以无论宿主机系统上的项目存放在哪个位置最终都能正确编译。  

持久化 Glide 缓存到指定 VOLUME:

```` shell
docker run -i --rm -v $PWD:/home/src -v cache-glide:/home/cache bluerain/golang-1.10-alpine:glide
````
