<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

/*
	해당 페이지처럼 JSP코드를 포함한 파일을 include하려면
	지시어를 통해 include하는것이 좋다.
	액션태그를 사용하는 경우 머저 컴파일된 후 페이지에 삽입되므로 문제가 될 수 있다.
*/

// 글쓰기 페이지 진입전 로그인 되었는지 확인
if(session.getAttribute("USER_ID") == null){
	/*	- 특정 페이지로 진입할 시 세션이 없는 경우 로그인 페이지로 이동하게 되는데
			이 때, request객체를 통해 현재 진입하고자 하는 페이지의 URI를 얻어온다. 	*/
	String r_uri = request.getRequestURI();
%>
	<script>
		/* 	- 만약 로그인도지 않았다면 로그인 페이지로 이동함 
			- 단, 진입하려했던 페이지의 URI를 파라미터로 전달한다. 	*/
		alert("로그인 후 이용해주세요");
		location.href="<%=request.getContextPath()%>/member/login.do/";
	</script>
<%
	/* JS코드보다 JSP코드의 우선순위가 더 높으므로
		만약 if문 밑에 JSP코드가 존재한다면 JS코드가 실행도지 않는다.
		그러므로 if문을 벗어나지 못하도록 return을 걸어줘야 한다. */
	return;	// if문을 반드시 실행시키고 싶다면 return; 실행.
}
// 만약 jsp코드가 있다면 위의 js코드는 실행되지 않는다.
// ex) response.sendRedirect("다른페이지");
%>
