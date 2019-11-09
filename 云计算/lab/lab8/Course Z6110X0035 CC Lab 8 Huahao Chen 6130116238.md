#南昌大学实验报告
---

姓名：**<u>陈华豪</u>**
	
学号：**<u>6130116238</u>**

邮箱地址：**<u>6130116238@email.ncu.edu.cn</u>**

专业班级：**<u>网络工程161班</u>**

实验日期：**<u>2019.05.26</u>**
    
课程名称：**<u>云计算</u>**

 
##实验项目名称

###Lab 8 Introduction to Cloud Computing -- Cloudlet
##实验目的


##实验基础
- [http://elijah.cs.cmu.edu/](http://elijah.cs.cmu.edu/)
- [https://github.com/cmusatyalab/faceswap](https://github.com/cmusatyalab/faceswap)
- [https://hub.docker.com/r/chaunce/ci-android/](https://hub.docker.com/r/chaunce/ci-android/)
##实验步骤
1. 阅读实验基础中的内容
	![](https://i.imgur.com/zD4qUfN.jpg)
2. 拉取[https://github.com/cmusatyalab/faceswap](https://github.com/cmusatyalab/faceswap)中给出的镜像

	```
	wget https://storage.cmusatyalab.org/faceswap/faceswap-server-release.qcow
	```
	![](https://i.imgur.com/ZBWE5TZ.jpg)
3. 选择docker hub 中安卓环境镜像[https://hub.docker.com/r/chaunce/ci-android/](https://hub.docker.com/r/chaunce/ci-android/)

	```
	docker pull chaunce/ci-android
	```
	
	![](https://i.imgur.com/vM7QtgO.jpg)
4. 下载faceswap-server.xml

	```
	wget https://raw.githubusercontent.com/cmusatyalab/faceswap/master/server/kvm/faceswap-server.xml
	```
	
	![](https://i.imgur.com/rJpY8qc.jpg)
5. 修改faceswap-server.xml 把地址改成faceswap-server-release.qcow所在地址
	![](https://i.imgur.com/afkdk1K.jpg)
6. 
##实验数据或结果
如上


##实验思考



##参考资料
