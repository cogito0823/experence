<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Connection" %>

<%--
Created by IntelliJ IDEA.
  User: azqd
  Date: 2018/11/21
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-grid.css">
    <link rel="stylesheet" href="css/bootstrap-reboot.css">
    <link href="css/style.css" rel="stylesheet"/>
    <title>网上书店</title>
</head>
<body onload="initAJAX()">
<script language="JavaScript">
    function showBook(categoryID) {
        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState == 4) {
                if(xmlHttp.status == 200) {
                    var data = xmlHttp.responseText;
                    document.getElementById("book").innerHTML = data;
                }
            }
        }
        xmlHttp.open("GET", "getBook.jsp?id="+categoryID, true);
        xmlHttp.send();
    }
</script>

<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"></div>
            <div class="modal-body"></div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>

<div class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-8 col-md-9">
                <div class="login span4">
                    <h1><a href=""> 欢迎来到<strong>我的</strong>书店</a>
                        <span class="red">.</span></h1>
                </div>
            </div>
            <%--<div class="col-sm-4 col-md-3" style="padding-top: 1em;">--%>
                <%--<form class="form-inline my-2 my-lg-0">--%>
                    <%--<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
                    <%--<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
                <%--</form>--%>
            <%--</div>--%>
            <div class="col-sm-4 col-md-3" style="padding-top: 1em;">
                <a href="manage.jsp" rel="tooltip" data-placement="bottom">管理员入口</a>
            </div>
        </div>
        <div class="links">
            <a class="car" href="car.jsp" rel="tooltip" data-placement="bottom"></a>
            <%--<a class="p" href="<c:url value='/jsps/order/list.jsp'/>"target="body">我的订单</a>--%>
            <a class="login" href="userLogin.html" rel="tooltip" data-placement="bottom" data-toggle="modal" data-target="#myModal"></a>
            <a class="register" href="userRegister.html" rel="tooltip" data-placement="bottom"></a>
        </div>
    </div>

</div> <%--header--%>
<div class="row"> <%--下方左右div控制--%>
    <div class="col-md-3"> <%--左侧菜单div控制--%>
        <br>
        <form class="form-inline my-2 my-lg-0" style="padding-left: 0.8em">
            <input class="form-control mr-sm-2" type="search" placeholder="搜索图书" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        <ul class="nav nav-list">
            <li class="nav-header">书籍类型</li>
            <%
                Class.forName("org.sqlite.JDBC");
                String url = "jdbc:sqlite:D:/文档/OneDrive/实验/web程序设计/实验/实验2/web/bookstore.db";
                String sql = "select id,name,description from category ";
                Connection conn = DriverManager.getConnection(url);
                Statement stat = conn.createStatement();
                ResultSet rs = stat.executeQuery(sql);
                while(rs.next())
                {
            %>
            <li>
                <a  href='javascript:showBook("<%=rs.getString("id")%>")'><%=rs.getString("name")%></a>
            </li>
            <%
                }
                stat.close();
                conn.close();
            %>
        </ul>
    </div><%--左侧菜单div控制--%>
    <div class="col-md-9" id="book"><%-- 书籍布局控制--%>
    </div>
</div><%--下方左右div控制--%>


<script src="js/jquery.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/commons.js"></script>

</body>
</html>