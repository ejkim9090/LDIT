<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside>
	<!--여기 작성 2-->
	
	
	<button class="accordion">일정</button>
          <div class="panel">
              <a href="#"></a>
          </div>
  
          <button class="accordion">프로젝트       <i class="fas fa-angle-down"></i> </button>
          <div class="panel">
              <p id="pd1">프로젝트 개설</p>
              <p id="pd1">고객 요구사항</p>
              <p id="pd1">이슈</p>
              
          </div>
  
          <button class="accordion">근무계획       <i class="fas fa-angle-down"></i> </button>
          <div class="panel">
              <p id="pd1">근무계획2</p>
              <p id="pd1">근무계획3</p>
              <p id="pd1">근무계획1</p>
  
          </div>
  
          <button class="accordion">조직도</button>
          <div class="panel">
              <a href="#"></a>
          </div>
  
          <button class="accordion">쪽지       <i class="fas fa-angle-down"></i> </button>
          <div class="panel"  >
              <p id="pd1">쪽지보내기</p>
              <p id="pd1">보낸 쪽지 확인</p>
              <p id="pd1">받은쪽지 확인</p>
              <p id="pd1">쪽지 폴더 등록</p>
          </div>
  
          <button class="accordion">전자결재</button>
          <div class="panel">
              <a href="#"></a>
          </div>
          <script>
           /*
           var acc = document.getElementsByClassName("accordion");
              var i;
  
              for (i = 0; i < acc.length; i++) {
                  acc[i].addEventListener("click", function () {
                      this.classList.toggle("active");
                      var panel = this.nextElementSibling;
                      if (panel.style.display === "block") {
                          panel.style.display = "none";
                      } else {
                          panel.style.display = "block";
                      }
                  });
              }
           */   
           
           
           $(document).ready(function(){
        	   // 제일 첫번째 아코디언 메뉴 버튼을 클릭한다.
        	   //$(".accordion").eq(0).trigger("click");
        	   
        	   /* 
        	   // 버튼의 색상 변경 (선택을 안 한 것처럼)
        	   $(".accordion").removeClass("active");
        	   
        	   // 모든 서브 메뉴 접기
        	   $(".panel").hide();
        	   // $("ul > li:first-child a").next().show();
        	   */
        	   
        	   // 아코디언 메뉴 버튼을 클릭할 때 실행
        	   $(".accordion").click(function(){
            	   $(".accordion").removeClass("active"); 
        	       $(this).addClass("active");
        	       
        	       $(this).next().slideToggle(300);
        	       // $(this).next().slideDown(300);
        	       $(".accordion").not(this).next().slideUp(300);
        	       
        	       return false;
        	   });

        	 });
          </script>
	
</aside>