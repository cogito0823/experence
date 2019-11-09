import java.sql.SQLOutput;
import java.util.Scanner;
import java.util.Arrays;

public class Ss
{
    public static int keylen;   //秘钥长度
    public static int codelen;  //密文长度
    public static int[] k2=new int[100];	//秘钥顺序
    public static int[] k1=new int[100];	//秘钥逆序

    //getter and setter
    public static int getKeylen() {
        return keylen;
    }
    public static void setKeylen(int k) {
        Ss.keylen = k;
    }
    public static int[] getK2() {
        return k2;
    }
    public static void setK2(int[] kk) {
        for (int i = 0; i <getKeylen() ; i++) {
            Ss.k2[i]=kk[i];
        }
    }
    public static int getCodelen() {
        return codelen;
    }
    public static void setCodelen(int codelen) {
        Ss.codelen = codelen;
    }
    public static int[] getK1() {
        return k1;
    }
    public static void setK1(int[] k1) {
        Ss.k1 = k1;
    }

    //输入方法
    public static char[] inputcode(String words){
        Scanner input =new Scanner(System.in);
        System.out.print("please enter the "+words+":");
        String k=input.next();	//秘钥
        //setKeylen(k);
        char[] arr=new char[k.length()];
        arr=k.toCharArray();
        return arr;
    }

    //准备阶段
    public static void prepare(){
        String words = new String("key");
        char[] arr=inputcode(words);
        setKeylen((int)arr.length);
        char[] aq=(char[])arr.clone();
        char[] arrs=paiXu(arr);	//排序后的秘钥
        int[] kk=new int[getKeylen()];

        //得出秘钥顺序K2
        for(int aawe=0;aawe<getKeylen();aawe++)
        {
            for(int aawq=0;aawq<getKeylen();aawq++)
            {
                if(aq[aawe]==arrs[aawq]){kk[aawe]=aawq+1;System.out.print(kk[aawe]);}
            }
        }
        setK2(kk);
        int[] k1=new int[k2.length];

        //得出逆序k1
        for (int i = 0; i < k2.length; i++) {
            for (int j = 0; j <k2.length; j++) {
                if(i+1==k2[j])k1[i]=j+1;
            }
        }
        setK1(k1);


    }

    //加密算法
    public static void luanXu(int keylen,int[] k)
    {
        boolean len = true;
        while(len) {
            char[] arr = inputcode("clean text");
            setCodelen(arr.length);
            if (getCodelen() % getKeylen() == 0)//判断明文长度是否合适
            {
                System.out.print("the cipher text is: ");
                char[] cleancode = new char[arr.length];
                for (int i = 0; i < getCodelen(); i++) {
                    cleancode[i] = (arr[i + k[i % (getKeylen())] - 1 - i % getKeylen()]);
                }
                for (int s = 0; s < getKeylen(); s++) {
                    for (int w = 0; w < (getCodelen() / getKeylen()); w++) {
                        System.out.print((cleancode[w * getKeylen() + s]));
                    }
                }
                System.out.println("");
                len=false;
            } else System.out.println("明文长度不合适，请您输入秘钥整数倍明文");
        }
    }

    //解密算法
    public static void zhengXu(int keylen,int[] k)
    {
        boolean len = true;
        while(len){
            char[] ciphercode = inputcode("cipher text");
            setCodelen(ciphercode.length);
            char[] zhengxu = new char[ciphercode.length];

            if(getCodelen()%getKeylen()==0) //判断密文长度是否合适
            {
                System.out.print("the clean text is: ");
                for (int i = 0; i <getKeylen() ; i++) {
                    for (int j = 0; j < getCodelen()/getKeylen(); j++) {
                        zhengxu[i+j*getKeylen()]=ciphercode[j+i*getCodelen()/getKeylen()];
                    }
                }
                for (int i = 0; i < getCodelen(); i++) {
                    System.out.print((zhengxu[i + k[i % (getKeylen())] - 1 - i % getKeylen()]));
                }
				System.out.println("");
                len=false;
            }else System.out.println("密文长度不合适，请输入整数倍长度的密文");
        }
    }

    // 冒泡排序
    public static char[] paiXu(char[] arr)
    {
        int len = arr.length;
        for (int i = 0; i < len - 1; i++)
        {
            for (int j = 0; j < len - 1 - i; j++)
            {
                if (arr[j] > arr[j+1])
                {
                    // 相邻元素两两对比
                    char temp = arr[j+1];        // 元素交换
                    arr[j+1] = arr[j];
                    arr[j] = temp;
                }
            }
        }
        return arr;
    }

    //主程序
    public static void main(String[] args)
    {
        prepare();

        //选择模式
        Scanner input =new Scanner(System.in);
        System.out.print("\n1: encode\n"+"2: decode\n");
        int re = input.nextInt();
        System.out.print("\n");
        switch(re)
        {
            case 1: //执行加密
            {
                luanXu(getKeylen(),getK1());
                break;
            }
            case 2: //执行解密
            {
                zhengXu(getKeylen(),getK2());
                break;
            }
            default: break;
        }
    }
}