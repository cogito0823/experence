import java.io.IOException;
import java.io.InterruptedIOException;  
import java.net.DatagramPacket;  
import java.net.DatagramSocket;  
import java.net.InetAddress;
import java.util.Scanner;

public class client {
    private static final int TIMEOUT = 5000;
    private static final int MAXNUM = 5;
    public static void main(String args[])throws IOException{
        System.out.print("cutepie> client ");
        Scanner in =new Scanner(System.in);             //存储输入的字符
        String adress = in.next();                      //存储ip地址
        int port = in.nextInt();                        //存储端口号
        System.out.print("Enter text: ");
        String send=in.next();                          //存储发送的信息
        byte[] buf = new byte[1024];


        DatagramSocket ds = new DatagramSocket(2121);
        InetAddress loc = InetAddress.getLocalHost();  
        //定义用来发送数据的DatagramPacket实例  
        DatagramPacket dp_send= new DatagramPacket(send.getBytes(),send.length(),loc,port);
        //定义用来接收数据的DatagramPacket实例  
        DatagramPacket dp_receive = new DatagramPacket(buf, 1024);  
        //数据发向本地3000端口  
        ds.setSoTimeout(TIMEOUT);              //设置接收数据时阻塞的最长时间  
        int tries = 0;                         //重发数据的次数  
        boolean receivedResponse = false;     //是否接收到数据的标志位  
        //直到接收到数据，或者重发次数达到预定值，则退出循环  
        while(!receivedResponse && tries<MAXNUM){
            ds.send(dp_send);  
            try{  
                //接收从服务端发送回来的数据  
                ds.receive(dp_receive);
                if(!dp_receive.getAddress().equals(loc)){  
                    throw new IOException("Received packet from an umknown source");  
                }
                receivedResponse = true;  
            }catch(InterruptedIOException e){
                tries += 1;  
                System.out.println("Time out," + (MAXNUM - tries) + " more tries..." );  
            }  
        }  
        if(receivedResponse){
            String str_receive = new String(dp_receive.getData(),0,dp_receive.getLength());
            System.out.println(str_receive);
            System.out.println("cutepie> ");
            dp_receive.setLength(1024);     
        }else{
            System.out.println("No response -- give up.");  
        }  
        ds.close();  
    }    
}   