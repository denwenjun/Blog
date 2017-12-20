package com.itdaima.modules.front.web;

import com.google.common.collect.Maps;
import com.itdaima.common.persistence.Page;
import com.itdaima.common.utils.Result;
import com.itdaima.common.utils.StringUtils;
import com.itdaima.common.web.BaseController;
import com.itdaima.modules.front.dao.CommentDao;
import com.itdaima.modules.front.entity.Comment;
import com.itdaima.modules.front.service.CommentService;
import com.itdaima.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.itdaima.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

/**
 * Created by Administrator on 2017/8/2.
 */
@Controller
@RequestMapping(value = "${frontPath}/comment")
public class CommentController extends BaseController {

    @Autowired
    private CommentDao commentDao;
    @Autowired
    private CommentService commentService;

    /**
     * 发表评论
     * @param articleId
     * @param commentContent
     * @param replyUserName
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value="save")
    @ResponseBody
    public Result save(String articleId, String commentContent, String replyUserName, HttpServletRequest request, HttpServletResponse response) {
        //判断是否已经登录用户
        Principal principal = UserUtils.getPrincipal();
        if(principal == null){
            return Result.warnResult().setMsg("请登录后再评论");
        }
        Comment comment = new Comment();
        if (StringUtils.isNotBlank(replyUserName)) {
            comment.setReplyUserName(replyUserName);
        }
        comment.setArticleId(articleId);
        comment.setContent(commentContent);
        comment.preInsert();
        commentDao.insert(comment);
        return Result.successResult();
    }

    /**
     * 评论展示
     * @param articleId
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value="commentList")
    @ResponseBody
    public Result commentList(String articleId, Integer pageNo, HttpServletRequest request, HttpServletResponse response) {
        Page<Comment> page = new Page<Comment>(request, response);
        page.setPageNo(pageNo);
        page.setPageSize(5);  //每次显示5条记录
        Comment comment = new Comment();
        comment.setArticleId(articleId);
        page = commentService.findPage(page, comment);
        HashMap<Object, Object> hashMap = Maps.newHashMap();
        hashMap.put("page",page);
        hashMap.put("pageLast",page.getLast());
        return Result.successResult().setObj(hashMap);
    }




}
