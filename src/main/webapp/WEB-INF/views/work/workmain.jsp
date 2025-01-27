<%@page import="java.util.List"%>
<%@page import="com.mycompany.ldit.work.model.vo.Work"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<!-- 이모티콘 -->
<script src="https://kit.fontawesome.com/616f27e0c4.js"
	crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/ldit_header.css" />
<!-- header css -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/ldit_aside.css" />
<!-- main css -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/basic.css" />
<!-- basic css -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/workmain.css" />
<!-- workmain css -->

<!-- jquery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- calendar -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/ldit_header.jsp"%>
	<%@ include file="/WEB-INF/views/ldit_aside.jsp"%>

	<section>
		<!-- 일자 클릭시 메뉴오픈 -->
		<div id="contextMenu" class="dropdown clearfix">
			<ul class="dropdown-menu dropNewEvent" role="menu"
				aria-labelledby="dropdownMenu"
				style="display: block; position: static; margin-bottom: 5px;">
				<li><a tabindex="-1" href="#">업무 등록</a></li>
				<li class="divider"></li>
				<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
			</ul>
		</div>
		<div id="calendarCon">
			<div id='calendar'></div>
		</div>
		<!-- 업무 등록 모달 -->
		<div id="workAddModal">
			<div class="modal-content">
				<div class="container">
					<div id="workCon">
						<span onclick="closeModal()" id="cancleBtn"><i
							class="fas fa-times"></i></span>
						<h1 class="workH1" id="modalAddTitle">업무 등록</h1>
						<form id="workAddFrm" action="workadd" method="post">
							<div id="workGrid">
								<label>업무 제목</label> <input id="workTitle" name="workTitle"
									required="required"> <label>업무 내용</label>
								<textarea rows="5" id="workContent" name="workContent"
									required="required"></textarea>
								<label>업무 시작일</label> <input type="date" id="workStart"
									name="workStart"> <label>업무 마감일</label> <input
									type="date" id="workEnd" name="workEnd"> <label>업무
									상태</label> <select id="workFinish" name="workFinish">
									<option value="0">업무 진행중</option>
									<option value="1">업무 완료</option>
								</select>
							</div>
							<button type="submit" id=submitBtn>등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 업무 조회 모달 -->
		<div id="workSelectModal">
			<div class="modal-content">
				<div class="container">
					<div id="workCon">
						<span onclick="closeSelectModal()" id="cancleBtn"><i
							class="fas fa-times"></i></span>
						<h1 class="workH1" id="modalSelectTitle">업무 등록</h1>
						<div id="workSelectGrid">
							<p class="workFont">업무 제목</p>
							<p id="workTitleCheck"></p>
							<p class="workFont">업무 내용</p>
							<p id="workContentCheck"></p>
							<p class="workFont">업무 시작일</p>
							<p id="workStartCheck"></p>
							<p class="workFont">업무 마감일</p>
							<p id="workEndCheck"></p>
							<p class="workFont">업무 상태</p>
							<p id="workFinishCheck"></p>
						</div>
						<hr class="clear">
					</div>
				</div>
			</div>
		</div>
		<!-- 업무 수정 모달 -->
		<div id="workUpdateModal">
			<div class="modal-content">
				<div class="container">
					<div id="workCon">
						<span onclick="closeUpdateModal()" id="cancleBtn"><i
							class="fas fa-times"></i></span>
						<h1 class="workH1" id="modalAddTitle">업무 수정</h1>
						<form id="workAddFrm" action="updatework" method="post">
							<div id="workGrid">
								<label>업무 제목</label> <input id="workTitleUpdate" name="workTitle"
									required="required"> <label>업무 내용</label>
								<textarea rows="5" id="workContentUpdate" name="workContent"
									required="required"></textarea>
								<label>업무 시작일</label> <input type="date" id="workStartUpdate"
									name="workStart"> <label>업무 마감일</label> <input
									type="date" id="workEndUpdate" name="workEnd"> <label>업무
									상태</label> <select id="workFinishUpdate" name="workFinish">
									<option value="0">업무 진행중</option>
									<option value="1">업무 완료</option>
								</select>
							</div>
							<button type="submit" id=submitBtn>등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var activeInactiveWeekends = true;
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				locale : 'ko',
				headerToolbar : {
					start : "",
					center : "prev title next",
					end : 'dayGridMonth,dayGridWeek,dayGridDay'
				},
				titleFormat : function(date) {
					return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
				},
				dayHeaderContent : function(date) {
					let weekList = [ "일", "월", "화", "수", "목", "금", "토" ];
					return weekList[date.dow];
				},
				selectable : true,
				droppable : true,
				editable : true,
				events : [ 
					<%List<Work> workList = (List<Work>) request.getAttribute("workList");%>
					<%if (workList != null) {%>
						<%for (Work vo : workList) {%>
						{
							id : '<%=vo.getWorkId()%>',
							title : '<%=vo.getWorkTitle()%>',
							start : '<%=vo.getWorkStart()%>',
							end : '<%=vo.getWorkEnd()%>',
							color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
						},
					<%}
}%>
				],
				eventClick : function(info) {
		    		$.ajax({
		    			url:"getworkdetail.do",
		    			data:{"workId": info.event._def.publicId},
		    			contentType: 'application/json; charset=utf-8',
		    			type: "GET",
		    			dataType: "json",
		    			success: function(result){
		    				if(result.stfNo == ${loginUser.stfNo}){
		    					$(".workReBtn").remove();
		    					$("#modalSelectTitle").append(" <a href='#' class='workReBtn' onclick='deleteWork("+result.workId+")'><i class='far fa-calendar-times'></i></a>")
		    					$("#modalSelectTitle").append(" <a href='#' class='workReBtn' onclick='updateWork("+result.workId+")'><i class='fas fa-sync-alt'></i></a>")
		    				}
		    				$("#workTitleCheck").text(result.workTitle);
		    				$("#workContentCheck").text(result.workContent);
		    				$("#workStartCheck").text(result.workStart);
		    				$("#workEndCheck").text(result.workEnd);
		    				$("#workFinishCheck").text(result.workFinish);
		    				
		    				$("#workTitleUpdate").append("<input type='hidden' value='"+result.workId+"' name='workId'>");
		    				$("#workTitleUpdate").val(result.workTitle);
		    				$("#workContentUpdate").text(result.workContent);
		    				$("#workStartUpdate").val(formatSqlDate(result.workStart));
		    				$("#workEndUpdate").val(formatSqlDate(result.workEnd));
		    				$("#workFinishUpdate").val(result.workFinish);
		    				var wf;
		    				if(result.workFinish == 0){
		    					wf = "업무 진행중";
		    				}else if(result.workFinish == 1){
		    					wf = "업무 완료";
		    				}
		    				$("#workFinishCheck").text(wf);
		    				$("#workSelectModal").show();
		    			},
		    			error : function(e) {
		    				alert("code:"+e.status+"\n"+"message:"+e.responseText+"\n"+"error:"+e);
				        }
		    		})
				},
				select : function(start, end, jsEvent, view, info) {
					$(".fc-daygrid").unbind('click');
					$(".fc-daygrid").on('click', function(e) {
						$("#contextMenu").addClass("contextOpened").css({
							display : "block",
							left : e.pageX,
							top : e.pageY
						});
						return false;
					});
					//console.log(start.startStr);
					//console.log(start.endStr);
					//start = moment(start).format('YYYY-MM-DD HH:mm');
					//end = moment(end).format('YYYY-MM-DD HH:mm');
					//console.log(start);
					//console.log(end);

					//날짜 클릭시 카테고리 선택메뉴
					$("#contextMenu").on("click", "a", function(e) {
						e.preventDefault();

						//닫기 버튼이 아닐때
						if ($(this).data().role !== 'close') {
							newEvent(start, end, $(this).html());
						}

						$("#contextMenu").removeClass("contextOpened");
						$("#contextMenu").hide();
					});

					$('body').on('click', function() {
						$("#contextMenu").removeClass("contextOpened");
						$("#contextMenu").hide();
					});

				}
			});
			calendar.render();
		});
		function closeModal() {
			$("#workAddModal").css("display", "none");
		}
		function closeSelectModal() {
			$("#workSelectModal").css("display", "none");
		}
		function closeUpdateModal() {
			$("#workUpdateModal").css("display", "none");
		}
		function deleteWork(workId) {
			var con = confirm("삭제 후 되돌릴 수 없습니다. 계속 진행하시겠습니까?");
			if(con == true){
				$.ajax({
					url:"deletework.do",
					data:{"workId": workId},
					contentType: 'application/json; charset=utf-8',
					type: "GET",
					dataType: "json",
					success: function(result){
						if(result > 0){
							alert("업무를 삭제하였습니다.");
							$("#workSelectModal").css("display", "none");
							window.location.reload();
						}
					},
					error : function(e) {
						alert("code:"+e.status+"\n"+"message:"+e.responseText+"\n"+"error:"+e);
					}
				})
			}
		}
		function updateWork(workId) {
			$("#workSelectModal").css("display", "none");
			$("#workUpdateModal").css("display", "block");
		}
		function formatSqlDate(date) {
    		month = date.split("월")[0];
    		day = date.split("월 ")[1].split(",")[0];
    		year = date.split(", ")[1];
    		if (month.length < 2)
    			month = '0' + month;
    		if (day.length < 2)
    			day = '0' + day;
    		return [year, month, day].join('-');
    	}
	</script>
	<script src="<%=request.getContextPath()%>/resources/js/addWork.js"></script>
</body>
</html>