<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="<%= request.getContextPath() %>/resources/css/common/reset.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/common/header.css" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <header id="header">
        <a href="<%= request.getContextPath() %>">
        <img class="Logo" src="<%= request.getContextPath() %>/resources/images/common/header/logo.png" alt="TM HOME">
        
        
        </a>
    
        <div class="search">
            <input type="text" placeholder="검색어를 입력해주세요.">
            <button>검색</button>
        </div>
        <div class="btnArea">
            <a href="<%= request.getContextPath() %>/login">로그인</a>
            <a href="<%= request.getContextPath() %>/memberjoin">회원가입</a>
            <a href="#">FAQ</a>
            <a href="#">장바구니</a>
        </div>
    </header>
    <nav id="nav">
        <ul>
           <li><a href="#">한식</a></li>
           <li><a href="#">양식</a></li>
           <li><a href="#">중식</a></li>
           <li><a href="#">일식</a></li>
           <li><a href="#">분식</a></li>
           <li><a href="#">양식</a></li>
           <li><a href="#">샐러드</a></li>
           <li><a href="#">리뷰</a></li>
           <li><a href="#">이벤트</a></li>
        </ul>
    </nav>
</div>
</body>
</html>