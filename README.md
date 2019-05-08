# docker
go-swoole 的docker容器，免安装扩展，一键启动适合go-swoole运行的开发环境。

## 拉取镜像

 `docker pull registry.cn-beijing.aliyuncs.com/anythink/go-swoole:lastest` 

## 启动镜像

 `docker run -it --rm -p 8080:8080 -v $PWD:/data registry.cn-beijing.aliyuncs.com/anythink/go-swoole:lastest` 
 
请在 go-swoole 根目录运行，否则修改$PWD为代码根路径，如果修改了端口请把8080 修改为自己使用的端口.

启动镜像后需要切换到 /data 目录，该目录挂载到主机的代码根目录，注意Mac系统无法使用inotify热加载功能。
 
 
 ## 定制 Dockerfile
 
 修改完Dockerfile后，在 Dockerfile 文件同级目录执行以下命令生成自己的docker 镜像，然后按照上面的方式启动镜像。
 `docker build -t registry.cn-beijing.aliyuncs.com/anythink/go-swoole:lastest . `
 
 
 ### 安装的软件与扩展请查看 Dockerfile
