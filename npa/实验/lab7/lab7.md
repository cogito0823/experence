#南昌大学实验报告
---



姓名：**<u>陈华豪</u>**
	
学号：**<u>6130116238</u>**

邮箱地址：**<u>6130116238@email.ncu.edu.cn</u>**

专业班级：**<u>网络工程161班</u>**

实验日期：**<u>2018.12.13</u>**
    
课程名称：**<u>网络协议分析与实现</u>**
 
##实验项目名称
**802.11, the best one**

##实验目的
- **Understanding the packages for 802.11**
- **Understanding the design of seeing protocols in action** 

##实验基础
- [http://www-net.cs.umass.edu/wireshark-labs/Wireshark_802.11_v7.0.pdf](http://www-net.cs.umass.edu/wireshark-labs/Wireshark_802.11_v7.0.pdf)

##实验步骤
###1. Getting Started###
- 下载zip文件http://gaia.cs.umass.edu/wireshark-labs/wireshark-traces.zip并解压缩文件Wireshark_802_11.pcap。
- 将其加载到Wireshark并使用File下拉菜单查看跟踪，选择Open，然后选择Wireshark_802_11.pcap跟踪文件。
- 回答“实验思考”部分内容 1~6。

![](https://i.imgur.com/EE9KQ1B.png)
###2. Beacon Frames###
- 回答“实验思考”部分内容 7~8。

###3. Data Transfer###
- 由于跟踪始于已与AP关联的主机，因此在查看AP关联/解除关联之前，首先要查看802.11关联上的数据传输。回想一下，在此跟踪中，在t = 24.82时，主机向http://gaia.cs.umass.edu/wireshark-labs/alice.txt发出HTTP请求。 gaia.cs.umass.edu的IP地址是128.119.245.12。然后，在t = 32.82时，主机向http://www.cs.umass.edu发出HTTP请求。
- 回答“实验思考”部分内容 9~15。

###4. Other Frame types###
- 我们的跟踪包含许多PROBE REQUEST和PROBE RESPONSE帧。回答“实验思考”部分内容 16。


##实验数据或结果
Wireshark_802_11.pcap
##实验思考
###1. Getting Started###
1. 在此跟踪中发出大多数信标帧的两个接入点的SSID是多少？

		答：如下图紫色标注所示，SSID是 Linksys_SES_24086和 30 Munroe St。
![](https://i.imgur.com/zSyI0Lx.png)
![](https://i.imgur.com/b7lTtkH.png)
2. linksys_ses_24086接入点的信标帧传输之间的时间间隔是多少？从30 Munroe St.接入点？ （提示：此时间间隔包含在信标帧本身中）。 

		答：如下图紫色标注所示，30 Munroe St.接入的时间间隔是0.1024秒，
		而linksys_ses_24086接入也是，但信标帧中没有。
![](https://i.imgur.com/QxegNYo.png)
3. 什么（以十六进制表示法）是来自30 Munroe St的信标帧上的源MAC地址？回想一下文中的图7.13，源，目的地和BSS是802.11帧中使用的三个地址。有关802.11帧结构的详细讨论，请参阅IEEE 802.11标准文档（上文引用）中的第7节。 

		答：如下图紫色标注所示，地址是 00:16:b6:f7:1d:51。
![](https://i.imgur.com/AsWMng3.png)
4. 什么（十六进制表示法）是来自30 Munroe St ??的信标帧上的目标MAC地址。 

		答：如下图蓝色标注所示，目标地址是 ff:ff:ff:ff:ff:ff。
![](https://i.imgur.com/j5uJEH1.png)
5. 什么（十六进制表示法）是来自30 Munroe St的信标帧上的MAC BSS id？ 

		答：如下图蓝色标注所示，地址是 00:16:b6:f7:1d:51。
![](https://i.imgur.com/Wnjfhf5.png)
6. 来自30 Munroe St接入点的信标帧宣告接入点可以支持四种数据速率和八种额外的“扩展支持速率”。这些率是多少？

		答：如下图蓝色标注所示，扩展速率有
		6.0, 9.0, 12.0, 18.0, 24.0, 36.0, 48.0, 54.0
		Mbps数据速率有1.0, 2.0, 5.5, 11.0 Mbps。
![](https://i.imgur.com/t5t9azb.png)
###2. Beacon Frames###
7. 找到包含第一个TCP会话（下载alice.txt）的SYN TCP段的802.11帧。 802.11帧中的三个MAC地址字段是什么？此帧中的哪个MAC地址对应于无线主机（给出主机MAC地址的十六进制表示）？到接入点？到第一跳路由器？发送此TCP段的无线主机的IP地址是多少？什么是目的地IP地址？此目标IP地址是否与主机，接入点，第一跳路由器或某些其他网络连接设备相对应？说明。

		答：如下图紫色标注所示，三个地址字段分别是
		BSSid：00:16:b6:f7:1d:51, 
		source address：00:13:02:d1:b6:4f，和 
		destination address:00:16:b6:f4:eb:a8。
		对应无线主机的MAC地址是 00:13:02:d1:b6:4f；
		对应第一跳路由器的MAC地址是 00:16:b6:f4:eb:a8；
		发送次TCP段的无线主机的IP地址是 00:16:b6:f7:1d:51；
		目的地址是 192.168.1.109；
		此目标地址对应主机。
![](https://i.imgur.com/YfLTjfo.png)
![](https://i.imgur.com/fQ8rsPc.png)
8. 找到包含此TCP会话的SYNACK段的802.11帧。 802.11帧中的三个MAC地址字段是什么？该帧中的哪个MAC地址对应主机？到接入点？到第一跳路由器？帧中的发送方MAC地址是否与发送此数据报中封装的TCP段的设备的IP地址相对应？ （提示：如果您不确定如何回答这个问题，或者上一个问题的相应部分，请查看案文中的图6.19。了解这一点尤其重要）

		答：如下图紫色标注所示，802.11帧中的三个MAC地址字段是
		BSS id：00：16：b6：f7：1d：51，
		目的地：00：13：02：d1：b6：4f 和
		源地址：00：16：b6：f4：eb ：A8。 MAC对应主机是
		00：13：02：d1：b6：4f。 MAC对应于第一跳是
		00：16：b6：f4：eb：a8。帧中的发送方MAC地址与发送此数据报
		中封装的TCP段的设备的IP地址不对应，因为TCP SYNACK的
		IP地址为128：199：245：12，但目标IP地址为192.168.1.109 。
![](https://i.imgur.com/xyRqrNP.png)
###3. Data Transfer###

9. 在t = 49之后，主机在跟踪中采取了哪两项措施（即框架被发送），以结束与跟踪收集开始时最初到位的30 Munroe St AP的关联？ （提示：一个是IP层操作，一个是802.11层操作）。看看802.11规范，你可能会看到另一个框架，但是在这里看不到？ 

		
10. 检查跟踪文件，查找从主机发送到AP的AUTHENICATION帧，反之亦然。从t = 49开始，无线主机向linksys_ses_24086 AP（MAC地址为Cisco_Li_f5：ba：bb）发送了多少AUTHENTICATION消息？

		答：十七条。
11. 主机是否希望身份验证需要密钥或打开？ 

		答：是的。
12. 您是否在跟踪中看到来自linksys_ses_24086 AP的回复AUTHENTICATION？ 

		答：没有。
13. 现在让我们考虑当主机放弃尝试与linksys_ses_24086 AP关联并且现在尝试与30 Munroe St AP关联时会发生什么。查找从主机发送到AP的AUTHENICATION帧，反之亦然。在什么时间有一个从主机到30 Munroe St. AP的AUTHENTICATION框架，以及何时有回复AUTHENTICATION从该AP发送给主机回复？ （请注意，您可以使用过滤器表达式“wlan.fc.subtype == 11and wlan.fc.type == 0和wlan.addr == IntelCor_d1：b6：4f”在此跟踪中仅显示此无线的AUTHENTICATION帧主机。）

	
14. 从主机到AP的关联请求，以及从AP到主机的相应的关联响应帧用于主机与AP关联。什么时候有主机请求30 Munroe St AP？什么时候发送相应的ASSOCIATE REPLY？ （请注意，您可以使用过滤器表达式“wlan.fc.subtype <2和wlan.fc.type == 0和wlan.addr == IntelCor_d1：b6：4f”来仅显示ASSOCIATE REQUEST和ASSOCIATE RESPONSE帧跟踪。）

		答：如下图紫色标注所示，在t = 63.169910，主机与
		30 Munroe St AP的关联请求，
		并在t = 63.192101回复。
![](https://i.imgur.com/s2Z5s4u.png)
![](https://i.imgur.com/1i5WBes.png)
15. 主机愿意使用什么传输速率？ AP？要回答此问题，您需要查看802.11无线LAN管理框架的参数字段。

		答：1, 2, 5.5, 11, 6, 9, 12, 18, 24, 32, 48, 54 Mbps。
###4. Other Frame types###
16. 我们的跟踪包含许多PROBE REQUEST和PROBE REQUEST帧，这些帧中的发送方，接收方和BSS ID MAC地址是什么？这两种框架的目的是什么？ （要回答最后一个问题，您需要深入研究本实验前面引用的在线参考资料）。

		答：如下图紫色标注所示，第50条帧包含PROBE REQUEST，
		第51条包含PROBE REQUEST，他们的三项地址分别为：
		Destination address: Broadcast (ff:ff:ff:ff:ff:ff)，
		Source address: IntelCor_1f:57:13 (00:12:f0:1f:57:13)，
		BSS Id: Broadcast (ff:ff:ff:ff:ff:ff)；
		Source address: Cisco-Li_f7:1d:51 (00:16:b6:f7:1d:51)，
		BSS Id: Cisco-Li_f7:1d:51 (00:16:b6:f7:1d:51)，
		Destination address: IntelCor_1f:57:13 (00:12:f0:1f:57:13)；
		PROBE REQUEST是搜寻主机接入点的广播消息，PROBE REQUEST
		用于回应来自该接入点的主机。
![](https://i.imgur.com/WbEpB8T.png)
![](https://i.imgur.com/2rTE8jM.png)
##参考资料

- [http://www-net.cs.umass.edu/wireshark-labs/Wireshark_802.11_v7.0.pdf](http://www-net.cs.umass.edu/wireshark-labs/Wireshark_802.11_v7.0.pdf)