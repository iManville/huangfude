package com.huangfude.admin.folder;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * FolderValidator.
 */
public class FolderValidator extends Validator {
	
	protected void validate(Controller controller) {
		validateRequiredString("name", "nameMsg", "请输入名称!");
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Folder.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/admin/folder/save"))
			controller.render("add.jsp");
		else if (actionKey.equals("/admin/folder/update"))
			controller.render("edit.jsp");
	}
}
