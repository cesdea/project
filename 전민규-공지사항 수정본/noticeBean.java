package notice;

import java.sql.Timestamp;

public class noticeBean {
   private int n_id;
   private String n_name;
   private String n_title;
   private String n_content;
   private Timestamp n_regDt;
   
   
public int getN_id() {
	return n_id;
}
public void setN_id(int n_id) {
	this.n_id = n_id;
}
public String getN_name() {
	return n_name;
}
public void setN_name(String n_name) {
	this.n_name = n_name;
}
public String getN_title() {
	return n_title;
}
public void setN_title(String n_title) {
	this.n_title = n_title;
}
public String getN_content() {
	return n_content;
}
public void setN_content(String n_content) {
	this.n_content = n_content;
}
public Timestamp getN_regDt() {
	return n_regDt;
}
public void setN_regDt(Timestamp n_regDt) {
	this.n_regDt = n_regDt;
}
}
  
  