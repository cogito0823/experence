#南昌大学实验报告
---

姓名：**<u>陈华豪</u>**
	
学号：**<u>6130116238</u>**

邮箱地址：**<u>6130116238@email.ncu.edu.cn</u>**

专业班级：**<u>网络工程161班</u>**

实验日期：**<u>2019.5.8</u>**
    
课程名称：**<u>云计算</u>**

 
##实验项目名称
###Lab 5 Introduction to Cloud Computing-- Load Balancing

##实验目的
- **Understanding the concept of load balancing**
- **Monitor the utilization status of each VM and each host**
- **Moving VMs from hot spot to cold ones**
- **Complete this experiment using at least two computers, the more the better**

##实验基础
- Go to dockerhub and pull one image call mongo-express
	- https://hub.docker.com/_/mongo-express
	```
	docker pull mongo-express
	```
	![](https://i.imgur.com/RX3DUlw.jpg)
	
- Test this mongodb web service with simple SQL statement
	- Hints, you can generate your own DB file on random data
	
	创建mongo-express容器需要先创建一个mongo容器
	所以拉取mongo镜像
	```
	docker pull mongo
	```
	![](https://i.imgur.com/zZS9ABJ.png)

	创建一个mongo容器
	```
    docker run -p 27017:27017 -v /tmp/db:/data/db -d 
	docker exec -it hopeful_wing bash
	mongo
	```
	![](https://i.imgur.com/81tKjFX.png)

	创建mongo-express容器
	
	```
        docker run -it --rm -p 8081:8081 /
		--link hopeful_wing:mongo mongo-express
	```
	![](https://i.imgur.com/b6zpMSK.png)
	![](https://i.imgur.com/36D1gUd.png)
	
	连接至8081端口：
	
	![](https://i.imgur.com/6zCFCTM.png)
- Write a HTTP request generator that wraps SQL statement
	- https://sourceforge.net/projects/http-req-gen/
	- https://github.com/Kong/httpsnippet
	
	下载http-req-gen
	
	![](https://i.imgur.com/D68vmLd.png)
	
	打开poster.exe
	
	![](https://i.imgur.com/mQWzPn9.png)
	![](https://i.imgur.com/iDS7gRd.png)
	
	发送请求至8081端口：
	
	![](https://i.imgur.com/4FUiYrP.png)
	
	得到response：
	
	![](https://i.imgur.com/17I1pPj.png)
	
	安装httpsnippet
	```
	# to use in cli
	npm install --global httpsnippet
	# to use as a module
	npm install --save httpsnippet
	```
	![](https://i.imgur.com/305IqEd.png)
	
##实验步骤
- First, connect your request generator to the MongoDB service, basically
shooting different SQL statement at a self-defined rate
- Second, make multiple duplicates of the MongoDB service, and randomly
distribute the SQL statement to all service hosts
- Third, based on your homework 2-3, use your hypercall to detect the
runtime system status, including CPU utilization, memory utilization, etc.
- Set a threshold for such status and name it as the hotspot when it is over
- E.g., when CPU util > 80%, this is a hot spot, you need to either move some hosts to
other machines, or distribute less workloads to this spot

##实验数据或结果
在上述项目中


##实验思考



##参考资料



