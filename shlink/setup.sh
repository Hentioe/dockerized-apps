#!/usr/bin/env bash

# 如果没有 ./data 目录，则创建它
if [ ! -d "./data" ]; then
  mkdir ./data
fi
# 赋予其它用户对 ./data 目录的读写权限
chmod -R 777 ./data
