package myUtil;

import java.net.URLEncoder;

public class HanConv {
   public static String toKor(String str) {
      if ((str == null) || (str.equals("null"))) {
         return str;
      }
      try {
         return new String(str.getBytes("8859_1"),"euc-kr");
      } catch (Exception e) {
         e.printStackTrace();
         return str;
      }
   }
   
   public static String toKorTwo(String str) {
      if ((str == null) || (str.equals("null"))) {
         return str;
      }
      try {
         String result="";
         result = URLEncoder.encode(str, "euc-kr");
         return result;
      } catch (Exception e) {
         e.printStackTrace();
         return str;
      }
   }
}