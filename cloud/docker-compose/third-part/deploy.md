# 部署

## 启动延迟队列插件

进入容器：`docker exec -it rabbitmq /bin/bash`

1. 复制配置到docker-compose文件同级目录

2. 给容器安装 下载工具 wget：`apt-get install -y wget` 报错执行： `apt-get update`

3. 下载插件包，因为我们的 `RabbitMQ` 版本为 `3.9.0` 所以我们安装 `3.9.0` 版本的延迟队列插件

   ```bash
   cd /plugins
   root@f72ac937f2be:/plugins# wget https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.9.0/rabbitmq_delayed_message_exchange-3.9.0.ez
   ```

6. 启动延迟队列插件

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

7. 退出容器：`exit`