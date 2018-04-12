<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
<script>tinymce.init({ selector:'textarea',height:'300' });</script>

<script>
$(function(){
	$('.attachment').click(function(e){
		//alert('나 눌렀어?')
		e.preventDefault();
		var attachmentId = $(this).data('target');
		console.log(attachmentId);
		
		//폼을 ajax로 post할 때 데이터 추출 메서드
		var data = $('#board').serialize();
		//data 값을 ajax 메서드의 data 필드에 지정
		console.log(data);
		
		var parent = $(this).parent();
		//parent.remove();	//삭제 테스트
		
		 $.ajax({
			url :"../delete_attachment/"+attachmentId,
			type:'delete',
			//data:data,
			success:function(result){
				if(result){
					console.log(this);
					parent.remove();
				}else{
					alert('첨부파일 삭제 실패');
				}
			}
		});
		
	});
})
</script>

<h2 class="mt-5 mb-4">게시글 수정</h2>

<form:form commandName="board" enctype="multipart/form-data">
	<form:hidden path="boardId"/>
	<form:hidden path="writer"/>
	<div class="md-form">
		<label>제목</label>
		<form:input path="title" required="required"/>
		<form:errors path="title"/>
	</div>
	
	<div class="mb-3">
		<label>작성자 : ${board.writer}</label>
	</div>
	
	<div class="md-form">
		<label>비밀번호</label>
		<form:password path="password" required="required"/>
		<form:errors path="password"/>
	</div>
	
	<div class="row">
		<div class="col-md-2">첨부파일</div>
		<div class="col-md-10">
			<c:forEach var="file" items="${board.attachments}">
				<div>
					<i class="fa fa-file"></i> ${file.fileName}
					<a class="attachment" href="#" data-target="${file.attachmentId}">
						<i class="fa fa-trash"></i>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div>
		<label>파일첨부</label>
		<input type="file" name="files" multiple="multiple"/>
	</div>
	
	<form:textarea path="content"/>
	<div class="text-center mt-3">
		<button type="submit" class="btn btn-primary btn-md">
			<i class="fa fa-check mr-2"></i> 확인	
		</button>
		<a href="javascript:history.back()" class="btn btn-primary btn-md">
			<i class="fa fa-undo mr-2"></i> 돌아가기
		</a>
	</div>
	
</form:form>


