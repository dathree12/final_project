<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>책검색</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
    <script src="${ path }/js/jquery-3.5.1.js"></script>
</head>
<body>
	<h3>책검색</h3>
	<input id="bookName" value="" type="text">
    <button id="search">검색</button>
    <div id="bookdata">
    	<p id="bookisbn"name="bookisbn" style="display:none"></p>
    	<p id="title" name="title"></p>
    	<p id="bookthumb"name=""></p>
    </div>
    <script>
        $(document).ready(function () {
            $("#search").click(function () {
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book?target=title",
                    data: { query: $("#bookName").val() },
                    headers: { Authorization: "KakaoAK 954b12f5b02d89c0024a777f0dab5148" }
                })
                    .done(function (msg) {
                    	console.log(msg.documents[0].isbn);
                        console.log(msg.documents[0].title);
                        console.log(msg.documents[0].thumbnail);
                        //책ISBN불러오기
                        $("#title").append( msg.documents[0].title);
                        $("#bookthumb").append("<img src='" + msg.documents[0].thumbnail + "'/>");
                        $("#bookisbn").append( msg.documents[0].isbn);
                    });
               
            });
            
        });
    </script>
   
    <script>
    $(document).ready(function () {
        $("#bookdata").click(function () {
        	var booktitle = document.getElementById("title").innerText;
        	var bookisbn = document.getElementById("bookisbn").innerText;
        	
        	console.log(booktitle)
        	
        	opener.window.document.getElementById("selectedBook").innerText = booktitle;
        	opener.window.document.getElementById("bookIsbn").innerText = bookisbn;
        	opener.window.document.getElementById("bookIsbn").innerText = bookisbn;
 			
        	 window.open('','_self').close();  
        });
    });  
        
    		
    </script>
</body>
</html>