<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>帖子内容</title>
    <link rel="stylesheet" href="../../resources/css/material-icons.css">
    <link rel="stylesheet" href="../../resources/css/material.min.css">
    <script type="text/javascript" src="../../resources/js/material.min.js"></script>
    <script type="text/javascript" src="../../resources/js/jquery-3.1.1.min.js"></script>
    <style>
        .card-width {
            width: 600px;
        }

        .center {
            margin-right: auto;
            margin-left: auto;
        }
    </style>
</head>
<body>
<!-- Uses a header that scrolls with the text, rather than staying
  locked at the top -->
<div class="mdl-layout mdl-js-layout">
    <header class="mdl-layout__header mdl-layout__header--scroll mdl-color--grey-50">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <a class="mdl-layout-title mdl-navigation__link mdl-color-text--pink-400"
               href="/board/listPosts-${post.postBoardId}">${post.postTitle}</a>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation -->
            <nav class="mdl-navigation">
                <c:choose>
                    <c:when test="${username != null}">
                        <a class="mdl-navigation__link mdl-color-text--pink-400"
                           href="/user/listUserInfo?username=${username}">${username}</a>
                        <c:if test="${username == 'admin'}">
                            <a class="mdl-navigation__link mdl-color-text--black" href="/admin/manageCenter">登入管理后台</a>
                        </c:if>
                        <a class="mdl-navigation__link mdl-color-text--black" href="/user/loginOut">注销</a>
                    </c:when>
                    <c:when test="${username == null}">
                        <a href="/userLogin" class="mdl-navigation__link mdl-color-text--pink-400">登录</a>
                        <a href="/userRegister" class="mdl-navigation__link mdl-color-text--pink-400">注册</a>
                    </c:when>
                </c:choose>
            </nav>
        </div>
    </header>
    <main class="mdl-layout__content"  style="background-image: url(../../resources/img/strategy.png);background-position:center;background-repeat: repeat">
        <div class="page-content">
            <!-- Your content goes here -->
            <div class="mdl-grid">
                <div class="mdl-cell--3-col"></div>
                <div class="mdl-cell--6-col">
                    <div class="card-width mdl-card mdl-shadow--2dp center">
                        <div class="mdl-card__title" style="background-image: url('../resources/img/${post.postBoardId}.png');background-size:72.5%;background-repeat: repeat">
                            <h4 class="mdl-color-text--pink-400">${post.postTitle}</h4>
                            <c:if test="${post.postIfBest==1}">
                                <img width="8%" height="8%" src="../../resources/img/精.png" alt="精">精！
                            </c:if>
                        </div>
                        <div class="mdl-card__actions mdl-color-text--grey-400" align="left" style="font-size: 13px">
                            --- <a href="/user/listUserInfo?username=${post.postUserName}">${post.postUserName}</a>  时间：${post.postCreateTime}   回复：${post.postReplyCount}
                        </div>
                        <c:if test="${username != null}">
                            <div class="mdl-card__actions mdl-color-text--grey-400" align="right" style="font-size: 13px">
                                <a href="/post/doLike?postId=${post.postId}">赞</a>：${post.postGoodCount} <a href="/post/doHate?postId=${post.postId}">踩</a>：${post.postBadCount}
                            </div>
                        </c:if>
                        <c:if test="${username == null}">
                            <div class="mdl-card__actions mdl-color-text--grey-400" align="right" style="font-size: 13px">
                                赞：${post.postGoodCount} 踩：${post.postBadCount}
                            </div>
                        </c:if>
                        <div class="mdl-card__supporting-text">
                            <p style="text-indent:2em; padding:0px; margin:0px;">${post.postContent}</p>
                        </div>
                        <%--<div class="mdl-card__actions mdl-color-text--grey-400" align="right">时间：${post.postCreateTime}</div>--%>
                    </div>
                </div>
                <div class="mdl-cell--3-col"></div>
            </div>

            <c:choose>
                <c:when test="${replies != null}">
                    <%for(int i=0;i<1;i++){
                        int t=0;
                    %>
                    <c:forEach items="${replies}" var="reply">
                        <div class="mdl-grid">
                            <div class="mdl-cell--3-col"></div>
                            <div class="mdl-cell--6-col">
                                <div class="card-width mdl-card mdl-shadow--2dp center">
                                    <div class="mdl-card__title">
                                        <a href="/user/listUserInfo?username=${reply.replyUserName}">${reply.replyUserName}</a>
                                    </div>
                                    <div class="mdl-card__supporting-text">
                                            ${reply.replyContent}
                                    </div>
                                    <%t++;%>
                                    <div class="mdl-card__actions mdl-color-text--grey-400" align="right" style="font-size:13px"><%=t%>楼</div>
                                    <div class="mdl-card__actions mdl-color-text--grey-400" align="right" style="font-size:13px">时间：${reply.replyCreateTime}</div>
                                    <c:choose>
                                        <c:when test="${username != null}">
                                            <div class="mdl-card__actions mdl-color-text--grey-400" align="right" style="font-size: 13px">
                                                <a href="/reply/doLike?replyId=${reply.replyId}&postId=${post.postId}">赞</a>：${reply.replyGoodCount} <a href="/reply/doHate?replyId=${reply.replyId}&postId=${post.postId}">踩</a>：${reply.replyBadCount}
                                                <c:choose>
                                                    <c:when test="${username == reply.replyUserName || username == 'admin'}">
                                                        <div class="mdl-card__actions mdl-color-text--grey-400" align="right" style="font-size: 13px">
                                                            <a href="/admin/deleteReply?replyId=${reply.replyId}&replyPostId=${reply.replyPostId}">
                                                                删除
                                                            </a>
                                                        </div>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                        </c:when>
                                        <c:when test="${username == null}">
                                            <div  class="mdl-card__actions mdl-color-text--grey-400" align="right" style="font-size:13px">
                                                赞：${reply.replyGoodCount} 踩：${reply.replyBadCount}
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        <div class="mdl-cell--3-col"></div>
                    </div>
                    </c:forEach>
                    <%}%>
                </c:when>
            </c:choose>

            <div class="mdl-grid">
                <div class="mdl-cell--3-col"></div>
                <div class="mdl-cell--6-col">
                    <c:choose>
                        <c:when test="${username != null}">
                            <div align="right" class="center card-width">
                                <a class="mdl-button mdl-js-button mdl-color--pink-400 mdl-color-text--white"
                                   href="/addReply?replyPostId=${post.postId}&replyUserName=${username}">
                                    立即回复
                                </a>

                            <c:choose>
                                <c:when test="${username ==post.postUserName || username == 'admin'}">
                                    <a class="mdl-button mdl-js-button mdl-color--blue-400 mdl-color-text--white"
                                       href="/admin/deletePost?postId=${post.postId}&postBoardId=${post.postBoardId}">删除主题</a>
                                </c:when>
                            </c:choose>


                            </div>
                        </c:when>
                    </c:choose>
                </div>
                <div class="mdl-cell--3-col"></div>
            </div>
        </div>
    </main>
</div>
</body>
</html>