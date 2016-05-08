package com.tccp.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tccp.entity.Action;
import com.tccp.entity.User_Action;
import com.tccp.persistence.ActionPersistence;
import com.tccp.service.ActionService;
import com.tccp.utils.GetStringTime;

@Service
@Transactional
// 此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class ActionServiceImpl implements ActionService {
	@Resource
	private ActionPersistence actionPersistence;

	// 添加动态
	public Boolean addMood(Action action) {
		action.setAction_date(GetStringTime.getStringTime());
		return actionPersistence.addMood(action);
	}

	// 删除动态
	public Boolean deleteMood(int action_id) {
		return actionPersistence.deleteMoodById(action_id);
	}

	// 获取所有动态
	public List<User_Action> selectAllActions() {
		List<User_Action> userActionList = actionPersistence.selectAllActions();
		if (userActionList != null && userActionList.size() > 0) {
			return userActionList;
		}
		return null;
	}

	// 获取所有与某个用户有关动态（包括评论）
	@SuppressWarnings("null")
	public synchronized List<User_Action> selectAllMoodsByUserId(int user_id) {
		List<User_Action> list = actionPersistence
				.selectAllActionsByUserId(user_id);
		List<User_Action> result = new ArrayList<User_Action>();
		List<User_Action> temp = null;
		for (User_Action action : list) {
			temp = actionPersistence.selectAllCommentsByActionId(action
					.getAction_id());
			if (temp != null || temp.size() != 0) {
				result.addAll(temp);
			}
		}
		result.addAll(list);
		return result;
	}
}
