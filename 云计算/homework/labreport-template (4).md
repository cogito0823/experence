#南昌大学实验报告
---

姓名：**<u>陈华豪</u>**
	
学号：**<u>6130116238</u>**

邮箱地址：**<u>6130116238@email.ncu.edu.cn</u>**

专业班级：**<u>网络工程161班</u>**

实验日期：**<u>2019.05.19</u>**
    
课程名称：**<u>云计算</u>**

 
##实验项目名称

###Lab 7 Introduction to Cloud Computing-- Hadoop and MapReduce
##实验目的

• Understanding the concept of MapReduce Model
• Building a file system in a distributed way that store large data trunks
• Merging all things together into a docker image
• Writing some sample demo on running MapReduce models
##实验基础
• Read the Hadoop wiki page and learn it
• https://wiki.apache.org/hadoop
• Install a Hadoop Docker image, you know where to find it
• Finish the report on your experience of realizing two classic demos
• Word Count: https://hadoop.apache.org/docs/stable/hadoop-mapreduceclient/hadoop-mapreduce-clientcore/MapReduceTutorial.html#Example:_WordCount_v1.0
• Quantity Analysis: https://docs.mongodb.com/manual/tutorial/map-reduceexamples/

##实验步骤
1. 拉镜像
```
docker pull sequenceiq/hadoop-docker
```
![](https://i.imgur.com/HsylW0N.jpg)
![](https://i.imgur.com/FOJMcKr.jpg)
2. 运行容器
```
docker run -it sequenceiq/hadoop-docker /bin/bash
```
![](https://i.imgur.com/hAiDg6O.jpg)
3. 加入java环境
```
export JAVA_HOME=/usr/java/default
export PATH=${JAVA_HOME}/bin:${PATH}
export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar
```
![](https://i.imgur.com/tFdDnzq.jpg)
4. 创建input、output文件夹
```
mkdir wordcount
cd wordcount
mkdir input
mkdir output
```
![](https://i.imgur.com/CpDNnAS.jpg)
5. 编写file01，file02
```
vi file01
vi file02
	```
6. 运行程序
```
bin/hadoop jar wc.jar WordCount /user/joe/wordcount/input /user/joe/wordcount/output
```
![](https://i.imgur.com/RBSlJpn.jpg)
##实验数据或结果
如上


##实验思考



##参考资料
- [https://hadoop.apache.org/docs/stable/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html#Example:_WordCount_v1.0](https://hadoop.apache.org/docs/stable/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html#Example:_WordCount_v1.0)
- [https://docs.mongodb.com/manual/tutorial/map-reduce-examples/](https://docs.mongodb.com/manual/tutorial/map-reduce-examples/)