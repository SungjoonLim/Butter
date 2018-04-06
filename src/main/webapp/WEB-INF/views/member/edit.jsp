<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div id="join-form" class="join-form">
	<h2>나의 정보 수정</h2>
	<hr />
	<form:form commandName="member">
		<div>
			<label for="userId">사용자 ID : ${member.userId}</label>
			<form:hidden path="userId" />
		</div>
		<div>
			<label for="name">이름 : ${member.name}</label>
			<form:hidden path="name" />
		</div>
		<div class="md-form">
			<label for="password">비밀번호 : </label>
			<form:password path="password"/>
			<form:errors path="password"/>
		</div>
		<div class="md-form">
			<label for="email">이메일 : </label>
			<form:input path="email" />
			<form:errors path="email"/>
		</div>
		<div class="md-form">
			<label for="cellPhone">전화번호 : </label>
			<form:input path="cellPhone" />
			<form:errors path="cellPhone"/>
		</div>
		<div class="md-form">
			<label for="address">주소 : </label>
			<form:input path="address" />
			<form:errors path="address"/>
		</div>
		<form:errors />
		<div>
			<button type="submit">수정</button>
		</div>
	</form:form>
</div>