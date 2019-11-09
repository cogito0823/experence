package servlet;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vo.Book;

public class AddServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		HttpSession session = request.getSession();
		HashMap books = (HashMap) session.getAttribute("books");
		// 获取提交的内容
		String bookno = request.getParameter("bookno");
		String bookname = request.getParameter("bookname");
		String strBookprice = request.getParameter("bookprice");
		String strBooknumber = request.getParameter("booknumber");
		// 存入购物车
		Book book = new Book();
		book.setBookno(bookno);
		book.setBookname(bookname);
		float bookprice = Float.parseFloat(strBookprice);
		book.setBookprice(bookprice);
		int booknumber = Integer.parseInt(strBooknumber);
		book.setBooknumber(booknumber);
		books.put(bookno, book);
		// 总钱数增加
		float money = (Float) session.getAttribute("money");
		money = money + bookprice * booknumber;
		session.setAttribute("money", money);
		response.sendRedirect("/showCart.jsp");
	}

}
