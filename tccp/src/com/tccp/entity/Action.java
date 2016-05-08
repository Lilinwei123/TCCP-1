package com.tccp.entity;

public class Action {
	private int action_id;
	private int user_id;
	private int action_type;
	private String action_date;
	private String action_message;
	private int action_describe;

	
	public Action(){}


	public Action(int action_id, int user_id, int action_type,
			String action_date, String action_message, int action_describe) {
		super();
		this.action_id = action_id;
		this.user_id = user_id;
		this.action_type = action_type;
		this.action_date = action_date;
		this.action_message = action_message;
		this.action_describe = action_describe;
	}


	public int getAction_id() {
		return action_id;
	}


	public void setAction_id(int action_id) {
		this.action_id = action_id;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public int getAction_type() {
		return action_type;
	}


	public void setAction_type(int action_type) {
		this.action_type = action_type;
	}


	public String getAction_date() {
		return action_date;
	}


	public void setAction_date(String action_date) {
		this.action_date = action_date;
	}


	public String getAction_message() {
		return action_message;
	}


	public void setAction_message(String action_message) {
		this.action_message = action_message;
	}


	public int getAction_describe() {
		return action_describe;
	}


	public void setAction_describe(int action_describe) {
		this.action_describe = action_describe;
	}
	

	
}
