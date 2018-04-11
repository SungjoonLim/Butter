<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
.error {
	color: red;
}
</style>

<script>
	$(function() {
		$('#check-btn').click(function(e) {
			e.preventDefault();
			//중복체크
			var userId = $('#userId').val();
			if (userId == '') {
				alert("사용할 아이디를 입력하세요");
				return;
			}

			<c:url value="/idcheck" var="idcheck"/>
			$.get('${idcheck}', {userId : userId}, function(data) {
				console.log(typeof data);
				console.log(data);
				if (!data) {
					$(':submit').prop('disabled', false);
					$('#check-message').removeClass('error')
								.html("아이디 사용가능!");
				} else {
					$(':submit').prop('disabled', true);
					$('#check-message').addClass('error')
								.html("아이디 중복!");
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
	<i class="fa fa-user"></i>&nbsp;회원추가
</h3>
<form:form commandName="member">
	<p>
		사용자 ID :
		<form:input path="userId" />
		<form:errors path="userId" element="div" cssClass="errs" />
	</p>
	
	<div class="md=form">
		<a id="check-btn"
			class="btn-floating btn btn-primary btn-sm">중복 확인</a>
       	<span id="check-message"></span>
	</div>
	
	
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
	
	<div class="md-form text-center">
		<button type="submit" class="btn btn-primary" disabled>
			<i class="fa fa-check"></i> 확인
		</button>
<!--
 		<a href="javascript:history.back()" class="btn btn-primary">
			<i class="fa fa-list"></i> 목록
		</a>
-->
		<a href="list?page=${param.page}" class="btn btn-primary">
			<i class="fa fa-list"></i> 목록
         </a>
		
	</div>
	<form:errors />
</form:form>
