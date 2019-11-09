package dao;
import beans.BookBean;
import java.sql.*;
class BooksDao {
    Connection conn=null;
    ResultSet resultSet=null;
    //往数据库中添加书籍
    public void addBook(BookBean bookBean){
        try {
            PreparedStatement state=null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/bookstore?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
            conn= DriverManager.getConnection(url,"root","123456");

            String sql="insert into books(bookName,category,photo,author,information,price) values(?,?,?,?,?,?)";
            state=conn.prepareStatement(sql);
            System.out.println(bookBean.getName()+","+bookBean.getCategory_id()+","+bookBean.getAuthor()+","+bookBean.getDescription()+","+bookBean.getPrice());
            state.setString(1,bookBean.getName());
            state.setString(2,bookBean.getCategory_id());
            state.setBytes(3,bookBean.getImage());
            state.setString(4,bookBean.getAuthor());
            state.setString(5,bookBean.getDescription());
            state.setFloat(6,bookBean.getPrice());

            int flag=state.executeUpdate();
            if(flag==0){
                System.out.println("插入失败！");
            }
            state.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    /*
        查询books表，将数据插入购物车表
     */
    public void addToCart(String name,String userName){
        try {
            PreparedStatement state=null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/bookstore?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
            conn= DriverManager.getConnection(url,"root","123456");
            String sql="select * from bookstore.book where Name=?";
            state=conn.prepareStatement(sql);
            state.setString(1,name);

            resultSet=state.executeQuery();

            while(resultSet.next()) {
                int bookId = resultSet.getInt(1);
                addToCart2(bookId,userName);
            }
            state.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void addToCart2(int bookId,String userName){
        try {
            PreparedStatement state=null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/bookstore?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
            conn= DriverManager.getConnection(url,"root","123456");
            if(addToCart3(bookId)==0){
                String sql="insert into bookstore.shoppingcart(bookId,username,quantity)VALUES (?,?,?)";
                state=conn.prepareStatement(sql);
                state.setInt(1,bookId);
                state.setString(2,userName);
                state.setInt(3,1);

                int success=state.executeUpdate();
            }
            state.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private int  addToCart3(int bookId){
        try {
            PreparedStatement state=null;
            conn= DBConnection.getConn();


            String sql="select * from bookstore.shoppingcart where bookId=?";
            state=conn.prepareStatement(sql);
            state.setInt(1,bookId);

            resultSet=state.executeQuery();
            if(resultSet.next())
            {
                System.out.println(1);
                return 1;
            }
            state.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(0);
        return 0;
    }
}