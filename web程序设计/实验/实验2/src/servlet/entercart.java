package servlet;

import dao.shoppingCartDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import VO.shoppingCart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.ArrayList;


public class entercart extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,IOException {
        String username=(String)request.getSession().getAttribute("user");
        request.getParameter(username);
        ArrayList<shoppingCart> shoppingcar= shoppingCartDao.queryShoppingCart("12");

        JSONArray jsonArray=new JSONArray();
        System.out.println("1111");
        System.out.println(shoppingcar);
        for(int i=0;i<shoppingcar.size();i++)
        {
            JSONObject json=new JSONObject();
            json.put("productId",shoppingcar.get(i).getBook_id());
            json.put("productQuentity",shoppingcar.get(i).getQuangtity());
            jsonArray.add(json);
        }
        request.getSession().setAttribute("cart",jsonArray);
        //将shoppingCar传递到购物车
        response.sendRedirect("http://localhost:8080/car.jsp");
    }


}
