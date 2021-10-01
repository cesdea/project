package report;

import java.util.Scanner;


public class report3 {
  public static void main(String[] args) {
	
	  Scanner sc = new Scanner(System.in);
	  int[] array = new int[3];
	  int i = 0;
	  
	  while(true) {
		  
		  if(i<3) {
		  System.out.println("넣을 숫자를 입력하세요");
		  array[i] = sc.nextInt();
		  i++;
	  }
	  System.out.println(array[0]);
}
}
}
//확인했습니다
