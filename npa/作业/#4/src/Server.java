import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Random;
import java.util.Scanner;

public class Server {
    static int num_rounds;
    static int num_packets;
    static int pkt_size=1000;
    static int xmit_time;
    static final int TARGET_BITS_PER_SECOND = 1 * 1024 * 1024;
    final static int TARGET_BYTES_PER_MILLISECOND = (TARGET_BITS_PER_SECOND / 8) / 1000;
    public static void main(String[] args) throws IOException, InterruptedException {
        Scanner sc=new Scanner(System.in);

        System.out.print("good>");
        sc.next();
        int listenport =sc.nextInt();
        System.out.print("good>");
        DatagramSocket socket = new DatagramSocket(listenport);

        byte[] data = new byte[8];

        DatagramPacket packet = new DatagramPacket(data, data.length);
        socket.receive(packet);

        int[] dataInt= read_2timesbytes(data);

        num_rounds=dataInt[0];
        num_packets=dataInt[1];
        pkt_size=dataInt[2];
        xmit_time=dataInt[3];

TrSocket trSocket =new TrSocket(socket);
        //向客户端响应数据
        //定义客户端的地址、端口号、数据
        for (int j = 0; j <num_rounds ; j++) {
            InetAddress address = packet.getAddress();
            int port = packet.getPort();
            int sequenseNum =0;
            byte[] data2;
            DatagramPacket packet2;
            for (int i = 0; i <num_packets ; i++) {
                data2=new byte[pkt_size];
                new Random().nextBytes(data2);
                int[] q={sequenseNum};
                for (int k = 0; k < 2; k++) {
                    data2[k]= (bytetimes2(q)[k]);
                }
                // 创建数据报，包含响应的数据信息
                packet2 = new DatagramPacket(data2, data2.length, address, port);
                // 响应客户端
                trSocket.send(packet2);
                sequenseNum++;
            }
        }
        // 关闭资源
        socket.close();



    }
    public static int[] read_2timesbytes(byte[] bytes){
        int[] x=new int[bytes.length/2];
        for (int i = 0; i <x.length; i++) {
            int t=bytes[2*i]&0xFF;
            t=(t<0?t+256:t);
            t+=(bytes[2*i+1]&0xFF)*256;
            x[i]=t;
        }
        return x;
    }
    public static byte[] bytetimes2(int[] x) {
        byte[] bytes2= new byte[x.length*2];
        for (int i = 0; i < x.length; i++) {
            bytes2[i*2]=(byte)(x[i]);
            bytes2[i*2+1]=(byte)(x[i]>>8);
        }
        return bytes2;
    }
}

