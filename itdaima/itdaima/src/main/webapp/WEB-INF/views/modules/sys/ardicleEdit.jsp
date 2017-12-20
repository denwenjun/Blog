<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/front/include/taglib.jsp" %>
<html>
<head>
  <meta name="decorator" content="admin_boostrap3"/>
  <title>文章编辑</title>
  <script src="${ctxStatic}/common/itdaima.min.js" type="text/javascript"></script>
  <script type="text/javascript">
    function selectType(value){
      $('#articleType').val(value)
    }
  </script>
</head>
<body>
  <ul class="nav nav-tabs">
    <li><a href="${ctxAdmin}/sys/article/">文章列表</a></li>
    <li class="active"><a href="${ctxAdmin}/sys/article/edit?id=${article.id}">文章编辑</a></li>
  </ul>

  <sys:message content="${message}"/>
  <form action="${ctxAdmin}/sys/article/update" method="post">
    <input type="hidden" name="id" value="${article.id}">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="form-group">
          <label>标题*</label>
          <input type="text" name="title" class="form-control" id="title" value="${article.title}" placeholder="标题" required>
        </div>
        <div class="form-group">
          <label>内容*</label>
                    <textarea name="content" id="editor1">
                      ${article.content}
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
          <input type="text" readonly name="articleType" class="form-control" id="articleType" value="${article.articleType}" placeholder="点击选择分类" required>
          <div id="type" style="margin-top: 10px;">
            <c:forEach items="${dictList}" var="dict">
              <button type="button" value="${dict.value}" onclick="selectType(this.value);" class="btn btn-info btn-sm">${dict.description}</button>
            </c:forEach>
          </div>
        </div>
        <div class="form-group">
          <label>关键字*</label>
          <input type="text" name="keywords" class="form-control" id="keywords" value="${article.keywords}" placeholder="关键字" required>
        </div>
        <div class="form-group">
          <label>审核是否通过</label>
          <div style="margin-top: 10px;">
            <select name="isAuditing">
              <option value="0"
                      <c:if test="${article.isAuditing == '0'}">
                        selected
                      </c:if>
                      >未审核</option>
              <option value="1"
                      <c:if test="${article.isAuditing == '1'}">
                        selected
                      </c:if>
                      >已审核</option>
              <option value="2"
                      <c:if test="${article.isAuditing == '2'}">
                        selected
                      </c:if>
                      >未通过</option>
            </select>
          </div>
        </div>
        <div class="pull-left">
          <button type="submit" class="btn btn-success btn-lg">编辑保存</button>
        </div>
      </div>
    </div>
  </form>
</body>
</html>