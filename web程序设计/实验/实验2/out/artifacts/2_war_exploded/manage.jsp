<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/30
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>
    <title>管理员</title>
</head>
<body>
<div style="width: 100%; height: 100%; color: lightgoldenrodyellow;background-image: url(images/gly.jpg); background-size: 100% 100%">
    <form action="index.jsp">
        <input type="submit" value="返回" onclick="">
    </form>
    <h3 align="center">管理员</h3>
    <div style="position: absolute; top: 30%; left: 20%">
    <table class="tab" width="100%" border="0" cellspacing="0" cellpadding="0" style="position: center; height: 100%">
    <tr>
        <th style="width: 30%;"><a rel="tooltip" data-placement="bottom" target="_self" href="showBook.jsp" style="font-size: 80px; border: 0px; margin: 10px; background-color: lightblue">图书管理</a></th>
        <th style="width: 30%;"><a rel="tooltip" data-placement="bottom" target="_self" href="getUserInformation.jsp" style="font-size: 80px; border: 0px; margin: 10px; background-color: lightcyan">用户管理</a></th>
    </tr>
    </table>
    </div>
</div>
</body>
<script src="js/jquery.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/commons.js"></script>
</html>
