package com.huangfude.admin.article;

import java.util.ArrayList;
import java.util.List;

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
		
		return paginate(pageNumber, pageSize, "select *", "from article order by id desc");
	}
	/**
	 * 用于前台，显示截取内容
	 */
	public Page<Article> viewPaginate(int pageNumber, int pageSize, int folder_id) {
		String sql = "from article order by id desc";
		if(folder_id>0){
			sql = "from article where folder_id = " +folder_id+ " order by id desc";
		}
		Page<Article> page = paginate(pageNumber, pageSize, "select *", sql);
		return removeHtml(page);
	}
	/**
	 * 文章搜索
	 */
	public Page<Article> searchPaginate(int pageNumber, int pageSize, String keyword) {
		String sql = "from article order by id desc";
		if(keyword!=""){
			sql = "from article where title like '%" +keyword+ "%' or content like '%"+keyword+"%' order by id desc";
		}
		Page<Article> page = paginate(pageNumber, pageSize, "select *", sql);
		return removeHtml(page);
	}
	/**
	 * 根据标签名获取文章列表
	 */
	public Page<Article> tagPaginate(int pageNumber, int pageSize, String tagname) {
		String sql =  "from article where id in (select article_id from tags where tagname=?)";
		Page<Article> page = paginate(pageNumber, pageSize, "select *", sql,tagname);
		return removeHtml(page);
	}	
	/**
	 * 去除文章HTML格式
	 */
	public Page<Article> removeHtml(Page<Article> page){
		List<Article> articleList = new ArrayList<Article>();
		for (Article article : page.getList()){
			String content = article.get("content");
			//removeHTML
			article.set("content", content.replaceAll("<[^>]*>", " "));
			articleList.add(article);
		}
		return new Page<Article>(articleList,page.getPageNumber(),page.getPageSize(),page.getTotalPage(),page.getTotalRow());
	}

	/**
	 * 上一篇
	 */
	public Article getLastArticle(int article_id, int folder_id) {
		String sql = "select * from article where id = (select max(id) from article where id < ? and folder_id = ?)";
		return (Article)Article.me.findFirst(sql,new Object[]{article_id,folder_id});
	}

	/**
	 * 下一篇
	 */
	public Article getNextArticle(int article_id, int folder_id) {
		String sql = "select * from article where id = (select min(id) from article where id > ? and folder_id = ?)";
		return (Article)Article.me.findFirst(sql,new Object[]{article_id,folder_id});
	}
	
}
