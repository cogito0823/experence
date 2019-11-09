<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/31
  Time: 1:02
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

    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>
</head>
<body onload="initAJAX()">
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"></div>
            <div class="modal-body"></div>
            <div class="modal-body"></div>
            <div class="modal-body"></div>
            <div class="modal-body"></div>
            <div class="modal-body"></div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>
<div class="nav-header" style="background-color: #9fcdff">书籍类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="addBook.html" rel="tooltip" data-placement="bottom" data-toggle="modal"
    data-target="#myModal" >添加图书</a></div>
<div class="row" style="background-color: #9fcdff; width: 100%; height: 100%">
    <div class="col-md-3">
    <ul class="nav nav-list">
        <%
            try {
        %>
        <%
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:C:/实验/01_实验/bookstore.db";
            String sql = "select id , name from category ";
            Connection conn = DriverManager.getConnection(url);
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while(rs.next())
            {
        %>
             <li><a  href='javascript:showbookm("<%=rs.getString("id")%>")'><%=rs.getString("name")%></a></li>
        <%
                }
                stat.close();
                conn.close();
            }catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </ul></div>
<div id="bookm" class="col-md-9">
</div></div>
<script language="JavaScript">
    function showbookm(id) {
        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState == 4) {
                if(xmlHttp.status == 200) {
                    var data = xmlHttp.responseText;
                    document.getElementById("bookm").innerHTML = data;
                }
            }
        };
        xmlHttp.open("GET", "bookManage.jsp?id="+id, true);
        xmlHttp.send();
    }
</script>
</body>
<script src="js/jquery.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/commons.js"></script>
</html>
