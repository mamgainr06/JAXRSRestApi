package com.blog.bean;

public class Posts {
	
	int id;
	String title;
	String content;
	
	public Posts(){
		super();
	}
	
	public Posts(int id, String title, String content){
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
