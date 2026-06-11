### 另一个在linux服务器上使用clash的方法（一句话概括就是把本地clash代理端口转发到服务器上用）

1. 打开本机clash的allow lan功能，查看本机clash代理的端口（一般是7890或7897）
<img width="940" height="737" alt="image" src="https://github.com/user-attachments/assets/e8754050-c5bc-4b28-a5f9-4006ed2250ff" />

2. 打开本地终端，通过ssh隧道，将本地clash代理的端口转发到服务器上
```bash
ssh -fCNR xxxx:localhost:yyyy username@ip -o "ServerAliveInterval=60" -o "ServerAliveCountMax=5"
```
其中xxxx可以随便设，只要该端口在服务器端没被占用，yyyy为`1.`中clash的代理端口，username为你服务器的用户名，ip为服务器ip地址

3. 在服务器终端设置代理环境变量
```bash
export http_proxy='http://localhost:xxxx'
export https_proxy='http://localhost:xxxx'
```
其中xxxx为`2.`中设置的端口
