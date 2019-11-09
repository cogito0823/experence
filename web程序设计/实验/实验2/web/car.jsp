<%@ page import="net.sf.json.JSONArray" %><%--
  Created by IntelliJ IDEA.
  User: god88
  Date: 2018/12/11
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <head>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>

    <script src="js/vue.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/vue-resource.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
    <link href="css/style.css" rel="stylesheet"/>
    <title>网上购物车</title>
  </head>
<%
  JSONArray car=(JSONArray)request.getSession().getAttribute("cart");
  Object cca=car;
%>
<script>
    dynamicTable(<%=cca%>);
    function refresh() {
        window.location.href="http://localhost:8080/servlet/entercart";
    }
</script>
  <body>
  <div class="header">
    <div class="container">
      <div class="row">
        <div class="login span4">
          <h1><a href=""> <strong>我的</strong>购物车</a>
            <span class="red">.</span></h1>
        </div>
        <div class="links span8">
          <div id="app" class="container">
    <table class="tab" width="100%" border="0" cellspacing="0" cellpadding="0">
      <thead>
      <tr>
        <th colspan="2">信息</th>
        <th style="width: 15%;">金额</th>
        <th style="width: 15%;">数量</th>
        <th style="width: 15%;">总金额</th>
        <th>编辑</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="item in productList">
        <td style="width: 5%;"><input type="checkbox" :checked="item.check" @click="checkBox(item)"/></td>
        <td class="goods">
          <img :src="item.productImage" class="goods-left"/>
          <div class="goods-right">
            <p>{{item.productName}}</p>
          </div>
        </td>
        <td>{{item.productPrice | formatMoney}}</td>
        <td class="num">
          <a href="javascript:;" @click="changeMoney(item,-1)">-</a>&nbsp;&nbsp;
          <input type="text" v-model="item.productQuentity"  disabled/>
          <input type="hidden" :id="item.productId" name="bookid" v-model="item.productId" style="display: none">&nbsp;&nbsp;
          <a href="javascript:;" @click="changeMoney(item,1)">+</a>
        </td>
        <td class="redcolor">{{item.productPrice*item.productQuentity | formatMoney}}</td>
        <td class="del" @click="del(item);">删除</td>
      </tr>
      </tbody>
      <tfoot>
      <tr class="footer">
        <td><input type="checkbox" :checked="checkAllFlag" @click="checkAll"/></td>
        <td>
          <span class="redcolor">全选</span>&nbsp;&nbsp;
        </td>
        <td colspan="4">
          <button type="button" style="background-color: #8da7ff;color: #fff;padding: 10px 40px;margin-right: 20px;border: 0;" onclick="refresh()">刷新当前页面</button>
          总计：<span>{{totalMoney | formatMoney}}</span>元
          <button type="button" class="btn" @click="addorder">结账</button>
        </td>
      </tr>
      </tfoot>
    </table>
  </div>
        </div>
      </div>
    </div> <%--header--%>
  </body>
<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/commons.js"></script>
</html>
