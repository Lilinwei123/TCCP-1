package com.tccp.persistence;

import java.util.List;

import com.tccp.entity.User;
import com.tccp.entity.User_List;

public interface UserPersistence {
	//根据用户名(U)和密码(P)查找符合条件用户信息(取user_id & username & priority)
	public User selectByUP(User user);
	//查找所有用户
	public List<User_List> selectAllUsers(); 
	//根据用户ID查找用户信息
	public User selectById(int user_id);
	//保存修改后的用户信息
	public boolean updateUserInfo(User user);
	//根据用户ID查询用户密码
	public String selectPd(int user_id);
	//保存密码
	public boolean updatePd(User user);
	//对比密码
	public boolean comparePd(User user);
	//修改头像
	public boolean updateImage(User user);
}
