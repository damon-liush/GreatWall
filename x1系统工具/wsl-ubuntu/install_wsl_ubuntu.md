# How to install ubuntu with wsl2

## 1. Install wsl2

## 2. Install ubuntu22

### 2.1 WSL2不能上网，Failed to connect to github.com port 443问题解决方案

第一步：sudo vim /etc/hosts

第二步：文件最后添加一行：140.82.114.3 github.com

### 2.2 buildroot 中path问题

第一步：修改/etc/wsl.conf
[interop] 
enabled=false
appendWindowsPath=false

第二步：powershell中重启wsl
 net stop LxssManager
 net start LxssManager
