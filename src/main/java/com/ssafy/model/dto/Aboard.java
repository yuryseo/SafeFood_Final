package com.ssafy.model.dto;

public class Aboard {

	int qno;	//foreign key
	int ano;	//auto_increment
	String userid;
	String write_date;
	String content;
	
//	qno int,
//	ano int primary key auto_increment,
//    userid varchar(15),
//    write_date date,
//	title varchar(200) not null,
//	content varchar(200) not null,
//	foreign key  fk_aboard_qno(qno) references qboard(qno)

	
	public Aboard() {
		
	}
	public Aboard(String userid, String write_date,  String content) {
		super();
		this.userid = userid;
		this.write_date = write_date;
		this.content = content;
	}
	
	public Aboard(int qno, int ano, String userid, String write_date,String content) {
		super();
		this.qno = qno;
		this.userid = userid;
		this.write_date = write_date;
		this.content = content;
	}
	
	public Aboard(int ano, String userid, String write_date, String content) {
		super();
		this.ano = ano;
		this.userid = userid;
		this.write_date = write_date;
		this.content = content;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
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

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Aboard [qno=" + qno + ", ano=" + ano + ", userid=" + userid + ", write_date=" + write_date
				+ ", content=" + content + "]";
	}

	

}
