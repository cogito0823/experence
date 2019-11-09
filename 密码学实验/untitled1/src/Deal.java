/**
 * @Author: Chen Huahao
 * @Dscription:
 * @Date: Created in 19:57 2018/12/20
 */
public class Deal {
    public static byte[] decrype(byte[] byte5, int e, int N) {
        int[] bytes=read_2timesbytes(byte5);
//        for (int i = 0; i <bytes.length ; i++) {
//            System.out.println(bytes[i]);;
//        }

        int rr[] =read_2timesbytes(byte5);
        System.out.println(rr[0]);
        String m= Integer.toBinaryString(e);

        int[] mresult = new int[m.length()];

        for (int i = 0; i <mresult.length; i++) {
            char c = m.charAt(mresult.length-i-1);
            mresult[i] = Character.getNumericValue(c);
        }


        int[] x = new int[rr.length];
        for (int i = 0; i < rr.length; i++) {

            x[i]=1;
            for (int j = m.length()-1; j >=0; j--) {
                x[i]=(x[i]*x[i])%N;
//                System.out.println(mresult[j]);
                if(mresult[j]==1)
                    x[i]=(x[i]*rr[i])%N;

            }
//            System.out.println(x[i]+"bb");

        }
        byte[] bytes2 = new byte[bytes.length];

        for (int i = 0; i < bytes.length; i++) {
            bytes2[i]=(byte)x[i];
        }
        return bytes2;
    }


    public static byte[] bytetimes2(int[] x) {
        byte[] bytes2= new byte[x.length*2];
        for (int i = 0; i < x.length; i++) {
            bytes2[i*2]=(byte)(x[i]);
            bytes2[i*2+1]=(byte)(x[i]>>8);
        }
        return bytes2;
    }

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
//                System.out.println(mresult[j]);
                if(mresult[j]==1)
                    x[i]=(x[i]*rr[i])%N;

            }
//            System.out.println(x[i]+"bb");

        }

//        byte[] bytes2 = new byte[x.length];
//
//        for (int i = 0; i < x.length; i++) {
//            bytes2[i]=(byte)(x[i]);
//            byte by = (byte)4016;
//            System.out.println(by & 0xff);
//        }
        return bytetimes2(x);

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


    public static void main(String[] args) {
        byte[] bytes={12,22,32,33,21,11};
        byte[] bytes1=encrype(bytes,101,4757);
        byte[] bytes2=decrype(bytes1,1601,4757);
        for (int i = 0; i <bytes2.length ; i++) {
            System.out.println(bytes2[i]);
        }
    }
}