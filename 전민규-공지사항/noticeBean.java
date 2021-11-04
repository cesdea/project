package notice;

public class noticeBean {
   private int id;
   private String name;
   private String title;
   private String content;
   private String regDt;
   
   public String getRegDt() {
      return regDt;
   }
   public void setRegDt(String regDt) {
      this.regDt = regDt;
   }
   public int getId() {
      return id;
   }
   public void setId(int id) {
      this.id = id;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   
   
}