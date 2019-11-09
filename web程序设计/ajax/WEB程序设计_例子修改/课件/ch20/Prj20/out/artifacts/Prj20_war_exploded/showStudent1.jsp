<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
  	<SCRIPT LANGUAGE="JavaScript">
  		function getStuname(){
  			var stusex = document.selectForm.stusex.value;
  			var xmlHttp;
            if(window.ActiveXObject){
//支持-通过ActiveXObject的一个新实例来创建XMLHttpRequest对象
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            }//不支持
            else if(window.XMLHttpRequest){
                xmlHttp = new XMLHttpRequest();
            }
            var url = "/servlet/ShowStudentServlet?stusex="+stusex;
            url = encodeURI(url);
            xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange=function() {
				if (xmlHttp.readyState==4) {
                    selectForm.stuname.options.length = 0;
                    var xmlDom = (new DOMParser()).parseFromString(xmlHttp.responseText,"text/xml");
                    var stunames=xmlDom.getElementsByTagName("stuname");
                    var len = stunames.length;
                    for(var i=0;i<len;i++) {
                        var stuname = stunames[i].firstChild.nodeValue;
                        selectForm.stuname.options.add(new Option(stuname,stuname));
					}
				}
			}
			xmlHttp.send();	
  		}
	</SCRIPT>
	显示学生信息<BR>
    <form name="selectForm">
    	学生性别：
    	<select name="stusex" onchange="getStuname()">
    		<option>选择性别</option>  	
    		<option value="男">男</option>
    		<option value="女">女</option>
    	</select>
    	学生姓名:<select name="stuname">
    	</select>
    </form>
  </body>
</html>
