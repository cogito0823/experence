#南昌大学实验报告
---

姓名：**<u>陈华豪</u>**
	
学号：**<u>6130116238</u>**

邮箱地址：**<u>6130116238@email.ncu.edu.cn</u>**

专业班级：**<u>网络工程161班</u>**

实验日期：**<u>2019.5.12</u>**
    
课程名称：**<u>云计算</u>**

 
##实验项目名称
###Lab 6 Introduction to Cloud Computing -- Kafka

##实验目的
- **Understanding the concept of message passing**
- **Trying to follow up the procedure of a message broker that handles messagefrom many tenants**
- **Repeating what others have done in the past sheds the light on your future**

##实验基础
**https://data-flair.training/blogs/kafka-docker/**
**https://blog.antlypls.com/blog/2015/10/05/getting-started-with-spark-streaming-using-docker/**
**https://gerardnico.com/dit/kafka/stream_wordcount**
**https://gerardnico.com/dit/kafka/docker_single_node**
	
##实验步骤
**1. 安装docker-compose**
```
apt install docker-compose
```
![](https://i.imgur.com/tYhukT6.png)

**2. 查看docker-compose版本**
```
docker-compose
```
![](https://i.imgur.com/QPH0lzT.png)

**3. 获取docker-compose.yml**
```
git clone https://github.com/confluentinc/cp-docker-images.git
cd cp-docker-images/examples/kafka-single-node
cat docker-compose.yml
```
![](https://i.imgur.com/QsR3eVj.png)
![](https://i.imgur.com/8jmUcZp.png)

**4. 修改docker-compose.yml**
>vim docker-compose.yml


```
---
version: '2'
services:
  zookeeper:
    image: confluentinc/cp-zookeeper:3.3.0
    network_mode: host
    environment:
      ZOOKEEPER_CLIENT_PORT: 32181
      ZOOKEEPER_TICK_TIME: 2000
    extra_hosts:
      - "moby:127.0.0.1"
      - "default:127.0.0.1"
  kafka:
    image: confluentinc/cp-kafka:3.3.0
    network_mode: host
    depends_on:
      - zookeeper
    environment:
      KAFKA_BROKER_ID: 1
      KAFKA_ZOOKEEPER_CONNECT: localhost:32181
      KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://localhost:29092
      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1
    extra_hosts:
      - "moby:127.0.0.1"
      - "default:127.0.0.1"
```
![](https://i.imgur.com/9R7H9NL.png)

**5. 开始服务**


```
docker-compose up -d
```

![](https://i.imgur.com/z7XAUbo.png)

**服务状态**

```
docker-compose ps
```
![](https://i.imgur.com/CyUpIon.png)
##实验数据或结果

###结果同上
##实验思考



##参考资料



