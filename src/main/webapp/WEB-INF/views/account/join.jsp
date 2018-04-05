<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<h3><i class="fa fa-user"></i>&nbsp;회원가입</h3>
	<form:form commandName="member">
		<p>
			사용자 ID :
			<form:input path="userId"/>
			<form:errors path="userId" element="div" cssClass="errs"/>
		</p>
		<p>
			이름 :
			<form:input path="name"/>
			<form:errors path="name" element="div" cssClass="errs"/>
		</p>
		<p>
			비밀번호 :
			<form:password path="password"/>
			<form:errors path="password" element="div" cssClass="errs"/>
		</p>
		<p>
			이메일 :
			<form:input path="email"/>
			<form:errors path="email" element="div" cssClass="errs"/>
		</p>
		<p>
			전화번호 :
			<form:input path="cellPhone"/>
			<form:errors path="cellPhone" element="div" cssClass="errs"/>
		</p>
		<p>
			주소 :
			<form:input path="address"/>
			<form:errors path="address" element="div" cssClass="errs"/>
		</p>
		<p><input type="submit"/></p>
	</form:form>
