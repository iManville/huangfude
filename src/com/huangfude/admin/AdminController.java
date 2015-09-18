package com.huangfude.admin;

import com.jfinal.core.Controller;

/**
 * AdminController
 */
public class AdminController extends Controller {
	public void index() {
		render("login.jsp");
	}
	
	public void login(){
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

