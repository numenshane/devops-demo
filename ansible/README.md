新增一个pipeline配置
ansible-playbook -i hosts/local_devtest pipeline_config.yml -e "project_name=docker-nodejs-demo repo_url=https://github.com/numenshane/docker-nodejs-demo.git check_uri="/" consul_ip="192.168.100.3" consul_port=8500 docker_registry=192.168.100.3:5000 expose_port=8080"
project_name必须为工程名称 repo_url为代码仓库地址
check_uri为验证的路径，consul_ip和consul_port为consul服务的ip和端口 docker_registry docker仓库的url expose_port 指的docker容器内部对外暴露的端口
配置文件模版中最终仓库的url为 ${repo_url}/${project_name}

production_daemon_config, integrated into jenkins role
ansible-playbook -i hosts/local_devtest production_daemon_config.yml
