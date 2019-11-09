import java.util.Scanner;

public class Encode
{

	//输入明文和密钥，用输入的密钥对明文进行加密
	public static void encode()
	{
		int i;
		char[] c=new char[100];
		char[] k1=new char[100];

		//输入
		Scanner input =new Scanner(System.in);
		System.out.print("please input message:");
		String m=input.next();
		System.out.print("please input the key:");
		String k=input.next();

		//构造密钥对照表                                                                                                    

		for(i=0;i<k.length();i++)
		{
			if(k.charAt(i)>='a'&&k.charAt(i)<='z')
			k1[i]=(char)(k.charAt(i)-97);
			if(k.charAt(i)>='A'&&k.charAt(i)<='Z')
			k1[i]=(char)(k.charAt(i)-65);
		}

		//加密

		for(i=0;i<m.length();i++)
		{
			if(m.charAt(i)>='a'&&m.charAt(i)<='z')
			c[i]=(char)((m.charAt(i)-97+k1[i%k.length()])%26+97);
			if(m.charAt(i)>='A'&&m.charAt(i)<='Z')
			c[i]=(char)((m.charAt(i)-65+k1[i%k.length()])%26+65);
		}

		//输出密文
		for(i=0;i<m.length();i++)
		{
			System.out.print(c[i]);
			if(i==m.length()-1)System.out.print("\n\n\n");
		}
		
	}

}