package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.StudentDao;

public class ShowStudentServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("Cache-Control", "no-cache");
		response.setContentType("text/xml;charset=gb2312");		
		String stusex = request.getParameter("stusex");
		System.out.println("Begin:");
        System.out.println("stusex1:"+stusex);

		StudentDao sdao = new StudentDao();
		List stunames = null;
		try {
			stunames = sdao.getStunamesByStuSex(stusex);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.println("<?xml version='1.0' encoding='gb2312'?>");
		out.println("<stunames>");
		for(int i=0;i<stunames.size();i++){
			String stuname = (String)stunames.get(i);			
			out.println("<stuname>" + stuname + "</stuname>");			
		}
		out.println("</stunames>");
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
}
