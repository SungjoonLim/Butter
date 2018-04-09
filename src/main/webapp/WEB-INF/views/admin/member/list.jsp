<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot" %>

<div class="text-right">
	(총 ${pagination.totalCount}명 / <a href="create"><i
		class="fa fa-user-plus"></i> 추가</a>)
</div>

<table class="table table-stripped">
	<thead>
		<tr>
			<th style="width: 60">No</th>
			<th>사용자</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>등록일</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var="member" items="${list}" varStatus="status">
			<tr>
				<td>${pagination.start+status.index}</td>
				<td>${member.userId}</td>
				<td>${member.name}</td>
				<td>${member.email}</td>
				<td>${member.cellPhone}</td>
				<td><fmt:formatDate value="${member.regDate}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<iot:pagination pagination="${pagination}" link="list" />
