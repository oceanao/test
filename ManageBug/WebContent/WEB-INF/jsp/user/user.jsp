<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/static/css/admin.css"
	type="text/css" rel="stylesheet" />
</head>
<body>
<p>  当前位置：<a href="${pageContext.request.contextPath }/user/hello"  target= "iFrame1 ">管理员</a>
/
   <a href="${pageContext.request.contextPath }/user/selectUser"  target= "iFrame1 ">查看用户</a>
</p>
	<h1 align="center">用户列表</h1>


<br><br>
	<table width="80%" height="90%" border="0" cellpadding="5" cellspacing="0" >
		<form name="userform" method="post" id="userform"
			action="${pageContext.request.contextPath }/user/selectUser">
			
			&nbsp;&nbsp;  	学号：<input type="text" name="student_num"
					onkeyup="javascript:chkmaxsms(this,'16')" style="width: 200px;height: 30px;">
				&nbsp;&nbsp;  	 姓名：<input
					type="text" name="username"
					onkeyup="javascript:chkmaxsms(this,'8')" style="width: 200px;height: 30px;">
					&nbsp;&nbsp;   角色： <select
					name="role" style="width: 200px;height: 32px;">
					<option value="0">--请选择角色--</option>
					<option value="1">测试人员</option>
					<option value="2">开发人员</option>
					
				</select> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;  
				<input type="submit" value="搜索" style="width: 120px;height: 34px;background-color: #0198f1;color: white;" />
		</form>
<br><br>
		<!--  输入框字数限制-->
		<script language="javascript" type="text/javascript">
		function chkmaxsms(vobj1, vmax) {
			var str = vobj1.value;
			var strlen = str.length;

			if (strlen > vmax) {
				alert('摘要字数超过限制');
				eval_r(vobj1.value = str.substr(0, vmax));
			}
		}
	</script>

		<!-- 数据展示区 -->
		<tr valign="top">
			<td height="20">
				<table width="100%" border="1" cellpadding="5" cellspacing="0"
					style="border: #c2c6cc 1px solid; border-collapse: collapse;">
					<tr align="center">
						<td>序号</td>
						<td>学号</td>
						<td>用户名</td>
						<td>角色</td>
						<td>创建时间</td>
						<td align="center"style="width: 60px;" >操作1</td>
						<td align="center"style="width: 60px;">操作2</td>
					</tr>
					<c:forEach items="${requestScope.users}" var="user"
						varStatus="stat">
						<tr id="data_${stat.index}" align="center">
							<td>${stat.count}</td>
							<td>${user.student_num }</td>
							<td>${user.username }</td>
							<td><c:choose>
									<c:when test="${user.role == 1 }">测试人员</c:when>
									<c:otherwise>开发人员</c:otherwise>
								</c:choose></td>
							<td><f:formatDate value="${user.register_time}" type="date"
									dateStyle="long" /></td>
							<td align="center" width="40px;"><a
								href="${pageContext.request.contextPath }/user/updateUser?flag=1&user_id=${user.user_id}">
									修改</a></td>
							<td align="center" width="40px;"><a
								href="${pageContext.request.contextPath }/user/removeUser?user_id=${user.user_id}" title="删除用户">
										<img src="${pageContext.request.contextPath }/static/image/delete.jpg" style="width: 50px;height: 25px;"></a></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<!-- 分页标签 -->
		<tr valign="top">
			<td align="center"><fkjava:pager
					pageIndex="${requestScope.pageModel.pageIndex}"
					pageSize="${requestScope.pageModel.pageSize}"
					recordCount="${requestScope.pageModel.recordCount}"
					submitUrl="${pageContext.request.contextPath }/user/selectUser?pageIndex={0}" />
			</td>
		</tr>
	</table>

</body>
</html>