package com.tccp.persistence;

import java.util.List;

import com.tccp.entity.Action;
import com.tccp.entity.User_Action;

public interface ActionPersistence {
	//添加动态
	public Boolean addMood(Action action);
	//添加评论
	public Boolean addComment(Action action);
	//根据用户ID删除所有动作
	public Boolean deleteActionsById(int user_id);
	//根据动态ID删除动态
	public Boolean deleteMoodById(int action_id);
	//获取某一用户的所有有关动态，返回类型为User_Action
	public List<User_Action> selectAllActionsByUserId(int user_id);
	//获取某一用户的所有有关动态ID，返回类型为int
	public List<Integer> selectAllActionsIdByUserId(int user_id);
	//删除某一动态的评论
	public Boolean deleteCommentsByActionId(List<Integer> actionIdList);
	//获取某一条动态的评论
	public List<User_Action> selectAllCommentsByActionId(int action_id);
	//查看所有动作
	public List<User_Action> selectAllActions();
}
