<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
  String id = request.getParameter("id");
  String new_pw = request.getParameter("new_pw");
  String blockCSRF= request.getHeader("referer");
  if (blockCSRF==null)
  {
    blockCSRF="";
  }

  String sql = null;
  Connection con = null;
  Statement st = null;
  ResultSet rs = null;
  int cnt = 0;

  try
  {
    Class.forName("com.mysql.jdbc.Driver");
  } catch (ClassNotFoundException e){
    out.println(e.getMessage()+"<br>");
  } //DB연결

  if(blockCSRF.equals("http://localhost:8080/jsp/brdProject/board_update_pw.html") || !(blockCSRF.equals("")))
  {
    try
    {
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/board?serverTimezone=UTC&useUnicode=true&charaterEncoding=euckr","root","root");
      st = con.createStatement();

      sql = "update freeboard_login set pw='"+new_pw+"' where id='"+id+"'";
      cnt = st.executeUpdate(sql);

      if(cnt > 0)
        out.println("비밀번호 수정에 성공하였습니다.");
      else
        out.println("비밀번호 수정에 실패하였습니다.");
      st.close();
      con.close();
    } catch (SQLException e)
    {
      out.println(e);
    }
  }else
  {
    out.println("올바른 접근이 아닙니다.");
  }

%>

<br><A href = "board_main.jsp">[메인으로] </A>
