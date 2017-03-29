 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="public/nocache.jsp" %>
<%@include file="public/header.jsp" %>
 <style>
        .linka{
            color:white;
        }
        /*网页首部*/
        .header{
            height:80px;color:white;overflow:hidden;
            background:url(${pageContext.request.contextPath}/img/banner-jkrz.jpg)
        }

        .menuItem li{
            width:140px;
            height:30px;
            margin-top:10px;
        }

        /* 改写tree node 的样式*/
        .tree-node{
            height:18px;
            padding-top:8px;
            line-height: 18px;
            margin-top:5px;
            font-size:17px;
            padding-left:5px;
            padding-bottom:6px;
            border:solid 1px #e6e6e6;
        }

        .border-orange{
            border:solid 1px orange;
            color: #4766ff;
        }

        .tr{
            padding:8px;
        }
    </style>
</head>
<body class="easyui-layout" fit="true">
<!-- 网站首部 -->
<div region="north" class="header" border="false">
    <span style="display:inline-block;float:left;width:120px;">
        <img src="${pageContext.request.contextPath}/img/banner-jkrzbg.png" style="width:150px;height:110px;margin-top: -5px;"/>
    </span>
    <div style="float:left;width:290px;">
         <p style="color:white;font-family:'微软雅黑';margin-top:18px;">
            <span style="font-size:21px;font-weight: 800;">汽车维修管理系统</span>
            <br>
            <span style="font-size:9px;"><i>Vehicle Maintenance Management System</i></span>
        </p>
    </div>
    <div>

    </div>
    <div style="float:right;color:white;font-size:13px;width:180px;height:40px;margin-top:38px;line-height: 40px;">
         欢迎&nbsp;<span style="font-weight:700;">${loginbean.username}</span>&nbsp;&nbsp;
        &nbsp;&nbsp;<a href="#" class="linka" onclick="exit();">退出系统</a>
    </div>
</div>
<!-- 菜单面板 -->
<div region="west" style="width:250px;" split="true" title="功能菜单" iconCls="icon-application_view_icons">
	<!-- 菜单面板内容开始 -->
    <div id="aa" class="easyui-accordion" fit="true" border="false" class="menuItem">
       <%--使用jstl标签进行遍历 --%>
       <c:forEach items="${allprivilege.elements}" var="item">
       		 <div title="&nbsp;&nbsp;&nbsp;&nbsp;${item.title}">
            <ul class="easyui-tree tr" data-options="data:${fn:replace(item.dataJSON,'\"','\'')}">
            </ul>
        </div>
       </c:forEach>
    </div>
    <!-- 菜单面板内容结束 -->
</div>
<!-- 主要内容 -->
<div region="center"  border="false">
    <div class="easyui-tabs" fit="true" id="tt">
        <div title="首页" data-options="iconCls:'icon-application_home'">
			<iframe  style="width:100%;height:100%;border:none;" src="<%=request.getContextPath()%>/index/dis.html?url=/fm/reportStatistics.jsp"></iframe>
        </div>
    </div>
</div>
<!-- 版权部分 -->
<div region="south" style="text-align: center;height:40px;
background:url(${pageContext.request.contextPath}/img/banner-jkrz.jpg);line-height: 40px;overflow:hidden;color:white;" border="false">
    版权所有:@汽车维修管理系统
</div>
<!-- 创建菜单 -->
<div id="mm" class="easyui-menu" style="width:120px;">
    <div id="closeCurrent" name="closeCurrent">关闭当前</div>
    <div id="closeOther" name="closeOther">关闭其他</div>
    <div id="closeAll" name="closeAll">关闭所有</div>
</div>
<script>

	/**
	*	退出登录
	**/
	function exit(){
		$.messager.confirm('确认', '你好,${loginbean.username}!你确定要退出系统登录吗?', function(r){
			if (r){
				window.location.href="${pageContext.request.contextPath}/users/${loginbean.accountnumber}/logout.html"
			}
		});
	}

    $(function(){
        // 改变tree的样式效果
        $(".tr").tree({ 
            onSelect:function(node){
                $(node.target).addClass("border-orange").parent().siblings().find("div").removeClass('border-orange');
                // 动态添加tab标签
                addTab(node.iconCls,node.text,node.attributes.url);
            },
        });


        // 动态添加标签
        function addTab(iconCls,title, url){
            if ($('#tt').tabs('exists', title)){
                $('#tt').tabs('select', title);
            } else {
                var content = '<iframe scrolling="auto"  frameborder="0"  src="${pageContext.request.contextPath}/index/dis.html?url='+url+'" style="width:100%;height:100%;margin-bottom:-3px;"></iframe>';
                $('#tt').tabs('add',{
                    title:title,
                    content:content,
                    closable:true,
                    iconCls:iconCls
                });
            }
        }

        // 绑定右键事件
        $("#tt").tabs({
            onContextMenu:function(e, title,index){
                e.preventDefault();
                console.log(e, title,index);
                // 选中标签
                $("#tt").tabs('select',index);
                // 显示右键菜单
                $("#mm").menu('show',{
                    left:e.pageX,
                    top:e.pageY
                });
                // 绑定点击事件
                $("#mm").menu({
                    onClick:function(item){
                        closeTab(this,item.name);
                    }
                });
            }
        });

        // 定义关闭标签的方法(第一个不能关闭)
        var closeTab = function(type,menuName){
            // 获取所有的tabs
            var $tabs = $("#tt").tabs("tabs");
            var length = $tabs.length;
            // 获取选中的tab
            var $selected = $("#tt").tabs('getSelected');
            var index = $("#tt").tabs('getTabIndex',$selected);
            // 执行关闭操作
            if(menuName=="closeCurrent"){// 关闭当前
                $("#tt").tabs('close',index);
            }else if(menuName=="closeOther"){// 关闭其他
                // 关闭之前
                for(var i = 0;i<index-1;i++){
                    $("#tt").tabs('close',1);
                }
                // 关闭之后
                for(var i=0;i<length-index-1;i++){
                    $("#tt").tabs('close',2);
                }
                // 设置选中
                $('#tt').tabs('select',1);
            }else if(menuName=="closeAll"){// 关闭所有
                for(var i = 0;i<length-1;i++){
                    $("#tt").tabs('close',1);
                }
            }
        }

    });
</script>
</body>
</html>