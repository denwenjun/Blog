<%@ page import="com.personal.blog.config.Global" %>
<%
  String ctx = request.getContextPath();
	String adminPath = Global.getAdminPath();
  String frontPath = Global.getFrontPath();
  response.sendRedirect(ctx + frontPath);
%>