<%@page import="com.cafe24.mysite.vo.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	UserVo vo = (UserVo)request.getAttribute("userVo");
	String genderChecker = "female".equals(vo.getGender()) ? "true" : "false";
%>

<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<%=request.getContextPath()%>/assets/css/user.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="user">

				<form id="join-form" name="joinForm" method="post"
					action="<%=request.getContextPath() %>/user">
					<input type="hidden" name="a" value="update"> <input
						type="hidden" name="no" value="<%=vo.getNo()%>"> <label
						class="block-label" for="email">이메일</label>
					<h4><%=vo.getEmail()%></h4>

					<label class="block-label" for="name">이름</label> <input id="name"
						name="name" type="text" value="<%= vo.getName()%>"> <label
						class="block-label">패스워드</label> <input name="password"
						type="password" value="">

					<fieldset>
						<legend>성별</legend>
						<% if("female".equals(vo.getGender())) {%>
						<label>여</label> <input type="radio" name="gender" value="female"
							checked="checked"> <label>남</label> <input type="radio"
							name="gender" value="male">
						<% } else {%>
						<label>여</label> <input type="radio" name="gender" value="female">
						<label>남</label> <input type="radio" name="gender" value="male"
							checked="checked">
						<%} %>
					</fieldset>


					<input type="submit" value="변경하기">
					<%
						String result = (String)request.getAttribute("result");
							if("fail".equals(result)){
					%>
					<p>아마 비밀번호나 이름이 너무 길어서 실패한거같아요 짧게 다시하세요</p>
					<%}	%>
				</form>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/includes/navigation.jsp" />
		<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>