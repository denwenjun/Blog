<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <meta name="decorator" content="front_default_basic"/>
    <meta name="description" content="itdaima"/>
    <meta name="keywords" content="itdaima"/>
    <style type="text/css">
        .single-row {
            overflow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
    </style>
    <script type="text/javascript">
        function say(){
            var sayContent = $("#sayContent").val();
            if(sayContent == ''){
                layer.alert('发表说说不能为空', {icon: 5});
            }else{
                $.ajax({
                    url: "${ctx}/say?_=" + new Date().getTime(),
                    type: "post",
                    dataType: "json",
                    data:{sayContent:sayContent},
                    cache: false,
                    beforeSend:function(jqXHR,settings){
                        /*layer.msg('正在退出...');*/
                    },
                    success:function (data) {
                        $("#sayContent").val('');
                        if(data.code = 1){
                            layer.alert(data.msg, {
                                skin: 'layui-layer-molv' //样式类名
                                ,closeBtn: 0
                            }, function(){
                                window.location.reload(true);
                            });
                        }else{
                            layer.alert(data.msg, {icon: 5});
                        }
                    }
                });
            }
        }
    </script>
</head>
<body>
<div style="margin:auto;">
    <div class="row">
        <div class="col-sm-9 col-md-9" id="left-panel" style="padding-right: 0px;">
            <div>
                <div class="row">
                    <c:if test="${not empty fns:getUser().loginName}">
                        <div id="say_shuo" class="well well-sm" style="margin:0px 5px 10px 5px;">
                            <textarea id="sayContent" style="resize:none;height: 60px;" class="form-control" rows="2" placeholder="发表说说"></textarea>
                            <div style="margin-top: 10px; text-align: right">
                                <button type="button" onclick="say();" class="btn btn-success">发表说说</button>
                            </div>
                        </div>
                    </c:if>
                    <div class="col-sm-6 col-md-6" id="left-panel-left-one" style="padding:0px 5px;">
                        <div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <span class="glyphicon glyphicon-align-justify" aria-hidden="true">
                                        <span style="font-weight: bold;">最新分享</span>
                                    </span>
                                    <div class="pull-right">
                                    <span style="font-weight: bold;">
                                        <a style="text-decoration:none" href="${ctx}/share${urlSuffix}">更多</a>
                                    </span>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <c:forEach items="${article:getArticleList('share',5)}" var="article" varStatus="i" begin="0">
                                        <p class="text-muted single-row">

                                            <span title="原创分享代码" class="orginal"><kbd>精</kbd></span>
                                            <a class="text-muted" href="${ctx}/blogView/${article.id}${urlSuffix}" target="_blank" title="${article.title}">
                                                    ${article.title}
                                            </a>
                                        </p>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6" id="left-panel-right-one" style="padding:0px 5px;">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <span class="glyphicon glyphicon-align-justify" aria-hidden="true">
                                    <span style="font-weight: bold;">最新问答</span>
                                </span>
                                <div class="pull-right">
                                    <span style="font-weight: bold;">
                                        <a style="text-decoration:none" href="${ctx}/talk${urlSuffix}">更多</a>
                                    </span>
                                </div>
                            </div>
                            <div class="panel-body">
                                <c:forEach items="${article:getArticleList('talk',5)}" var="article" varStatus="i" begin="0">
                                    <p class="text-muted single-row">
                                        <span title="原创分享代码" class="orginal"><kbd>精</kbd></span>
                                        <a class="text-muted" href="${ctx}/blogView/${article.id}${urlSuffix}" target="_blank" title="${article.title}">
                                            ${article.title}
                                        </a>
                                    </p>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 col-md-6" id="left-panel-left-two" style="padding:5px 5px;">
                        <div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <span class="glyphicon glyphicon-list" aria-hidden="true">
                                        <span style="font-weight: bold;">最新博客</span>
                                    </span>
                                    <div class="pull-right">
                                    <span style="font-weight: bold;">
                                        <a style="text-decoration:none" href="${ctx}/blog${urlSuffix}">更多</a>
                                    </span>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <c:forEach items="${article:getArticleList('blog',10)}" var="article" varStatus="i" begin="0">
                                        <p class="text-muted single-row">
                                            <span title="原创分享代码" class="orginal">精</span>
                                            <a class="text-muted" href="${ctx}/blogView/${article.id}${urlSuffix}" target="_blank" title="${article.title}">
                                                ${article.title}
                                            </a>
                                        </p>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6" id="left-panel-right-two" style="padding:5px 5px;">
                        <div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <span class="glyphicon glyphicon-list" aria-hidden="true">
                                        <span style="font-weight: bold;">最新评论</span>
                                    </span>
                                    <div class="pull-right">
                                        <span style="font-weight: bold;">
                                            <a style="text-decoration:none" href="${ctx}/blog${urlSuffix}">更多</a>
                                        </span>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <c:forEach items="${article:getArticleList('pinglun',10)}" var="article" varStatus="i" begin="0">
                                        <p class="text-muted single-row">
                                            <span title="原创分享代码" class="orginal">精</span>
                                            <a class="text-muted" href="${ctx}/blogView/${article.id}${urlSuffix}" target="_blank" title="${article.title}">
                                                ${article.title}
                                            </a>
                                        </p>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="height: 100px; border: solid;"></div>
                <div class="row">
                    <div class="col-sm-6 col-md-6" id="left-panel-left-three" style="padding:0px 5px;">
                        <div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
                                </div>
                                <div class="panel-body">
                                    面板内容
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6" id="left-panel-right-three" style="padding:0px 5px;">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
                            </div>
                            <div class="panel-body">
                                面板内容
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3 col-md-3" id="right-panel" style="padding:0px 15px;">
            <div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-list" aria-hidden="true">
                            <span style="font-weight: bold;">最新说说</span>
                        </span>
                        <div class="pull-right">
                            <span style="font-weight: bold;">
                                <a style="text-decoration:none" href="${ctx}/say/p1${urlSuffix}">更多</a>
                            </span>
                        </div>
                    </div>
                    <div class="panel-body" id="suosuo">
                        <c:forEach items="${article:getSayList(6)}" var="say" varStatus="i" begin="0">
                            <div class="text-muted content" style="margin-bottom: 2px;">
                                <div class="row">
                                    <div class="col-md-7">
                                       ${say.user.loginName}
                                    </div>
                                    <div class="col-md-5" style="text-align: right;">
                                       ${say.agoDate}
                                    </div>
                                </div>
                            </div>
                            <div class="text-muted content" style="margin-bottom: 5px;">
                                ${say.content}
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-list" aria-hidden="true">
                            <span style="font-weight: bold;">最新心情</span>
                        </span>
                    </div>
                    <div class="panel-body">
                        <c:forEach items="${article:getArticleList('blog',10)}" var="article" varStatus="i" begin="0">
                            <p class="text-muted single-row">
                                <span title="原创分享代码" class="orginal">精</span>
                                <a class="text-muted" href="${ctx}/blogView/${article.id}${urlSuffix}" target="_blank" title="${article.title}">
                                        ${article.title}
                                </a>
                            </p>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>