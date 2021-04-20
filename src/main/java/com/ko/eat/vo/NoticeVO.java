package com.ko.eat.vo;

import java.util.Date;

public class NoticeVO {
   
   private int bno;
   private String title;
   private String content;
   private int top;
   
   public int getBno() {
      return bno;
   }
   public void setBno(int bno) {
      this.bno = bno;
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
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public Date getRegdate() {
      return regdate;
   }
   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }
   public int getTop() {
      return top;
   }
   public void setTop(int top) {
      this.top = top;
   }
   private String writer;
   private Date regdate;


}