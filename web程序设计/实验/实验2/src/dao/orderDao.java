package dao;

import VO.order;

import java.sql.*;
import java.util.ArrayList;

/**
 * @Author: Chen Huahao
 * @Dscription:
 * @Date: Created in 22:52 2018/12/11
 */
public class orderDao {

    //查询所有用户的订单
    public static ArrayList<order> queryOrderList(){
        ArrayList<order> list=new ArrayList<>();
        String sql="select books.bookId,bookName,photo,price,orderState,number,orderlist.Date,orderId " +
                "from orderlist,books where orderlist.bookId=books.bookId order by username;";

        try{
            Connection con=DBConnection.getConn();
            PreparedStatement pre=con.prepareStatement(sql);
            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                order order=new order();
                order.setBookId(rs.getInt(1));
                order.setBookName(rs.getString(2));
                order.setPhoto(rs.getString(3));
                order.setPrice(rs.getFloat(4));
                if(rs.getInt(5)>0){
                    order.setOrderState("订单已完成！");
                }else{
                    order.setOrderState("订单未完成！");
                }
                order.setNumber(rs.getInt(6));
                order.setDate(rs.getDate(7).toString());
                order.setOrderId(rs.getInt(8));
                list.add(order);
            }
            DBConnection.closeConn(con);
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return list;
    }

    //查询单个用户的订单列表
    public static ArrayList<order> queryUserOrderList(String username){
        ArrayList<order> list=new ArrayList<>();
        String sql="select books.bookId,bookName,photo,price,orderState,number,orderlist.Date,orderId " +
                "from orderlist,books where orderlist.bookId=books.bookId and username=?;";

        try{
            Connection con=DBConnection.getConn();
            PreparedStatement pre=con.prepareStatement(sql);
            pre.setString(1,username);
            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                order order=new order();
                order.setBookId(rs.getInt(1));
                order.setBookName(rs.getString(2));
                order.setPhoto(rs.getString(3));
                order.setPrice(rs.getFloat(4));
                if(rs.getInt(5)==1){
                    order.setOrderState("订单已完成！");
                }else{
                    order.setOrderState("订单未完成！");
                }
                order.setNumber(rs.getInt(6));
                order.setDate(rs.getDate(7).toString());
                order.setOrderId(rs.getInt(8));
                list.add(order);
            }
            DBConnection.closeConn(con);
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return list;
    }

    //更改订单状态
    public static void updateOrderState(int orderId){
        String sql="update orderlist set orderState=1 where orderId="+orderId;

        try{
            Connection con=DBConnection.getConn();
            Statement st=con.createStatement();
            st.executeUpdate(sql);
            DBConnection.closeConn(con);
        }catch(SQLException ex){

        }
    }
}
