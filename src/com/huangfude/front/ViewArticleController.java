package com.huangfude.front;

import com.huangfude.admin.article.Article;
import com.huangfude.admin.article.Tags;
import com.jfinal.core.Controller;

/**
 * ViewArticleController
 */
public class ViewArticleController extends Controller {
	public void index() {
		int articleId = getParaToInt();
		Article article = (Article)Article.me.findById(articleId);
		Article lastArticle = Article.me.getLastArticle(articleId,article.getInt("folder_id"));
		Article nextArticle = Article.me.getNextArticle(articleId,article.getInt("folder_id"));
		setAttr("article", article);
		setAttr("curFolder_id", article.getInt("folder_id"));
		setAttr("last_id",lastArticle==null?"":lastArticle.getInt("id"));
		setAttr("last_title",lastArticle==null?"":lastArticle.getStr("title"));
		setAttr("next_id",nextArticle==null?"":nextArticle.getInt("id"));
		setAttr("next_title",nextArticle==null?"":nextArticle.getStr("title"));

		String tagsname = Tags.me.getTagsname(articleId);
		setAttr("tagsname",tagsname==null?"":tagsname);

		setAttr("tagnamelist",Tags.me.getListForTagname());
		render("view_article.jsp");
	}
}





