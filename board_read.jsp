<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="java.sql.*,java.util.*"%>

<HTML>
  <HEAD>
    <TITLE>글 조회</TITLE>
  </HEAD>

  <BODY>
    <%
      String sql=null;
      Connection con=null;
      Statement st=null;
      ResultSet rs=null;

      int id=Integer.parseInt(request.getParameter("id")); //id 파라미터를 받음

      try {
        Class.forName("com.mysql.jdbc.Driver");
      } catch (ClassNotFoundException e) {
        out.println(e);
      }

      try {
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/board?serverTimezone=UTC&useUnicode=true&charaterEncoding=euckr","root","root");
      } catch (SQLException e){
        out.println(e);
      }

      try {
        st=con.createStatement();
        rs=st.executeQuery("select * from freeboard where id="+id);
        if (!(rs.next()))
        {
          out.println("해당 내용이 없습니다.");
        } else
        {
          out.println("<FORM name='read'><FIELDSET STYLE = 'width:500'><legend>"+rs.getString("id")+"번 글</legend>");
          out.println("제목 : "+rs.getString("subject")+"<br></a>");
          out.println("작성자 : "+rs.getString("name")+"<br>");
          out.println("내용 : "+rs.getString("content"));
          out.println("</FIELDSET></FORM><br>");
        }
      } catch (SQLException e)
      {
        out.println(e);
      }
    %>
  </BODY>
</HTML>
















<!---->
