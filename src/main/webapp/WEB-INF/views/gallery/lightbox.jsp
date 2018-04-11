<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:url value="/" var="root"/>
<link href ="${root}resources/bower_components/lightbox/dist/css/lightbox.css" rel="stylesheet">
<script src="${root}resources/bower_components/lightbox/dist/js/lightbox.js"></script>

<h1>Gallery</h1>

<a href="carousel?page=${param.page}"
	class="btn btn-primary btn-sm">carousel</a>

<a href="upload">
	<i class="fa fa-upload"></i>이미지 등록</a>

<div class="text-right mb-2">
	보기 모드 :
	<a href="lightbox?page=${param.page}&mode=tile"><i class="fa fa-home"></i>타일형</a>
	<a href="lightbox?page=${param.page}&mode=list"><i class="fa fa-home"></i>리스트형</a>
</div>

<c:if test="${param.mode!='list'}">
	<jsp:include page="lightbox_tile.jsp"/>
</c:if>
<c:if test="${param.mode=='list'}">
	<jsp:include page="lightbox_list.jsp"/>
</c:if>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot" %>
<iot:pagination pagination="${pagination}" 
				params="&mode=${param.mode}"
				link=""/>




