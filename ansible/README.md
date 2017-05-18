新增一个pipeline配置
ansible-playbook -i hosts/local_devtest pipeline_config.yml -e "project_name=docker-nodejs-demo repo_url=https://github.com/numenshane"
project_name为工程名称
repo_url为代码仓库地址
配置文件模版中最终仓库的url为 repo_url/project_name

production_daemon_config
ansible-playbook -i hosts/local_devtest production_daemon_config.yml
