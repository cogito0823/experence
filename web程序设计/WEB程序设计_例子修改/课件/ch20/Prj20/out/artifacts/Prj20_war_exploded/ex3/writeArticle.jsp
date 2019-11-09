<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
  <body>
  	<SCRIPT LANGUAGE="JavaScript">
  		function writeArticle(){	
 	  		var xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	  		var article = postForm.article.value;
	  		var url = "/servlet/WriteArticleServlet?article=" + article;	  					    xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange=function() {
				if (xmlHttp.readyState==4) {
					var text = xmlHttp.responseText;
					if(text=="OK"){
						postForm.article.value = "";
						articleDiv.innerHTML += (article + "<HR>");
					}
					else{
						alert("发帖失败");
					}					
				}
			}
			xmlHttp.send();	
  		}
	</SCRIPT>
	文章正文(省略)<HR>
	<div id="articleDiv"></div>
	<form name="postForm">
		输入内容:<BR>
		<textarea name="article" rows="5" cols="20"></textarea>
		<input type="button" onclick="writeArticle()" value="提交">
	</form>
  </body>
</html>
