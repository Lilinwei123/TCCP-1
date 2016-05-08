package com.tccp.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sun.mail.iap.Response;
import com.tccp.entity.User_List;
import com.tccp.entity.testUser;
import com.tccp.service.UserService;
import com.tccp.entity.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	/**
	 * 跳转到用户登陆界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toUserLogin")
	public String toUserLogin(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("User");
		if(user != null && user.getUsername()!= null) 
			return "/user_homePage"; 
		else
			return "/homePage";
	
	}	

	/**
	 * 跳转到管理员界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toAdminHomepage")
	public String toAdminHomepage(HttpServletRequest request){
		return "/admin_homePage";
	}	
	/**
	 * 重定向到管理员界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/redirectAdminHomepage")
	public String redirectAdminHomepage(HttpServletRequest request){
		return "redirect:/user/toAdminHomepage";
	}	
	/**
	 * 用户登录
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/userLogin")
	public String userLogin(User user, HttpServletRequest request){
		User user1 = userService.userLogin(user);
		if(user1 !=null){
			request.getSession().setAttribute("User", user1);
			request.getSession().setMaxInactiveInterval(900);			
			return "/user_homePage";
		}else{
			return "/error";
		}
	}	
	/**
	 * 用户登出
	 * @param request
	 * @return 
	 */
	@RequestMapping("/userLoginOut")
	public String userLoginOut(HttpServletRequest request){
			request.getSession().removeAttribute("User");
			//request.getSession().setMaxInactiveInterval(0);
			return "redirect:/user/toUserLogin";
	}
	/**
	 * 查看用户个人信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/getUserInformation")
	public String getUserInformation(HttpServletRequest request){
		int user_id = ((User)request.getSession().getAttribute("User")).getUser_id();
		if(user_id != 0){
			User user = userService.getUserInformation(user_id);
			try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("userInfo", user);
			return "/user_userInfo";
		}else{
			return "/error";
		}
	}	
	/**
	 * 修改个人信息
	 * @param request
	 * @param user
	 * @return 
	 */
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo(User user, HttpServletRequest request){
			user.setUser_id(((User)request.getSession().getAttribute("User")).getUser_id());
			System.out.println(user.toString());
			if(userService.updateUserInfo(user) == true)
				return "redirect:/user/getUserInformation";
			else {
				return "/error";
			}
	}	
	/**
	 * 跳转到密码修改界面
	 * @param request
	 * @return 
	 */
	@RequestMapping("/toUpdatePd")
	public String toChangePd(HttpServletRequest request){
		int user_id = ((User)request.getSession().getAttribute("User")).getUser_id();
		String password = userService.selectPd(user_id);
		if(password != null){
			request.setAttribute("password", password);
			return "/user_updatePd";
		}
		return "/error";
	}	
	/**
	 * 修改密码
	 * @param request
	 * @param password
	 * @return 
	 */
	@RequestMapping("/updatePd")
	public String changePd(String password, HttpServletRequest request){

		User user = new User();
		int user_id = ((User)request.getSession().getAttribute("User")).getUser_id();
		user.setUser_id(user_id);
		user.setPassword(password);
		if(userService.updatePd(user) == true)
			return "redirect:/user/getUserInformation";	
		return "/error";
	}
	/**
	 * 验证密码
	 * @param request
	 * @param password
	 * @return 
	 * @throws IOException 
	 */
	@RequestMapping("/comparePd")
	public String comparePd(String password, HttpServletRequest request, HttpServletResponse response) throws IOException{

		User user = new User();
		int user_id = ((User)request.getSession().getAttribute("User")).getUser_id();
		user.setUser_id(user_id);
		user.setPassword(password);
		if(userService.comparePd(user) == true){
			response.getWriter().write(1);
			return null;	
		}
		response.getWriter().write(0);
		return "/error";
	}
	/**
	 * 跳转到上传头像界面
	 * @param request
	 * @return 
	 */
	@RequestMapping("/toUploadImage")
	public String toUploadImage1() {
		return "/user_uploadImage";
	}
	/**
	 * 上传头像
	 * @param request
	 * @param file
	 * @return 
	 */
	@RequestMapping("/uploadImage")
	public String uploadImage1(MultipartFile file, HttpServletRequest request) throws IOException {
		String realPath = "D:/apache-tomcat-7.0.42/webapps/tccp/upload/uploadImages/";
		int user_id = ((User)request.getSession().getAttribute("User")).getUser_id();
		file.transferTo(new File(realPath+user_id+file.getOriginalFilename()));
		System.out.println(file.getOriginalFilename());
		String image = file.getOriginalFilename();
		User user = new User();
		user.setImage(image);
		user.setUser_id(user_id);
		if(userService.updateImage(user) == true){
			request.setAttribute("image", image);
			return "/success";
		}
		else {
			return "/error";
		}
	}
	
	/**
	 * 获取所有用户信息的Json串
	 * @param request
	 * @return Json
	 */
	@ResponseBody
	@RequestMapping("/getAllUsers")
	public List<User_List> getAllUsers() {
		return userService.getAllUsers();
	}
	
	
	
//************************************测试参考方法*************************************************************************
//************************************测试参考方法*************************************************************************
//************************************测试参考方法*************************************************************************
//************************************测试参考方法*************************************************************************
	/**
	 * 获取所有用户列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getAllUser")
	public String getAllUser(HttpServletRequest request){
		
		List<testUser> findAll = userService.findAll();
		
		request.setAttribute("userList", findAll);
		return "/test_allUser";
	}
	/**
	 * 跳转到json测试界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toTestJson")
	public String toTestJson(HttpServletRequest request){
		
		return "/test_testJson";
	}
	/**
	 * json测试界面
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/testJson")
	public testUser testJson(HttpServletRequest request){
		testUser testUser = new testUser(1, "test", "男");
		return testUser;
	}
	/**
	 * 测试获取所有用户列表
	 * @param request
	 * @return String
	 * @throws IOException 
	 */
	@RequestMapping("/getAllUserTest")
	public String getAllUserTest(HttpServletRequest request, HttpServletResponse response) throws IOException{
		 return null;
	}	
	/**
	 * 跳转到添加用户界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toAddUser")
	public String toAddUser(HttpServletRequest request){
		
		return "/test_addUser";
	}
	/**
	 * 添加用户并重定向
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/addUser")
	public String addUser(testUser user,HttpServletRequest request){
		userService.add(user);
		return "redirect:/user/getAllUser";
	}
	/**
	 *编辑用户
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateUser")
	public String updateUser(testUser user,HttpServletRequest request){
		
		
		if(userService.update(user)){
			user = userService.findById(user.getUser_id());
			request.setAttribute("user", user);
			return "redirect:/user/getAllUser";
		}else{
			return "/error";
		}
	}
	/**
	 * 根据id查询单个用户
	 * @param user_id
	 * @param request
	 * @return
	 */
	@RequestMapping("/getUser")
	public String getUser(int user_id,HttpServletRequest request){
		
		request.setAttribute("user", userService.findById(user_id));
		return "/test_editUser";
	}
	/**
	 * 删除用户
	 * @param user_id
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delUser")
	public void delUser(int user_id,HttpServletRequest request,HttpServletResponse response){
		String result = "{\"result\":\"error\"}";
		
		if(userService.delete(user_id)){
			result = "{\"result\":\"success\"}";
		}
		
		response.setContentType("application/json");
		
		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	//********************************************************************************
}
