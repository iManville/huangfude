package com.huangfude.front;

import com.huangfude.admin.article.Article;
import com.jfinal.core.Controller;

/**
 * IndexController
 */
public class IndexController extends Controller {
	public void index() {
		setAttr("articlePage", Article.me.viewPaginate(getParaToInt(0, 1), 10));
		render("index.jsp");
	}
}





