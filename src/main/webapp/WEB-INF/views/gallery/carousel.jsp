<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#demo{
		margin:10px auto;
		width:80%;
	}
	#demo img{
		width:100%;
	}
</style>

<h3>Gallery</h3>
<a href="gallery?mode=lightbox" 
	class="btn btn-primary btn-sm">lightbox ver.</a>
<hr />

<div id="demo" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ul class="carousel-indicators">
		<c:forEach var="image" items="${list}" varStatus="status">
				<li data-target="#demo" data-slide-to="${status.index}"
					<c:if test="${status.first}">class="active"</c:if>
				 ></li>
		</c:forEach>
	</ul>
	<!-- The slideshow -->
	<div class="carousel-inner">
		<c:forEach var="image" items="${list}" varStatus="status">
			<div class="carousel-item <c:if test="${status.first}">active</c:if>">
				<img src="image/${image.imageId}" alt="${image.title}"/>
	  		</div>
	  	</c:forEach>
	</div>
	
	<!-- Left and right controls -->
	<a class="carousel-control-prev" href="#demo" data-slide="prev">
	  <span class="carousel-control-prev-icon"></span>
	</a>
	<a class="carousel-control-next" href="#demo" data-slide="next">
	  <span class="carousel-control-next-icon"></span>
	</a>

</div>  




