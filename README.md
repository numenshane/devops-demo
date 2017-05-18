Devops 
======
General purpose:
  - used for automatically provision of a whole devops platform  under one physical machine 

POC:
  - CentOS Linux release 7.3.1611 (Core) + vagrant 1.9.4 + virtualbox 5.1.22 + ansible 2.3.0.0

Contract:
  - devs and ops agreed devops contract	
    - -> dev write Dockerfile for proj, one Dockerfile for one Apps --- single app within proj
    - -> dev write Composefile for proj, one Composefile for one stack --- multi apps within proj
        
    - -> ops provision platform, create project pipeline for each proj
Concept Workflow:			
  - commit code 
	- -> login to central control center 
		- -> config QA profile(env + resouce), tag tested suc then auto staging 
			- -> one click deploy freely 
				- -> full lifecycle management 
					- -> scheduling in a large, parallel fast start up and gracefully termination, be fast
					- -> auto-scaling auto-discoverable auto-routing, be smart
					- -> highly secure, reliable, available  
					- -> centrol dashboard for visualizing app/env status metrics and app logs, be unified
					- -> mult-factor authenticate, contralized authorization service, fine-grain permission control, free balanced

12 Factors:
  - 研发：one code repo for each app, declarative dependency manage using Dockerfile, lift configuration info upto standardized environmental variables
  - 管道构建：decoupling & strictly separating dev/QA/Prod stages, multi concurrent proj with multi tagged versions
  - 运维管控：stateless service, treat BE services as attached resource and jobs as temporary adhoc process, outside access by port NAT, stdout logs
  - 高层编排：scheduling as a whole for a stack, multi-stack coordination by register/discover/call
	
Implemented: 
  - vagrant and ansible-playbook for ci-cd setup(jdk 8, jenkins master, docker private registry, control k/v store using consul
	- auto create demo using jenkins role and template substituion;
	- auto install jenkins plugin like pipeline,github ...
 
	- k8s cluster single node setup,etcd/docker/kube*, central control center using consul to store app config/resource info
	
	- i have setup a nodejs-demo project, see my repo https://github.com/numenshane/docker-nodejs-demo
	- i have fully automated the demo dev-test-staging-prod using jenkins pipeline plugin

Problem:
  - introduce template file, like aws cloudformation for coding infrastructure
    - how to manipulate each specifical proj's testing and deploying need when automating ci-cd pipeline 
 - ansible playbook compatible with multi version OS, func like aws OpsWorks using Chef
