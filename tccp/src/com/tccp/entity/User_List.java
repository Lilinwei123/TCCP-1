package com.tccp.entity;

public class User_List {
	private int 	user_id;
	private String 	username;
	private int 	sex;
	private String 	phonenum;
	private String 	grade;
	private String 	major;
	private String 	groups;
	private int 	priority;
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
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getGroups() {
		return groups;
	}
	public void setGroups(String groups) {
		this.groups = groups;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	@Override
	public String toString() {
		return "User_List [user_id=" + user_id + ", username=" + username
				+ ", sex=" + sex + ", phonenum=" + phonenum + ", grade="
				+ grade + ", major=" + major + ", groups=" + groups
				+ ", priority=" + priority + "]";
	}
	
	
}
