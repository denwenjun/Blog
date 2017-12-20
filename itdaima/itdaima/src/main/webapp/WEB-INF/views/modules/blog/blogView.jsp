<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/front/include/taglib.jsp" %>
<html>
<head>
    <title>${article.title}-博客</title>
    <meta name="decorator" content="front_default_basic"/>
    <meta name="description" content="itdaima"/>
    <meta name="keywords" content="itdaima"/>
    <style type="text/css">
        #load-more {
            padding: 0 15px;
            width: 120px;
            height: 30px;
            background-color: #D31733;
            color: #fff;
            line-height: 30px;
            text-align: center;
            border-radius: 5px;
            margin: 20px auto;
            border: 0 none;
            font-size: 16px;
            display: none;
        }
    </style>
    <script type="text/javascript">
        var article_id = '${article.id}';
        $(function(){
            $(".panel-body img").addClass("img-responsive lazy");
            /*初始化*/
            var pageNo = 1; /*计数器*/

            /*首次加载*/
            getData(pageNo);

            /*监听加载更多*/
            $(document).on('click', '#load-more', function(){
                pageNo++;
                getData(pageNo);
            });
        });

        function getData(pageNo){
            $.ajax({
                url: "${ctx}/comment/commentList?_=" + new Date().getTime(),
                type: "post",
                dataType: "json",
                data:{articleId:article_id, pageNo:pageNo},
                cache: false,
                success:function (data) {
                    if(data.code==1){
                        if(data.obj.page.list != undefined){
                            if(data.obj.pageLast == pageNo){
                                $("#load-more").hide();
                            }else{
                                $("#load-more").show();
                            }
                            for(var i=0;i<data.obj.page.list.length;i++){
                                $("#pinlun_view").append("<div class='media' style='margin-top: 5px;'>" +
                                        "<div class='pull-left'>" +
                                        "<a href='#'>" +
                                        "<img class='lazy img-circle' " +
                                        "data-original='"+ data.obj.page.list[i].user.photo +"'" +
                                        "alt='"+data.obj.page.list[i].user.loginName+"' src='"+data.obj.page.list[i].user.photo+"' width='45px' height='45px'>" +
                                        "</a></div>" +
                                        "<div class='media-body'>" +
                                        "<div style='margin-bottom: 12px;'>"+data.obj.page.list[i].user.loginName +
                                        "<span class='pull-right' style='font-size: 10px;'>"+data.obj.page.list[i].createDate +
                                        "</span></div>" +
                                        "<div class='pinlun content' style='width: 620px;'>"+data.obj.page.list[i].content+"</div>" +
                                        "</div>" +
                                        "</div>");
                            }
                        }

                    }else{
                        layer.alert(data.msg, {icon: 5});
                    }
                }
            });
        }

        function pinlun(commentContent){
            if(commentContent == ''){
                alert("评论不能为空");
                return false;
            }
            var replyUserName = '';
            $.ajax({
                url: "${ctx}/comment/save?_=" + new Date().getTime(),
                type: "post",
                dataType: "json",
                data:{articleId:article_id, commentContent:commentContent, replyUserName:replyUserName},
                cache: false,
                beforeSend:function(jqXHR,settings){
                    $(".btn1").button('loading');
                },
                success:function (data) {
                    if(data.code == 2){  //说明还没有登录
                        alert(data.msg);
                    }else if(data.code == 1){  //评论成功
                        $("#pl").val('');
                        $("#pinlun_view").empty();
                        getData(1);
                    }else{
                        alert(data.msg);
                    }
                    $(".btn1").button('reset');
                    $(".btn1").dequeue();
                }
            });
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
                                        <div>
                                            <span class="glyphicon glyphicon-tag"></span>
                                            <span class="label label-info">
                                                <a href="#">${article.keywords}</a>
                                            </span>
                                        </div>
                                        <hr/>
                                        <div id="pinlun_view" style="margin-top: 10px;">

                                        </div>
                                        <!--加载更多按钮-->
                                        <div id="load-more" style="">更多评论</div>
                                        <div style="margin-top: 10px; text-align: right">
                                            <textarea id="pl" style="resize:none;height: 60px;" class="form-control" rows="2" placeholder="发表评论"></textarea>
                                            <br/>
                                            <button type="button" data-loading-text="Loading..." onclick="pinlun($('#pl').val());" class="btn1 btn btn-success">发表评论</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="alert alert-warning content">声明：若要转载
                            <a href="${urlRoot}${pageContext.request.contextPath}${fns:getFrontPath()}">${fns:getConfig('productName')}</a>
                            中的任何文章请注明转载地址<br/>
                            分享地址：<a href="${urlRoot}${pageContext.request.contextPath}${fns:getFrontPath()}/blogView/${article.id}${urlSuffix}">
                                ${urlRoot}${pageContext.request.contextPath}${fns:getFrontPath()}/blogView/${article.id}${urlSuffix}
                            </a>
                        </div>
                        <div>
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
                    <div class="panel-body content">
                        面板内容
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
