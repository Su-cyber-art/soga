#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

SOGA_VERSION="2.13.7"
SOGA_REPO="Su-cyber-art/soga"
RAW_BASE="https://raw.githubusercontent.com/${SOGA_REPO}/master"

# check root
[[ $EUID -ne 0 ]] && echo -e "${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1

arch=$(arch)

if [[ $arch == "x86_64" || $arch == "x64" || $arch == "amd64" ]]; then
    arch="amd64"
elif [[ $arch == "aarch64" || $arch == "arm64" ]]; then
    arch="arm64"
else
    arch="amd64"
    echo -e "${red}检测架构失败，使用默认架构: ${arch}${plain}"
fi

echo "架构: ${arch}"

if [ "$(getconf WORD_BIT)" != '32' ] && [ "$(getconf LONG_BIT)" != '64' ] ; then
    echo "本软件不支持 32 位系统(x86)，请使用 64 位系统(x86_64)，如果检测有误，请联系作者"
    exit 2
fi

echo -e "${green}开始安装 soga 管理脚本（固定 soga v${SOGA_VERSION}）${plain}"

curl -o /usr/bin/soga -Ls "${RAW_BASE}/soga.sh"
if [[ $? -ne 0 ]]; then
    echo -e "${red}下载 soga 管理脚本失败，请确认网络可访问 Github${plain}"
    exit 1
fi

chmod +x /usr/bin/soga

last_version="$(/usr/bin/soga -v 2>/dev/null || echo "unknown")"
echo -e "${green}soga 管理脚本 ${last_version}${plain} 安装完成"

echo -e ""
echo -e "执行 ${green}soga${plain} 命令运行管理脚本；安装/更新时将固定安装 soga v${SOGA_VERSION}"
