<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/front/include/taglib.jsp" %>
<html>
<head>
    <title>${article.title}-问答</title>
    <meta name="decorator" content="front_default_basic"/>
    <meta name="description" content="itdaima"/>
    <meta name="keywords" content="itdaima"/>
    <script type="text/css">

    </script>
    <script type="text/javascript">
        $(function () {

        });

        $(window).load(function () {
            $(".panel-body img").addClass("img-responsive lazy");
        })
    </script>
</head>
<body>
<div style="margin:auto;">
    <div class="row">
        <div class="col-sm-9 col-md-9" id="left-panel" style="padding-right: 0px;">
            <div class="row">
                <div class="col-sm-12 col-md-12" id="left-panel-left-one" style="padding:0px 5px;">
                    <div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div style="text-align: right;">
                                    <span style="font-weight: bold;">收藏</span>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="media" style="margin-top: 5px;">
                                    <div class="pull-left">
                                        <a href="#">
                                            <img class="lazy img-circle" data-original="${article.user.photo}"
                                                 alt="${article.user.loginName}" src="${ctxStatic}/jquery/grey.gif"
                                                 width="45px" height="45px">
                                        </a>
                                    </div>
                                    <div class="media-body text-muted">
                                        <div style="margin-bottom: 12px;">
                                            ${article.user.loginName}
                                        <span class="pull-right" style="font-size: 10px;">
                                          发布时间：${article.createTime}&nbsp;&nbsp;浏览量：${article.hits}
                                        </span>
                                        </div>
                                        <h4 class="media-heading">${article.title}</h4>

                                        <div class="content" style="margin-bottom: 10px; width: 675px;">
                                            ${article.content}
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="alert alert-warning content">声明：若要转载
                            <a href="${urlRoot}${pageContext.request.contextPath}${fns:getFrontPath()}">${fns:getConfig('productName')}</a>
                            中的任何文章请注明转载地址<br/>
                            分享地址：<a href="${urlRoot}${pageContext.request.contextPath}${fns:getFrontPath()}/blogView/${article.id}${urlSuffix}">
                                ${urlRoot}${pageContext.request.contextPath}${fns:getFrontPath()}/talkView/${article.id}${urlSuffix}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3 col-md-3" id="right-panel" style="padding:0px 15px;">
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
    </div>
</div>
</body>
</html>
