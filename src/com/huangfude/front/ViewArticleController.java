package com.huangfude.front;

import com.huangfude.admin.article.Article;
import com.jfinal.core.Controller;

/**
 * ViewArticleController
 */
public class ViewArticleController extends Controller {
	public void index() {
		setAttr("article", Article.me.findById(getParaToInt()));
		render("view_article.jsp");
	}
}





