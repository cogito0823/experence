<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: azqd
  Date: 2018/12/12
  Time: 1:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    Class.forName("org.sqlite.JDBC");
    String url = "jdbc:sqlite:D:/文档/OneDrive/实验/web程序设计/实验/实验2/web/bookstore.db";
    String sql = "insert into buybag(id,book_id,quangtity,user_id) values(?,?,?,?)";
    String book_id = request.getParameter("id");
    String user_id=request.getParameter("userid");
    Connection conn = DriverManager.getConnection(url);
    Statement st = conn.createStatement();
    ResultSet rs1 = st.executeQuery("select * from buybag");

    int rowCount = 0;
    while(rs1.next()) {
        rowCount++;
    }
    out.print(rowCount);
    PreparedStatement pstat = conn.prepareStatement(sql);

    pstat.setInt(1,++rowCount);
    pstat.setString(2,book_id);
    pstat.setInt(3,1);
    pstat.setString(4,user_id);
    pstat.executeUpdate();

%>
<script type="text/javascript">
    alert("yitianjia");
    window.location.href='index.jsp';
</script>
</body>
</html>
