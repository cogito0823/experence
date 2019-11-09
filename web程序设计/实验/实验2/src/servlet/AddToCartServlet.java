package servlet;

import dao.shoppingCartDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static java.lang.Integer.valueOf;

/**
 * @Author: Chen Huahao
 * @Dscription:
 * @Date: Created in 23:10 2018/12/11
 */
@WebServlet(name = "Servlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String username=request.getParameter("username");
       int book_id=valueOf(request.getParameter("id"));
       shoppingCartDao.add2Shopping(username,book_id);

       response.sendRedirect("/web/getBook.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
