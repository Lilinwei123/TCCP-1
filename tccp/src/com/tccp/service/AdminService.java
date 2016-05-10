package com.tccp.service;

import com.tccp.entity.User;

public interface AdminService {
	//添加用户
	public boolean addUser(User user);
	//删除用户
	public boolean delUser(int user_id);
	//权限移交
	public boolean movUserToAdmin(int user_id);
}
