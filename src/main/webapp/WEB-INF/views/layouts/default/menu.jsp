<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/" var="root" />

<style>
.menu {
	background: navy;
	padding: 5px 20px;
	overflow: hidden;
}

#left-menu {
	float: left;
	color: white;
}

#right-menu {
	float: right;
	color: white;
}

.menu div a {
	color: white;
}

ul>li {
	hover: pointer;
}
</style>

<div class="menu">
	<div id="left-menu">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link" href="${root}"><i class="fa fa-home"></i>HOME</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${root}gallery/lightbox">
					<i class="fa fa-images"></i>GALLERY</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${root}gallery/flickr">
					<i class="fa fa-images"></i>Flickr</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${root}admin/member/list">
					회원관리</a>
			</li>
		</ul>
	</div>
	<div id="right-menu">
		<c:choose>
			<c:when test="${empty USER}">
				<ul>
					<li><a href="${root}join"><i class="fa fa-user"></i>&nbsp;회원가입</a></li>
					<li><a href="${root}login"><i class="fa fa-sign-in-alt"></i>&nbsp;로그인</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li><a href="${root}member/profile"><i class="fa fa-user"></i>&nbsp;&nbsp;${USER.userId}님</a></li>
					<li><a href="${root}logout"><i class="fa fa-sign-out-alt"></i>&nbsp;로그아웃</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<hr />