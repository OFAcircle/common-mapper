<%@ page   pageEncoding="UTF-8" %>
<script type="text/javascript">

				$(function(){
								//初始化提交按钮
								$("#submitbtn").linkbutton({
										//为提交按钮添加事件
										onClick:function(){
											$("#addform").form("submit",{
													url:"${pageContext.request.contextPath}/all/insertOne",
													onSubmit:function(){
																		return $("#addform").form("validate");
																	},
													success:function(){
													$("#adddialog").dialog("close");
													$("#tab").datagrid('reload')
															$.messager.show({
																		title:"系统提示",
																		msg:"添加成功。",
																		timeout:2000,
																		showType:"slide"
																	});
													}			
											});
										}
								
								}); 
																		
									
									//账号验证
									$("#checkusername").validatebox({
											required:true,
											validType:"length[6,15]"
										});
								 	//密码验证	
									$("#checkpassword").validatebox({
											required:true,
											validType:"length[6,15]"
										});
									//邮箱验证
									$("#checkemail").validatebox({
								         	required:true,
											validType:["email","length[6,30]"]
											});				
									//生日					
									$("#checkbirthday").datebox({   
										editable:false		
									}); 
				});

</script>

<form id="addform" method="post">	
		username:  <input id="checkusername" name="username"/> <br/>
		password:	 <input  id="checkpassword" name="password"/><br/>
		email:       	<input id="checkemail" name="email" /><br/>	
		birthday:	<input id="checkbirthday" name="birthday">	<br/>
		<a id="submitbtn">添加</a>
		<input id="resetbtn" type="reset"></input>		
</form>