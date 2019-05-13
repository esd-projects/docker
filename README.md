# docker
EasySwoole Distributed 的 docker 镜像，免安装扩展，一键启动适合ESD运行的开发环境。

```
➜ docker run -it --rm -p 8080:8080 -v $PWD:/data registry.cn-beijing.aliyuncs.com/anythink/esd:latest
 _____ ____  ____    ____              _   _
| ____/ ___||  _ \  |  _ \ _   _ _ __ | |_(_)_ __ ___   ___
|  _| \___ \| | | | | |_) | | | | '_ \| __| | '_ ` _ \ / _ \
| |___ ___) | |_| | |  _ <| |_| | | | | |_| | | | | | |  __/
|_____|____/|____/  |_| \_\\__,_|_| |_|\__|_|_| |_| |_|\___|
ESD framework Runtime Environment
version 1.5 author by anythink
root@f41132062911:/data# 
```


## 拉取镜像

 `docker pull registry.cn-beijing.aliyuncs.com/anythink/esd:latest` 

## 启动镜像

 `docker run -it --rm -p 8080:8080 -v $PWD:/data registry.cn-beijing.aliyuncs.com/anythink/esd:latest` 
 
请在 ESD 根目录运行容器，否则修改$PWD为代码根路径（windows需要用%cd%替换$PWD），如果修改了端口请把8080 修改为自己使用的端口.

镜像启动后的目录即挂载到主机的代码目录，注意 Mac 系统无法使用 inotify 热加载功能。

容器启动后执行命令 `composer update` 更新依赖,`php examples/start_server.php start`运行框架
 
 
 ## 定制 Dockerfile
 
 修改完Dockerfile后，在 Dockerfile 文件同级目录执行以下命令生成自己的docker 镜像，然后按照上面的方式启动镜像。
 `docker build -t registry.cn-beijing.aliyuncs.com/anythink/esd:latest . `
 
 
 ### 相关说明
 
 如果使用Mac系统想从docker里访问宿主的服务比如redis，mysql，则需使用 192.168.65.2 或者 host.docker.internal 。
 
 如果非Mac系统，则需使用 172.17.0.1
 
 [查看相关链接](https://docs.docker.com/docker-for-mac/networking/#there-is-no-docker0-bridge-on-macos)

 

 ### 安装的软件与扩展请查看 Dockerfile
 
