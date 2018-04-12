<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
<script>tinymce.init({ selector:'textarea',height:'300' });</script>

<%-- <c:url value="/resources/bower_components/tinymce/tinymce.min.js" var="tinymce"/>
<script src="${tinymce}"></script> --%>
<script>
$(function(){

})
</script>


<h2 class="mt-5 mb-4">게시글 작성</h2>

<form:form commandName="board" enctype="multipart/form-data">
	<div class="md-form">
		<label>제목</label>
		<form:input path="title" required="required"/>
		<form:errors path="title"/>
	</div>
	<div class="md-3">
		<label>작성자 : ${USER.userId}</label>
		<input type="hidden" name="writer" value="${USER.userId}"/>
	</div>
	<div class="md-form">
		<label>비밀번호</label>
		<form:password path="password" required="required"/>
		<form:errors path="password"/>
	</div>
	<div>
		<label>파일첨부</label>
		<input type="file" name="files" multiple="multiple">
	</div>
	<hr/>
	<form:textarea path="content"/>
	<div class="text-center mt-3">
		<button type="submit" class="btn btn-primary btn-md">
			<i class="fa fa-check mr-2"></i> 등록
		</button>
		<a href="javascript:history.back()"
				class="btn btn-primary btn-md">
			<i class="fa fa-undo mr-2"></i>돌아가기
		</a>
	</div>

</form:form>











