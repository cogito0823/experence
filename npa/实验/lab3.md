#南昌大学实验报告
---



姓名：**<u>陈华豪</u>**
	
学号：**<u>6130116238</u>**

邮箱地址：**<u>6130116238@email.ncu.edu.cn</u>**

专业班级：**<u>网络工程161班</u>**

实验日期：**<u>2018.11.18</u>**
    
课程名称：**<u>网络协议分析与实现</u>**
 
##实验项目名称
**Lab 3: Let’s Do IP**

##实验目的
- **understanding the essence of processing one protocol**
- **Understanding the merits of IP**

##实验基础
- [http://www-net.cs.umass.edu/wireshark-labs/Wireshark_IP_v7.0.pdf](http://www-net.cs.umass.edu/wireshark-labs/Wireshark_IP_v7.0.pdf)

##实验步骤
（一）**运行 tracert 发送ip数据报到目标地址并用 Wireshark 跟踪数据。**

- Start up Wireshark and begin packet capture (Capture->Start) and then press OK on the Wireshark Packet Capture Options screen (we’ll not need to select any
options here).
![](https://i.imgur.com/hIBjhFR.png)
- start up pingplotter and enter the name of a
target destination in the “Address to Trace Window.” Enter 3 in the “# of times to
Trace” field, so you don’t gather too much data. Select the menu item Edit->Advanced Options->Packet Options and enter a value of 56 in the Packet Size
field and then press OK. Then press the Trace button. You should see a
pingplotter window that looks something like this:
Next, send a set of datagrams with a longer length, by selecting Edit->Advanced
Options->Packet Options and enter a value of 2000 in the Packet Size field and
then press OK. Then press the Resume button.
Finally, send a set of datagrams with a longer length, by selecting Edit->Advanced Options->Packet Options and enter a value of 3500 in the Packet Size
field and then press OK. Then press the Resume button.
Stop Wireshark tracing.
![](https://i.imgur.com/xWmACy9.png)
![](https://i.imgur.com/wfVIgaM.png)（56bytes）
![](https://i.imgur.com/doab5vi.png)
![](https://i.imgur.com/Rw6BqVs.png)(2000bytes)
![](https://i.imgur.com/zFkbh7f.png)
![](https://i.imgur.com/rKB0qd6.png)(3500bytes)

- A look at the captured trace
In your trace, you should be able to see the series of ICMP Echo Request (in the case of
Windows machine) or the UDP segment (in the case of Unix) sent by your computer and
the ICMP TTL-exceeded messages returned to your computer by the intermediate
routers. 
- 下载 http://gaia.cs.umass.edu/wireshark-labs/wireshark-traces.zip 使用其中的“ipethereal-trace-1”文件在 Wireshark 上进行观察，并解答下面出现的问题。
![](https://i.imgur.com/p5sCbfF.png)
- 选择计算机发送的第一个ICMP Echo Request消息，然后在数据包详细信息窗口中展开数据包的Internet协议部分。
![](https://i.imgur.com/d0J7BK6.png)（第八条为第一个ICMP Echo Request消息）


##实验数据或结果
数据及结果在实验步骤和实验思考中。

##实验思考

**思考1：你的计算机的IP地址是？**

	答：IP地址是：192.168.1.102，如下图紫色标注部分：
![](https://i.imgur.com/FRFlifF.png)
**思考2：在IP首部中，上层协议字段中的值是多少？**

	答：Protocol: ICMP (1)。
**思考3：IP首部中有多少字节？ IP数据报的有效负载中有多少字节？说明如何确定有效负载字节数。**

	答：IP首部有20字节，payload为36字节，因此总长度为56字节。
**思考4：此IP数据报是否已被分片？解释您如何确定数据报是否已被分片。**

	答：没有被分片，因为标志位为零，如下图标注所示：
![](https://i.imgur.com/64w0v6v.png)

- 接下来，通过单击Source列标题，根据IP源地址对跟踪的数据包进行排序;一个小的向下箭头应出现在单词Source旁边。如果箭头指向上方，请再次单击“源”列标题。选择计算机发送的第一个ICMP Echo Request消息，然后展开“所选数据包标题的详细信息”窗口中的Internet协议部分。在“捕获数据包列表”窗口中，您应该在第一个ICMP下面看到所有后续ICMP消息（可能还有计算机上运行的其他协议发送的其他散布数据包）。使用向下箭头浏览计算机发送的ICMP消息。
![](https://i.imgur.com/NdrY0Rl.png)

**思考5. Which fields in the IP datagram always change from one datagram to the next
within this series of ICMP messages sent by your computer?**

	答：标识位、首部检验和以及TTL必须不同。

**思考6. 哪些域保持不变？哪些域必须保持不变？哪些域必须改变？为什么？**

	答：	在IP数据报中保持不变的字段是：
	- 版本（所有包都使用IPv4）
	- 首部长度(ICMP包的首部长度一致)
	- 源地址（源地址没有改变）
	- 目的地址（目标地址没有改变）
	- 区分服务所有包都是ICMP，使用相同的区分服务）
	- 上层协议（都是ICMP包）
	在IP数据报中必须保持不变的字段是：
	- 版本（所有包都使用IPv4）
	- 首部长度(ICMP包的首部长度一致)
	- 源地址（源地址没有改变）
	- 目的地址（目标地址没有改变）
	- 区分服务所有包都是ICMP，使用相同的区分服务）
	- 上层协议（都是ICMP包）
	在IP数据报中必须改变的字段是：
	- 标识（IP包必须有不同的id）
	- 生存时间（traceroute每隔一个包裹TTL递增一次）
	- 首部检验和（首部改变了，校验和会改变）

**思考7： 描述你所见的IP数据报中标识字段变化模式**

	答：随着每个ICMP ECHO request 递增。
**思考8：标识位和生存时间域的值是什么？**
	
	答：TTL:1
	标识：13008（如下图）
![](https://i.imgur.com/gTPF917.png)
**思考9：从第一跳路由器发送给你的电脑的所有ICMP TTL-exceeded replies中的值都是一样的吗？为什么？**

	答：所有 ICMP TTL-exceeded replies 的标识位上的值都不相同因为
	对于每个ip数据报，标识位都是唯一独立的。当两个或更多数据报的标识
	值相同时，意味着这些数据报都来自一个更大的被分片的数据报。


**思考10：找出pingplotter中长度改为2000后计算机发出的第一条 ICMP Echo Request信息。这条信息是否被分段？**

	答：截取每次发送的第一跳路由器和目的地址的request及reply信息
	如下图所示，可以看出发送数据长度为56bytes时，长度为98bytes；
	发送数据长度为2000时，长度为562bytes；发送数据长度为3500时，
	长度为582bytes。由此看出序列号为 30467/887 编号为93的数据报为数据
	长度改为2000时从自身计算机发出的第一条ICMP Echo Request信息。
![](https://i.imgur.com/wINoYur.png)

	即下图选中：
![](https://i.imgur.com/at0Ical.png)

	由上图中间紫色标注：Flats:0x00b9 及 Fragment offset：185 得知该数据报被分段。
**11. 打印出ip数据报分段中的第一条分段数据报**

	答：
![](https://i.imgur.com/zXiZVpN.png)

	如上图紫色标注中Flats:0x2000，More fragments表明被分段，
	Fragment offset：0表明是第一个分段，Total Length：1500bytes
	表明总长度为1500bytes。

**思考12：打印第二个分段。什么信息表明这个分段不是第一个分段？more fragment信息是怎样的？你是如何辨别的？**

	答：第二个分段如下图：
![](https://i.imgur.com/at0Ical.png)

	由图中Fragment offset：185知这不是第一个分段，more fragment里的
	信息是0，因为这是最后一个分段所以设为零。

**思考13：第一和第二个段的首部中哪些域改变了？**

	答：有总长度、标志、段偏移及首部校验和改变了。
**14. 原始数据报产生了多少分段？**

	答：
![](https://i.imgur.com/q3aKXPz.png)

	如上图紫色标记所示长度变为3500后，原始数据报产生了0x2000个分段。

**15. 各分段首部有哪些不同？**

	答：片偏移量和首部校验和在个数据包里都不同。在前两个数据包和最后一个
	数据包之间到总长度和标志不同。
	前两个数据包的总长度为1500，其中More fragment设置为1，
	最后一个数据包的总长度为548，More fragment位设置为0。


##参考资料
- [http://www-net.cs.umass.edu/wireshark-labs/Wireshark_IP_v7.0.pdf](http://www-net.cs.umass.edu/wireshark-labs/Wireshark_IP_v7.0.pdf)

