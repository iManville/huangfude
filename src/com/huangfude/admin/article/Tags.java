package com.huangfude.admin.article;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

/**
 * Tags model.

将表结构放在此，消除记忆负担
mysql> desc tags;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int(11)      | NO   | PRI | NULL    | auto_increment |
| article_id  | int(11)      | YES  |     | NULL    |                |
| tagname     | varchar(200) | YES  |     |         |                |
| create_time | varchar(64)  | YES  |     | NULL    |                |
| create_id   | int(11)      | YES  |     | 0       |                |
+-------------+--------------+------+-----+---------+----------------+

数据库字段名建议使用驼峰命名规则，便于与 java 代码保持一致，如字段名： userId
 */
@SuppressWarnings("serial")
public class Tags extends Model<Tags> {
	public static final Tags me = new Tags();
	
	/**
	 * 获取列表
	 */
	public List<Tags> getListByArticleId(int article_id){
		String sql = "select * from tags where article_id=" + article_id;
		return (List<Tags>)Tags.me.find(sql);
	}
	
}
