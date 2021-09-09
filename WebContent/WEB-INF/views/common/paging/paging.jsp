<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이징 영역</title>
<link href="<%= request.getContextPath() %>/resources/css/common/paging/paging.css" rel="stylesheet">
</head>
<body>
<ul>
	<li><a href="#"><img src="${ contextPath }/resources/images/common/paging/prev_disabled.png" alt=""></a></li>
	<li><a href="#">1</a></li>
	<li><a href="#">2</a></li>
	<li><a href="#">3</a></li>
	<li><a href="#">4</a></li>
	<li><a href="#">5</a></li>
	<li><a href="#">6</a></li>
	<li><a href="#">7</a></li>
	<li><a href="#">8</a></li>
	<li><a href="#">9</a></li>
	<li><a href="#">10</a></li>
	<li><a href="#"><img src="${ contextPath }/resources/images/common/paging/next_active.png" alt=""></a></li>
</ul>
</body>
</html>