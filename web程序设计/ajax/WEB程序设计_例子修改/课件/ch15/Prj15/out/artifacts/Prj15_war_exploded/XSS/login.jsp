<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
<body>
��ӭ��¼�ʻ�����ϵͳBBS
<form action="login.jsp" method="post">
	���������˺ţ�
	<input name="account" type="text">
	<BR>
	�����������룺
	<input name="password" type="password">
	<BR>
	<input type="submit" value="��¼">
</form>
<%
	//��ȡ�˺�����
	String account = request.getParameter("account");
	String password = request.getParameter("password");
	if(account!=null){
		//��֤�˺����룬�����˺�������ͬ��ʾ��¼�ɹ�
		if(account.equals(password)){
			//����session,��ת����һ��ҳ��
			session.setAttribute("account",account);	
			response.addCookie(new Cookie("account",account));
			response.addCookie(new Cookie("password",password));
			response.sendRedirect("loginResult.jsp"); 
		} else{
			 out.println("��¼���ɹ�");
		} 
	} %>
</body>
</html>
