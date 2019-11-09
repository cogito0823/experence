<%@ page language="java" pageEncoding="gb2312"%>
<html>
	<body>
		<form action="insert3.jsp" method="post">
			输入学号:<input type="text" name="stuno"><BR>
			输入姓名:<input type="text" name="stuname"><BR>
			选择性别:
			<select name="stusex">
				<option value="男">男</option>
				<option value="女">女</option>
			</select><BR>
			<input type="submit" value="提交">
		</form>
	</body>
</html>
