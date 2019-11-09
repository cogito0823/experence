#南昌大学实验报告
---



姓名：**<u>陈华豪</u>**
	
学号：**<u>6130116238</u>**

邮箱地址：**<u>6130116238@email.ncu.edu.cn</u>**

专业班级：**<u>网络工程161班</u>**

实验日期：**<u>2018.12.2</u>**
    
课程名称：**<u>网络协议分析与实现</u>**
 
##实验项目名称
### Let’s Do Ethernet and ARP ###

##实验目的
- **understanding the packages for Ethernet**
- **Understanding the design of Ethernet and ARP**

##实验基础
- [http://www-net.cs.umass.edu/wiresharklabs/Wireshark_Ethernet_ARP_v7.0.pdf](http://www-net.cs.umass.edu/wiresharklabs/Wireshark_Ethernet_ARP_v7.0.pdf)
##实验步骤
###1. Capturing and analyzing Ethernet frames###
- 清除浏览器缓存，启动wireshark嗅探工具
![](https://i.imgur.com/8UziOY7.png)
![](https://i.imgur.com/7aE955b.png)
-  浏览器打开链接 [http://gaia.cs.umass.edu/wireshark-labs/HTTP-ethereal-lab-file3.html](http://gaia.cs.umass.edu/wireshark-labs/HTTP-ethereal-lab-file3.html)
-  停止抓包，找到从本机发往 gaia.cs.umass.edu 的 HTTP GET 信息和从  gaia.cs.umass.edu 发到本机的 HTTP 应答信息。
![](https://i.imgur.com/yMusjLX.png)
- 选择Analyze-> Enabled Protocols。然后取消选中IP框并选择确定，更改Wireshark的“捕获数据包列表”窗口，以便它仅显示有关IP以下协议的信息。
![](https://i.imgur.com/q2KQ6va.png)
- 回答“实验思考”部分的问题1~8。
###2. The Address Resolution Protocol###
####ARP Caching####
- 输入命令 “c:\windows\system32\arp” 查看计算机的 ARP 缓存中的内容。
![](https://i.imgur.com/1X8kQdx.png)
![](https://i.imgur.com/Zj6OaG9.png)
- 回答“实验思考”部分的问题9。
- 	清除计算机的ARP缓存中的所有内容，命令： “arp -d *” 
####Observing ARP in action####
- 清除计算机的ARP缓存中的所有内容。
![](https://i.imgur.com/AjXnWf9.png)
- 清除浏览器缓存。
- 开始 wireshark 嗅探。
- 用浏览器打开 [http://gaia.cs.umass.edu/wireshark-labs/HTTP-ethereal-lab-file3.html](http://gaia.cs.umass.edu/wireshark-labs/HTTP-ethereal-lab-file3.html)
- 停止抓包，通过更改“捕获窗口列表”以显示IP协议以下的信息。
- 回答“实验思考”部分的问题10~15。
##实验数据或结果
抓包结果为：trace.pcapng

##实验思考
###1. Capturing and analyzing Ethernet frames###
1. What is the 48-bit Ethernet address of your computer?

		答：如下图紫色标注所示，我的电脑以太网地址是：c8:5b:76:36:b9:3e
![](https://i.imgur.com/2mN5cxt.png)
2. What is the 48-bit destination address in the Ethernet frame? Is this the Ethernet
address of gaia.cs.umass.edu? (Hint: the answer is no). What device has this as its
Ethernet address? [Note: this is an important question, and one that students
sometimes get wrong. Re-read pages 468-469 in the text and make sure you
understand the answer here.]

		答：如下图紫色标注所示，目的地址以太网地址是：c8:5b:76:36:b9:3e，
		这个地址不是 gaia.cs.umass.edu 的以太网地址，
		而是所连接的离开所在子网的路由器的地址，
		这个路由器有arp适配器和端口。
![](https://i.imgur.com/2mN5cxt.png)
3. Give the hexadecimal value for the two-byte Frame type field. What upper layer
protocol does this correspond to?

		答：如下图紫色标注所示，类型值是 0x8864，
		上层协议为PPPoE Session。
![](https://i.imgur.com/2mN5cxt.png)
4. How many bytes from the very start of the Ethernet frame does the ASCII “G” in
“GET” appear in the Ethernet frame?

		答：如下图紫色标注所示，ASCII码“G”出现在第65个字节。
![](https://i.imgur.com/Ffyhu4S.png)
5. What is the value of the Ethernet source address? Is this the address of your
computer, or of gaia.cs.umass.edu (Hint: the answer is no). What device has this
as its Ethernet address?

		答：如下图紫色标注所示，以太网源地址是：
		cc:1a:fa:e9:6c:40，
		这个地址不是 gaia.cs.umass.edu 的以太网地址，
		而是而是到我所在子网的路由器的端口的因特网地址。
		这个路由器有arp适配器和端口。
![](https://i.imgur.com/rZL6wNn.png)
6. What is the destination address in the Ethernet frame? Is this the Ethernet address
of your computer?

		答：如下图紫色标注所示，源地址是：cc:1a:fa:e9:6c:40
		是我的电脑的地址。
![](https://i.imgur.com/LrmqFlI.png)
7. Give the hexadecimal value for the two-byte Frame type field. What upper layer
protocol does this correspond to?

		答：如下图紫色标注所示，类型值是 0x8864，
		上层协议为PPPoE Session。
![](https://i.imgur.com/y74Ci42.png)
8. How many bytes from the very start of the Ethernet frame does the ASCII “O” in
“OK” (i.e., the HTTP response code) appear in the Ethernet frame?

		答：如下图紫色标注所示，没找着0k
![](https://i.imgur.com/pVXyNGE.png)

###2. The Address Resolution Protocol###
####ARP Caching####
9. Write down the contents of your computer’s ARP cache. What is the meaning of
each column value?

		答：如下图。
![](https://i.imgur.com/1X8kQdx.png)
![](https://i.imgur.com/Zj6OaG9.png)
####Observing ARP in action####
10. What are the hexadecimal values for the source and destination addresses in the
Ethernet frame containing the ARP request message?
11. Give the hexadecimal value for the two-byte Ethernet Frame type field. What
upper layer protocol does this correspond to?
12. Download the ARP specification from
ftp://ftp.rfc-editor.org/in-notes/std/std37.txt. A readable, detailed discussion of
ARP is also at http://www.erg.abdn.ac.uk/users/gorry/course/inet-pages/arp.html.
a) How many bytes from the very beginning of the Ethernet frame does the
ARP opcode field begin?
b) What is the value of the opcode field within the ARP-payload part of the
Ethernet frame in which an ARP request is made?
c) Does the ARP message contain the IP address of the sender?
d) Where in the ARP request does the “question” appear – the Ethernet
address of the machine whose corresponding IP address is being queried?
13. Now find the ARP reply that was sent in response to the ARP request.
a) How many bytes from the very beginning of the Ethernet frame does the
ARP opcode field begin?
b) What is the value of the opcode field within the ARP-payload part of the
Ethernet frame in which an ARP response is made?
c) Where in the ARP message does the “answer” to the earlier ARP request
appear – the IP address of the machine having the Ethernet address whose
corresponding IP address is being queried?
14. What are the hexadecimal values for the source and destination addresses in the
Ethernet frame containing the ARP reply message?
15. Open the ethernet-ethereal-trace-1 trace file in
http://gaia.cs.umass.edu/wireshark-labs/wireshark-traces.zip. The first and second
ARP packets in this trace correspond to an ARP request sent by the computer
running Wireshark, and the ARP reply sent to the computer running Wireshark by
the computer with the ARP-requested Ethernet address. But there is yet another
computer on this network, as indicated by packet 6 – another ARP request. Why
is there no ARP reply (sent in response to the ARP request in packet 6) in the
packet trace?

**Extra Credit**

EX-1. The arp command:

*arp -s InetAddr EtherAddr*

allows you to manually add an entry to the ARP cache that resolves the IP address
InetAddr to the physical address EtherAddr. What would happen if, when you
manually added an entry, you entered the correct IP address, but the wrong
Ethernet address for that remote interface?

EX-2. What is the default amount of time that an entry remains in your ARP cache
before being removed. You can determine this empirically (by monitoring the
cache contents) or by looking this up in your operation system documentation.
Indicate how/where you determined this value. 

##参考资料

- **understanding the packages for Ethernet**
- **Understanding the design of Ethernet and ARP**