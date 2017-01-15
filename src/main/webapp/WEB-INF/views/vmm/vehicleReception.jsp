<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery-easyui-1.4.5/jquery-easyui-texteditor/texteditor.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-easyui-1.4.5/jquery-easyui-texteditor/jquery.texteditor.js"></script>
<style type="text/css">

        .form_cont td{
            padding:5px;
            text-align: center;
        }

        .main_table{
            width:100%;
            height:100%;
            border:solid 1px #97b1ff;
            border-right:none;
            border-bottom:none;
        }


        .main_table td{
            border:solid 1px #97b1ff;
            border-top:none;
            border-left:none;
        }
    </style>
</head>
<body style="margin:0px;padding:0px;">
        <div class="easyui-panel" border="false"
             iconCls="icon-application" style="width:100%;padding:10px;">
            <div style="padding-top:5px;padding-bottom:10px;">
                <table style="width:100%;height:100%;">
                    <tr>
                        <td style="text-align: left;">
                            <label>请选择用户</label>
                            <!-- 如果不是首次登记 -->
                            <select prompt="请输入用户名/手机号/车牌号" id="cc" class="easyui-combogrid" name="dept"
                                    style="width:250px;height:30px;"
                                    data-options="
                panelWidth:450,
                idField:'code',
                textField:'name',
                url:'datagrid_data.json',
                columns:[[
                    {field:'id',title:'用户编号',width:60},
                    {field:'col4',title:'用户名',width:100},
                    {field:'name',title:'手机号',width:100},
                    {field:'addr',title:'车牌号',width:120}
                ]]
            "></select>
                        </td>
                        <td style="text-align: right;">
                            <a href="#" class="easyui-linkbutton" style="height:30px;" iconCls="icon-add">添加新用户</a>&nbsp;&nbsp;
                            <a href="#" class="easyui-linkbutton" style="height:30px;" iconCls="icon-building_error">暂存</a>&nbsp;&nbsp;
                            <a href="#" class="easyui-linkbutton" style="height:30px;" iconCls="icon-building_go">保存</a>
                        </td>
                    </tr>
                </table>

            </div>
            <div class="easyui-panel form_cont" border="false">
                <table class="main_table" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>用户名</td>
                        <td>
                            <input prompt="请输入用户名"  class="easyui-textbox" style="height:30px;">
                        </td>
                        <td>
                            电话
                        </td>
                        <td>
                            <input prompt="请输入电话" class="easyui-textbox" style="height:30px;">
                        </td>
                        <td>车牌号</td>
                        <td>
                            <select id="pn" class="easyui-combobox" name="dept" style="height:30px;width:150px;">
                                <option value="aa">aitem1</option>
                                <option>bitem2</option>
                                <option>bitem3</option>
                                <option>ditem4</option>
                                <option>eitem5</option>
                            </select>
                        </td>
                        <td>
                            车型
                        </td>
                        <td>
                            <input prompt="请输入车型" class="easyui-textbox" style="height:30px;">
                        </td>
                    </tr>
                    <tr>
                        <td >行驶里程数</td>
                        <td >
                            <input prompt="请输入行驶里程数" class="easyui-textbox" style="height:30px;">
                        </td>
                        <td >保险日期</td>
                        <td>
                            <input style="height:30px;" prompt="请选择保险日期" class="easyui-datebox" name="birthday"
                                   data-options="required:true,showSeconds:false" value="3/4/2010 2:3" style="width:150px">
                        </td>
                        <td>发动机号</td>
                        <td>
                            <input prompt="请输入发动机号" class="easyui-textbox" style="height:30px;">
                        </td>
                        <td>查看旧件</td>
                        <td>
                            <input type="radio" name="jiujian" />是&nbsp;
                            <input type="radio" name="jiujian" checked="checked"/>否
                        </td>

                    </tr>
                    <tr>
                        <td>检查备胎</td>
                        <td>
                            <input type="radio" name="beitai" />是&nbsp;
                            <input type="radio" name="beitai" checked="checked"/>否
                        </td>
                        <td>清洁车辆</td>
                        <td>
                            <input type="radio" name="qingjie" />是&nbsp;
                            <input type="radio" name="qingjie" checked="checked"/>否
                        </td>
                        <td>联系地址</td>
                        <td colspan="4">
                            <!-- 联系地址 -->
                            <input prompt="请输入车主联系地址" class="easyui-textbox" style="height:30px;width:90%;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>预计交付时间</td>
                        <td>
                            <input id="dd" value="3/4/2010 2:3" type="text" class="easyui-datebox" style="height:30px;"/>
                        </td>
                        <td>选择保修的内容</td>
                        <td colspan="5">
                            <span>维护</span><input type="checkbox" checked="checked" value="1"/>&nbsp;&nbsp;
                            <span>故障修理</span><input type="checkbox" checked="checked" value="2"/>&nbsp;&nbsp;
                            <span>返修</span><input type="checkbox" checked="checked" value="3"/>&nbsp;&nbsp;
                            <span>事故维修</span><input type="checkbox" checked="checked" value="4"/>&nbsp;&nbsp;
                            <span>其他</span><input type="checkbox" checked="checked" value="5"/>
                            <span>返修</span><input type="checkbox" checked="checked" value="6"/>&nbsp;&nbsp;
                            <span>事故维修</span><input type="checkbox" checked="checked" value="7"/>&nbsp;&nbsp;
                            <span>其他</span><input type="checkbox" checked="checked" value="8"/>
                        </td>

                    </tr>
                    <tr>
                        <td>随车物品</td>
                        <td colspan="3">
                            <input prompt="请输入随车物品" class="easyui-textbox" style="width:90%;height:30px;">
                        </td>
                        <td>贵重物品</td>
                        <td colspan="3">
                            <input prompt="请输入贵重物品" class="easyui-textbox" style="width:90%;height:30px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="height:150px;">车主描述故障状况</td>
                        <td colspan="7" style="padding:0px;height:150px;">
                            <div id="te" fit="true" border="false"></div>
                            <script>
                                $(function(){
                                    $('#te').texteditor({

                                    });
                                });
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td>维修人员指派</td>
                        <td colspan="7" style="height:200px;padding:0px;">
                            <div class="easyui-layout" fit="true" border="false">
                                <div region="west" title="维修人员指派" collapsible="false" iconCls="icon-calendar_edit"   style="width:180px;
                                border-top: none;border-bottom: none;border-left:none;" split="true">
                                    <ul class="easyui-tree">
                                        <li>
                                            <span>汽车修理厂</span>
                                            <ul>
                                                <li data-options="state:'closed'">
                                                    <span>修理部</span>
                                                    <ul>
                                                        <li>
                                                            <span>Friend</span>
                                                        </li>
                                                        <li>
                                                            <span>Wife</span>
                                                        </li>
                                                        <li>
                                                            <span>Company</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <span>质检部</span>
                                                    <ul>
                                                        <li>Intel</li>
                                                        <li>Java</li>
                                                        <li>Microsoft Office</li>
                                                        <li>Games</li>
                                                    </ul>
                                                </li>

                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div region="center" style="border-top:none;border-right:none;
                                border-bottom:none;">
                                    <table class="easyui-datagrid" title="已选维修人员" fit="true" border="false" iconCls="icon-comments_add"
                                           data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
                                        <thead>
                                        <tr>
                                            <th data-options="field:'itemid',width:50">编号</th>
                                            <th data-options="field:'productid',width:100">员工工号</th>
                                            <th data-options="field:'listprice',width:100">员工姓名</th>
                                            <th data-options="field:'unitcost',width:200">联系方式</th>
                                            <th data-options="field:'attr1',width:100">当前任务数量</th>
                                            <th data-options="field:'attr1',width:50">操作</th>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td>质检人员指派</td>
                        <td colspan="7" style="height:200px;padding:0px;">
                            <div class="easyui-layout" fit="true" border="false">
                                <div region="west" title="质检人员指派" collapsible="false" iconCls="icon-calendar_edit" style="width:180px;
                                border-top: none;border-bottom: none;border-left:none;" split="true">
                                    <ul class="easyui-tree">
                                        <li>
                                            <span>汽车修理厂</span>
                                            <ul>
                                                <li data-options="state:'closed'">
                                                    <span>修理部</span>
                                                    <ul>
                                                        <li>
                                                            <span>Friend</span>
                                                        </li>
                                                        <li>
                                                            <span>Wife</span>
                                                        </li>
                                                        <li>
                                                            <span>Company</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <span>质检部</span>
                                                    <ul>
                                                        <li>Intel</li>
                                                        <li>Java</li>
                                                        <li>Microsoft Office</li>
                                                        <li>Games</li>
                                                    </ul>
                                                </li>

                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div region="center" style="border-top:none;border-right:none;
                                border-bottom:none;">
                                    <table class="easyui-datagrid" title="已选质检员工" fit="true" border="false" iconCls="icon-comments_add"
                                           data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
                                        <thead>
                                        <tr>
                                            <th data-options="field:'itemid',width:50">编号</th>
                                            <th data-options="field:'productid',width:100">员工工号</th>
                                            <th data-options="field:'listprice',width:100">员工姓名</th>
                                            <th data-options="field:'unitcost',width:200">联系方式</th>
                                            <th data-options="field:'attr1',width:100">当前任务数量</th>
                                            <th data-options="field:'attr1',width:50">操作</th>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8" style="background-color:#d8ecff;">
                            <a class="easyui-linkbutton" iconCls="icon-ok" style="width:120px;height:30px;">提交</a>&nbsp;&nbsp;&nbsp;
                            <a class="easyui-linkbutton" iconCls="icon-building_error" style="width:120px;height:30px;">暂存</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>


</body>
</html>