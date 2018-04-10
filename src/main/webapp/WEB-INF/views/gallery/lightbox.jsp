<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.thumb-pane {
	display: inline-block;
	width: 200px;
	padding: 2px;
}
</style>

<c:url value="/" var="root"/>
<link href ="${root}resources/bower_components/lightbox/dist/css/lightbox.css" rel="stylesheet">
<script src="${root}resources/bower_components/lightbox/dist/js/lightbox.js"></script>


<h3>Gallery</h3>
<a href="carousel?page=${param.page}" class="btn btn-primary btn-sm">carousel ver.</a>
<a href="upload"><i class="fa fa-upload"></i>이미지 등록</a>
<hr />
<div class="row">
	<c:forEach var="image" items="${list}" varStatus="status">
		
		<div class="col-md-3 col-sm-4">
			<a href="image/${image.imageId}" data-lightbox="roadtrip">
				<img src="thumb/${image.imageId}" alt="${image.title}"/>
			</a>
			<p>
				<a href="download/${image.imageId}">
					<i class="fa fa-download"></i> ${image.title}
				</a>
			</p>
		</div>
	</c:forEach>
</div>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot" %>
<iot:pagination pagination="${pagination}" link=""/>




