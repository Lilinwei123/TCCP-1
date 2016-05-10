package com.tccp.service;

import java.util.List;

import com.tccp.entity.Action;
import com.tccp.entity.User_Action;

public interface ActionService {
	//添加动态
	public Boolean addMood(Action action);
	//删除动态
	public Boolean deleteMood(int action_id);
	//获取所有动态
	public List<User_Action> selectAllActions();
	//获取所有与某个用户有关动态（包括评论）
	public List<User_Action> selectAllMoodsByUserId(int user_id);
}
