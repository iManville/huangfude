package com.huangfude.admin.article;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * ArticleValidator.
 */
public class ArticleValidator extends Validator {
	
	protected void validate(Controller controller) {
		validateRequiredString("title", "titleMsg", "请输入文章标题!");
		validateRequiredString("content", "contentMsg", "请输入文章内容!");
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Article.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/admin/article/save"))
			controller.render("add.jsp");
		else if (actionKey.equals("/admin/article/update"))
			controller.render("edit.jsp");
	}
}
