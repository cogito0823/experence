package servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vo.Book;

public class RemoveServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312"); 
		String bookno = request.getParameter("bookno");	

		HttpSession session = request.getSession();
		HashMap books = (HashMap)session.getAttribute("books");
		Book book = (Book)books.get(bookno);
		//总钱数减少
		float money = (Float)session.getAttribute("money");
		money = money - book.getBooknumber()*book.getBookprice();
		session.setAttribute("money", money);	
		//移除相应图书
		books.remove(bookno);		
		response.sendRedirect("/showCart.jsp");
	}
}
