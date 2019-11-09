package dao;
import java.sql.*;

/**
 * 定义数据库连接操作
 */
public class DBConnection {
    // 定义数据库连接参数
    public static final String DRIVER_CLASS_NAME = "org.sqlite.JDBC";

    public static final String URL = "jdbc:sqlite:D:/文档/OneDrive/实验/web程序设计/实验/实验2/web/bookstore.db";


    // 注册数据库驱动
    static
    {
        try
        {
            Class.forName(DRIVER_CLASS_NAME);
        }
        catch (ClassNotFoundException e)
        {
            System.out.println("注册失败！");
            e.printStackTrace();
        }
    }

    // 获取连接
    public static Connection getConn() throws SQLException
    {
        return DriverManager.getConnection(URL);
    }

    // 关闭连接
    public static void closeConn(Connection conn)
    {
        if (null != conn)
        {
            try
            {
                conn.close();
            }
            catch (SQLException e)
            {
                System.out.println("关闭连接失败！");
                e.printStackTrace();
            }
        }
    }

}
