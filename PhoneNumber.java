package test;

import java.util.Scanner;

public class PhoneNumber {
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("�ο���>> ");
		int n = scanner.nextInt();

		String names[] = new String[n];
		String tels[] = new String[n];
		
		for (int i = 0; i < n; i++) {
			System.out.print("�̸��� ��ȭ��ȣ(�̸��� ��ȣ�� �� ĭ ���� �Է�)>> ");
			names[i] = scanner.next();
			tels[i] = scanner.next();			
		}
		System.out.println("����Ǿ����ϴ�...");
		
		while (true) {
			boolean count = true;

			System.out.print("�˻��� �̸�>> ");
			String name = scanner.next();
			
			if (name.equals("�׸�")) {
				break;
			}
			
			for (int i = 0; i < names.length; i++) {
				if (name.equals(names[i])) {
					System.out.println(names[i] + "�� ��ȣ�� " + tels[i] + "�Դϴ�.");
					count = false;
				}
			}
			
			if (count == true) {
				System.out.println(name + " �� �����ϴ�.");
			}
		}
		
		scanner.close();
	}
}
