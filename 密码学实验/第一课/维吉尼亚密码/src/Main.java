import java.util.Scanner;
public class Main{
	public static void main(String[] args){
		for(int i=0;i<=100;i++)
		{
			
			//选择功能
			System.out.print("Please choose a function:\n"+"1.encode\n"+"2.decode\n"+"3.exit\n");
			Scanner o = new Scanner(System.in);
			int aaa = o.nextInt();
			
				switch(aaa)
				{
					case 1:{Encode.encode();break;}
					case 2:{Decode.decode();break;}
					case 3:System.exit(0);
					default: break;
				}
				
		}
		
		
	}
	
}