<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: azqd
  Date: 2018/11/21
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/all.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-grid.css">
    <link rel="stylesheet" href="css/bootstrap-reboot.css">
    <link href="css/style.css" rel="stylesheet"/>
    <title></title>
</head>
<body>
<%
    Class.forName("org.sqlite.JDBC");
    String url = "jdbc:sqlite:D:/文档/OneDrive/实验/web程序设计/实验/实验2/web/bookstore.db";
    String sql = "select * from book" +
            " where category_id = ?";
    String categoryID = request.getParameter("id");
    Connection conn = DriverManager.getConnection(url);
    PreparedStatement pstat = conn.prepareStatement(sql);
    pstat.setString(1,categoryID);
    ResultSet rs = pstat.executeQuery();
    while (rs.next()) {
%>
    <div class="col-sm-9 col-md-3">
        <div class="thumbnail"  style="height: 30em;">
            <img src="<%=rs.getString("image")%>" style="height: 12em;">
            <div class="caption" style="height: 18em;">
                <h4 style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
                    <%=rs.getString("name")%>
                </h4>
                <p style="display: -webkit-box;-webkit-box-orient: vertical;overflow: hidden; font-size: 75%;height: 15em;">
                    作者：<a href="" rel="search"><%=rs.getString("author")%></a><br>
                    出版社：<a href="" rel="search"><%=rs.getString("press")%></a><br>
                    出版时间：<%=rs.getString("time")%><br>
                    价格：<inline style="color:red"><%=rs.getString("price")%></inline>&nbsp;原价：<inline style="color:blue;text-decoration:line-through"><%=rs.getString("old_price")%></inline><br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("description")%>
                </p>
                <p class="row" style="text-align:center"  style="height: 3em;">
                    <a href="addcart.jsp?userid=12&id=<%=rs.getString("id")%>" class="btn btn-primary col col" role="button">加入购物车</a>
                    <a href="#" class="btn btn-default col col" role="button">查看详情</a>
                </p>
            </div>
        </div>
    </div>
<%
    }
    pstat.close();
    conn.close();
%>
</body>

</html>