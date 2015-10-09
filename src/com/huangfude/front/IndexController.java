package com.huangfude.front;

import com.huangfude.admin.article.Article;
import com.huangfude.admin.article.Tags;
import com.jfinal.core.Controller;

/**
 * IndexController
 */
public class IndexController extends Controller {
	
	public void index() {
		setAttr("articlePage", Article.me.viewPaginate(getParaToInt(0, 1), 10, getParaToInt(1,0)));
		//当前目录id
		setAttr("curFolder_id",getParaToInt(1,0));
		setAttr("actionUrl","/");
		setAttr("urlParas","-"+getParaToInt(1,0));
		//标签
		setAttr("tagnamelist",Tags.me.getListForTagname());
		render("index.jsp");
	}
	
	public void search() {
		String keyword = getPara("keyword");
		int pageNumber = getParaToInt("no",1);
		setAttr("articlePage", Article.me.searchPaginate(pageNumber, 10, keyword));
		setAttr("actionUrl","/search?no=");
		setAttr("urlParas","&keyword="+keyword);
		//当前目录id
		setAttr("curFolder_id",0);
		//标签
		setAttr("tagnamelist",Tags.me.getListForTagname());
		render("index.jsp");
	}

	public void tag() {
		String tagname = getPara("tagname");
		int pageNumber = getParaToInt("no",1);
		setAttr("articlePage", Article.me.tagPaginate(pageNumber, 10, tagname));
		setAttr("actionUrl","/tag?no=");
		setAttr("urlParas","&tagname="+tagname);
		//当前目录id
		setAttr("curFolder_id",0);
		//标签
		setAttr("tagnamelist",Tags.me.getListForTagname());
		render("index.jsp");
	}
}





