<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
#container{
	width:500px;
	border:1px solid black;
}
</style>

<script>
	$(function(){
		
	});
</script>

	<h3>
		<i class="fa fa-sign-in-alt"></i>&nbsp;로그인
	</h3>
	<div id="container">
	<form:form commandName="login">
		<p>
			<input type="hidden" name="url" value="${url}">
		</p>
		<p>
			아이디 :
			<form:input path="userId" />
			<form:errors path="userId" cssClass="errs" />
		</p>
		<p>
			비밀번호 :
			<form:input path="password" />
			<form:errors path="password" cssClass="errs" />
		</p>
		<p>
			<input type="submit" value="로그인" />
		</p>
		<form:errors cssClass="errs" />
	</form:form>
	</div>
