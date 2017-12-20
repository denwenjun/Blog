<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/front/include/taglib.jsp" %>
<html>
<head>
  <title>用户登录</title>
  <meta name="decorator" content="front_default_basic"/>
  <meta name="description" content="itdaima"/>
  <meta name="keywords" content="itdaima"/>
  <script type="text/javascript">
    $(function(){
      var isLogin = '${isLogin}';
      if(isLogin == 'true'){
        $("#inputForm").hide();
      }
    });
  </script>
</head>
<body>
  <div class="well">
    <c:if test="${message != null}">
      <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          ${message}
      </div>
    </c:if>
    <form id="inputForm" class="form-horizontal" role="form" action="${ctx}/frontLogin${urlSuffix}" method="post" style="margin-top: 30px;">
      <input type="hidden" id="redirect_url" name="redirect_url" value="${ctx}">
      <div class="form-group">
        <label class="col-sm-2 control-label">用户名:</label>
        <div class="col-sm-3">
          <input type="text" name="username" class="form-control" id="username" value="${username}" placeholder="请输入用户名" required>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">密码:</label>
        <div class="col-sm-3">
          <input type="password" name="password" class="form-control" id="password" value="${password}" placeholder="请输入密码" required>
        </div>
      </div>
      <c:if test="${isValidateCodeLogin}">
        <div class="form-group">
          <label class="col-sm-2 control-label">验证码:</label>
          <div class="col-sm-3">
            <sys:validateCode name="validateCode"/>
          </div>
        </div>
      </c:if>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <div class="checkbox">
            <label>
              <input type="checkbox" name="rememberMe" id="rememberMe"> 请记住我
            </label>
          </div>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <button type="submit" class="btn btn-primary">登录</button>
        </div>
      </div>
    </form>
  </div>
</body>
</html>
