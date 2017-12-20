<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/front/include/taglib.jsp" %>
<html>
<head>
  <meta name="decorator" content="admin_boostrap3"/>
  <title>文章管理</title>
  <script src="${ctxStatic}/common/itdaima.min.js" type="text/javascript"></script>
  <script type="text/javascript">
    function page(n, s) {
      $("#pageNo").val(n);
      $("#pageSize").val(s);
      $("#searchForm").submit();
      return false;
    }
  </script>
</head>
<body>
<ul class="nav nav-tabs">
  <li class="active"><a href="${ctxAdmin}/sys/article/">文章列表</a></li>
</ul>
<form:form id="searchForm" modelAttribute="model" action="${ctxAdmin}/sys/article" method="post" class="breadcrumb form-search form-inline">
  <sys:message content="${message}"/>
  <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
  <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
  <label>标题：</label> <form:input path="title" cssClass="form-control"></form:input>
  &nbsp;
  <label>文章类型：</label>
  <form:select path="articleType">
    <form:option value="" label="请选择"/>
    <c:forEach items="${atricleType}" var="atricleType">
      <form:option value="${atricleType.value}" label="${atricleType.label}"/>
    </c:forEach>
  </form:select>
  &nbsp;
  <label>状态：</label>
  <form:select path="isAuditing">
    <form:option value="" label="请选择"/>
      <c:forEach items="${isAuditingType}" var="isAuditingType">
        <form:option value="${isAuditingType.value}" label="${isAuditingType.label}"/>
      </c:forEach>
  </form:select>
  &nbsp;
  <button type="submit" class="btn btn-success">查询</button>
</form:form>
  <table class="table table-bordered table-condensed" style="font-size: 15px;">
    <tr>
      <th>标题</th>
      <th>模块类型</th>
      <th>所属用户</th>
      <th>状态</th>
      <th>操作</th>
    </tr>
    <c:forEach items="${page.list}" var="article">
      <tr>
        <td>${article.title}</td>
        <td>
          <c:if test="${article.type == 'blog'}">
            博客
          </c:if>
          <c:if test="${article.type == 'share'}">
            分享
          </c:if>
          <c:if test="${article.type == 'talk'}">
            问答
          </c:if>
        </td>
        <td>${article.user.loginName}</td>
        <td>
          <c:if test="${article.isAuditing == '0'}">
            <span style="color: red;">未审核</span>
          </c:if>
          <c:if test="${article.isAuditing == '1'}">
            <span style="color:green;">已审核</span>
          </c:if>
          <c:if test="${article.isAuditing == '2'}">
            <span>未通过</span>
          </c:if>
        </td>
        <td>
          <a href="${ctxAdmin}/sys/article/edit?id=${article.id}">编辑</a>
          <a href="${ctxAdmin}/sys/article/delete?id=${article.id}" onclick="return confirmx('确认要删除该文章吗？', this.href)">删除</a>
        </td>
      </tr>
    </c:forEach>
  </table>
<div>${page}</div>
</body>
</html>
