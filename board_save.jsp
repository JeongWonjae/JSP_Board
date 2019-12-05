<%@ page contentType="text/html;charset=UTF-8" %> <!--jsp가 생성할 문서의 타입을 지정-->
<%@page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
  String uploadPath=application.getRealPath("brdProject/upload");
  MultipartRequest multi=new MultipartRequest(request, uploadPath, 1024*1024*10, "utf-8", new DefaultFileRenamePolicy()); //파일 업로드

  String name = multi.getParameter("name"); //파라미터 변수 name에 저장된 변수를 얻어내는 메소드
  String mail = multi.getParameter("mail");
  String subject = multi.getParameter("subject");
  String content = multi.getParameter("content");
  String password = multi.getParameter("password");
  int id = 1;

  if(content.length()==1)
  {
    content=content+" ";
  } //본문의 내용길이가 1이면 공백을 더함

  java.util.Date yymmdd = new java.util.Date();
  SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-dd hh:mm a");
  String ymd = myformat.format(yymmdd);

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
    sql="select max(id) from freeboard";
    rs = st.executeQuery(sql); //현재 테이블에 최대 id값 뽑기
    if(!(rs.next()))
      id = 1;
    else{
      id = rs.getInt(1) + 1; //현재 id값에 1을 더함
      rs.close();
    }

    sql = "insert into freeboard values("+id+", '"+name+"', '"+password+"', '"+mail+"', '"+subject+"', '"+content+"', '"+ymd+"', "+id+", 0, 0, 0)";
    cnt = st.executeUpdate(sql);

    if(cnt > 0)
    {
      out.println("데이터가 성공적으로 입력되었습니다.<br>");
      if(multi!=null)
      {
        out.println("파일이 성공적으로 업로드 되었습니다.<br>파일 경로 : "+uploadPath+"\\");
      }
    } else
    {
      out.println("데이터가 입력되지 않았습니다.");
    }
    st.close();
    con.close();
  } catch (SQLException e)
  {
    out.println(e);
  }
 %>

 <br><A href = "board_list.jsp">[게시판으로] </A>
