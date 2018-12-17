<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@page isELIgnored="false"%>
<html>
	<head>
		<title>login</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/css/style.css" />
		<script type="text/javascript"   src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
			function login(){
			
			   $("#d1").html("");
               $("#circle").prop("src","${pageContext.request.contextPath}/img/load.gif");
                  
                  // 获取表单里的所有数据
                  var username = $("#username").val();
                  var password = $("#password").val();
           
                  
                  //发送异步请求
                   var xhr;
                    if(window.XMLHttpRequest){
                        xhr = new XMLHttpRequest();   //webkit
                    }else{
                        xhr = new ActiveXObject("Microsoft.XMLHTTP");  //ie6之前
                    }
                     
                    xhr.open("POST","<s:url value='/lg/LoginAction'/>");
                    xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
                    xhr.send("username="+username+"&password="+password);
                   
                    xhr.onreadystatechange = function(){
                        $("#circle").prop("src","");
                        if( xhr.readyState==4 && xhr.status==200 ){
                        
                          var message = xhr.responseText;
                          
                          if(message=="ok"){
		        			  location.href="${pageContext.request.contextPath}/es/ShowAll";
		        		  }else{
		        			  if(message=="username"){
		        				  $("#d1").html("此用户名不存在");
		        			  }
		        			  if(message=="password"){
		        				  $("#d1").html("密码错误");
		        			  }
		        		  }
                           
                            
                        } 
                    };  
                 }
		
		
		</script>
	</head>

	<body>
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
						login
					</h1>
					<form action="${pageContext.request.contextPath}/user/login.do" method="post">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									username:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="username" id="username"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									password:
								</td>
								<td valign="middle" align="left">
									<input type="password" class="inputgri" name="password" id="password"/>
								</td>
							</tr>
							
						</table>
						<p>
							<input type="submit" class="button" value="Submit &raquo;" onclick="login();"/>
							<input type="button" class="button" onclick="location.href='regist.jsp'" value="Regist &raquo;" />
							<td>
		    	    			<img id='circle' src="" /><span id="d1"></span>
		    	    		</td>
						</p>
					</form>
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
