<%@ page   pageEncoding="UTF-8" %>
<script type="text/javascript">
				$(function(){
								//页面加载成功后,调取load方法
								$("#addform").form("load","${pageContext.request.contextPath }/all/queryOne?id="+${param.id});
								$("#submitbtn").linkbutton({
										onClick:function(){
											$("#addform").form("submit",{
													url:"${pageContext.request.contextPath}/all/updateOne",
													onSubmit:function(){
																		return $("#addform").form("validate");
																	},	
													success:function(){
															$.messager.show({
																		title:"系统提示",
																		msg:"修改成功。",
																		timeout:2000,
																		showType:"slide"
																	});
															$("#updateDialog").dialog("close");
															$("#tab").datagrid('reload')	
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

<form id="addform" method="post" >
							<input id="id" name="id"  type="hidden"/><br/>
		username:  <input id="checkusername" name="username" /> <br/>
		password:	 <input  id="checkpassword" name="password"/><br/>
		email:       	<input id="checkemail" name="email"  /><br/>	
		birthday:	<input id="checkbirthday" name="birthday">	<br/>
		<a id="submitbtn">修改</a>
		<input id="resetbtn" type="reset"></input>		
</form>