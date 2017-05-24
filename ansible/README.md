
## 初始化安装Jenkins及其他服务

```
ansible-playbook -i hosts/local_devtest devtest.yml 
```
### 初始化内容
1. pip 
2. ReadHat下自动安装jdk
3. git服务
4. consul服务
5. docker服务
6. jenkins
7. registry

---

## 新增一个pipeline工程

```
ansible-playbook -i hosts/local_devtest pipeline_config.yml -e "project_name=docker-nodejs-demo repo_url=https://github.com/numenshane/docker-nodejs-demo.git check_uri="/" consul_ip="192.168.100.3" consul_port=8500 docker_registry=192.168.100.3:5000 expose_port=8088"
```
## 参数说明
1. project_name 为工程名称
2. repo_url 为代码仓库地址
3. check_uri为验证的路径
4. consul_ip和consul_port为consul服务的ip和端口
5. docker_registry docker仓库的url
6. expose_port 指的docker容器内部对外暴露的端口
---

