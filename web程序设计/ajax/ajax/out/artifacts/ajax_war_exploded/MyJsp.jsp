
<%response.setContentType("text/html; charset=utf-8");
response.setHeader("Cache-Control", "no-cache");
String rand = (String)session.getAttribute("rand");
String input  = request.getParameter("rand");
/*PrintWriter out=response.getWriter();*/ 
if (rand.equals(input)) 
  out.println("true"); 
else
  out.println("false");
out.close();%> 


<%response.setContentType("text/html;charset=utf-8");
response.setHeader("Cache-Control","no-cache");
//String 
rand=(String)session.getAttribute("rand");
//String 
input=request.getParameter("rand");
//PrintWriter out=response.getWriter();
if(rand.equals(input)){
	out.print("true");
}else{
	out.print("false");
}
out.close();%>