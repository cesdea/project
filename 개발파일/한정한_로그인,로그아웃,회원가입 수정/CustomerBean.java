package magic.member;

import java.sql.Timestamp;

public class CustomerBean {
	private String cus_id;
    private String cus_pwd;
    private String cus_nickname;
    private String cus_email;
    private Timestamp cus_registration_date;
    private int cus_num;
    
    
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
	public String getCus_pwd() {
		return cus_pwd;
	}
	public void setCus_pwd(String cus_pwd) {
		this.cus_pwd = cus_pwd;
	}
	public String getCus_nickname() {
		return cus_nickname;
	}
	public void setCus_nickname(String cus_nickname) {
		this.cus_nickname = cus_nickname;
	}
	public String getCus_email() {
		return cus_email;
	}
	public void setCus_email(String cus_email) {
		this.cus_email = cus_email;
	}
	public Timestamp getCus_registration_date() {
		return cus_registration_date;
	}
	public void setCus_registration_date(Timestamp cus_registration_date) {
		this.cus_registration_date = cus_registration_date;
	}
	public int getCus_num() {
		return cus_num;
	}
	public void setCus_num(int cus_num) {
		this.cus_num = cus_num;
	}
    

	}

