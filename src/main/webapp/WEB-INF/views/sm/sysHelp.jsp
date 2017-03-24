<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %> 
<style>
 	.mypanel{
 		width:100%;
 		background:#E0ECFF; 
 		margin-bottom:20px;
 	}
 	
 	.mypanel-header{
 		border-bottom:solid 2px #278DCF;
 		font-family:"微软雅黑";
 		font-weight:800;
 		color:#278DCF;
 		font-size:17px;
 		padding:10px;
 	}
 	
 	.mypanel-body{
 		font-size:15px;
 		padding:5px;
 		color:black;
 	} 	
 	
 	.demoimg{
 		width:80%;
 		height:500px; 
 		display:block;
 		margin:0 auto; 
 	}
</style>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
    	<div class="mypanel">
	   		<div class="mypanel-header">
	   			<span><img src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.5/themes/icons/tag_red.png"/>联系开发者</span>
	   		</div>
	   		<div class="mypanel-body">
	   			<table>
	   				<tr>
	   					<td><img src="<%=request.getContextPath()%>/img/author.png" style="width:110px;height:150px;"/></td>
	   					<td>
	   						<div style="padding-left:20px;width:800px;display:inline-block;"> 
				   				姓名:陈鹏<br/>
				   				毕业院校：徐州工程学院  信电工程学院<br/>
				   				手机：13961826751<br/>
				   				邮箱：dntchenpeng@163.com<br/>
				   				专业兴趣：热爱web，有扎实的前端知识储备和java基础，擅长web前端、微信公众号和微信小程序的开发，熟悉并使用过java开源框架：Spring、Hibernate、Struts2、SpringMVC、MyBatis等。	
				   				热衷于实践，自学并研究过React.js,Python以及Linux。			   
				   			</div>
	   					</td>
	   				</tr>
	   			</table> 		
	   		</div>
	   </div>
	   <div class="mypanel">
	   		<div class="mypanel-header">
	   			<span><img src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.5/themes/icons/tag_red.png"/>系统运用背景</span>
	   		</div>
	   		<div class="mypanel-body">
	   			<p>
	   				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随着我国改革开放的不断深入，汽车工业有着空前的发展，尤其是近几年来，汽车的数量在不断的增加。有相关调查数据显示
					从上个世纪78年的136万辆到2003年多达2000万余俩，前后增加了多达14.6倍。而且未来还将保持长足增长的趋势。
	   			</p>
	   			<p>
	   				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;汽车数量增长为汽修行业的发展打下了坚实的基础，汽车维修中的巨大商机吸引了越来越多的人参与到汽修行业。
					大小规模的汽车维修厂也如雨后春笋般的涌现。在这个机遇与挑战并存的时间段上，他们也面临着来自同行业之间的竞争和客户提出的新要求，
					按照传统的汽车维修的管理模式，复杂的业务流程，加上庞大的数据量，通过人工很难做到科学和规范化的去管理汽车维修厂，
					所以迫切需要一个汽车维修管理软件来支撑汽修厂的高效运营。
	   			</p>    			
	   		</div>
	   </div>
	   <div class="mypanel">
	   		<div class="mypanel-header">
	   			<span><img src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.5/themes/icons/tag_red.png"/>系统主要功能介绍</span>
	   		</div>
	   		<div class="mypanel-body">
	   			<p>
	   				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					系统作为汽车修理厂后台管理系统，需要支撑维修厂日常高效的运行，整个软件功能着重分为汽车维修管理、配件管理、财务管理、基础数据管理以及系统的维护。其主要解决的问题有：
  					
  					<br/>
  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					（1）车辆接待：系统需要实现添加来访者以及其车辆的信息，需要进行开单操作，同时为维修单分配维修人员和质检人员。
					<br/>
  					<img src="<%=request.getContextPath()%>/img/cljd.png" class="demoimg"/>
					<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					（2）维修项目登记：维修人员登录系统能够看到自己当前所有的维修任务，进行维修检查，系统需要纪录维修人员填写的维修项目以及工时和维修领料的情况。
					<br/>
  					<img src="<%=request.getContextPath()%>/img/wxxmdj.png" class="demoimg"/>
					<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					（3）维修领料：按照维修人员的相关信息和时间范围的条件,查询用户维修用料登记的情况，可以查看每一项登记的领取历史，对于材料库存不够的情况,需要进行材料采购的申请。
					<br/>
  					<img src="<%=request.getContextPath()%>/img/wxll.png" class="demoimg"/>
					<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					（4）质检完工：质检员查看自己的质检任务，进行质检，录入质检结果到系统中。
					<br/>
  					<img src="<%=request.getContextPath()%>/img/zjwg.png" class="demoimg"/>
					<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					（5）消费结算：车主在约定的时间进行提车，查看维修单，进行付款操作。
					<br/>
  					<img src="<%=request.getContextPath()%>/img/xfjs.png" class="demoimg"/>
					<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					（6）配件管理：管理配件的信息，采购相关的配件，录入信息到系统中。
					<br/>
  					<img src="<%=request.getContextPath()%>/img/pjgl.png" class="demoimg"/>
					<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					（7）基础数据管理：对系统的一些参数进行配置，管理系统的一些基础的数据，个人信息的查看以及密码修改等相关功能的实现。
					<br/>
  					<img src="<%=request.getContextPath()%>/img/jcsj.png" class="demoimg"/>
					<br/> 
	   			</p> 	
	   		</div>
	   </div> 
	</div>
    <div region="south" style="height:10px;" border="false"></div>
</div> 
</body>
</html>