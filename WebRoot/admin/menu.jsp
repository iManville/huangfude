<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

 <div class="template-page-wrapper">
      <div class="navbar-collapse collapse templatemo-sidebar">
        <ul class="templatemo-sidebar-menu">
          <li>
            <form class="navbar-form">
              <input type="text" class="form-control" id="templatemo_search_box" placeholder="Search...">
              <span class="btn btn-default">Go</span>
            </form>
          </li>

          <li class="sub open">
            <a href="javascript:;">
              <i class="fa fa-database"></i> 常用菜单 <div class="pull-right"><span class="caret"></span></div>
            </a>
            <ul class="templatemo-submenu">
              <li class="active"><a href="/admin/article">文章管理</a></li>
              <li><a href="/admin/folder">目录管理</a></li>
              <li><a href="#">标签管理</a></li>
            </ul>
          </li>
          <li><a href="data-visualization.html"><i class="fa fa-cubes"></i><span class="badge pull-right">9</span>数据字典</a></li>
          <li><a href="tables.html"><i class="fa fa-users"></i><span class="badge pull-right">NEW</span>会员管理</a></li>
          <li><a href="preferences.html"><i class="fa fa-cog"></i>系统设置</a></li>
          <li><a href="javascript:;" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>退出</a></li>
        </ul>
      </div><!--/.navbar-collapse -->
