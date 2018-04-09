# dockerfiles/app
对各种 app 环境的封装，列出的所有命令可以直接执行（全部上线 DockerHub）。

注意：下面的文字不会对任何 app 有相关介绍，如果你想进一步了解请阅读说明中的链接（通常是官方 Wiki）。

## udp2raw-tunnel

说明：https://github.com/wangyu-/udp2raw-tunnel/blob/master/README.md

### 镜像信息

|名称+标签|FROM|
|--------|--------|
|bluerain/udp2raw-tunnel|alpine:3.7|

#### 使用方式

```` bash
docker run -ti --name udp2raw-tunnel -d --net=host --cap-add NET_ADMIN --restart=always \
bluerain/udp2raw-tunnel <ARGS>
````

例子：

```` bash
docker run -ti --name udp2raw-tunnel -d --net=host --cap-add NET_ADMIN --restart=always \
bluerain/udp2raw-tunnel -s -l0.0.0.0:4096  -r127.0.0.1:4097 -a -k "passwd" --raw-mode faketcp --cipher-mode xor
````

附加：因为 udp2raw-tunnel 需要向 iptables 中添加规则，所以需要添加 NET_ADMIN 这个 Capability

___

*更多镜像待更新*
