sudo su -
# install kubernetes 
yum install kubernetes.x86_64 -y
yum install etcd.x86_64 net-tools.x86_64 -y

# docker part
# add --insecure-registry to docker config
sed -i 's/#INSECURE_REGISTRY/INSECURE_REGISTRY/g' /etc/sysconfig/docker
sed -i 's/--insecure-registry/--insecure-registry 192.168.100.3:5000/g' /etc/sysconfig/docker

# ectd part
sed -i 's/localhost/192.168.100.2/g' /etc/etcd/etcd.conf
systemctl start etcd

cd /etc/kubernetes/ 
sed -i 's/127.0.0.1/192.168.100.2/g' *
sed -i 's/,ServiceAccount//g' *
systemctl start kube-apiserver kube-scheduler.service kube-controller-manager.service
systemctl start kubelet.service kube-proxy.service
# test 
curl http://192.168.100.2:8080
if [ $? -eq 0 ]; then echo kubernets cluster with single node install successfully; fi

# kube-apiserver 
# kubectl --server 192.168.100.2:8080 create -f *.json

mkdir -p "/root/.kube"
cat << EOF > "/root/.kube/config"
apiVersion: v1
clusters:
- cluster:
    server: http://192.168.100.2:8080
  name: cluster_http
contexts:
- context:
    cluster: cluster_http
    namespace: default
    user: ""
  name: default-http
- context:
    cluster: cluster_http
    namespace: kube-system
    user: ""
  name: kube-system
current-context: default-http
kind: Config
preferences: {}
users: []
EOF
