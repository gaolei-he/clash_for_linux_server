# linux上使用clash

## 安装

```bash
git clone https://github.com/gaolei-he/clash_for_linux_server.git
cd clash_for_linux_server
bash #需在bash中，zsh需修改install.sh，见后文
./install.sh
```

并将你的配置文件放在`~/.config/clash/config.yaml`

## 启动

```bash
start_clash
```

## 退出

1. 使用`Ctrl+D`退出终端，clash会自动退出（推荐）
2. 使用`exit_clash`命令退出

## 说明

1. 由于订阅链接现多采用加密方式，因此你需要手动将本地解密后的订阅配置文件上传至服务器`~/.config/clash/`路径，并命名为`config.yaml`（本地的配置文件查找方式见后图，通过该方式找到文件所在路径，打开所在文件夹，上传至服务器即可，注意上传后重命名为`config.yaml`）

2. 默认情况下，clash会代理7890端口，你需要确保`config.yaml`中的端口号（关键字为`mixed-prot`或`port`等）和`install.sh`中的端口号一致，建议修改为大一点（>10000）的端口，避免与其他程序冲突(你也可以不修改install.sh的端口号，直接在.bashrc中修改端口号)

3. 同时，`config.yaml`中，`external-controller`所在行行首添加#注释掉即可，减少端口占用（该端口为web面板，仅在需要安装web面板时才需要）

4. 可通过`wget google.com`测试代理是否正常，如正常，返回码为`200`，会生成一个`index.html`文件（该文件无用，可删除）

5. 注意不用时及时[关闭](#退出)，避免长期占用端口

6. 该程序兼容bash，如使用zsh，需将install.sh中的trap行命令删除，同时退出clash仅支持exit_clash命令

7. 关于web面板的使用：如果要使用web面板选择节点等操作，不要删除`3`中的`external-controller`选项，在启动clash后，将其端口通过vscode转发到本地，然后在[这里](yacd.haishan.me)在本地连接到该端口进行控制

## 其他问题

如遇`start_clash: command not found`，可尝试执行`source ~/.bashrc`

默认情况下，安装脚本会将`clash`的配置文件和程序放在`~/.config/clash/`

输出log到`~/.config/clash/clash.log`

安装后可删除该仓库。

如重新安装，建议删除`.bashrc`中已添加的clash配置内容

如遇问题，欢迎pr

<img width="940" height="737" alt="image" src="https://github.com/user-attachments/assets/9c9f3320-012a-4c23-9c23-f65ceb8dd0ce" />

