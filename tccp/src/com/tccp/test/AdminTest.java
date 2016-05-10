package com.tccp.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tccp.entity.User;
import com.tccp.persistence.AdminPersistence;
/**
 * 管理员数据库操作测试
 * @author TCCP项目组
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/config/spring-common.xml")
public class AdminTest {
	@Autowired
	private AdminPersistence adminPersistence;
	//测试增加用户
	@Test
	public void testAddUser()
	{
		User user = new User();
		String username = "测试用户名5";
		user.setUsername(username);
		user.setSex(1);
		user.setGroups("大数据组");
		user.setPhonenum("18829291491");
		System.out.println(adminPersistence.addUser(user));		
	}
	
	//测试权限移交
	@Test
	public void testMoveUserToAdmin(){
		System.out.println(adminPersistence.moveUserToAdmin(3));	
	}
	//测试删除用户ById
	@Test
	public void testDeleteUserById()
	{
		int user_id = 3;
		System.out.println(adminPersistence.deleteUserById(user_id));		
	}
	//测试删除用户ByName
		@Test
		public void testDeleteUserByName()
		{
			String username = "测试用户名3";
			System.out.println(adminPersistence.deleteUserByName(username));		
		}
	//测试添加管理员
	@Test
	public void testAddAdmin()
	{
		String username = "测试管理员";
		System.out.println(adminPersistence.addAdmin(username));
	}
	//测试根据用户ID查询用户信息
	@Test
	public void testSelectUser(){
		int user_id = 5;
		User user = new User();
		user = adminPersistence.selectUser(user_id);
		System.out.println(user.toString());	
	}
	//测试查询所有用户信息
	@Test
	public void testSelectAllUser(){
		List<User> list = adminPersistence.selectAllUser();
		System.out.println(list.size());
	}
	//测试更新用户信息
	@Test
	public void testUpdateUser(){
		java.sql.Date date1;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date uDate = new Date();
		System.out.println(sdf.format(uDate));
		date1 = new java.sql.Date(uDate.getTime());
		User user = new User(6, "", "", 1, "18829291325", "1234@163.com", "666666666", "傲雪苍狼的博客", "https://test", "大四", "通工", date1, "西安邮电大学", "学生", 0, "", "技术改变人生，奋斗共享价值！","大数据组");
		System.out.println("更新测试：" + adminPersistence.updateUser(user));
	}
}
