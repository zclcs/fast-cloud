# 部署

## 本地安装虚拟机（不需要可跳过）

> - 安装 **[Vagrant2.2.18](https://www.vagrantup.com/downloads)**
> - 安装 **[VirtualBox6.1.26](https://www.virtualbox.org/wiki/Downloads)**

### 构建CentOS7虚拟机

> - 搜索[centos镜像](https://app.vagrantup.com/boxes/search)
> - 创建vagrant_vm目录
> - 进入vagrant_vm目录，执行`vagrant init centos/7`（来自镜像网站）命令
> - 执行`vagrant up`命令（这时候最好也打开VirtualBox）
> - 执行`vagrant plugin install vagrant-vbguest`命令（报错执行）
> - 在vagrant_vm目录，找到配置文件**Vagrantfile**，打开配置`config.vm.network "private_network"`
> - 执行`vagrant reload`命令，重启虚拟机
> - 执行`vagrant ssh`命令，即可连上虚拟机

#### ps: root账户登录

> - `sudo -s`
> - `passwd`
> - `vim /etc/ssh/sshd_config`
> - 修改配置**PermitRootLogin** 为 **yes**
> - 修改配置**PasswordAuthentication** 为 **yes**
> - `vagrant reload`

#### ps: vagrant 配置

```
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = "zclcs"
  config.vm.provider "virtualbox" do |v|
    v.memory = 6144
    v.cpus = 2
  end
end 
```

## 安装docker

### 安装Docker所需要的包：

```
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
```

### 设置稳定的仓库：

```
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

### 安装最新版的Docker引擎：

```
yum install docker-ce docker-ce-cli containerd.io
```

### 启动Docker：

```
systemctl start docker
```

### 开机自启动Docker：

```
systemctl enable docker
```

## 安装Docker Compose

### 获取Docker Compose的最新稳定版本：

```
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

### 对二进制文件授予可执行权限：

```
chmod +x /usr/local/bin/docker-compose
```

### 创建link：

```
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

## 部署harbor镜像仓库

### 安装harbor

> - github下载harbor最新[离线安装包](https://github.com/goharbor/harbor/releases)
> - 上传到服务器解压`tar -xzvf harbor-offline-installer-v2.3.2.tgz`
> - 修改harbor配置`harbor.yml`
> - 执行`./install.sh`
> - 创建仓库`cloud`, 权限公开
> - 进入/etc/docker，创建daemon.json，写入配置：`"insecure-registries": ["192.168.33.10:3000"]`, 重启docker：`service docker restart`
> - 登录harbor仓库：`docker login 192.168.33.10:3000`

### 构建jdk skywalking 基础镜像

> - 下载`wget https://archive.apache.org/dist/skywalking/8.1.0/apache-skywalking-apm-8.7.0.tar.gz`
> - 解压`tar zxf apache-skywalking-apm-8.7.0.tar.gz`
> - 压缩agent`tar zcvf  agent.tar.gz ./apache-skywalking-apm-bin/agent`
> - 使用/agent Dockerfile 构建基础镜像`docker build -t 192.168.33.10:3000/library/openjdk8-skywalking:1.0.0 .`
> - docker 打包`docker build -t 192.168.33.10:3000/library/openjdk8-skywalking:1.0.0 .`
> - push 镜像到harbor仓库`docker push 192.168.33.10:3000/library/openjdk8-skywalking:1.0.0`
> - 进入本项目目录执行maven命令(如果harbor账号密码不是默认记得改，地址及端口也是一样)：`mvn -DsendCredentialsOverHttp=true clean package`

## 部署第三方依赖：mysql、redis、nacos

> - 创建`third-part`目录, 复制项目 /cloud/third-part下的内容，上传至服务器
> - 执行`docker network create -d bridge cloud_net`, 创建网络群组
> - 进入`third-part`目录, 执行`docker-compose up -d`
> - 执行`docker-compose down`, `docker-compose up -d`重启

## 部署服务及前端

> - 创建`cloud`目录, 复制项目 /cloud/cloud下的内容，上传至服务器
> - 在`cloud`目录下创建`web`目录, 复制前端`dist`目录下的文件到`web`目录
> - 进入`cloud`目录, 执行`docker-compose up -d`

## 额外配置：skywalking 监控服务调用

