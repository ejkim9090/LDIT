<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<!-- 이모티콘 -->
<script src="https://kit.fontawesome.com/616f27e0c4.js" crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/ldit_header.css" /><!-- header css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/ldit_aside.css" /><!-- main css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/basic.css" /><!-- basic css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/projectadd.css" /><!-- projectadd css -->

<!-- jquery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>LDIT: 프로젝트 개설</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/ldit_header.jsp" %>
	<%@ include file="/WEB-INF/views/ldit_aside.jsp" %>
	<section>
        <div id="pjAdd">
            <h1>Project 개설</h1>
            <article>
                <form id="pjAddFrm" action="pjadd" method="post">
<!--                     <div class="textBox"><label>시작일</label></div>
                    <input type="date" id="startDate" name="projectStart"><br>
                    <div class="textBox"><label>종료일</label></div>
                    <input type="date" id="endDate" name="projectEnd"><br> -->
                    <div class="textBox" id="calendar">
                    	<label>시작일</label>
                    	<input type="date" id="startDate" name="projectStart">
                    	<label>종료일</label>
                    	<input type="date" id="endDate" name="projectEnd">
                   	</div>
                   	<br>
                    <div class="textBox" id="pjTitle">
                    	<label>프로젝트명</label>
                    	<input type = "text" name = "stf_name" class = "stf_name_input" id = "stf_name_input" placeholder="제목을 입력해주세요">
                    </div>
                    <br>
                    <div class="textBox" id="pjTm">
                    	<label>프로젝트 TM</label>
						<input type = "text" name = "stf_name" class = "stf_name_input" id = "stf_name_input" placeholder="이름으로 검색해주세요">
                    	<button type="submit" id="submitAddBtn">검색</button>
                    </div>
                    <br>
                    <div class="textBox" id="pjContent">
                    	<label>프로젝트 내용</label>
                    	<input type = "text" name = "stf_no" class = "stf_no_input" id = "stf_no_input" placeholder="내용을 입력해주세요">
                    </div>
                    <br>
                    <div id="submitBtn">
	                    <button type="submit" id="submitAddBtn">개설</button>
	                    <button type="submit" id="submitCancelBtn">취소</button>
                    </div>
                </form>
            </article>
        </div>
    </section>
</body>
</html>