package com.tccp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tccp.entity.User;
import com.tccp.service.AdminService;



@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	/**
	 * 跳转到添加用户页面
	 * @param request
	 * @return 
	 */
	@RequestMapping("/toAddUser")
	public String toAddUser() {
		return "/admin_addUser";
	}
	/**
	 * 添加用户
	 * @param request
	 * @return 
	 */
	@RequestMapping("/addUser")
	public String addUser(User user, HttpServletRequest request) {
		if(adminService.addUser(user))
			return "redirect:/user/toAdminHomepage";
		else {
			return "/error";
		}
	}
	/**
	 * 跳转到删除用户页面
	 * @param request
	 * @return 
	 */
	@RequestMapping("/toDelUser")
	public String toDelUser() {
		return "/admin_delUser";
	}
	/**
	 * 删除用户
	 * @param request
	 * @return 
	 */
	@RequestMapping("/delUser")
	public String delUser(int user_id, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		if(adminService.delUser(user_id)){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
			return "redirect:/user/toAdminHomepage";
		}else {
			return "/error";
		}
	}
	/**
	 * 跳转到权限移交页面
	 * @param request
	 * @return 
	 */
	@RequestMapping("/toMoveUser")
	public String toMoveUser() {
		return "/admin_mov";
	}
	/**
	 * 权限移交
	 * @param request
	 * @return 
	 */
	@RequestMapping("/movUserToAdmin")
	public String movUserToAdmin(int user_id, HttpServletRequest request) {
		if(adminService.movUserToAdmin(user_id)){
			return "redirect:/user/toAdminHomepage";
		}else {
			return "/error";
		}
	}
}
