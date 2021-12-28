package portfolio.service;

public class ServiceBean {
	private int s_id;
	private String s_content;
	private String s_name;
	
	public static int pageSize=10;
	public static int pageCount=1;
	public static int pageNum=1;
	
	/*페이징 처리*/
	public static String pageNumer(int limit) {
		String str="";
		int temp=(pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		if ((startPage - limit) > 0) {
			str = "<a href='ServiceList.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage+limit); i++) {
			if (i == pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='ServiceList.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='ServiceList.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>&nbsp;&nbsp;";
		}
		return str;
	}
	
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	
	
}
