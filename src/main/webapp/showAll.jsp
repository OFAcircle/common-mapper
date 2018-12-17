<%@ page  pageEncoding="utf-8"%>
<html>
  <head>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css ">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes//icon.css ">
		<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js "></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">
				var del=function del(a,b){
						return (a>b?1:-1)
						};
			
		
		
		
							var updatefun = function(id){
									$("#updateDialog").dialog({
											title:"修改",
											width: 600,    
   											height: 400, 
											href:"${pageContext.request.contextPath}/view/updateOne.jsp?id="+id,
											modal:true,
											cache:false
									}).dialog('open')
								}
								var deletefun = function(id){
									$.messager.confirm("check info","确定删除吗？",function(check){
										if(check){
											$.ajax({
												type:"GET",
												url:"${pageContext.request.contextPath }/all/deleteOne?id="+id,
												dataType:"text",
												success:function(result){
													$.messager.show({
														title:"系统消息",
														msg:"删除成功!"
													})
													$("#tab").datagrid('reload')
												}
												
											})
											
										}
									})
								}		
						$(function(){
								//初始化添加对话框
									//添加对话框
								$("#adddialog").dialog({
									iconCls:"icon-add",
									title: "添加框",    
   									width: 600,    
   									height: 400,     
   									cache: false,    
   									modal: true ,
   									href:"${pageContext.request.contextPath}/view/addUser.jsp",
   									closed:true
								});
								//为添加按钮添加事件
									$("#addUserBtn").linkbutton({
										text:"增加新用户",
										onClick:function(){
											//单击调用对话框的open方法
											$("#adddialog").dialog("open");	
										}
													
								})					
								//初始化表格
								$("#tab").datagrid({
											fitColumns:true,
											url:"${pageContext.request.contextPath }/all/queryAll",
											striped:true,
											toolbar:"#tb",
											rownumbers:true,
											singleSelect:true,
											title:"学生成绩表",
											 columns:[[ 
											 			{field:'id',title:'ID',width:10,sortable:true,remoteSort:true, sorter: del},     
       										 			{field:'username',title:'Username',width:50},    
												        {field:'email',title:'Email',width:50},    
												        {field:'birthday',title:'Birthday',width:100,align:'left'},
												        {field : 'OPERATION',title : 'OPERATION',formatter : operationfun	}
												    ]]   
										});
										
									});
									//添加修改与删除按钮
									var operationfun = function(value, row, index){
									return "<a href='#'  class='l-btn'   onClick='updatefun("+row.id+")'>修改</a>  <a href='#'class='l-btn' onClick='deletefun("+row.id+")'>删除</a>"
					}
			</script>
</head>
<body>
			<div id="tb">
				<a id="addUserBtn">添加用户</a>
				
			</div>
		<table id="tab"></table>
		<a id="reloadBtn"></a>	
		<div id="adddialog"></div>
		<div id="updateDialog"></div>
		<div id="deleteDialog"></div>
</body>
</html>