package dao;

import VO.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @Author: Chen Huahao
 * @Dscription:
 * @Date: Created in 22:49 2018/12/11
 */
public class userDao {
    //2、登入验证，数据库中有该用户则返回true 否则为false
    public static Boolean login(user user){
        String sql="select * from user where username=?";
        String pswd=" ";
        try {
            Connection con = DBConnection.getConn();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, user.getUsername());
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                pswd = rs.getString("password");
            }
            pre.close();
            con.close();
        }catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        if(pswd.equals(user.getPassword()))
            return true;
        return false;
    }

    //2、用户注册 如果注册成功，返回true 否则，返回false
    public static Boolean registered(user user){
        String sql="insert into user values(?,?,?,?,?,?);";
        int executeSuccess=0;

        try{
            Connection con=DBConnection.getConn();
            PreparedStatement pre=con.prepareStatement(sql);
            pre.setString(1,user.getUsername());
            pre.setString(2,user.getPassword());
            pre.setString(3,user.getGender());
            pre.setString(4,user.getPhone());
            pre.setString(5,user.getAddress());
            pre.setString(6,user.getEmail());
            executeSuccess=pre.executeUpdate();
            pre.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        if(executeSuccess>0)
            return true;
        else
            return false;
    }

    //3、查询所有用户信息
    public static ArrayList<user> queryAllUsers(){
        ArrayList<user> list=new ArrayList<>();
        String sql="select * from user;";

        try{
            Connection con=DBConnection.getConn();
            PreparedStatement pre=con.prepareStatement(sql);
            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                user user=new user();
                user.setUsername(rs.getString("username"));
                user.setGender(rs.getString("gender"));
                user.setPhone(rs.getString("telephone"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                list.add(user);
            }
            DBConnection.closeConn(con);
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return list;
    }


}
