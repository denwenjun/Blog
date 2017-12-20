<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:title/>-IT代码</title>
	<%@include file="/WEB-INF/views/modules/front/include/head.jsp" %>
	<sitemesh:head/>

	<style type="text/css">
		.container {
			width: 1010px;
		}
		#body-main{
			margin-top: 90px;
		}
		.navbar-header{
			height: 60px;
		}

		.content{
			word-wrap: break-word;
			word-break: break-all;
			clear: both;
		}
	</style>
	<script type="text/javascript">
		var i='${sessionScope.sessionInfo.loginName}' ;
		var navbarType = '${navbarType}';
		$(function(){
			$("img.lazy").lazyload({effect: "fadeIn"});

			$(".nav-pills li").each(function() {
				$(this).removeClass();
			});
			if(navbarType == 'default'){
				$("#default").addClass("active");
			}else if(navbarType == 'share'){
				$("#share").addClass("active");
			}else if(navbarType == 'talk'){
				$("#talk").addClass("active");
			}else if(navbarType == 'blog'){
				$("#blog").addClass("active");
			}

			var redirect_url = '${ctx}';
			var local_url = window.location.href;
			console.log("/register${urlSuffix}");
			console.log(local_url.substring(local_url.lastIndexOf("/"), local_url.length));
			if(window.sessionStorage){
				if((local_url != document.referrer)){
					sessionStorage.setItem('redirect_url', document.referrer);
				}
				redirect_url = sessionStorage.getItem("redirect_url");
			}
			console.log(redirect_url);

			if(redirect_url.substring(redirect_url.lastIndexOf("/"), local_url.length) == '/register${urlSuffix}'){
				redirect_url = '/t';
			}
			console.log(redirect_url);
			$("#redirect_url").val(redirect_url);
		});

		function logout(){
			$.ajax({
				url: "${ctxAdmin}/logout?_=" + new Date().getTime(),
				type: "post",
				dataType: "json",
				cache: false,
				beforeSend:function(jqXHR,settings){
					layer.msg('正在退出...');
				},
				success:function (data) {
					if(data){
						window.location.reload(true);//刷新当前页
					}else{
						layer.msg('提示：用户未登录。');
					}
				}
			});
		}
	</script>
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-default">
		<div class="container">
			<div class="navbar-header" style="padding-top: 6px;">
				<a class="navbar-brand" href="${ctx}">ITDAIMA</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav nav-pills" style="padding-top: 6px;">
					<li id="default"><a href="${ctx}">首页</a></li>
					<li id="share"><a href="${ctx}/share${urlSuffix}">分享</a></li>
					<li id="talk"><a href="${ctx}/talk${urlSuffix}">问答</a></li>
					<li id="blog"><a href="${ctx}/blog${urlSuffix}">博客</a></li>
				</ul>
				<div class="pull-right">
					<form class="navbar-form navbar-left" role="search" style="padding-top: 6px;">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="搜索">
						</div>
					</form>
					<c:choose>
						<c:when test="${not empty fns:getUser().loginName}">
							<ul id="login_reg" class="nav navbar-nav login">
								<li style="padding-top: 14px;">
									<button onclick="window.location.href='${ctx}/shareFrom${urlSuffix}'" class="btn btn-success">分享</button>
									<button onclick="window.location.href='${ctx}/talkFrom${urlSuffix}'" class="btn btn-success">问答</button>
									<button onclick="window.location.href='${ctx}/blogFrom${urlSuffix}'" class="btn btn-success">博客</button>
								</li>
								<li>
									<a href="${ctx}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
										<c:if test="${not empty fns:getUser().photo}">
											<img src="${fns:getUser().photo}" class="img-circle" alt="image" width="32px" height="32px">
										</c:if>
										<c:if test="${empty fns:getUser().photo}">
											<img src="${ctxStatic}/images/Img_head/default_head.jpg" class="img-circle" alt="image" width="32px" height="32px">
										</c:if>
										&nbsp;${fns:getUser().loginName}<%--【新消息】<span class="badge">4</span>--%><span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><a href="${ctx}/homepage"><span class="glyphicon glyphicon-home" aria-hidden="true">&nbsp;主页</span></a></li>
										<li><a href="${ctx}/set"><span class="glyphicon glyphicon-cog" aria-hidden="true">&nbsp;设置</span></a></li>
										<li><a href="${ctxAdmin}" target="_blank"><span class="glyphicon glyphicon-home" aria-hidden="true">&nbsp;后台管理</span></a></li>
										<li><a href="javascript:void(0);" onclick="logout();"><span class="glyphicon glyphicon-off" aria-hidden="true">&nbsp;退出</span></a></li>
									</ul>
								</li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul id="login_reg" class="nav navbar-nav login" style="padding-top: 6px;">
								<li><a href="${ctx}/frontLogin${urlSuffix}">登录</a></li>
								<li><a href="${ctx}/register${urlSuffix}">注册</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</nav>
	<div class="container" id="body-main">
			<sitemesh:body/>
    </div>
	<hr>
	<footer style="text-align: center">
		<p>Copyright &copy; 2017-${fns:getConfig('copyrightYear')} <a href="${pageContext.request.contextPath}${fns:getFrontPath()}">${fns:getConfig('productName')}</a></p>
	</footer>
</body>
</html>