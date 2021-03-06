<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!--  material design bootstrap stylesheet -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/css/mdb.min.css" />

<style>
	.error{
		color:red;
	}
</style>

<script>
	$(function() {
		$('#checkId-btn').click(function(e) {
			e.preventDefault();
			//중복체크
			var userId = $('#userId').val();
			if (userId == '') {
				alert("사용할 아이디를 입력하세요");
				return;
			}
			$.get('idcheck', {userId : userId}, function(data) {
				console.log(typeof data);
				console.log(data);

				if (data == false) {
					$(':submit').prop('disable', false);
					$('#check-message').removeClass('error').html("아이디 사용가능!");
				} else {
					$(':submit').prop('disable', true);
					$('#check-message').addClass('error').html("아이디 중복!");
				}
			});
		});

		$('#member').submit(function(e) {
			var password1 = $(':password').eq(0).val();
			var password2 = $(':password').eq(1).val();
			if (password1 != password2) {
				alert("비밀번호가 일치하지 않습니다.");
				$(':password').eq(0).focus();
				e.preventDefault();
			}
		});
	});
</script>

<h3>
	<i class="fa fa-user"></i>&nbsp;회원가입
</h3>
<form:form commandName="member">
	<p>
		사용자 ID :
		<form:input path="userId" />
		<form:errors path="userId" element="div" cssClass="errs" />
		<a id="checkId-btn" class="btn-floating btn btn-primary btn-sm">
			아이디 중복체크 </a> <span id="check-message"></span>
	</p>
	<p>
		이름 :
		<form:input path="name" />
		<form:errors path="name" element="div" cssClass="errs" />
	</p>
	<p>
		비밀번호 :
		<form:password path="password" />
		<form:errors path="password" element="div" cssClass="errs" />
	</p>
	<p>
		비밀번호 확인: <input type="password" id="password2" />
	</p>
	<p>
		이메일 :
		<form:input path="email" />
		<form:errors path="email" element="div" cssClass="errs" />
	</p>
	<p>
		전화번호 :
		<form:input path="cellPhone" />
		<form:errors path="cellPhone" element="div" cssClass="errs" />
	</p>
	<p>
		주소 :
		<form:input path="address" />
		<form:errors path="address" element="div" cssClass="errs" />
	</p>
	<c:if test="${not empty error}">
		<div class="error">${error}</div>
	</c:if>
	<p>
		<input type="submit" />
	</p>
	<form:errors />
</form:form>
