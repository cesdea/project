package homework;

import java.util.Scanner;

class Phone {
	private String name;
	private String number;
	
	public Phone(String name, String number) {
		this.name = name;
		this.number = number;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	
	
}

public class Phonebook {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		System.out.println("�ο� �� >> ");
		int n = Integer.parseInt(scan.nextLine());
		
		Phone[] phones = new Phone[n];
		
		for (int i = 0; i < n; i++) {
			System.out.println("�̸��� ��ȭ��ȣ(�̸��� ��ȭ��ȣ�� ��ĭ ���� �Է�) >> ");
			String name = scan.next();
			String number = scan.next();
			
			phones[i] = new Phone(name, number);
		}
		scan.nextLine();
		
		System.out.println("����Ǿ����ϴ�...");
		
		while(true) {
			System.out.print("�˻��� �̸� >> ");
			String name = scan.nextLine();
			
			if(name.equals("�׸�")) {
				scan.close();
				break;				
			}
			String number = "";
			
			for (int i = 0; i <n; i++) {
				if(phones[i].getName().equals(name)) {
					number = phones[i].getNumber();
					break;
				}
			}
			
			if(number.equals("")) {
				System.out.println(name + "�� �����ϴ�.");
			}else {
				System.out.println(name + "�� ��ȣ�� " + number);
			}
		}
	}
}
