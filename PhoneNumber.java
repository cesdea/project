package test;

import java.util.Scanner;

public class PhoneNumber {
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("인원수>> ");
		int n = scanner.nextInt();

		String names[] = new String[n];
		String tels[] = new String[n];
		
		for (int i = 0; i < n; i++) {
			System.out.print("이름과 전화번호(이름과 번호는 빈 칸 없이 입력)>> ");
			names[i] = scanner.next();
			tels[i] = scanner.next();			
		}
		System.out.println("저장되었습니다...");
		
		while (true) {
			boolean count = true;

			System.out.print("검색할 이름>> ");
			String name = scanner.next();
			
			if (name.equals("그만")) {
				break;
			}
			
			for (int i = 0; i < names.length; i++) {
				if (name.equals(names[i])) {
					System.out.println(names[i] + "의 번호는 " + tels[i] + "입니다.");
					count = false;
				}
			}
			
			if (count == true) {
				System.out.println(name + " 이 없습니다.");
			}
		}
		
		scanner.close();
	}
}
