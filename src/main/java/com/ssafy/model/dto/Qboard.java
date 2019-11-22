package com.ssafy.model.dto;

public class Qboard {

	int qno;	//auto increasement
	String userid;
	String write_date;
	String title;
	String content;
	int hit;
	
//	qno int primary key auto_increment,
//    userid varchar(15),
//    write_date date,
//	title varchar(200) not null,
//	content varchar(200) not null,
//	hit int default 0

	
	public Qboard() {
		
	}
	
	
	public Qboard(String userid, String write_date, String title, String content) {
		super();
		this.userid = userid;
		this.write_date = write_date;	
		this.title = title;
		this.content = content;
	}
	public Qboard(int qno, String userid, String write_date, String title, String content, int hit) {
		super();
		this.qno = qno;
		this.userid = userid;
		this.write_date = write_date;
		this.title = title;
		this.content = content;
		this.hit = hit;
	}
	


	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "QBoard [qno=" + qno + ", userid=" + userid + ", write_date=" + write_date + ", title=" + title
				+ ", content=" + content + ", hit=" + hit + "]";
	}
	
	
	

}
