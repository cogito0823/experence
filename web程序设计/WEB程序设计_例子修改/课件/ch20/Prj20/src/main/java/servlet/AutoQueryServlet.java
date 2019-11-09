package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vo.Customer;
import dao.CustomerDao;

public class AutoQueryServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("Cache-Control", "no-cache");
		response.setContentType("text/xml;charset=gb2312");
		String account = request.getParameter("account");
		CustomerDao cdao = new CustomerDao();
		Customer cus = null;
		try {
			cus = cdao.getNameByAccount(account);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		if(cus!=null){
			out.println("<?xml version='1.0' encoding='gb2312'?>");
			out.println("<customer>");
			out.println("<cname>"+cus.getCname()+"</cname>");
			out.println("</customer>");
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
}
