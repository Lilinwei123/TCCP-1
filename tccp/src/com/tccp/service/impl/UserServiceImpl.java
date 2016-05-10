package com.tccp.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tccp.persistence.UserMapper;
import com.tccp.persistence.UserPersistence;
import com.tccp.entity.User;
import com.tccp.entity.User_List;
import com.tccp.entity.testUser;
import com.tccp.service.UserService;



@Service
@Transactional  
//此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserMapper mapper;
	@Resource
	private UserPersistence userPersistence;

	//用户登录
	public User userLogin(User user)
	{
		return userPersistence.selectByUP(user);
	}
	//查看个人信息
	public User getUserInformation(int user_id)
	{
		return userPersistence.selectById(user_id);
	}
	//修改用户信息
	public boolean updateUserInfo(User user)
	{
		return userPersistence.updateUserInfo(user);
	}
	//查询密码
	public String selectPd(int user_id)
	{
		return userPersistence.selectPd(user_id);
	}
	//验证密码
	public boolean comparePd(User user){
		return userPersistence.comparePd(user);
	}
	//修改密码
	public boolean updatePd(User user)
	{
		return userPersistence.updatePd(user);
	}
	//修改头像
	public boolean updateImage(User user)
	{
		return userPersistence.updateImage(user);
	}
	
	public List<User_List> getAllUsers(){
		return userPersistence.selectAllUsers();
	}
	
	
	
	
	
	
	
	
	//**************************************测试方法*********************************************************************
	//**************************************测试方法*********************************************************************
	//**************************************测试方法*********************************************************************
	public boolean delete(int id) {
		
		return mapper.delete(id);
	}

	public List<testUser> findAll() {
		List<testUser> findAllList = mapper.findAll();
		return findAllList;
	}

	public testUser findById(int id) {

		testUser user = mapper.findById(id);
		
		return user;
	}

	public void add(testUser user) {

		mapper.add(user);
	}

	public boolean update(testUser user) {

		return mapper.update(user);
	}
	//**************************************测试方法************************************************************************
	//**************************************测试方法*********************************************************************
	//**************************************测试方法*********************************************************************
}
