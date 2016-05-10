package com.tccp.persistence;

import java.util.List;

import com.tccp.entity.User;

public interface AdminPersistence {
	//添加用户
	public boolean addUser(User user);
	//添加管理员
	public boolean addAdmin(String username);
	//权限移交
	public boolean moveUserToAdmin(int user_id);
	//根据用户ID删除用户
	public boolean deleteUserById(int user_id);
	//根据用户名删除用户
	public boolean deleteUserByName(String username);
	//修改用户
	public boolean updateUser(User user);
	//根据用户ID查询用户
	public User selectUser(int user_id);
	//查询所有用户
	public List<User> selectAllUser();
}
