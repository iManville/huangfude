package com.huangfude.front;

import com.huangfude.admin.article.Article;
import com.jfinal.core.Controller;

/**
 * ViewArticleController
 */
public class ViewArticleController extends Controller {
	public void index() {
		Article article = (Article)Article.me.findById(getParaToInt());
		Article lastArticle = Article.me.getLastArticle(article.getInt("id"),article.getInt("folder_id"));
		Article nextArticle = Article.me.getNextArticle(article.getInt("id"),article.getInt("folder_id"));
		setAttr("article", article);
		setAttr("last_id",lastArticle==null?"":lastArticle.getInt("id"));
		setAttr("last_title",lastArticle==null?"":lastArticle.getStr("title"));
		setAttr("next_id",nextArticle==null?"":nextArticle.getInt("id"));
		setAttr("next_title",nextArticle==null?"":nextArticle.getStr("title"));
		render("view_article.jsp");
	}
}





