package servlets;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String loginState = "Fail";
		String targetUrl = "/loginFail.jsp";
		//认为账号密码相等就算登录成功，此处是对DAO的简化
		if(account.equals(password)){
			loginState = "Success";
			targetUrl = "/loginSuccess.jsp";
			HttpSession session = request.getSession();
			session.setAttribute("account", account);
		}
		request.setAttribute("loginState", loginState);
		ServletContext application = this.getServletContext();
		RequestDispatcher rd = 
			application.getRequestDispatcher(targetUrl);
		rd.forward(request, response);
	}
}
