<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty sessionScope.name && empty sessionScope.pass}">
	<jsp:forward page="login.jsp" />
</c:if>

<c:if test="${empty param.q}">
	<jsp:forward page="index.jsp" />
</c:if>

<c:set var="postid" value="${param.q}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New Post</title>
<link rel="shortcut icon" type="image/x-icon"
	href="Resources/megaphone.ico">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>

</head>
<body>
	<!-- I include header and top-menu separately because the other web pages also need to have both of them 
		so don't need to do again one more time
	-->
	<jsp:include page="header.jsp" />

	<jsp:include page="top-menu.html" />
	<br />
	<br />
	<div class="container">
		<c:if test="${not empty List}">
			<div class="well"
				style="border-bottom: 5px solid #126758; background-color: #f2f2f2;">
				<h2>${List.get(0).get_post_topic()}</h2>
				<p>
					<small style="color: #9999ff; font-size: 13px;">&emsp;<span
						class="fa fa-star"></span>&emsp;submitted in
						&nbsp;${List.get(0).get_post_date()}
						&nbsp;by&nbsp;${List.get(0).get_post_username()}
					</small>
				</p>
				<p>${List.get(0).get_post_content()}</p>
				<br>
			</div>
			<br />
			<br />
			<div class="row">
				<div class="col-sm-6">
					<form action="postcomment" method="post">
						<input type="hidden" name="postid" value="${postid}">
						<div class="form-group">
							<label for="content">Add your comment:</label>
							<textarea class="form-control" rows="9" maxlength="1000"
								name="content" required="required" id="content"></textarea>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-md"
								style="width: 86px !important;">Comment</button>
							&nbsp;
							<button type="reset" class="btn btn-primary btn-md"
								style="width: 86px !important;" value="Reset">Cancel</button>
						</div>

					</form>
				</div>
			</div>
			<br />
			<hr style="color: #123455;">
			<div>
				<h3>${total}&nbsp;Comments</h3>
			</div>
			<br />
			<br />

			<c:forEach items="${List}" var="list">
				<c:if
					test="${not empty list.get_comment_content() || not empty list.get_comment_username() || not empty list.get_comment_date()}">
					<div class="well" style="background-color: hsl(0, 0%, 96%);">
						<div class="media">
							<div class="media-left"></div>
							<div class="media-body">

								<h4 class="media-heading">${list.get_comment_username()}
									<c:if
										test="${ list.get_comment_username() eq list.get_post_username()}">
										<small style="color: #8080ff;">(Author)</small>
									</c:if>
									<small><i>&emsp;&emsp;${list.get_comment_date()}</i></small>
								</h4>
								<p>${list.get_comment_content()}</p>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</c:if>
	</div>
	<br />
	<br />
	<br />
	<br />
	<jsp:include page="footer.jsp" />
</body>
</html>