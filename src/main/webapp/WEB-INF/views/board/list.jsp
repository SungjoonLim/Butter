<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<h2 class="mt-5 mb-4">게시판입니다!!</h2>



<table class="table table-stripped">
	<thead>
		<tr>
			<th style="width:60px">No</th>
			<th>제목</th>
			<th style="width:100px">작성자</th>
			<th style="width:90px">조회수</th>
			<th style="width:120px">등록일</th>
		</tr>
	</thead>
	<tbody>
		
		<c:forEach var="board" items="${list}" varStatus="status">
			<tr>
				<td>${board.boardId}</td>
				<td>
					<a href="view/${board.boardId}">${board.title}</a>
				</td>
				<td>${board.writer}</td>
				<td>${board.readCnt}</td>
				<td>
					<fmt:formatDate value="${board.regDate}"
						pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<iot:pagination pagination="${pagination}" link="list"/>
<div class="text-center">
	<c:if test="${not empty USER}">
		<a href="create" class="btn btn-primary"><i class="fa fa-plus"></i> 글 작성</a>
	</c:if>
<div class="text-right">
	(총 ${pagination.totalCount}건)
</div>

