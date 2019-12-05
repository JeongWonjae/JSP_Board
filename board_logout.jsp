<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
  Cookie[] cookies=request.getCookies(); //요청에서 퀴를 가져옴

  if(cookies!=null)
  {
    for(int i=0; i<cookies.length; i++)
    {
      if(cookies[i].getValue().equals("justv95"))
      {
        cookies[i].setMaxAge(0);
        response.addCookie(cookies[i]); //수정한 쿠키를 응답에 추가
        break;
      }
      else
      {
        cookies[i].setMaxAge(0);
        response.addCookie(cookies[i]); //수정한 쿠키를 응답에 추가
        break;
      }
    }
  }

  response.sendRedirect("board_login.html");

%>
