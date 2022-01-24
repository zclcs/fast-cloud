# 部署

## 启动延迟队列插件

进入容器：`docker exec -it rabbit-3.7.7 /bin/bash`

1. 给容器安装 下载工具 wget：`apt-get install -y wget`

2. 下载插件包，因为我们的 `RabbitMQ` 版本为 `3.7.7` 所以我们安装 `3.7.x` 版本的延迟队列插件

   ```bash
   root@f72ac937f2be:/plugins# wget https://dl.bintray.com/rabbitmq/community-plugins/3.7.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip
   ```

3. 给容器安装 解压工具 unzip：`apt-get install -y unzip`

4. 解压插件包

   ```bash
   root@f72ac937f2be:/plugins# unzip rabbitmq_delayed_message_exchange-20171201-3.7.x.zip
   Archive:  rabbitmq_delayed_message_exchange-20171201-3.7.x.zip
     inflating: rabbitmq_delayed_message_exchange-20171201-3.7.x.ez
   ```

5. 启动延迟队列插件

   ```yaml
   root@f72ac937f2be:/plugins# rabbitmq-plugins enable rabbitmq_delayed_message_exchange
   The following plugins have been configured:
     rabbitmq_delayed_message_exchange
     rabbitmq_management
     rabbitmq_management_agent
     rabbitmq_web_dispatch
   Applying plugin configuration to rabbit@f72ac937f2be...
   The following plugins have been enabled:
     rabbitmq_delayed_message_exchange

   started 1 plugins.
   ```

6. 退出容器：`exit`