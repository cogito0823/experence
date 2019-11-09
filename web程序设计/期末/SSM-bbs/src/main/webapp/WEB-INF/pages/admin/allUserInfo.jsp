<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
    <link rel="stylesheet" href="../../resources/css/material-icons.css">
    <link rel="stylesheet" href="../../resources/css/material.min.css">
    <script type="text/javascript" src="../../resources/js/material.min.js"></script>
    <script type="text/javascript" src="../../resources/js/jquery-3.1.1.min.js"></script>
</head>
<body>
<!-- Uses a header that scrolls with the text, rather than staying
  locked at the top -->
<div class="mdl-layout mdl-js-layout">
    <header class="mdl-layout__header mdl-layout__header--scroll mdl-color--grey-50">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <a class="mdl-layout-title mdl-navigation__link mdl-color-text--pink-400" href="/admin/manageCenter">返回</a>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation -->
            <nav class="mdl-navigation">
                <a class="mdl-navigation__link mdl-color-text--pink-400"
                   href="/user/listUserInfo?username=${username}">${username}</a>
                <a class="mdl-navigation__link mdl-color-text--black" href="/user/loginOut" name="logout">注销</a>
            </nav>
        </div>
    </header>
    <main class="mdl-layout__content">
        <div class="page-content">
            <!-- Your content goes here -->
            <c:forEach items="${users}" var="user" varStatus="status">
                <div class="mdl-grid">
                    <%--<div class="mdl-cell--3-col"></div>--%>
                    <div class="center mdl-cell--12-col">
                        <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" align="center">
                            <thead>
                            <tr>
                                <th class="mdl-data-table__cell--non-numeric">用户名</th>
                                <th>ID</th>
                                <th class="mdl-data-table__cell--non-numeric">邮箱</th>
                                <th>手机</th>
                                <th class="mdl-data-table__cell--non-numeric">性别</th>
                                <th class="mdl-data-table__cell--non-numeric">最后登录IP</th>
                                <th>最后登录时间</th>
                                <th>人气值</th>
                                <th>冻结</th>
                                <th>删除</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td width="100px">
                                    <a href="/user/listUserInfo?username=${user.userName}">${user.userName}</a>
                                </td>
                                <td>${user.userId}</td>
                                <td width="140px">${user.userEmail}</td>
                                <td width="120px">${user.userPhone}</td>
                                <td>${user.userSex}</td>
                                <td width="120px">${user.lastIp}</td>
                                <td>${user.lastLoginTime}</td>
                                <td>${user.userFollowCount}</td>
                                <td>
                                    <c:if  test="${user.userState==0}">
                                        <div class="">
                                            <a class=""
                                               href="/admin/coldUser?userName=${user.userName}">冻结</a>
                                        </div>
                                    </c:if>
                                    <c:if  test="${user.userState!=0}">
                                        <div class="">
                                            <a class=""
                                               href="/admin/deColdUser?userName=${user.userName}">解冻</a>
                                        </div>
                                    </c:if>
                                </td>
                                <td>
                                    <div class="">
                                        <a class=""
                                           href="/admin/deleteUser?userName=${user.userName}">删除</a>
                                    </div>
                                </td>
                            </tr>
                            </tbody>

                        </table>
                    </div>
                    <div class="mdl-cell--3-col"></div>
                </div>
            </c:forEach>
        </div>
    </main>
</div>
</body>
</html>
