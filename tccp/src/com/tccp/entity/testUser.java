package com.tccp.entity;

/**
 * 框架测试用户表
 * @author tccp项目组
 **/
public class testUser {

	private int user_id;
	private String username;
	private String age;
	
	public testUser(){
		super();
	}
	
	public testUser(int user_id, String username, String age) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.age = age;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", username=" + username + 
				", age=" + age + "]";
	}
}
