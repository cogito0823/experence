<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/30
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        table{
            border-collapse: collapse;
            border: 2px;
        }
        tr{
            vertical-align:middle;
        }
        td{
            margin-left: 5cm;
            font-size: 25px;
        }
    </style>
</head>
<body>
<%
    try{
%>
<%
    Class.forName("org.sqlite.JDBC");
    String url = "jdbc:sqlite:C:/实验/01_实验/bookstore.db";
    String sql = "select * from book" + " where category_id = ?";
    String ID = request.getParameter("id");
    Connection conn = DriverManager.getConnection(url);
    PreparedStatement pstat = conn.prepareStatement(sql);
    pstat.setString(1,ID);
    ResultSet rs = pstat.executeQuery();
    while (rs.next()) {
%>
    <table style="width:80%;font-size: 25px; border-color: #0b2e13"  align="center" rules="rows">
        <tr>
            <td style="width: 10%;">书籍编号</td>
            <td style="width: 10%;">书籍名</td>
            <td style="width: 10%;">作者</td>
            <td style="width: 30%;" >简介</td>
            <td style="width: 10%;">价格</td>
            <td style="width: 10%;">操作</td>
        </tr>
    <%
        while(rs.next())
        {
    %>
    <tr>
        <td><%=rs.getInt("id")%></td>
        <td><%=rs.getString("name")%></td>
        <td><%=rs.getString("author")%></td>
        <td><%=rs.getString("description")%></td>
        <td><%=rs.getDouble("price")%></td>
        <td><button title="删除" type="submit" formtarget="_self" onclick="" class="form-control">删除</button></td>
    </tr>
    <%
        }
    %></table>
<%
    }
    pstat.close();
    conn.close();
%>
<%
    }catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
