#南昌大学实验报告
---



姓名：**<u>陈华豪</u>**
	
学号：**<u>6130116238</u>**

邮箱地址：**<u>6130116238@email.ncu.edu.cn</u>**

专业班级：**<u>网络工程161班</u>**

实验日期：**<u>2018.12.06</u>**
    
课程名称：**<u>网络协议分析与实现</u>**
 
##实验项目名称
**Let’s Do DHCP**

##实验目的
- **Understanding the packages for Ethernet**
- **Understanding the design of seeing protocols in action** 

##实验基础
- [http://www-net.cs.umass.edu/wireshark-labs/Wireshark_DHCP_v7.0.pdf](http://www-net.cs.umass.edu/wireshark-labs/Wireshark_DHCP_v7.0.pdf)

##实验步骤
- 打开Windows命令提示符应用程序（可在“附件”文件夹中找到）。输入“ipconfig / release”。 ipconfig的可执行文件位于C：\ windows \ system32中。
![](https://i.imgur.com/xv8jqpM.png)
- 启动Wireshark数据包嗅探器，如介绍Wireshark实验室中所述，并开始Wireshark数据包捕获。
![](https://i.imgur.com/jidIghb.png)
- 现在返回Windows命令提示符并输入“ipconfig / renew”。这会指示您的主机获取网络配置，包括新的IP地址。在图1中，主机获得IP地址192.168.1.108。
![](https://i.imgur.com/IhQXG5T.png)
- 等到“ipconfig / renew”终止。然后再次输入相同的命令“ipconfig / renew”。 
- 当第二个“ipconfig / renew”终止时，输入命令“ipconfig / release”以将先前分配的IP地址释放到您的计算机。
- 输入“ipconfig / renew”再次为您的计算机分配一个IP地址。 7.停止Wireshark数据包捕获。
![](https://i.imgur.com/iXfuG9D.png)
- 回答实验思考部分的问题。

##实验数据或结果
抓包数据：DHCP.pcapng
![](https://i.imgur.com/iXfuG9D.png)
##实验思考
1. DHCP消息是通过UDP还是TCP发送的？ 

		答：如下图紫色标注所示，通过UDP转发。
![](https://i.imgur.com/McWhKie.png)
2. 绘制定时数据报，说明客户端和服务器之间的第一个四包发送/提供/请求/ ACK DHCP交换的顺序。对于每个数据包，指示源和目标端口号。端口号是否与本实验分配中给出的示例相同？

		答：如下图紫色标注所示。
![](https://i.imgur.com/kAtTCd1.png) 
3. 主机的链路层（例如以太网）地址是什么？ 

		答：如下图紫色标注所示，以太网地址是：c8:5b:76:36:b9:3e。
![](https://i.imgur.com/tyGRuuJ.png)
4. DHCPdiscover消息中的哪些值将此消息与DHCP请求消息区分开来？ 

		答：如下图紫色标注所示，Option: (53) DHCP Message Type ()
		中的值区分discover和request。
![](https://i.imgur.com/ge69X9s.png)
![](https://i.imgur.com/ICS5365.png)
5. 前四个（发现/提供/请求/ ACK）DHCP消息中的每一个中的Transaction-ID值是多少？第二组（请求/ ACK）DHCP消息集中的Transaction-ID值是多少？ Transaction-ID字段的目的是什么？ 

		答：如下图紫色标注所示，前四个是0xd79d0142，后两个是0xde9207f7。
		Transaction-ID用以区分客户端请求。
![](https://i.imgur.com/vnPCrZX.png)
6. 主机使用DHCP获取IP地址等。但是直到四消息交换结束才确认主机的IP地址，如果在四消息交换结束之前未设置IP地址，那么在四消息交换中的IP数据报中使用了哪些值？对于四个DHCP消息（发现/提供/请求/ ACK DHCP）中的每一个，指示封装IP数据报中携带的源和目标IP地址。
		
		答：如下图紫色标注所示， 
![](https://i.imgur.com/1FdpI2J.png)
7.  DHCP服务器的IP地址是多少？ 

		答：如下图紫色标注所示，是111.76.52.1。
![](https://i.imgur.com/DIRuy7k.png)
8. 在DHCP Offer消息中为主机提供的DHCP服务器是什么IP地址？指示哪条DHCP消息包含提供的DHCP地址。 

		答：如下图紫色标注所示，YDHCP服务器分配的地址是：111.76.55.217。
![](https://i.imgur.com/45RiatW.png)
9. 在此分配的示例屏幕截图中，主机和DHCP服务器之间没有中继代理。跟踪中的哪些值表明没有中继代理？您的实验中是否有中继代理？如果是这样，代理的IP地址是什么？ 

		答：如下图紫色标注所示，“Relay agent IP address: 0.0.0.0”
		表示没有使用DHCP中继。我的实验没有使用中继代理。
![](https://i.imgur.com/pWXSav7.png)
10. 解释DHCP offer消息中路由器和子网掩码信息的用途。 

		答：如下图紫色标注所示，路由器行表示该使用什么网关，子网掩码行
		表示该使用什么子网掩码。
![](https://i.imgur.com/kSvp5Uq.png)
11. 在脚注2中注明的DHCP跟踪文件中，DHCP服务器向客户端提供特定的IP地址（另请参见上面的问题8）。在客户端对第一个服务器OFFER消息的响应中，客户端是否接受此IP地址？客户的RESPONSE在哪里是客户要求的地址？

		答：如下图紫色标注所示，111.76.55.217是本机接收的地址，
		在Option: (50) Requested IP Address信息中。
![](https://i.imgur.com/tMuDRB8.png)
12. 解释lease time的目的。您的实验中的租约时间有多长？ 

		答：lease time表示DHCP服务器租用给客户机的时间，在此时间内除非客户机
		release地址，客户可以一直使用这个ip地址直到此地址被DHCP服务器回收。
		如下图紫色标注所示，我的租期是一小时。
![](https://i.imgur.com/E5OKu8X.png)
13.  DHCP 的release消息的目的是什么？ DHCP服务器是否发出收到客户端DHCP请求的确认？如果客户端的DHCP释放消息丢失会发生什么？ 

		答：如下图紫色标注所示，客户端发送DHCP release消息以结束其对DHCP服务器为其提供的IP地址的租用。 DHCP服务器不会向客户端发送确认消息。如果来自客户端的DHCP Release消息丢失，则DHCP服务器必须等到该IP地址的租用期结束才可以将其重新用于另一个客户端。
14. 从Wireshark窗口中清除bootp过滤器。在DHCP数据包交换期间是否发送或接收了任何ARP数据包？如果是，请说明这些ARP数据包的用途。

		答：在向客户端提供IP地址之前，DHCP服务器会为提供的IP发出ARP请求，以确保其他工作站尚未使用该IP地址。如下图紫色标注所示，DHCP向111.76.55.217发送了ARP数据报。
![](https://i.imgur.com/alAIMZX.png)
![](https://i.imgur.com/zWdOL1i.png)
IP address to a client, the DHCP server issues an ARP request for the offered IP
to make sure the IP address is not already in use by another workstation.
##参考资料

- [http://www-net.cs.umass.edu/wireshark-labs/Wireshark_DHCP_v7.0.pdf](http://www-net.cs.umass.edu/wireshark-labs/Wireshark_DHCP_v7.0.pdf)