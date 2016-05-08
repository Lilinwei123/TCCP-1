package com.tccp.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tccp.entity.Action;
import com.tccp.entity.User;
import com.tccp.entity.User_Action;
import com.tccp.persistence.ActionPersistence;
import com.tccp.persistence.UserPersistence;
import com.tccp.utils.DateFormatUtil;

/**
 * 动态数据库操作测试
 * 
 * @author TCCP项目组
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/config/spring-common.xml")
public class ActionTest {
	@Autowired
	private ActionPersistence actionPersistence;
	@Autowired
	private UserPersistence userPersistence;
	// 测试样例
	Date date = new Date(System.currentTimeMillis());
	String dateString = DateFormatUtil.dateFormat(date);
	Action action = new Action(5, 2, 0, dateString, "Hello World!", 0);

	// 测试添加动态
	@Test
	public void testAddAction() {
		Action action1 = new Action();
		action1.setAction_date(dateString);
		action1.setUser_id(3);
		action1.setAction_message("再来一条！");
		action1.setAction_describe(3);
		System.out.println(actionPersistence.addMood(action1));
	}

	// 测试删除动态
	@Test
	public void testDeleteAction() {
		System.out.println(action.getAction_id());
		System.out.println(actionPersistence.deleteMoodById(action
				.getAction_id()));
	}

	// 测试查询某用户发布的状态
	@Test
	public void selectAllMoodsByUserId() {
		List<User_Action> list = actionPersistence.selectAllActionsByUserId(2);
		System.out.println(list.size());
		for (User_Action action : list) {

			System.out.println(action.toString());
		}
	}

	// 测试查询与某用户所有动态包括评论
	@Test
	public void selectAllCommentsByActionId() {
		List<User_Action> list = actionPersistence.selectAllActionsByUserId(2);
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
		for (User_Action print : result) {
			System.out.println(print.toString());
		}
	}

	// 查询用户动态
	@Test
	public void testSelectAllMoods() {
		List<User_Action> list = actionPersistence.selectAllActions();
		System.out.println(list.size());
		for (User_Action action : list) {

			System.out.println(action.toString());
		}
	}

	// 测试日期
	@Test
	public void testDate() {
		Date date = new Date(System.currentTimeMillis());
		System.out.println(DateFormatUtil.dateFormat(date));
	}

	// 测试查询用户动态Id
	@Test
	public void testSelectActionIdByUserId() {
		List<Integer> result = actionPersistence.selectAllActionsIdByUserId(2);
		System.out.println(result.size());
	}
	
	// 测试删除某一用户有关所有相关动态
	@Test
	public void testDeleteMoodsAndComments() {

		actionPersistence.deleteCommentsByActionId(actionPersistence.selectAllActionsIdByUserId(4));
		actionPersistence.deleteActionsById(4);
	}
}
