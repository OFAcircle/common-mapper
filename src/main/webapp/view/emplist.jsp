<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib prefix="isEl"%>>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<title>emplist</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
    	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
		<script type="text/javascript"   src="${pageContext.request.contextPath}/easyui/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js "></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">	
		
		
		
			$(function(){
				$.get("${pageContext.request.contextPath}/all/queryAll.do",
						function(res) {
							for ( var i = 0; i < res.length; i++) {
								$("#table").append(
										"<tr class="+"table_header"+"><td>"
												+ res[i].id + "</td><td>"
												+ res[i].username + "</td><td>"
												+ res[i].email + "</td><td>"
												+ res[i].birthday + "</td><td>" 
												+ "<a id='deletebtn'  onclick=deleteOne("+res[i].id+") href='javascript:void(0)'>删除</a>" + "</td><td>"
												+ "<a id='updatebtn' onclick=updateOne("+res[i].id+") href='javascript:void(0)'>修改</a>"
												+ "</td></tr>");
									}
								}, "json");
								//添加对话框
								$("#adddialog").dialog({
									iconCls:"icon-add",
									title: "添加框",    
   									width: 600,    
   									height: 400,     
   									cache: false,    
   									modal: true ,
   									href:"${pageContext.request.contextPath}/view/addUser.jsp" 
								});
								//为添加按钮添加事件
								$("#adduser").linkbutton({
										text:"增加新用户",
										onClick:function(){
											//单击调用对话框的open方法
											$("#adddialog").dialog("open");	
										}
													
								})
								
						});
						
								//删除函数
								function deleteOne(id){
								//初始化删除对话框
								$.messager.confirm("确认对话框","您确定删除吗？",function(r){
										if(r){
												$.get("${pageContext.request.contextPath }/all/deleteOne",
															{id:id},
															function(){
															},
														"json"
												);
												//右下角提示框
													$.messager.show({
													title:"删除确认",
													msg:"删除成功！"
													});
												}
									});	
								}
							//修改函数
							function updateOne(id){
											//初始化修改对话框
											$("#updatedialog").dialog({
											title:"修改",
											width: 600,    
   											height: 400, 
											href:"${pageContext.request.contextPath}/view/updateOne.jsp?id="+id,
											modal:true,
											cache:false
				});
			}
		</script>
	</head>
	<body >
		<div id="wrap">
			<div id="top_content"> 
				<div id="header">
					<div id="rightheader">
						<p>
							<script type="text/javascript">
								function getTime(){
									var d = new Date().toLocaleString()+ ' 星期' + '日一二三四五六'.charAt(new Date().getDay());;
									document.getElementById("rightheader").innerHTML = d;
									window.setTimeout("getTime()",1000);
								}
								window.onload=getTime;
							</script>	

							<br />
						</p>
					</div>
					<div id="topheader">
						<h1 id="title">
							<a href="#">main</a>
						</h1>
					</div>
					<div id="navigation">
					</div>
				</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						Welcome! 
					</h1>
						<table id="table">
						<tr class="table_header">
							<td>
								ID
							</td>
							<td>
								Name
							</td>	
							<td>
								email
							</td>
							
							<td>
								birthday
							</td>
							<td>
							delete
							</td>
							<td>
							update
							</td>
						</tr>								
					</table>
					<p>
							
						<a id="adduser"></a>
						 <div id="adddialog" class="easyui-dialog" data-options="closed:true,toolbar:'#gj',title:'对话框名',width:200,height:200,resizable:true,collapsible:true,maximizable:true"></div>
						 <div id="updatedialog">
					</p>
				</div>
			</div>
			<div id="footer">
				<div id="footer_bg">
				ABC@126.com
				</div>
			</div>
		</div>
	</body>
</html>






