<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@include file="pass.jsp" %>
<%
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

java.sql.Connection cox;
java.sql.Statement st,st1;
java.sql.ResultSet rs,rs1;
cox=null;
st=null;
rs=null;

String sql="";
request.setCharacterEncoding("UTF8");
int idd=Integer.parseInt(request.getParameter("id"));
try{
Class.forName("net.sourceforge.jtds.jdbc.Driver");
cox = java.sql.DriverManager.getConnection(url, id, pass);
}catch(ClassNotFoundException cnfex){  cnfex.printStackTrace(); }

    try {
	sql = "EXEC N_Execute_Aqti ?";   
	java.sql.CallableStatement ps = cox.prepareCall(sql);
	ps.setInt(1, idd);
	ps.execute();
	out.print("OK");
      }
     catch (Exception e) {         e.printStackTrace();      }

%>
