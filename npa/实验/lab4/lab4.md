#南昌大学实验报告
---



姓名：**<u>陈华豪</u>**
	
学号：**<u>6130116238</u>**

邮箱地址：**<u>6130116238@email.ncu.edu.cn</u>**

专业班级：**<u>网络工程161班</u>**

实验日期：**<u>2018.11.18</u>**
    
课程名称：**<u>网络协议分析与实现</u>**
 
##实验项目名称
**Lab 4: Let’s Do NAT and ICMP**

##实验目的
- **Objective:  understanding the merits of managing protocol**
- **Understanding the design of NAT and ICMP**
- **Writing a good report**

##实验基础
- **http://www-net.cs.umass.edu/wireshark-labs/Wireshark_NAT_v7.0.pdf**
- **http://www-net.cs.umass.edu/wireshark-labs/Wireshark_ICMP_v7.0.pdf**
##实验步骤
### NAT: ###
（由于实验条件有限，此次实验用 *http://gaia.cs.umass.edu/wireshark-labs/wireshark-traces.zip* 中给出的数据）

1. 在此次实验中，我们将从家庭网络中的客户端 PC 向 www.google.com 服务器捕获来自简单 Web 请求的数据包。在家庭网络中，家庭网络路由器提供NAT服务，如第4章所述。与其他 Wireshark 实验一样，在家庭网络中的客户端 PC 上收集 Wireshark 跟踪。该文件名为 *NAT\_home\_side2*。在家用路由器的 ISP 端捕获的 Wireshark 跟踪文件名为 *NAT\_ISP\_side*。
2. 打开*NAT\_home\_side*文件并回答以下问题。当需要从跟踪文件中显示包含 HTTP 消息的帧时，您可能会发现使用 Wireshark 过滤器非常有用。
3. 使用 wireshark 对数据进行分析然后回答本实验的思考部分。
###ICMP:###
####ICMP and Ping####
1. 打开命令行控制程序
2. 启动wireshark，开始获取数据
3. ping一个网站，这里ping www-net.cs.umass.edu,因为www.ust.hk 超时，而umass大学在另一个大陆符合条件
![](https://i.imgur.com/slKnYr0.png)
4. 当ping程序终止，关闭wireshark
![](https://i.imgur.com/GngLlIn.png)
![](https://i.imgur.com/fPWoNIa.png)
5. 回答实验思考中1~4
####ICMP and Traceroute####
6. 打开命令行程序
7. 启动并运行wireshark抓取数据
8. tracert 一个网站www.inria.fr
![](https://i.imgur.com/qpnWUHc.png)
9. tracert 程序运行结束时停止wireshark抓取
![](https://i.imgur.com/HPXTHc8.png)
10. 回答实验思考部分中的5~10
##实验数据或结果
数据及结果在思考及步骤部分

##实验思考
###NAT:###
**思考1. What is the IP address of the client?**
	
	答：如下图紫色标注所示，客户机的IP地址是：192.168.1.100。
![](https://i.imgur.com/kOkJ2Oi.png)

**思考2. The client actually communicates with several different Google servers in order to
implement “safe browsing.” (See extra credit section at the end of this lab). The
main Google server that will serve up the main Google web page has IP address
64.233.169.104. In order to display only those frames containing HTTP messages
that are sent to/from this Google, server, enter the expression “http && ip.addr ==
64.233.169.104” (without quotes) into the Filter: field in Wireshark .**

	答：在筛选框中输入"http && ip.addr == 64.233.169.104"，wireshark界面如下图所示：
![](https://i.imgur.com/rEQRHST.png)

**思考3. Consider now the HTTP GET sent from the client to the Google server (whose IP
address is IP address 64.233.169.104) at time 7.109267. What are the source and
destination IP addresses and TCP source and destination ports on the IP datagram
carrying this HTTP GET?**

	答： 如下图紫色标注所示，HTTP GET数据报中的源地址是: 192.168.1.100, 4335 
	目的地址是: 64.233.169.104, 80。
![](https://i.imgur.com/cRkf3hT.png)

**思考4. At what time4 is the corresponding 200 OK HTTP message received from the
Google server? What are the source and destination IP addresses and TCP source
and destination ports on the IP datagram carrying this HTTP 200 OK message?**

	答：如下图紫色标注所示，接收到200 OK HTTP 数据的时间是：7.158797，
	原地址是：64.233.169.104，目的地址是：192.168.1.100。
![](https://i.imgur.com/fPoMO82.png)

**思考5. Recall that before a GET command can be sent to an HTTP server, TCP must first
set up a connection using the three-way SYN/ACK handshake. At what time is
the client-to-server TCP SYN segment sent that sets up the connection used by
the GET sent at time 7.109267? What are the source and destination IP addresses
and source and destination ports for the TCP SYN segment? What are the source
and destination IP addresses and source and destination ports of the ACK sent in
response to the SYN. At what time is this ACK received at the client?**

	答：如下图紫色标注所示，第一次握手时间在 7.075657；
	TCP SYN源地址是：192.168.1.100，4335，目的地址是：64.233.169.104，80；
	SYN，ACK源地址是：64.233.169.104，80，目的地址是：192.168.1.100，4335；
	客户端接收到ACK的时间是：7.108986。
![](https://i.imgur.com/VLyUla9.png)

***在下面思考中，我们将重点关注两条HTTP消息（GET和200 OK）以及上面确定的TCP SYN和ACK段。我们的目标是在路由器和ISP之间的链路上捕获的跟踪文件（NAT\_ISP\_side）中找到这两个HTTP消息和两个TCP段。由于这些捕获的帧已经通过NAT路由器转发，因此一些IP地址和端口号将因NAT转换而被更改。打开NAT\_ISP\_side。请注意，此文件和NAT\_home\_side中的时间戳不同步，因为图1中所示的两个位置的数据包捕获不会同时启动。 （实际上，您应该发现在ISP链路上捕获的数据包的时间戳实际上小于在客户端PC上捕获的数据包的时间戳）。***

**思考6. In the NAT_ISP_side trace file, find the HTTP GET message was sent from the
client to the Google server at time 7.109267 (where t=7.109267 is time at which
this was sent as recorded in the NAT_home_side trace file). At what time does
this message appear in the NAT_ISP_side trace file? What are the source and
destination IP addresses and TCP source and destination ports on the IP datagram
carrying this HTTP GET (as recording in the NAT_ISP_side trace file)? Which
of these fields are the same, and which are different, than in your answer to
question 3 above?**

	答：如下图紫色标注所示，NAT_ISP_side 文件里，思考3中GET获取时间是：6.069168；
	源地址是：71.192.34.104, 4335，目的地址是：64.233.169.104, 80；
	与思考3中不同的只有源地址。
![](https://i.imgur.com/qyremHR.png)

**思考7. Are any fields in the HTTP GET message changed? Which of the following fields
in the IP datagram carrying the HTTP GET are changed: Version, Header Length,
Flags, Checksum. If any of these fields have changed, give a reason (in one
sentence) stating why this field needed to change.**

	答：如下图对比，HTTP GET携带的信息没有变化；
	IP 数据报中版本号和首部长度及标识没有改变，只有首部校验和改变，
	因为首部校验和包含源地址信息，源地址改变则校验和会改变。
![](https://i.imgur.com/7UqYKrY.png)
![水电费](https://i.imgur.com/WxJESaS.png)

**思考8. In the NAT\_ISP\_side trace file, at what time is the first 200 OK HTTP message
received from the Google server? What are the source and destination IP
addresses and TCP source and destination ports on the IP datagram carrying this
HTTP 200 OK message? Which of these fields are the same, and which are
different than your answer to question 4 above?**


	答：第一次收到200 OK HTTP的时间是：6.117570；
	源地址是：64.233.169.104, 80，目的地址是：71.192.34.104, 4335；
	与思考4相比只有目的地址改变了。
![](https://i.imgur.com/FORohnN.png)

**思考9. In the NAT\_ISP\_side trace file, at what time were the client-to-server TCP SYN
segment and the server-to-client TCP ACK segment corresponding to the
segments in question 5 above captured? What are the source and destination IP
addresses and source and destination ports for these two segments? Which of
these fields are the same, and which are different than your answer to question 5
above?**

	答：如下两图比较知，ISP文件中SYN时间是：	6.035475, ACK时间是：6.067775；
	SYN：源地址是：71.192.34.104, 4335，目的地址是：64.233.169.104, 80；
	ACK：源地址是：64.233.169.104, 80，目的地址是：71.192.34.104, 4335；
	与思考5相比，SYN变了源地址，ACK变了目的地址，端口号都没有改变。
![](https://i.imgur.com/VLyUla9.png)
![](https://i.imgur.com/ComNHFF.png)

**思考10. Using your answers to 1-8 above, fill in the NAT translation table entries for
HTTP connection considered in questions 1-8 above.**

	答：NAT置换表如下：

|NAT置换表||
|:---:|:---:|
|WAN|LAN|
|71.192.34.104.4335|192.168.1.100.4335|

**Extra Credit:** The trace files investigated above have additional connections to Google servers above and beyond the HTTP GET, 200 OK request/response studied above. For example, in the NAT_home_side trace file, consider the client-to-server GET at time  1.572315, and the GET at time 7.573305. Research the use of these two HTTP messages and write a half page explanation of the purpose of each of these messages.
###ICMP:###
***ICMP部分思考题用网站所给压缩包内数据分析***
![](https://i.imgur.com/UN6xxdr.png)
![](https://i.imgur.com/TnoIFSP.png)
**思考1. What is the IP address of your host? What is the IP address of the destination
host?**
	
	答：本机地址：192.168.1.101；目的地址143.89.14.34。
**思考2. Why is it that an ICMP packet does not have source and destination port
numbers?**

	答：ICMP数据包没有源和目的端口号，因为它旨在在主机和路由器之间传递网络层信息，而
	不是在应用层进程之间传递。每个ICMP数据包都有一个类型和一个代码。类型/代码组合标识
	正在接收的特定消息。由于网络软件本身解释所有ICMP消息，因此不需要端口号来将ICMP消
	息定向到应用层进程。
**思考3. Examine one of the ping request packets sent by your host. What are the ICMP
type and code numbers? What other fields does this ICMP packet have? How
many bytes are the checksum, sequence number and identifier fields?**

	答：如下图紫色标注所示，ICMP类型为8，代码编号为0。ICMP数据包还具有校验和，标识
	符，序列号和数据字段。校验和，序列号和标识符字段各为两个字节。
![](https://i.imgur.com/aIk7JU2.png)
**思考4. Examine the corresponding ping reply packet. What are the ICMP type and code
numbers? What other fields does this ICMP packet have? How many bytes are the
checksum, sequence number and identifier fields?**

	答：如下图紫色标注所示，ICMP类型为0，代码编号为0。ICMP数据包还具有校验和，标识
	符，序列号和数据字段。校验和，序列号和标识符字段各为两个字节。
![](https://i.imgur.com/Q2eBb1Q.png)
**思考5. What is the IP address of your host? What is the IP address of the target
destination host?**

	答：本机地址：192.168.1.101；目的地址138.96.146.2。
**思考6. If ICMP sent UDP packets instead (as in Unix/Linux), would the IP protocol
number still be 01 for the probe packets? If not, what would it be?**

	答：不会，将变成0x11。
**思考7. Examine the ICMP echo packet in your screenshot. Is this different from the
ICMP ping query packets in the first half of this lab? If yes, how so?**

	答：ICMP echo数据包与ping query数据包具有相同的字段。
**思考8. Examine the ICMP error packet in your screenshot. It has more fields than the
ICMP echo packet. What is included in those fields?**

	答：ICMP error 包与ping query包不同。它包含IP首部和错误所针对的原始ICMP数据包
	的前8个字节。
![](https://i.imgur.com/n4QEHtg.png)
**思考9. Examine the last three ICMP packets received by the source host. How are these
packets different from the ICMP error packets? Why are they different?**

	答：最后三个ICMP数据包是消息类型0（回应应答）而不是11（TTL已过期）。它们是不同
	的，因为数据报在TTL过期之前已经到达目的主机。
![](https://i.imgur.com/iCDQuni.png)
**思考10. Within the tracert measurements, is there a link whose delay is significantly
longer than others? Refer to the screenshot in Figure 4, is there a link whose
delay is significantly longer than others? On the basis of the router names, can
you guess the location of the two routers on the end of this link?**

	答：如下图，相对于6，7具有明显更长的延迟。
![](https://i.imgur.com/qpnWUHc.png)
##参考资料

- **http://www-net.cs.umass.edu/wireshark-labs/Wireshark_NAT_v7.0.pdf**
- **http://www-net.cs.umass.edu/wireshark-labs/Wireshark_ICMP_v7.0.pdf**