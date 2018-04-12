<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/" var="root" />

<style>
.navbar {
	z-index: 1;
}
</style>

<!--Main Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark black">
	<div class="container">
		<a class="navbar-brand" href="#"><i class="fa fa-bars"></i> <strong>BuTTer</strong></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="float-left" id="left-menu">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="${root}"><i
						class="fa fa-home"></i>&nbsp;Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${root}gallery/lightbox"> <i class="fa fa-images"></i>&nbsp;GALLERY</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${root}gallery/flickr"> <i class="fa fa-images"></i>&nbsp;Flickr</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${root}admin/member/list"> &nbsp;회원관리</a>
				</li>
			</ul>
		</div>
		<div class="float-right" id="right-menu">
			<c:choose>
				<c:when test="${empty USER}">
					<ul class="nav navbar-nav nav-flex-icons ml-auto">
						<li class="nav-item">
							<a href="${root}join"><i class="fa fa-user"></i> 회원가입</a>
						</li>
						&nbsp;&nbsp;
						<li class="nav-item"><a href="${root}login">
							<i class="fa fa-sign-in-alt"></i> 로그인</a>
						</li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav nav-flex-icons ml-auto">
						<li class="nav-item">
							<a href="${root}member/profile">
								<i class="fa fa-user"></i> ${USER.userId}님
							</a>
						</li>
						&nbsp;&nbsp;
						<li class="nav-item">
							<a href="${root}logout">
								<i class="fa fa-sign-out-alt"></i> 로그아웃
							</a>
						</li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
</nav>

<!--Main Navigation-->
<hr />