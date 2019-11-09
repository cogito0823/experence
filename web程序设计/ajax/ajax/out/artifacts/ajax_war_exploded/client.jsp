<%@page contentType="text/html"%>
<%@page pageEncoding="gb2312"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>AJAX Demo</title>
        <script language="JavaScript">
            var xmlHttp;
            
            function getGiftFromServer() {
                var url = "server.jsp";
                if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }else if(window.XMLHttpRequest){
                	xmlHttp = new XMLHttpRequest();
                }

                xmlHttp.onreadystatechange = showGift;

                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
                
                setTimeout("getGiftFromServer()",2000);
            }

            function showGift() {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                    document.getElementById("output").innerHTML = "Time is for " + xmlHttp.responseText + ".";
                }
            }
        </script>
    </head>
    <body onload="getGiftFromServer()">

        <h1>AJAX例子</h1>

        <div id="output"></div>
    </body>
</html>
