<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
  <body>
  	<table>	
   		<tr>
   		  		<td>id</td>
   		  		<td>用户名</td>
   		  		<td>密码</td>
   				<td>邮箱</td>
   				<td>生日</td>
   				<td></td>
   		</tr>
   		<c:forEach items="${requestScope.list}" var="p">
   		<tr>
   				<td>
   				${p.id}
   				 </td>
   		  		<td>
   		  		${p.username}
   		  		</td>
   		  		<td>
   		  		${p.password} 
   		  		</td>
   				<td>
   				${p.email}
   				 </td>
   				<td>
   				<fmt:formatDate	pattern="yyyy-mm-dd" value="${p.birthday}"/> 
   				</td>
   		</tr>
   		</c:forEach>
   		</table>
  </body>
</html>
