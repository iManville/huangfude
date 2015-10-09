package com.huangfude.admin.article;

import java.util.Date;
import java.util.List;

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
		article.set("status",getParaToInt("status"));
		article.set("type", getParaToInt("type"));
		article.set("publish_time", format.format(new Date()));
		
		article.save();
		saveTags(article.getInt("id"),getPara("tagsname"));
		redirect("/admin/article");
	}
	
	public void edit() {
		setAttr("article", Article.me.findById(getParaToInt()));
		//整合标签	
		/*
		String tagsname = "";
		List<Tags> taglist = Tags.me.getListByArticleId(getParaToInt());
		for (Tags tag : taglist) {
			tagsname += tag.get("tagname") + ",";
		}
		if(tagsname.indexOf(",")>-1){
			tagsname = tagsname.substring(0,tagsname.lastIndexOf(","));
		}
		*/
		String tagsname = Tags.me.getTagsname(getParaToInt());
		setAttr("tagsname", tagsname);
	}
	
	@Before(ArticleValidator.class)
	public void update() {
		Article article = getModel(Article.class);
		article.set("id", getParaToInt("id"));
		article.set("folder_id", getParaToInt("folder_id"));
		article.set("title", getPara("title"));
		article.set("content", getPara("content"));
		article.set("status",getParaToInt("status"));
		article.set("type", getParaToInt("type"));
		article.set("update_time", format.format(new Date()));
		
		article.update();
		saveTags(article.getInt("id"),getPara("tagsname"));
		redirect("/admin/article");
	}
	
	public void delete() {
		Article.me.deleteById(getParaToInt());
		Tags.me.deleteByArticleId(getParaToInt());
		redirect("/admin/article");
	}

	/*
	 *保存标签
	 */
	public void saveTags(int article_id, String tagsname){
		//删除原有标签
		Tags.me.deleteByArticleId(article_id);
		//保存新标签
		if(tagsname.indexOf(",")>-1){
			String[] tagnames = tagsname.split(",");
			for(int i=0;i<tagnames.length;i++){
				Tags tags = new Tags();
				tags.set("tagname",tagnames[i]);
				tags.set("article_id",article_id);
				tags.save();
			}	
		} else {
			Tags tags = new Tags();
			tags.set("tagname",tagsname);
			tags.set("article_id",article_id);
			tags.save();
		}
	}

}


