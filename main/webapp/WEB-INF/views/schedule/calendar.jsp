<%-- <%@page import="com.sun.glass.ui.Pixels.Format"%> --%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
//한달치를 디비에서! 한번에뽑아서!! 반복할때 뽑아놨던 데이터 하고!! 
//지금 실제우리가 반복하고있는 데이터의 날짜를 비교해서 똑같은 것들만 뿌려주면 된다.
//그러면 쿼리한번에 캘리더 한달치는 가져올수있다!

/*
Calendar 클래스는 추상 클래스로 생성자를 제공하지 않는다. 
따라서, 객체를 생성하기 위해 new 연산자를 사용할 수 없다.  
대신 getInstance() 메소드를 사용하여 현재 날짜와 시간의 객체를 얻어올 수 있다.
*/
Calendar tDay = Calendar.getInstance();

//마지막 날짜가 속한 주가 선택 월의 몇째 주인지 확인한다. 이렇게 하면 선택 월에 주가 몇번 있는지 확인할 수 있다.
//참고용>int weekNum = cal.get(Calendar.WEEK_OF_MONTH);

// Calendar 객체의 날짜를 마지막 날짜로 변경한다.
//참고용>cal.set(Calendar.DATE, lastNum);





/* 파라미터가 없다면 현재 년/월/일 구해옴 */
int y = (request.getParameter("y")==null) ?  
		tDay.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("y"));
int m = (request.getParameter("m")==null) ? 
		tDay.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("m"));
int d = tDay.get(Calendar.DATE);

/*
날자설정을 위한 객체생성 : 현재 년/월 그리고 1일로 설정, 즉 현재월의 1일로 설정한다.
*/
Calendar dSet = Calendar.getInstance();
dSet.set(y, m, 1);
//선택 월의 시작요일을 구한다. 
int yo = dSet.get(Calendar.DAY_OF_WEEK);


// 년, 월 , 일 구하기.
// 해당년도 return (get 의 반환형은 int)
int year = dSet.get(Calendar.YEAR);

// 월의 정보는 1월일 때는 0의 값으로 반환한다.
// 사용함에 있어서 +1을 해줘야한다.
int month = dSet.get(Calendar.MONTH)+1; 

// 현재월의 마지막 날자를 구해옴(7월:31일, 9월:30일 ... )
int last_day = dSet.getActualMaximum(Calendar.DATE);
%>

<!DOCTYPE html>
<html>
	<head>
		<title>캘린더</title>	
<!-- 상단 인클루드 -->
<%@ include file="/resources/include/top.jsp"%>

<!-- body 시작 -->
<body class="is-preload">

<!-- 캘린더CSS -->
<style>
.calendarTitle {
	font-weight: bold;
	font-size: 25px;
}
.Year {
	padding-left: 350px;
}
#buttonMove {
	padding-left: 750px;
	font-size: 10px;
}


.calendarTable {
	border: solid 2px #E8D9FF;
	text-align: right;
} 
.calendarTr {
	padding: 50px;
}
.calendarTh {
	text-align: center;
	padding: 5px;
	background: #E8D9FF;
}
.calendarTd {
	text-align: left;
	color: black;
	padding-top: 0;
	padding-left: 1;
	padding-bottom: 80px;
	border: solid 2px #E8D9FF; 
	font-size: 15px;
}
</style>
<!-- style태그끝! -->

<!-- 왼쪽메뉴 include -->
<jsp:include page="/resources/include/leftmenu_schedule.jsp"/><!-- flag구분예정 -->

<!-- 검색 인클루드 : 필요한분 쓰세요!!!!! -->
<%--<%@ include file="/resources/include/search.jsp"%> --%>


	<!-- 캘린더시작. -->
	<hr />
	<div id="main" class="col-lg-12 sidenav">
	
		<div class="calendarTitle" id="calendartop">
		 	<span class="Year">
 				<%=y%>년 <%=m +1%>월
 			</span>
 			<span id="buttonMove">
 					<%if(m > 0){ %>
					<a href="<c:url value='/schedule/calendar.jsp' />?y=<%=y%>&amp;m=<%=m-1 %>" class="button default small">
						<i class='fas fa-chevron-left'></i>
					</a>
					<%} else { %>
						<b>%lt;</b>
					<%} %>
					
					<%if(m < 11){ %>
					<a href="<c:url value='/schedule/calendar.jsp' />?y=<%=y%>&amp;m=<%=m+1%>" class="button default small">
						<i class='fas fa-chevron-right'></i>
					</a>
					<%} else {%>
						<b>&gt;</b>
					<%} %>

			</span>
		</div>

		<table class="calendarTable">
<%-- 						<colgroup>
							<col width="14.5%" />
							<col width="14.5%" />
							<col width="14.5%" />
							<col width="14.5%" />
							<col width="14.5%" />
							<col width="14.5%" />
							<col width="*" />
						</colgroup> --%>
			<tr class="calendarTr">
			<%
			String[] a = { "일", "월", "화", "수", "목", "금", "토" };
			for (int i = 0; i < 7; i++) {
			%>
				<th class="calendarTh"><%=a[i]%></th>
				<%
			}
			%>
			</tr>
			<tr>
			<%
			for (int k = 1; k < yo; k++) {
			%>
				<td class="calendarTd"></td>
			<% 
			}
			%>
			<%
			for (int j = 1; j <= last_day; j++) {
			%>
				<td class="calendarTd"><%=j%>
				<%if ((yo+j-1) % 7 == 0) {%></td>
			</tr>
			<tr>
			<%
				}
			}
			for(int e=1; e <(7-yo); e++) {
			%>
				<td class="calendarTd"></td>
			<% 
			}
			%>
			</tr>
		</table>
		
	</div><!-- main div끝 -->
	
<!-- #################################################################### -->

   	<jsp:include page="/resources/include/bottom.jsp" />	
</body>
		

<!-- 하단 인클루드 -->
<jsp:include page="/resources/include/footer.jsp" />

</html>