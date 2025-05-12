#!/bin/bash

# SRBMiner-Multi一键安装和运行脚本
# 适用于Linux系统

# 检查是否为root用户
if [ "$(id -u)" -ne 0 ]; then
    echo "请使用sudo或以root用户运行此脚本"
    exit 1
fi

# 更新系统和安装必要组件
echo "正在更新系统并安装必要组件..."
apt update > /dev/null 2>&1
apt install -y sudo wget libcurl4 openssl libjansson4 libgomp1 > /dev/null 2>&1

# 下载SRBMiner-Multi
echo "正在下载SRBMiner-Multi..."
if [ ! -f "SRBMiner-Multi-2-8-7-Linux.tar.gz" ]; then
    wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.8.7/SRBMiner-Multi-2-8-7-Linux.tar.gz > /dev/null 2>&1
fi

# 解压文件
echo "正在解压文件..."
tar -xzf SRBMiner-Multi-2-8-7-Linux.tar.gz > /dev/null 2>&1

# 进入目录
cd SRBMiner-Multi-2-8-7

# 设置执行权限
chmod +x SRBMiner-MULTI

# 启动挖矿
echo "正在启动SRBMiner-Multi进行挖矿..."
echo "算法: sha3x"
echo "矿池: tari.luckypool.io:6118"
echo "钱包地址: solo:126URyVrk2hzyNRsT5jhkR7v7SKYEbTkbdE4Zs8dhRwKcDexdxwpq4dWywZZhysQRyXR2516HXynLXYCZss1GLfhFFs"
echo "按Ctrl+C停止挖矿"

env -i \
  PATH=/usr/bin:/bin \
  LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu \
  ./SRBMiner-MULTI \
    --algorithm sha3x \
    --pool tari.luckypool.io:6118 \
    --wallet solo:126URyVrk2hzyNRsT5jhkR7v7SKYEbTkbdE4Zs8dhRwKcDexdxwpq4dWywZZhysQRyXR2516HXynLXYCZss1GLfhFFs
