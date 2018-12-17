<%@ page  pageEncoding="utf-8"%>
<html>
  <head>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css ">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes//icon.css ">
		<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js "></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
		<script>
		$(function(){
		// 初始化 datagrid1
		$("#datagrid1").datagrid({
			fitColumns:true,
			url:"${pageContext.request.contextPath }/datagrid3json.jsp",
			pagination:true,
			pageSize:1,
			pageList:[1,5,10,15,20]
		});
		$('#datagrid1').datagrid('sort', 'id');
		$("#datagrid1").datagrid('sort',{
						sortName:'id',
						sortOrder:'desc'
		});
		// 初始化测试按钮
		$("#loadBtn").linkbutton({
			onClick:function(){
				// 刷新datagrid中的数据 -- 调load方法
				$("#datagrid1").datagrid("load");
			}
		});
	});
	
	// 自定义操作列的内容
	/*
		参数1：当前列中 该行上的属性值
		参数2：该行对应的json对象
		参数3：行下标索引 
	*/
	function myOptFormatter(value, row, index){
		// console.log(index);
		return "<a href=''>修改</a> <a href='' onclick='removeUser("+row.id+")'>删除</a>";
	}
	</script>
</head>
<body>
	<!-- 查所有 -->
	<table id="datagrid1">
		<thead>
		<tr>
			<th data-options="field:'id',width:1,sortable:true,order:'asc',remoteSort:true">学号</th>
			<th data-options="field:'name',width:1">姓名</th>
			<th data-options="field:'score',width:1">成绩</th>
			<th data-options="field:'xx',formatter:myOptFormatter">操作</th>
		</tr>
		</thead>
	</table>
	
	<!-- 添加对话框 -->
	<!-- 修改对话框 -->
	
	<!-- 测试load方法 -->
	<a id="loadBtn">load</a>
</body>
</html>