package com.tccp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tccp.entity.Action;
import com.tccp.entity.User;
import com.tccp.entity.User_Action;
import com.tccp.service.ActionService;



@Controller
@RequestMapping("/action")
public class ActionController {
	@Autowired
	private ActionService actionService;
	
	/**
	 * 发表动态
	 * @param request
	 * @return 
	 */

	@RequestMapping("/addMood")
	public String addMood(String action_message, HttpServletRequest request) {
		if(action_message!=null){
			Action action = new Action();
			int user_id = ((User)request.getSession().getAttribute("User")).getUser_id();
			action.setUser_id(user_id);
			action.setAction_message(action_message);
			actionService.addMood(action);
			return "redirect:/user/toUserLogin";
		}
		else {
			return null;
		}
	}
	/**
	 * 查看所有动作
	 * @param request
	 * @return 
	 */
	@RequestMapping("/selectAllActions")
	public String selectAllActions() {
		if(actionService.selectAllActions()!= null){
			return "/admin_delUser";
		}else{
			return "/error";
		}
	}
	/**
	 * 获得所有动态
	 * @param request
	 * @return Json
	 */
	@ResponseBody
	@RequestMapping("/selectAllMoods")
	public List<User_Action> selectAllMoods(HttpServletRequest request) {
		return actionService.selectAllActions();
	}
	
	/**
	 * 获得所有关于某个用户的动态
	 * @param request
	 * @return Json
	 */
	@ResponseBody
	@RequestMapping("/selectAllMoodsByUserId")
	public List<User_Action> selectAllMoodsByUserId(HttpServletRequest request) {
		int user_id = ((User)request.getSession().getAttribute("User")).getUser_id();
		List<User_Action> result = null;
		if((result = actionService.selectAllMoodsByUserId(user_id)) != null){
			return result;
		}
		else {
			return null;
		}
	}
}
