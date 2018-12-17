<%@ page  pageEncoding="utf-8"%>
<html>
  <head>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css ">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes//icon.css ">
		<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js "></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">
						$(function(){
								$("#select1").	combobox({
										editable:false,
										onSelect:function(item){
													console.log(item.value+","+item.text)													
										}
								});
								$("#setvaluebtn").linkbutton({
											onClick:function(){
												//给combox赋值
												$("#select1").combobox("setvalue",5)
											}
								});					
						});
		 </script>
  </head>
			  		
  <body>
    				年级<select id="select1">
    						<option>一年级</option>
    						<option>二年级</option>
    						<option>三年级</option>
    						<option>四年级</option>
    						</select>
    						<br/>
    						<a id="setvaluebtn">测试set</a>
    						
    						
  </body>
</html>
