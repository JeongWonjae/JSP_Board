<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>

<HTML>
  <HEAD>
    <TITLE>게시글 조회</TITLE>
  </HEAD>

  <BODY>
    <CENTER>
    <%
      int id=0;
      String em=null;
      Connection con=null;
      Statement st=null;
      ResultSet rs=null;
      Vector keyid=new Vector();

      try {
        Class.forName("com.mysql.jdbc.Driver");
      } catch (ClassNotFoundException e){
        out.println(e);
      }

      try {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/board?serverTimezone=UTC&useUnicode=true&charaterEncoding=euckr","root","root");
      } catch (SQLException e){
        out.println(e);
      }

      try
      {
        st=con.createStatement();
        rs=st.executeQuery("select * from freeboard order by id desc"); //내림차순으로 게시글 조회
        if (!(rs.next()))
        {
          out.println("게시판에 올린 글이 없습니다.");
        } else
        {
          do
          {
            keyid.addElement(new Integer(rs.getInt("id")));

            out.println("<FORM name='list'><FIELDSET STYLE = 'width:200'><legend>"+rs.getString("id")+"번 글</legend>");
            out.println("<a href=board_read.jsp?id="+rs.getString("id")+"> 제목 : "+rs.getString("subject")+"<br></a>");
            out.println("작성자 : "+rs.getString("name"));
            out.println("</FIELDSET></FORM><br>");
          } while(rs.next()); //값이 없을때까지 반복
          rs.close();
        }
        st.close();
        con.close();
      } catch (SQLException e)
      {
        out.println(e);
      }
    %>
    </CENTER>
  </BODY>
</HTML>






























<!---->
