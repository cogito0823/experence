package servlet;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BookDao;

public class InitServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookDao bdao = new BookDao();
		HashMap allbook = null;
		try {
			allbook = bdao.getAllBook();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("allbook", allbook);
		response.sendRedirect("/showAllBook.jsp");
	}
}
