package com.huangfude.admin.article;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * Article model.

将表结构放在此，消除记忆负担
mysql> desc article;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| id            | int(11)      | NO   | PRI | NULL    | auto_increment |
| folder_id     | int(11)      | YES  |     | 1       |                |
| title         | varchar(200) | YES  |     |         |                |
| content       | text         | YES  |     | NULL    |                |
| count_view    | int(11)      | YES  |     | 0       |                |
| count_comment | int(11)      | YES  |     | 0       |                |
| type          | int(11)      | YES  |     | 1       |                |
| status        | varchar(20)  | YES  |     | 1       |                |
| is_comment    | varchar(20)  | YES  |     | 1       |                |
| sort          | int(11)      | YES  |     | 1       |                |
| image_url     | varchar(256) | YES  |     | NULL    |                |
| publish_time  | varchar(64)  | YES  |     | NULL    |                |
| publish_user  | varchar(64)  | YES  |     | 1       |                |
| update_time   | varchar(64)  | YES  |     | NULL    |                |
| create_time   | varchar(64)  | YES  |     | NULL    |                |
| create_id     | int(11)      | YES  |     | 0       |                |
+---------------+--------------+------+-----+---------+----------------+

数据库字段名建议使用驼峰命名规则，便于与 java 代码保持一致，如字段名： userId
 */
@SuppressWarnings("serial")
public class Article extends Model<Article> {
	public static final Article me = new Article();
	
	/**
	 * 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
	 */
	public Page<Article> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from article order by id asc");
	}
}
