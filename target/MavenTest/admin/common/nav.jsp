<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          
          <ul class="nav nav-sidebar">
            <li class="active">
              <a href="admin/index.jsp" class="nav-header menu-first collapsed">
              <i class="glyphicon glyphicon-home icon"></i>
               首页
              </a>
            </li>
            <li>
              <a href="aUser/userlist.do" class="nav-header menu-first collapsed">
                <i class="glyphicon glyphicon-user icon"></i>
                用户列表
              </a>
            </li>
            <li>
              <a href="#physicalMenu" class="nav-header menu-first collapsed" data-toggle="collapse">
                <i class="icon iconfont">&#xe621;</i>
                体检管理
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              </a>
              <ul id="physicalMenu" class="nav nav-list collapse menu-second">
                <li><a href="#">体检机构</a></li>
                <li><a href="#">体检套餐</a></li>
                <li><a href="#">体检项目</a></li>
              </ul>
            </li>
            <li>
              <a href="#articleMenu" class="nav-header menu-first collapsed" data-toggle="collapse">
                <i class="glyphicon glyphicon-certificate icon"></i>
                权限管理
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              </a>
              <ul id="articleMenu" class="nav nav-list collapse menu-second">
                <li><a href="#">角色</a></li>
                <li><a href="#">权限</a></li>
                <li><a href="#">后台用户</a></li>
              </ul>
            </li>
            <li>
              <a href="#systemMenu" class="nav-header menu-first collapsed" data-toggle="collapse">
                <i class="glyphicon glyphicon-cog icon"></i>
                系统管理
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              </a>
              <ul id="systemMenu" class="nav nav-list collapse menu-second">
                <li><a href="#">查看日志</a></li>
                <li><a href="#">修改密码</a></li>
              </ul>
            </li>
            
            <li>
              <a href="#" class="nav-header menu-first collapsed">
                <i class="glyphicon glyphicon-off icon"></i>
            		注销
              </a>
            </li>
            
          </ul>

        </div>

