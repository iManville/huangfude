package com.huangfude.front;

import com.huangfude.admin.article.Article;
import com.jfinal.core.Controller;

/**
 * IndexController
 */
public class IndexController extends Controller {
	public void index() {
		setAttr("articlePage", Article.me.viewPaginate(getParaToInt(0, 1), 10, getParaToInt(1,0)));
		//当前目录id
		setAttr("curFolder_id",getParaToInt(1,0));
		render("index.jsp");
	}
}





