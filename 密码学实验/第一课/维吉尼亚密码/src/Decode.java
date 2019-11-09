import java.util.Scanner;
public class Decode
{

	//输入密文和密钥，用密钥对密文解密
	public static void decode()
	{
		int i;
		char[] m=new char[100];
		char[] k1=new char[100];

		//输入
		Scanner input = new Scanner(System.in);
		System.out.print("please input message:");
		String c=input.next();
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

		//解密

		for(i=0;i<c.length();i++)
		{
			if(c.charAt(i)>='a'&&c.charAt(i)<='z')
			m[i]=(char)((c.charAt(i)-97-k1[i%k.length()]+26)%26+97);
			if(c.charAt(i)>='A'&&c.charAt(i)<='Z')
			m[i]=(char)((c.charAt(i)-65-k1[i%k.length()]+26)%26+65);
		}

		//输出明文
		for(i=0;i<c.length();i++)
		{
			System.out.print(m[i]);
			if(i==(c.length()-1))
				System.out.print("\n\n\n");
		}
	}

}