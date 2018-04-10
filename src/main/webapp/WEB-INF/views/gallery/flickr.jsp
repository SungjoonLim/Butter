<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:url value="/resources/js/FlickrApi.js" var="flickr"/>
<script src="${flickr}"></script>
<script>
$(function(){
	var api=new FlickrApi();
	//api.getRecent('superman');
	api.search('superman');
	$('#search').click(function(){
		var keyword = $('#keyword').val();
		api.search(keyword);
	});
	
});
</script>


<div class="container">
	<h2>Flickr Gallery!</h2>
	<div class="mb-4">
		<input type="text" id="keyword">
		<button id="search">검색</button>
	</div>
	<div class="row" id="panel">
	</div>
</div>

