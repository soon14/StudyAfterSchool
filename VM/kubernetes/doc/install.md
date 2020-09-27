<!--
 * @Author: wjn
 * @Date: 2020-09-27 09:30:50
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-27 11:56:04
-->
[参考](https://blog.csdn.net/JENREY/article/details/84205838?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param#3.1%E3%80%81%E4%BC%A0%E7%BB%9F%E7%9A%84%E9%83%A8%E7%BD%B2%E6%96%B9%E5%BC%8F%EF%BC%9A%EF%BC%88%E6%9C%AC%E6%96%87%E4%B8%8D%E4%BD%BF%E7%94%A8%E8%BF%99%E7%A7%8D%EF%BC%8C%E5%BE%80%E4%B8%8B%E7%9C%8B%EF%BC%89)



# 添加yum源

```
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=0
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
setenforce 0
```
主节点

> yum install -y kubelet kubeadm kubectl docker 
子节点
> yum install -y kubelet kubeadm docker


# 配置

vi /etc/sysconfig/kubelet
KUBELET_EXTRA_ARGS="--fail-swap-on=false"

echo "1" > /proc/sys/net/bridge/bridge-nf-call-iptables
echo "1" > /proc/sys/net/bridge/bridge-nf-call-ip6tables

systemctl enable kubelet
systemctl enable docker


# 初始化
主节点
kubeadm init --kubernetes-version=v1.19.2 --image-repository registry.aliyuncs.com/google_containers --pod-network-cidr=10.244.0.0/16 --service-cidr=10.96.0.0/12 --ignore-preflight-errors=Swap

--kubernetes-version    #指定Kubernetes版本
--image-repository   #由于kubeadm默认是从官网k8s.grc.io下载所需镜像，国内无法访问，所以这里通过--image-repository指定为阿里云镜像仓库地址
--pod-network-cidr    #指定pod网络段
--service-cidr    #指定service网络段
--ignore-preflight-errors=Swap    #忽略swap报错信息

rpm -ql kubelet




#  在master部署flannel

kubectl apply -f kube-flannel.yml 

kubectl get pods -n kube-system

# 子节点加入集群

* 生成token
kubeadm token create --print-join-command 

*****  --ignore-preflight-errors=Swap



清理下第一次初始化的文件什么的
kubeadm reset  

删除节点
kubectl delete node cdh3.fd.sunflower.chat




# 错误

* /proc/sys/net/bridge/bridge-nf-call-iptables contents are not set to 1

echo "1" > /proc/sys/net/bridge/bridge-nf-call-iptables
echo "1" > /proc/sys/net/bridge/bridge-nf-call-ip6tables

* The HTTP call equal to 'curl -sSL http://localhost:10248/healthz' failed with error: Get "http://localhost:10248/healthz": dial tcp [::1]:10248: connect: connection refused.

kubelet 没有启动 使用journalctl -xefu kubelet 查看日志





* invalid argument "flase" for "--fail-swap-on" flag: strconv.ParseBool: parsing "flase": invalid syntax
/etc/sysconfig/kubelet  
中--fail-swap-on=false 写错


* kubeadm安装k8s 组件controller-manager 和scheduler状态 Unhealthy

https://www.gjie.cn/2618.html

检查kube-scheduler和kube-controller-manager组件配置是否禁用了非安全端口
vim /etc/kubernetes/manifests/kube-scheduler.yaml
vim /etc/kubernetes/manifests/kube-controller-manager.yaml


将port=0去掉
然后systemctl restart kubelet









