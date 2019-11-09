<%@ page language="java" pageEncoding="gb2312"%>
<html>
	<body>
		文件上传
		<hr>
		<form action="/servlet/UploadServlet" method="post"
			enctype="multipart/form-data">
			你选择一个文件进行上传：
			<input type="file" name="myFile">
			<input type="submit" value="上传">
		</form>
		${msg}
	</body>
</html>
