package dao;

import VO.shoppingCart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @Author: Chen Huahao
 * @Dscription:
 * @Date: Created in 22:39 2018/12/11
 */
public class shoppingCartDao {

    //查询用户购物车
    public static ArrayList<shoppingCart> queryShoppingCart(String username){
        ArrayList<shoppingCart> list=new ArrayList<>();
        String sql="select * from buybag" +
                "where user_id=?";

        try{
            Connection con=DBConnection.getConn();
            PreparedStatement pre=con.prepareStatement("select * from buybag");

            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                shoppingCart cart=new shoppingCart();
                cart.setQuangtity(rs.getInt("quangtity"));
                cart.setBook_id(rs.getInt("book_id"));
                list.add(cart);
            }
            rs.close();
            DBConnection.closeConn(con);
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return list;
    }

    //从购物车中删除
    public static void removeFromShoppingCart(int bookId,String username){
        String sql="delete from shoppingcart where bookId=? and username=?;";

        try{
            Connection con=DBConnection.getConn();
            PreparedStatement pre=con.prepareStatement(sql);
            pre.setInt(1,bookId);
            pre.setString(2,username);
            pre.executeUpdate();
            DBConnection.closeConn(con);
        }catch(SQLException ex){
            ex.printStackTrace();
        }

    }


    //将某一用户的购物车中的某商品的数量加减一
    public static void increaseBook(String username ,int bookId,Boolean isAdd){
        String sql1="select number from shoppingcart where username=? and bookId=?";
        int number=0;
        String sql2="update shoppingcart set number=? where username=? and bookId=?";

        try{
            Connection con=DBConnection.getConn();
            PreparedStatement pre=con.prepareStatement(sql1);
            pre.setString(1,username);
            pre.setInt(2,bookId);
            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                number=rs.getInt("number");
            }
            rs.close();
            pre=con.prepareStatement(sql2);
            if(isAdd)
                pre.setInt(1,number+1);
            else
                pre.setInt(1,number-1);
            pre.setString(2,username);
            pre.setInt(3,bookId);
            pre.executeUpdate();
            DBConnection.closeConn(con);
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }


    //将商品添加至该用户的购物车中
    public static void add2Shopping(String username, int book_id){
        String sql="insert into buybag (book_id,user_id,quangtity,id) values(?,?,?,?);";
        int i=1;
        try{
            Connection con=DBConnection.getConn();
            PreparedStatement pre=con.prepareStatement(sql);
            pre.setInt(1,book_id);
            pre.setString(2,username);
            pre.setInt(3,1);
            pre.setInt(4,i++);
            pre.executeUpdate();
            DBConnection.closeConn(con);
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }

}
