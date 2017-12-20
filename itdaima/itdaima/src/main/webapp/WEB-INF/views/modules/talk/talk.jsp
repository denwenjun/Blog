<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/front/include/taglib.jsp" %>

<html>
<head>
    <title>问答列表</title>
    <meta name="decorator" content="front_default_basic"/>
    <meta name="description" content="itdaima"/>
    <meta name="keywords" content="itdaima"/>
    <style type="text/css">

    </style>
    <script type="text/javascript">
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            /*$("#searchForm").submit();*/
            window.location.href = "${ctx}/talk/p" + n + "${urlSuffix}";
            return false;
        }
    </script>
</head>
<body>
<div style="margin:auto;">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" type="hidden" value="${page.pageSize}"/>
    <div class="row">
        <div class="col-sm-9 col-md-9" id="left-panel" style="padding-right: 0px;">
            <div class="row">
                <div class="col-sm-12 col-md-12" id="left-panel-left-one" style="padding:0px 5px;">
                    <div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <span style="font-weight: bold;">问答列表</span>
                            </div>
                            <div class="panel-body">
                                <c:forEach items="${page.list}" var="blog">
                                    <div class="media" style="margin-top: 5px;">
                                        <div class="media-left">
                                            <a href="#">
                                                <img class="lazy img-circle" data-original="${blog.user.photo}"
                                                     alt="Generic placeholder image" src="${ctxStatic}/jquery/grey.gif" width="40px" height="40px">
                                            </a>
                                        </div>
                                        <div class="media-body">
                                            <a href="${ctx}/talkView/${blog.id}${urlSuffix}">
                                                <span class="media-heading">${blog.title}</span>
                                            </a>
                                            <div style="margin-bottom: 10px;">${blog.content}</div>
                                            <div class="row">
                                                <c:forEach items="${blog.img}" var="img">
                                                    <div class="col-xs-6 col-md-3">
                                                            ${img}
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div>${page}</div>
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
