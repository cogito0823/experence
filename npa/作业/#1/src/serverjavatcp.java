import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

//默认服务器ip为本机
public class serverjavatcp {
    public static void main(String[] args) throws Exception{

        Socket client = null;

        System.out.print("good> sever ");
        Scanner sc = new Scanner(System.in);            //获取服务端输入
        int port = sc.nextInt();                           //存储要监听的端口号
        System.out.println("[Eventually, after the server responds, it should just exit]");

        //监听输入的端口请求的TCP连接
        ServerSocket server = new ServerSocket(port);
        System.out.print("good> ");
        client = server.accept();

        //为每个客户端连接开启一个线程
        new Thread(new ServerThread(client)).start();
        server.close();
    }
}
class ServerThread implements Runnable {

    private Socket client = null;
    public ServerThread(Socket client){
        this.client = client;
    }

    @Override
    public void run() {
        try{
            PrintStream out = new PrintStream(client.getOutputStream());
            BufferedReader buf = new BufferedReader(new InputStreamReader(client.getInputStream()));
            boolean flag =true;
            while(flag){
                String str =  buf.readLine();
                if(str == null || "".equals(str)){
                    flag = false;
                }else{
                    str=str.toLowerCase();
                    str=str.replaceAll(" +",".");
                    out.println(str);
                }
            }
            out.close();
            client.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}