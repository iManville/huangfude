package com.huangfude.admin.folder;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Folder model.

将表结构放在此，消除记忆负担
mysql> desc folder;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int(11)      | NO   | PRI | NULL    | auto_increment |
| name        | varchar(100) | NO   |     |         |                |
| path        | varchar(200) | NO   |     |         |                |
| content     | text         | YES  |     | NULL    |                |
| sort        | int(11)      | YES  |     | 1       |                |
| status      | varchar(20)  | YES  |     | 1       |                |
| type        | int(11)      | YES  |     | 1       |                |
| update_time | varchar(64)  | YES  |     | NULL    |                |
| create_time | varchar(64)  | YES  |     | NULL    |                |
| create_id   | int(11)      | YES  |     | 0       |                |
+-------------+--------------+------+-----+---------+----------------+

数据库字段名建议使用驼峰命名规则，便于与 java 代码保持一致，如字段名： userId
 */
@SuppressWarnings("serial")
public class Folder extends Model<Folder> {
	public static final Folder me = new Folder();
	
	/**
	 * 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
	 */
	public Page<Folder> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from folder order by id asc");
	}

	/**
	 * 获取目录列表
	 */
	public List<Folder> getList(){
		return (List<Folder>)Folder.me.find("select * from folder order by id asc");
	}
}
