<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:url value="/" var="root" />
<script src="${root}resources/js/comment.js"></script>

<style>
.row.content.view {
	height: 100%;
}

.card {
	width: 1000px;
	height: 100%;
	min-height: 1000px;
	margin: 100px auto;
}

.card-header {
	background: dodgerblue;
	color: white;
}

.text-content {
	min-height: 500px;
}

.comments {
	background: #e3f2fd;
	font-size: 13px;
	height: auto;
}

.comments-header {
	margin-left: 10px;
	margin-bottom: 10px;
	margin-right: 10px;
	padding: 10px;
}

.comments-footer {
	padding: 20px;
}

.comment-child {
	background: #bbdefb;
}

.comment-main {
	margin-right: 10px;
	padding: 10px;
}

.btn-light-blue {
	font-size: 13px !important;
}
</style>

<script>
$(function(){
	//console.log('여기 왔니?')
    //페이징 처리를 위한 정보 오브젝트
    var info = {
        root:${root},
        page:1,
        writer:'${USER.userId}',
        boardId:${board.boardId}
    };
	//console.log(info)
    getComment(info);

});
</script>

<div class="row content view">
	<div class="card">
		<div class="card-header">
			<h4>${board.title}</h4>
			<span>${board.writer} 님</span><br>
			<fmt:formatDate value="${board.regDate}"
				pattern="yyyy-MM-dd hh:mm:ss" />
			<div class="row">
				<div class="col text-right">
					<c:forEach var="file" items="${board.attachments}">
                        &nbsp;<a class="text-white small"
							href="../download/${file.attachmentId}"><i
							class="fa fa-download"></i>${file.fileName}</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="img" style="margin: 20px auto">
				<c:forEach var="file" items="${board.attachments}">
					<img src="../img/${file.attachmentId}" alt="${file.fileName}" />
					<br>
				</c:forEach>
			</div>
			<div class="text-content">${board.content}</div>
			<div class="scroll-point"></div>
			<div class="comments z-depth-1">
				<div class="comments-header border-bottom border-light"></div>
				<div class="comments-body"></div>
				<div class="comments-write">
					<div class="comments-area" id="scroll"></div>
				</div>
				<div class="comments-footer"></div>
			</div>
		</div>
		<div class="card-footer">
			<div class="row">
				<div class="col-4">
					수정일 :
					<fmt:formatDate value="${board.updateDate}"
						pattern="yyyy-MM-dd hh:mm:ss" />
				</div>
				<div class="col-8 text-right">
					<c:if test="${USER.userId == board.writer }">
						<a href="../edit/${board.boardId}" class="mr-4"> <i
							class="fa fa-edit mr-2"></i> 수정
						</a>
						<a href="../delete/${board.boardId}" class="mr-4"> <i
							class="fa fa-trash mr-2"></i> 삭제
						</a>
					</c:if>
					<a href="javascript:history.back()"> <i class="fa fa-undo mr-2"></i>
						목록
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

