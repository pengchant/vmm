<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 左侧导航 -->
<nav style="width:180px;height:100%;position: fixed;left:0px;top:50px;z-index:200;background-color:#293038" id="left_nav">
    <!--左侧导航的具体内容部分-->
    <div class="navside">
        <ul class="nav_ul">
            <li style="text-align: center;" id="menu_control">
                <span class="fui-list" style="line-height: 40px;color:white;cursor:pointer;"></span>
            </li>
            <li>
                <a href="#">
                    <span class="span_down"></span>&nbsp;&nbsp;产品与服务 <span class="fright fui-gear  " title="自定义产品与服务"></span>
                </a>
                <ul class="nav_2_bar">
                    <li>
                        <a href="javascript:void(0);"><span class="glyphicon glyphicon-tasks"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;云服务器ECS</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);"><span class="glyphicon glyphicon-cloud-upload"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;云数据库</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);"><span class="glyphicon glyphicon-retweet"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负载均衡</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);"><span class="glyphicon glyphicon-hdd"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对象存储</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <span class="span_down"></span>&nbsp;&nbsp;用户中心<span class="fright fui-gear " title="个人信息管理"></span>
                </a>
                <ul class="nav_2_bar">
                    <li>
                        <a href="javascript:void(0);"><span class="fui-user"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;账号管理</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费用中心</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);"><span class="glyphicon glyphicon-usd"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;续费管理</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);"><span class="fui-mail"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消息中心</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);"><span class="fui-new"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工单管理</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>