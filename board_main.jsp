<%@ page contentType="text/html;charset=UTF-8" %> <!--jsp가 생성할 문서의 타입을 지정-->
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>

<HTML>

  <HEAD>
    <%
      String r_id = request.getParameter("id");
      request.setCharacterEncoding("UTF-8");
      Cookie[] cookies=request.getCookies();

      //자동로그인, 로그인 알림 표시
      if(cookies!=null) //쿠키가 널이 아닐때
      {
        for(int i=0;i<cookies.length;i++)
        {
            String id=cookies[i].getValue(); //쿠키의 값을 저장
            if(id.equals("admin")) //자동로그인을 유지를 위한 if문
            {
                out.println(id+"님 안녕하세요.");
                out.println("<br>Cookie : "+cookies[i]);
                break;
            }
            else
            {
              out.println(id+"님 환영합니다.");
              break;
            }
        }
      }
      %>
    <TITLE>
    </TITLE>
  </HEAD>

  <BODY>
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <nav id='topMenu'>
      <ul>
        <li><A class="menuLink" href = "board_signup.html">[회원가입] </A></li>
        <li><A class="menuLink" href = "board_list.jsp">[게시판조회] </A></li>
        <li><A class="menuLink" href = "board_write.html">[게시글작성] </A></li>
        <li><A class="menuLink" href = "board_login.html">[로그인] </A></li>
        <li><A class="menuLink" href = "board_logout.jsp">[로그아웃] </A></li>
        <li><A class="menuLink" href = "board_update_pw.html">[비밀번호 수정] </A></li>
      </ul>
    </nav>
  </BODY>
</HTML>
