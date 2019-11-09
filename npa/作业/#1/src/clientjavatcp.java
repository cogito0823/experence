import java.io.BufferedReader;
import java.io.IOException;  
import java.io.InputStreamReader;  
import java.io.PrintStream;  
import java.net.Socket;  
import java.net.SocketTimeoutException;
import java.util.Scanner;

public class clientjavatcp {
    public static void main(String[] args) throws IOException {

        System.out.print("cutepie> client ");

        Scanner qq = new Scanner(System.in);       //读取服务器输入
        String ip = qq.next();                     //存储域名或ip地址
        int port = qq.nextInt();                   //存储端口号

        //客户端请求与用户设定的地址和端口建立TCP链接
        Socket client = new Socket(ip, port);

        client.setSoTimeout(10000);                //设置超时时间

        //获取键盘输入   
        BufferedReader input = new BufferedReader(new InputStreamReader(System.in));

        //获取Socket的输出流，用来发送数据到服务端    
        PrintStream out = new PrintStream(client.getOutputStream());

        //获取Socket的输入流，用来接收从服务端发送过来的数据    
        BufferedReader buf =  new BufferedReader(new InputStreamReader(client.getInputStream()));
        boolean flag = true;  

            System.out.print("Enter text: ");
            String str = input.readLine();

            //发送数据到服务端    
            out.println(str);
        String qqq = buf.readLine();
        System.out.println(qqq);
        System.out.print("cutepie> ");

        input.close();
        if(client != null){
            client.close();
        }
    }  
}  