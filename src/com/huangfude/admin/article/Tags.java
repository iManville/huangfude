package com.huangfude.admin.article;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Db;

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
	 * 获取所有列表
	 */
	public List getListForTagname(){
		String sql = "select tagname,count(tagname) count from tags group by tagname";
		return Db.query(sql);
	}

	/**
	 * 根据article_id获取列表
	 */
	public List<Tags> getListByArticleId(int article_id){
		String sql = "select * from tags where article_id = ?";
		return (List<Tags>)Tags.me.find(sql, article_id);
	}
	/**
	 * 标签名
	 */
	public String getTagsname(int article_id){
		String tagsname = "";
		List<Tags> taglist = getListByArticleId(article_id);
		for (Tags tag : taglist) {
			tagsname += tag.get("tagname") + ",";
		}
		if(tagsname.indexOf(",")>-1){
			tagsname = tagsname.substring(0,tagsname.lastIndexOf(","));
		}
		return tagsname;

	}

	/*
	 * 删除标签
	 */
	public void deleteByArticleId(int article_id){
		String sql = "delete from tags where article_id = ?";
		Db.update(sql,article_id);
	}	
}
