<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
		String filename = request.getParameter("file");
	    //告诉客户端出现下载框，并指定下载框中的文件名
		response.setHeader("Content-Disposition","attachment;filename="+filename);   
    	//指定文件类型   
		response.setContentType("image/jpeg");   
		//指定文件
		RequestDispatcher rd = request.getRequestDispatcher("/FILES/" + filename);
		rd.forward(request, response);
 %>