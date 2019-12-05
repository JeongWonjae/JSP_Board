<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  String name = request.getParameter("name");
  String email = request.getParameter("mail");

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


  try
  {
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/board?serverTimezone=UTC&useUnicode=true&charaterEncoding=euckr","root","root");
    st = con.createStatement();

    sql = "insert into freeboard_login values('"+id+"', '"+pw+"', '"+name+"', '"+email+"')";
    cnt = st.executeUpdate(sql);

    if(cnt > 0)
      out.println("가입에 성공하였습니다.");
    else
      out.println("가입에 실패하였습니다.");
    st.close();
    con.close();
  } catch (SQLException e)
  {
    out.println(e);
  }
%>

<br><A href = "board_main.jsp">[메인으로] </A>
