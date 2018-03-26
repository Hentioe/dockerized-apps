# dockerfiles
为个人需求而编写开源的 Docker 镜像列表，列出的所有命令可以直接执行（全部上线 DockerHub）。

注：以下主要分为应用镜像（封装 APP 的镜像）和构建镜像（封装编译工具链的镜像）。

## Java

### 基础镜像

|封装环境|名称+标签|FROM|
|-------|--------|--------|
|JDK|bluerain/java-10-buildpack:jdk|buildpack-deps:stretch-curl|
|JRE|bluerain/java-10-buildpack:jre|buildpack-deps:stretch-curl|

注：基于 Oracle Java 构建（非 OpenJdk），版本分支：10


### 构建镜像

|封装环境|名称+标签|FROM|
|-------|--------|--------|
|Maven|bluerain/java-10-buildpack:maven|bluerain/java-10-buildpack:jdk|
|Gradle|bluerain/java-10-buildpack:gradle|bluerain/java-10-buildpack:jdk|

#### 使用方式

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
docker run -ti --name tomcat -d -p 8080:8080 -v logs-tomcat:/home/logs bluerain/java-10-buildpack:tomcat
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

#### 使用方式

```` bash
docker run -i --rm -v $PWD:/home/src bluerain/golang-1.10-alpine:glide
````

容器工作结束以后会产生一个 `./bin` 文件。

注意：因为 Alpine 的 musl libc 库的原因，如果依赖 GCC 的项目可能会导致宿主机无法执行编译后的目标文件，所以你需要用基于 Alpine 封装自己的应用镜像。

PS:因为挂载到 `/home/src` 的目录会链接到容器中的 `$GOPATH/src/targetProject` 中，所以无论宿主机系统上的项目存放在哪个位置最终都能正确编译。  

持久化 Glide 缓存到指定 VOLUME:

```` shell
docker run -i --rm -v $PWD:/home/src -v cache-glide:/home/cache bluerain/golang-1.10-alpine:glide
````

## Node.js

### 构建镜像

|封装环境|名称+标签|FROM|
|-------|--------|--------|
|Node+Yarn|bluerain/node-8.10-alpine:yarn|alpine:3.7|

注：当前分支：8.10

### 使用方式：

默认执行(yarn run build)

````
docker run -i --rm -v $PWD:/home/src bluerain/node-8.10-alpine:yarn
````

经过依赖安装以后会执行 package.json 中的某个 SCRIPT 指令，默认的 SCRIPT 指令是 build，这仅仅只是一个约定。

执行自己的 SCRIPT(build:prd):

````
docker run -i --rm -v $PWD:/home/src bluerain/node-8.10-alpine:yarn build:prd
````

持久化 Yarn 的缓存到指定 VOLUME:

````
docker run -i --rm -v $PWD:/home/src -v cache-yarn:/home/cache bluerain/node-8.10-alpine:yarn
````

## Ruby

### 基础镜像

|封装环境|名称+标签|FROM|
|-------|--------|--------|
|Ruby+build-essential|bluerain/ruby-2.5-slim:build-essential|library/ruby:2.5-slim|
|Ruby+build-essential+libmysql|bluerain/ruby-2.5-slim:libmysql|bluerain/ruby-2.5-slim:build-essential|

注：当前分支：2.5

由于 Ruby 这类脚本语言的特殊性（只能使用共享库），所以一般使用基础镜像直接包装 APP 作为应用镜像。

#### 使用方式

构建应用镜像:

```` dockerfile
FROM bluerain/ruby-2.5-slim:build-essential


ARG HOME_PATH=/usr/local/blog


COPY ./ $HOME_PATH


WORKDIR $HOME_PATH


RUN gem install bundler && bundle


EXPOSE 8080


CMD ["ruby", "www.rb", "production"]
````
Gem 拉取依赖时碰到包含 Native 代码的依赖必须要使用 build-essentail 中的编译工具链才能完成安装工作，所以仅仅靠 Ruby 官方的 Docker 镜像是不行的，需要基于它们二次定制。  
注：build-essential 是 Debian 中的包名。

libmysql 镜像是面向常见的 Ruby+Mysql 场景，需要系统环境包含 libmysql 包才能使项目正常工作。
___

*更多镜像待更新*
