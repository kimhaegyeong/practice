<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="script.js"></script>

<h2> <%=page_input%> </h2>
<%
	request.setCharacterEncoding( "utf-8" );
%>

<jsp:useBean id="dto" class="member.LogonDataBean"/>
	<jsp:setProperty name="dto" property="*"/>

<%
	String zipcode = null;
	String zipcode1 = request.getParameter("zipcode1");
	String zipcode2 = request.getParameter("zipcode2");
	
	if (!zipcode1.equals("")
			&& !zipcode2.equals("")) {
		zipcode = zipcode1 + "-" + zipcode2;
	}
	dto.setZipcode(zipcode);
%>
<%
	String address = null;
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	
	if (!address1.equals("")
			&& !address2.equals("")) {
		address = address1 + " " + address2;
	}
	
	dto.setAddress(address);
%>
<%
	String tel = null;
	String tel1 = request.getParameter( "tel1" );
	String tel2 = request.getParameter( "tel2" );
	String tel3 = request.getParameter( "tel3" );
	if( ! tel1.equals( "" ) 
		&& ! tel2.equals( "" ) 
		&& ! tel3.equals( "" ) ) {
		tel = tel1 + "-" + tel2 + "-" + tel3;
	}	
	dto.setTel( tel );
%>
<%
	String email = null;
	String email1 = request.getParameter( "email1" );
	String email2 = request.getParameter( "email2" );
	if( ! email1.equals( "" ) && ! email2.equals( "" ) ) {
		if( email2.equals( "0" ) ) {
			// 직접입력
			email = email1;
		} else {
			// 선택입력
			email = email1 + "@" + email2;
		}
	}
	dto.setEmail( email );	
%>
<%
	LogonDBBean dao = LogonDBBean.getInstance();
	int result = dao.insertMember( dto );
	
	if( result == 0 ) {
		// 가입 실패
		%>
		<script type="text/javascript">
			<!--
			erroralert( inputerror );
			//-->
		</script>		
		<%
	} else {
		// 가입 성공
		response.sendRedirect( "loginForm.jsp" );	
	}	
%>