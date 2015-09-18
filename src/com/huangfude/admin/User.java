package com.huangfude.admin;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;


/**
 * User model.

将表结构放在此，消除记忆负担
mysql> desc user;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id          | int(11)     | NO   | PRI | NULL    | auto_increment |
| username    | varchar(32) | YES  |     |         |                |
| password    | varchar(32) | YES  |     |         |                |
| name        | varchar(32) | YES  |     |         |                |
| create_time | varchar(64) | YES  |     | NULL    |                |
| create_id   | int(11)     | YES  |     | 0       |                |
+-------------+-------------+------+-----+---------+----------------+
数据库字段名建议使用驼峰命名规则，便于与 java 代码保持一致，如字段名： userId
 */
@SuppressWarnings("serial")
public class User extends Model<User> {
	public static final User me = new User();
	
	/**
	 * 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
	 */
	public Page<User> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from user order by id desc");
	}

	/**
	 * 登陆验证
	 *
	 */
	public User userLogin(String username,String password){
		String sql = "select * from user where username=? and password=?";
		User user = User.me.findFirst(sql, new Object[]{username,password});
		return user;

	}

}
