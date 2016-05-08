package com.tccp.persistence;

import java.util.List;

import com.tccp.entity.User;
import com.tccp.entity.testUser;

public interface UserMapper {
	//增删改查

	//根据用户名和密码查找符合条件用户信息
	User selectByUP(User user);
	//查找所有用户
	User selectAllUser();
	void add(testUser user);
	boolean update(testUser user);
	boolean delete(int user_id);
	testUser findById(int user_id);
	List<testUser> findAll();
	List<testUser> findAll2();
	public testUser userMap(int user_id); 
	
}
