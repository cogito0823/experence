import java.io.IOException;
import java.net.DatagramPacket;  
import java.net.DatagramSocket;
import java.util.Scanner;

public class server {
    public static void main(String[] args)throws IOException{

        String send = new String();
        byte[] buf = new byte[1024];
        System.out.print("good> sever ");
        Scanner sc = new Scanner(System.in);            //获取服务端输入
        int port = sc.nextInt();                           //存储要监听的端口号
        System.out.println("[Eventually, after the server responds, it should just exit]");
        DatagramSocket ds = new DatagramSocket(port);
        System.out.print("good> ");
        //接收从客户端发送过来的数据  
        DatagramPacket dp_receive = new DatagramPacket(buf, 1024);
        boolean f = true;  
        while(f){  
            //服务器端接收来自客户端的数据  
            ds.receive(dp_receive);
            String str_receive = new String(dp_receive.getData(),0,dp_receive.getLength());

            send= str_receive;
            send= send.toLowerCase();
            send=send.replaceAll(" +",".");
            //数据发动到客户端的port端口
            DatagramPacket dp_send= new DatagramPacket(send.getBytes(),send.length(),dp_receive.getAddress(),2121);
            ds.send(dp_send);  

            dp_receive.setLength(1024);  
        }  
        ds.close();  
    }  
}  