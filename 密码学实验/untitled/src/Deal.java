import com.sun.tools.javac.Main;

public class Deal {
    public static byte[] encrype(byte[] bytes,int e,int N){

        String m= Integer.toBinaryString(e);

        int[] mresult = new int[m.length()];

        for (int i = 0; i <mresult.length; i++) {
            char c = m.charAt(mresult.length-i-1);
            mresult[i] = Character.getNumericValue(c);
        }

        int[] rr = new int[bytes.length] ;
        int[] x = new int[bytes.length];
        for (int i = 0; i < bytes.length; i++) {
            rr[i]= bytes[i] & 0xFF;

            x[i]=1;
            for (int j = m.length()-1; j >=0; j--) {
                x[i]=(x[i]*x[i])%N;
                System.out.println(mresult[j]);
                if(mresult[j]==1)
                    x[i]=(x[i]*rr[i])%N;

            }
            System.out.println(x[i]+"bb");

        }

        byte[] bytes2 = new byte[x.length];

        for (int i = 0; i < x.length; i++) {
            bytes2[i]=(byte)(x[i]);
            byte by = (byte)4016;
            System.out.println(by & 0xff);
        }

        return bytes2;
    }

    public static byte intToByte(int x) {
        return (byte) x;
    }

    public static int byteToInt(byte b) {
        //Java 总是把 byte 当做有符处理；我们可以通过将其和 0xFF 进行二进制与得到它的无符值
        return b & 0xFF;
    }
    public static void main(String[] args) {
        byte[] bytes={(byte)2};
        byte[] bytes1=encrype(bytes,101,4757);
//        for (int i = 0; i < bytes1.length; i++) {
//            System.out.println(bytes1[i]);
//        }
//        byte[] bytes2=encrype(bytes1,1601,4757);
//        for (int i = 0; i < bytes2.length; i++) {
//            System.out.println(bytes2[i]);
//        }
        byte by = (byte)4016;
        System.out.println(by & 0xff);
    }
}
