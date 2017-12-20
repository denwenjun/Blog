<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/front/include/taglib.jsp" %>

<html>
<head>
    <title>博客列表</title>
    <meta name="decorator" content="front_default_basic"/>
    <meta name="description" content="itdaima"/>
    <meta name="keywords" content="itdaima"/>
    <style type="text/css">
        #img img{
            height: auto;
            max-width: 100%;
            vertical-align: middle;
            diaplay:inline;
        }
    </style>
    <script type="text/javascript">
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            /*$("#searchForm").submit();*/
            window.location.href = "${ctx}/blog/p" + n + "${urlSuffix}";
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
                                <span style="font-weight: bold;">博客列表</span>
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
                                            <a href="${ctx}/blogView/${blog.id}${urlSuffix}">
                                                <span class="media-heading">${blog.title}</span>
                                            </a>
                                            <div class="content" style="margin-bottom: 10px;">
                                                ${blog.content}
                                            </div>
                                            <div style="clear: both; ">
                                                <c:forEach items="${blog.img}" var="img">
                                                    <div id="img" style="margin: 5px 2px 5px 2px; display:inline;">
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
