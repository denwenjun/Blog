
<%@ page import="com.itdaima.common.config.Global" %>
<%
  String ctx = request.getContextPath();
  String adminPath = Global.getAdminPath();
  String frontPath = Global.getFrontPath();
  //response.sendRedirect(ctx + adminPath);
  response.sendRedirect(ctx + frontPath);
  //request.getRequestDispatcher(ctx + frontPath).forward(request,response);
%>
