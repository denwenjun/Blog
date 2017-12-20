<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/front/include/taglib.jsp"%>
<html>
<head>
  <title>发表分享</title>
  <meta name="decorator" content="front_default_basic"/>
  <meta name="description" content="itdaima" />
  <meta name="keywords" content="itdaima" />

  <script type="text/javascript">
    function selectType(value){
      $('#articleType').val(value)
    }
  </script>
</head>
<body>
<div style="margin:auto;">
  <div class="row">
    <div class="col-sm-9 col-md-9" id="left-panel" style="padding-right: 0px;">
      <div class="row">
        <div class="col-sm-12 col-md-12" id="left-panel-left-one" style="padding:5px 5px;">
          <div>
            <c:if test="${message != null}">
              <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  ${message}
              </div>
            </c:if>
            <form action="${ctx}/shareFrom${urlSuffix}" method="post">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <span style="font-weight: bold;">发表分享</span>
                </div>
                <div class="panel-body">
                  <div class="form-group">
                    <label>标题*</label>
                    <input type="text" name="title" class="form-control" id="title" value="${title}" placeholder="标题" required>
                  </div>
                  <div class="form-group">
                    <label>内容*</label>
                    <textarea name="content" class="form-control" name="content" style="resize:none; height:200px;" id="editor1">
                      ${content}
                    </textarea>
                    <script>
                      CKEDITOR.replace('editor1',{
                        customConfig : 'config.js',
                        toolbar : 'Comment',
                      });
                    </script>
                  </div>
                  <div class="form-group">
                    <label>类型*</label>
                    <input type="text" readonly name="articleType" class="form-control" id="articleType" value="${articleType}" placeholder="点击选择分类" required>
                    <div id="type" style="margin-top: 10px;">
                      <c:forEach items="${dictList}" var="dict">
                        <button type="button" value="${dict.value}" onclick="selectType(this.value);" class="btn btn-info btn-sm">${dict.description}</button>
                      </c:forEach>
                    </div>
                  </div>
                  <div class="pull-right">
                    <button type="submit" class="btn btn-success">发表分享</button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-3 col-md-3" id="right-panel" style="padding:5px 15px;">
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
