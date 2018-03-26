# dockerfiles
为个人需求而编写开源的 Docker 镜像列表。

注：以下主要分为应用镜像（封装 APP 的镜像）和构建镜像（封装编译工具链的镜像）

## Java

### 基础镜像：

|封装环境|名称+标签|
|-------|--------|
|JDK|bluerain/java-10-buildpack:jdk|
|JRE|bluerain/java-10-buildpack:jre|

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
$PWD 变量指的是项目的根目录（具有 pom.xml 的路径），持久化缓存到指定 VOLUME:
````
docker run -i --rm -v $PWD:/home/src -v cache-maven:/home/cache bluerain/java-10-buildpack:maven package
````

Gradle:

````
docker run -i --rm -v $PWD:/home/src bluerain/java-10-buildpack:gradle build
````
$PWD 变量指的是项目的根目录（具有 build.gradle 的路径），持久化缓存到指定 VOLUME:
````
docker run -i --rm -v $PWD:/home/src -v cache-gradle:/home/cache bluerain/java-10-buildpack:gradle build
````
