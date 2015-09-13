package com.huangfude.admin.article;

import java.util.Date;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * BlogController
 * 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(ArticleInterceptor.class)
public class ArticleController extends Controller {
	
	java.text.DateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
	
	public void index() {
		setAttr("articlePage", Article.me.paginate(getParaToInt(0, 1), 10));
		render("article.jsp");
	}
	
	public void add() {
	}
	
	@Before(ArticleValidator.class)
	public void save() {
		Article article = getModel(Article.class);
		article.set("folder_id", getParaToInt("folder_id"));
		article.set("title", getPara("title"));
		article.set("content", getPara("content"));
		article.set("publish_time", format.format(new Date()));
		
		article.save();
		redirect("/admin/article");
	}
	
	public void edit() {
		setAttr("article", Article.me.findById(getParaToInt()));
	}
	
	@Before(ArticleValidator.class)
	public void update() {
		Article article = getModel(Article.class);
		article.set("id", getParaToInt("id"));
		article.set("folder_id", getParaToInt("folder_id"));
		article.set("title", getPara("title"));
		article.set("content", getPara("content"));
		
		article.update();
		redirect("/admin/artcile");
	}
	
	public void delete() {
		Article.me.deleteById(getParaToInt());
		redirect("/blog");
	}
}


