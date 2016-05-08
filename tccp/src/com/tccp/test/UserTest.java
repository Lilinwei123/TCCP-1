package com.tccp.test;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tccp.persistence.UserMapper;
import com.tccp.entity.User;
import com.tccp.entity.User_List;
import com.tccp.entity.testUser;
/**
 * 用户数据库操作测试
 * @author TCCP项目组
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/config/spring-common.xml")
public class UserTest {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private com.tccp.persistence.UserPersistence test;
	
	//测试登录
	@Test
	public void testSelectByUP(){
		User user = new User();	
		user.setUsername("测试用户名3");
		user.setPassword("123456");
		System.out.println("用户名：" + test.selectByUP(user).getUsername() + "\n用户ID:" + test.selectByUP(user).getUser_id()+ "\n用户类型:" + test.selectByUP(user).getPriority());
	}
	//测试查询密码
	@Test
	public void testSelectPd(){
		int user_id = 2;
		System.out.println(test.selectPd(user_id));
	}
	//测试比对密码
		@Test
		public void testComparePd(){
			User user = new User();
			user.setUser_id(2);
			user.setPassword("123456");
			System.out.println(test.comparePd(user));
		}
	//测试修改密码
	@Test
	public void testUpdatePd(){
		User user = new User();
		user.setUser_id(1);
		user.setPassword("666666");
		System.out.println(test.updatePd(user));
	}
	//测试查询所有用户信息
	@Test
	public void testSelectAllUser(){
		List<User_List> result = test.selectAllUsers();
		for (User_List user: result) {
			System.out.println(user.toString());
		}
	}
	//测试根据用户ID查询信息
	@Test
	public void testSelectById(){
		System.out.println(test.selectById(2).toString());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = test.selectById(2).getBirthday();
		System.out.println("\n日期格式测试：" + sdf.format(date));
	}
	//测试更新用户头像
	@Test
	public void testUpdateImage(){
		User user = new User();
		user.setImage("logo.png");
		user.setUser_id(6);
		System.out.println(test.updateImage(user));
	}
	//测试更新用户信息
	@Test
	public void testUpdateUserInfo(){
		User user = new User();
		user.setUser_id(6);
		user.setGroups("大数据组");
	//	user.setGroup(2);
		System.out.println("更新测试：" + test.updateUserInfo(user));
	}
	

	
	
	
	
	
	
	
//********************************测试框架用*************************************************//
	/**
	 * 框架测试
	 * @author TCCP项目组
	 **/
	@Test
	public void testAdd(){
		testUser user = new testUser(4, "王五", "33");
		userMapper.add(user);
	}
	@Test
	public void testFindAll(){
		List<testUser> findAllList = userMapper.findAll();
		System.out.println(findAllList.size());
	}
	@Test
	public void testFindAll2(){
		List<testUser> findAllList = userMapper.findAll2();
		System.out.println(findAllList.size());
	}
	@Test
	public void testFindById(){
		testUser user = userMapper.findById(2);
		System.out.println(user.getUser_id());
		System.out.println(user.getUsername());
	}
	@Test
	public void testUpdate(){	
		testUser user = new testUser(5, "钱6", "24");
		userMapper.update(user);
	}
	@Test
	public void testDelete(){
		userMapper.delete(6);
	}
	@Test
	public void testTest(){
		testUser user =userMapper.userMap(2);
		System.out.println(user.toString());
	}
}
