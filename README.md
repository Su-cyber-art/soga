# soga

这是 `soga` 的维护复刻仓库，安装入口已固定到指定版本 **v2.13.7**。

## 说明

- 固定安装版本：`v2.13.7`
- 支持架构：`amd64`、`arm64`
- 支持系统：常见 64 位 Linux 发行版（Debian / Ubuntu / CentOS 等，需 systemd）
- 安装脚本不再拉取 `latest`，也不会根据输入参数安装其他版本
- 管理脚本 `soga update` 也固定重新安装 `v2.13.7`
- 二进制包、管理脚本和辅助工具均来自本仓库；Release `v2.13.7` 内置 `amd64` / `arm64` 资产

## 一键安装

```bash
bash <(curl -Ls https://raw.githubusercontent.com/Su-cyber-art/soga/master/install.sh)
```

如果服务器没有 `curl`，可使用：

```bash
wget -O install.sh https://raw.githubusercontent.com/Su-cyber-art/soga/master/install.sh && bash install.sh
```

> 即使在命令后传入版本号，脚本也会忽略该参数，并始终安装 `v2.13.7`。

## 安装管理命令

完整安装后会写入 `/usr/bin/soga` 管理命令：

```bash
soga              # 显示管理菜单
soga start        # 启动 soga
soga stop         # 停止 soga
soga restart      # 重启 soga
soga status       # 查看状态
soga enable       # 设置开机自启
soga disable      # 取消开机自启
soga log          # 查看日志
soga update       # 重新安装固定版本 v2.13.7
soga config       # 查看/修改配置
soga uninstall    # 卸载
soga version      # 查看版本
```

## 仅安装管理命令

如果只需要安装 `/usr/bin/soga` 管理命令：

```bash
bash <(curl -Ls https://raw.githubusercontent.com/Su-cyber-art/soga/master/install_cmd.sh)
```

## 配置位置

默认配置目录：

```text
/etc/soga/
```

首次安装完成后，请按实际环境修改：

```bash
nano /etc/soga/soga.conf
systemctl restart soga
```

## 卸载

```bash
soga uninstall
```

或手动清理：

```bash
systemctl stop soga
systemctl disable soga
rm -f /etc/systemd/system/soga.service /etc/systemd/system/soga@.service
rm -rf /usr/local/soga /etc/soga /usr/bin/soga /usr/bin/soga-tool
systemctl daemon-reload
```

## 版本策略

本仓库后续安装入口统一固定为 `v2.13.7`，避免 `latest` 变化导致不同服务器安装结果不一致。若未来需要升级版本，应先在仓库中明确修改固定版本号并测试后再发布。
