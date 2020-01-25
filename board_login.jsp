<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");

  String sql = null;
  Connection con = null;
  Statement st = null;
  PreparedStatement pstmt=null;
  ResultSet rs = null;
  int cnt = 0;

  try
  {
    Class.forName("com.mysql.jdbc.Driver");
  } catch (ClassNotFoundException e)
  {
    out.println(e.getMessage()+"<br>");
  } //DB연결


  try
  {
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/board?serverTimezone=UTC&useUnicode=true&charaterEncoding=euckr","root","root");

    sql = "select * from freeboard_login where id='"+id+"' and pw='"+pw+"'";
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);

    if(rs.next())
    {
      out.println("<SCRIPT Language='javascript'>alert('로그인에 성공하였습니다.')</SCRIPT>");
      out.println("Hello "+rs.getString("id")+"!");
      Cookie cookie=new Cookie("ck_id", rs.getString("id"));
      cookie.setMaxAge(60*60);
      response.addCookie(cookie);
      response.sendRedirect("board_main.jsp");
    }
    else
    {
      out.println("<SCRIPT Language='javascript'>alert('로그인에 실패하였습니다.')</SCRIPT>");
    }


/* //시큐어 코딩
    sql = "select * from freeboard_login where id=? and pw=?";
    pstmt=con.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, pw);
    rs = pstmt.executeQuery();

    if(!(rs.next()))
    {
        out.println("로그인 정보가 일치하지 않습니다.");
    }
    else
    {
      if(id.equals(rs.getString("id")))
      {
        if(pw.equals(rs.getString("pw")))
        {
            out.println("<SCRIPT language='javascript'>alert('로그인에 성공하였습니다.')</SCRIPT>");
            out.println("로그인에 성공하였습니다.");
            Cookie cookie=new Cookie("ck_id", id);
            cookie.setMaxAge(60);
            response.addCookie(cookie);
            response.sendRedirect("board_main.jsp");
        }
        else
        {
            out.println("<SCRIPT language='javascript'>alert('로그인 정보가 일치하지 않습니다.')</SCRIPT>");
        }
      }
      else
      {
        out.println("<SCRIPT language='javascript'>alert('로그인 정보가 일치하지 않습니다.')</SCRIPT>");
      }
    }
*/
  } catch (SQLException e)
  {
    out.println(e);
  }
%>

<br><A href = "board_main.jsp">[메인으로] </A>
<br><A href = "board_login.html">[다시로그인] </A>
