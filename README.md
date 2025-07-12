# linux上使用clash

## 安装

```bash
git clone https://github.com/gaolei-he/clash_for_linux_server.git
cd clash_for_linux_server
./install.sh
```

并将你的配置文件放在`~/.config/clash/config.yaml`

## 启动

```bash
start_clash
```

## 退出

1. 使用`Ctrl+D`退出终端，clash会自动退出
2. 使用`exit_clash`命令退出

## 细节

clash默认代理端口为7890，如需更改，修改`install.sh`中的所有`7890`为你需要的端口。

默认情况下，安装脚本会将`clash`的配置文件和程序放在`~/.config/clash/`

输出log到`~/.config/clash/clash.log`

安装后可删除该仓库。