<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/front/include/taglib.jsp" %>
<html>
<head>
  <title>用户注册</title>
  <meta name="decorator" content="front_default_basic"/>
  <meta name="description" content="itdaima"/>
  <meta name="keywords" content="itdaima"/>
  <script type="text/javascript">
    function reg(){
      var isUserName = /^[a-zA-Z]{1}([a-zA-Z0-9]){5,11}$/;//只能输入6-12个以字母开头、可带数字
      var isPassword = /^[a-zA-Z]{1}([a-zA-Z0-9]){5,11}$/; // 6-12位字母开头
      var isEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/; //电子邮箱
      $("#loginNameError").html("");
      $("#emailError").html("");
      $("#passwordError").html("");
      var loginName = $("#loginName").val();
      var bool = false;
      if(loginName ==''){
        $("#loginNameError").html("用户名不能为空");
        bool = false;
      }else if(isUserName.test(loginName)){
        $("#loginNameError").html("");
        bool = true;
      }else{
        $("#loginNameError").html("请输入字母开头6-12位的用户名");
        bool = false;
      }
      var email = $("#email").val();
      if(email ==''){
        $("#emailError").html("电子邮箱格不能为空");
        bool = false;
      }else if(isEmail.test(email)){
        $("#emailError").html("");
        bool = true;
      }else{
        $("#emailError").html("电子邮箱格式不正确");
        bool = false;
      }
      var password = $("#password").val();
      var re_password = $("#re_password").val();
      if(password ==''){
        $("#passwordError").html("密码不能为空");
        bool = false;
      }else if(password != re_password){
        $("#passwordError").html("两次输入的密码不一致");
        bool = false;
      }else if(isPassword.test(password)){
        $("#passwordError").html("");
        bool = true;
      }else{
        $("#passwordError").html("请输入字母开头6-12位的密码");
        bool = false;
      }
      console.log(bool);

      if(bool){
        var queryParam = $.serializeObject($("#inputForm"));
        $.ajax({
          url:"${ctx}/register${urlSuffix}?_="+ new Date().getTime(),
          type: "post",
          dataType: "json",
          data: queryParam,
          cache: false,
          beforeSend:function(jqXHR,settings){
            //加载层
            index = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
          },
          success:function (data) {
            layer.close(index);
            if(data.code == 1){
              //清空表单
              $("#inputForm")[0].reset();
              layer.alert(data.msg)
            }else{
              layer.msg(data.msg);
            }
            $('.validateCodeRefresh').click();
          }
        })
      }
    }
  </script>
</head>
<body>
  <form:form id="inputForm" modelAttribute="user" action="${ctx}/register${urlSuffix}" method="post" class="form-horizontal">
    <div class="well">
      <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          欢迎注册
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">用户名:</label>
        <div class="col-sm-3">
          <form:input path="loginName" htmlEscape="false" maxlength="16" class="form-control" placeholder="请输入用户名" required="required"/>
          <span id="loginNameError" style="color: red;"></span>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">电子邮箱:</label>
        <div class="col-sm-3">
          <form:input path="email" type="email" htmlEscape="false" maxlength="16" class="form-control" placeholder="请输入电子邮箱" required="required"/>
          <span id="emailError" style="color: red;"></span>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">密码:</label>
        <div class="col-sm-3">
          <form:password path="password" htmlEscape="false" maxlength="16" class="form-control" placeholder="请输入密码" required="required"/>
          <span id="passwordError" style="color: red;"></span>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">确认密码:</label>
        <div class="col-sm-3">
          <input type="password" name="re_password" maxlength="16" class="form-control" id="re_password" placeholder="请确认密码" required>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">验证码:</label>
        <div class="col-sm-3">
          <sys:validateCode name="validateCode"/>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-5">
          <button type="button" onclick="reg();" class="btn btn-primary">注册</button>
        </div>
      </div>
    </div>
  </form:form>
</body>
</html>
