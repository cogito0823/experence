<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/30
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
    <link href="css/all.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-grid.css">
    <link rel="stylesheet" href="css/bootstrap-reboot.css">
    <link href="css/style.css" rel="stylesheet"/>

    <link href="css/style.css" rel="stylesheet"/>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        table{
            border-collapse: collapse;
            border-color: blue;
            border: 2px;
        }
        tr{
            vertical-align:middle;
        }
        td{
            align-content: center;
            font-size: 25px;
            background-color: lightyellow;
        }
    </style>
</head>
<body>
<%
    try {
%>
<%
    Class.forName("org.sqlite.JDBC");
    String url = "jdbc:sqlite:C:/实验/01_实验/bookstore.db";
    String sql = "select * from user ";
    Connection conn = DriverManager.getConnection(url);
    Statement stat = conn.createStatement();
    ResultSet rs = stat.executeQuery(sql);
%>
<div style="width: 100%; height: 100%; background-color: #9fcdff">
<h1 align="center"><a href=""><strong>用户信息</strong></a></h1>
    <table class="tab" width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
        <thead>
        <tr>
            <td style="width: 15%;">用户名</td>
            <td style="width: 15%;">密码</td>
            <td style="width: 15%;">性别</td>
            <td style="width: 15%;">邮箱地址</td>
            <td style="width: 15%;">用户地址</td>
        </tr>
        </thead>
        <tbody>
    <%
        while(rs.next())
        {
    %>
    <tr>
        <td><%=rs.getString("username")%></td>
        <td><%=rs.getInt("password")%></td>
        <td><%=rs.getString("gender")%></td>
        <td><%=rs.getString("email")%></td>
        <td><%=rs.getString("address")%></td>
    </tr>
    <%
        }
    %></tbody></table></div>
<%
    stat.close();
    conn.close();
%>
<%
    }catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>
