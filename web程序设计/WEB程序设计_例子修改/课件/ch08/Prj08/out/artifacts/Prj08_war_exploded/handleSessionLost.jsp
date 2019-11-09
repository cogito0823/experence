<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <body>
<form action=" handleSessionLost.jsp" method="post">
	请您输入书本：<input name="book" type="text">
	<input type="submit" value="添加到购物车">	
</form>
<HR>
<%
	//从session获取books，如果为空则实例化
	ArrayList books = (ArrayList)session.getAttribute("books");
	if(books==null){
		books = new ArrayList();
		session.setAttribute("books",books);
	}
	//获得书名
	String book = request.getParameter("book");
	if(book!=null){
		book = new String(book.getBytes("ISO-8859-1"));
		//将book加进去
		books.add(book);
	}
%>
购物车中的内容是：<BR>
<%
	//遍历books
	for(int i=0;i<books.size();i++){
		out.println(books.get(i) + "<BR>");
	}
%>
</body>
</html>
