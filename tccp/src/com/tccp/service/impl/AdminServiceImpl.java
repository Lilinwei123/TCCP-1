package com.tccp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tccp.entity.User;
import com.tccp.persistence.ActionPersistence;
import com.tccp.persistence.AdminPersistence;
import com.tccp.service.AdminService;

@Service
@Transactional  
//此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class AdminServiceImpl implements AdminService{
	@Resource
	private AdminPersistence adminPersistence;
	@Resource
	private ActionPersistence actionPersistence;
	
	//权限移交
	public boolean movUserToAdmin(int user_id){
		return adminPersistence.moveUserToAdmin(user_id);
	}
	//添加用户
	public boolean addUser(User user){
		return adminPersistence.addUser(user);
	}
	
	//删除用户及其所有动态
	public synchronized boolean delUser(int user_id){
		List<Integer> actionsId = actionPersistence.selectAllActionsIdByUserId(user_id);
		if(actionsId != null && actionsId.size() != 0){
			actionPersistence.deleteCommentsByActionId(actionsId);
		}
		actionPersistence.deleteActionsById(user_id);
		return adminPersistence.deleteUserById(user_id);
	}
}
