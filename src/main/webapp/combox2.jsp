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
		// 初始化
		$("#input1").combobox({
			editable:false,
			url:"${pageContext.request.contextPath }/comboboxjson.jsp",
			textField:"name",
			valueField:"id",
			onSelect:function(item){
				console.log(item.id+", "+item.name+","+item.birthday);
			}
			/* onChange:function(newVal, oldVal){
				console.log(newVal +", "+oldVal);
			} */
		});
		
		// 初始化测试reload按钮
		$("#reloadBtn1").linkbutton({
			onClick:function(){
				// 调combobox的reload方法
				$("#input1").combobox("reload");
			}
		});
		$("#reloadBtn2").linkbutton({
			onClick:function(){
				// 调combobox的reload方法
				$("#input1").combobox("reload", "${pageContext.request.contextPath }/comboboxjson1.jsp");
			}
		});
	});
	</script>
</head>
<body>
	<input id="input1"/><br/>
	<a id="reloadBtn1">reload1</a>
	<a id="reloadBtn2">reload2</a>
</body>
</html>