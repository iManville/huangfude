package com.huangfude.admin;

import com.jfinal.core.Controller;

/**
 * LoginController
 */
public class LoginController extends Controller {
	
	public void index() {
		String username = getPara("username");
		String password = getPara("password");
		User user = User.me.userLogin(username,password);
		if (user != null) {
			setSessionAttr("user",user);
			render("index.jsp");
		} else {
			render("login.jsp");
		}
	}
}

