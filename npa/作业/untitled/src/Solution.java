import java.util.*;

class Solution {

    public static int lengthOfLongestSubstring(String s) {
        int ans=0,n=s.length();
        int[] index = new int[128];
        for(int i=0,j=0;j<n;j++){
            i=Math.max(i,index[s.charAt(j)]);
            ans=Math.max(ans,j-i+1);
            index[s.charAt(j)]=j+1;
        }
        return ans;
    }
    public static void main(String[] args){
        Scanner scan = new Scanner(System.in);
        String s = scan.nextLine();
        int a = lengthOfLongestSubstring(s);
        System.out.print(a);
    }
}