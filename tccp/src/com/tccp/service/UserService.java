package com.tccp.service;

import java.util.List;

import com.tccp.entity.User;
import com.tccp.entity.User_List;
import com.tccp.entity.testUser;


public interface UserService {
	//实际方法
	
	//用户登录
	public User userLogin(User user);
	//查看个人信息
	public User getUserInformation(int user_id);
	//修改个人信息
	public boolean updateUserInfo(User user);
	//查询密码
	public String selectPd(int user_id);
	//验证密码
	public boolean comparePd(User user);
	//修改密码
	public boolean updatePd(User user);
	//修改头像
	public boolean updateImage(User user);
	//获得所有用户信息
	public List<User_List> getAllUsers();
	
	
	
	
	
	
	
	
	
	//**************************************测试方法*********************************************************************
	//**************************************测试方法*********************************************************************
	//**************************************测试方法****************************************************************
	void add(testUser user);
	boolean update(testUser user);
	boolean delete(int id);
	testUser findById(int id);
	List<testUser> findAll();
	//***************************************测试方法****************************************************************
	//**************************************测试方法*********************************************************************
	//**************************************测试方法*********************************************************************
}
