package com.huangfude.admin.folder;

import java.util.Date;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * BlogController
 * 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(FolderInterceptor.class)
public class FolderController extends Controller {
	
	java.text.DateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
	
	public void index() {
		setAttr("folderList", Folder.me.getList());
		render("folder.jsp");
	}
	
	public void add() {
	}
	
	@Before(FolderValidator.class)
	public void save() {
		Folder folder = getModel(Folder.class);
		folder.set("name", getPara("name"));
		folder.set("create_time", format.format(new Date()));
		
		folder.save();
		redirect("/admin/folder");
	}
	
	public void edit() {
		setAttr("folder", Folder.me.findById(getParaToInt()));
	}
	
	@Before(FolderValidator.class)
	public void update() {
		Folder folder = getModel(Folder.class);
		folder.set("id", getParaToInt("id"));
		folder.set("name", getPara("name"));
		folder.set("update_time", format.format(new Date()));
		
		folder.update();
		redirect("/admin/folder");
	}
	
	public void delete() {
		Folder.me.deleteById(getParaToInt());
		redirect("/admin/folder");
	}
}


