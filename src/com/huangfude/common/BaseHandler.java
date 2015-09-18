package com.huangfude.common;

import com.jfinal.handler.Handler;

import javax.servlet.http.*;



public class BaseHandler extends Handler {

	@Override
	public void handle(String target, HttpServletRequest request,HttpServletResponse response, boolean[] isHandled) {

		//如果路径中包含admin(该路径下所有资源),那么验证身份,通过验证才能进入后台管理模块
		if(target.indexOf("admin")>0){
			HttpSession session = request.getSession(false);
			if(session==null||session.getAttribute("user")==null){
				//验证不成功，跳转到后台登陆页面
				target="/admin";
			}
		}
		nextHandler.handle(target, request, response, isHandled);
	}

}
