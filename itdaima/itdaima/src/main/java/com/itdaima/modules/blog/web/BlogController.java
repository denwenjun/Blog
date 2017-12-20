package com.itdaima.modules.blog.web;

import com.itdaima.common.persistence.Page;
import com.itdaima.common.utils.DateUtils;
import com.itdaima.common.utils.Encodes;
import com.itdaima.common.utils.StringUtils;
import com.itdaima.common.web.BaseController;
import com.itdaima.common.web.Servlets;
import com.itdaima.modules.sys.dao.ArticleDao;
import com.itdaima.modules.sys.entity.Article;
import com.itdaima.modules.sys.entity.Dict;
import com.itdaima.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.itdaima.modules.sys.service.ArticleService;
import com.itdaima.modules.sys.service.DictService;
import com.itdaima.modules.sys.utils.LogUtils;
import com.itdaima.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/7/21.
 */
@Controller
@RequestMapping(value = "${frontPath}")
public class BlogController extends BaseController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleDao articleDao;
    @Autowired
    private DictService dictService;


    /**
     * 博客
     */
    @RequestMapping(value={"/blog${urlSuffix}","/blog/p{pageNo}${urlSuffix}"})
    public String blog(Model model,HttpServletRequest request, HttpServletResponse response,
                       @PathVariable @RequestParam(value = "pageNo",defaultValue = "1") Integer pageNo) {
        model.addAttribute("navbarType", "blog");
        Article article = new Article();
        article.setType("blog");
        Page<Article> page = new Page<Article>(request, response);
        String url = request.getRequestURI();
        url = url.substring(url.indexOf("/p") + 2, url.indexOf(urlSuffix));
        if(StringUtils.isNotBlank(url) && !url.equals("t/blog")){
            pageNo = Integer.parseInt(url);
        }
        page.setPageNo(pageNo);
        page = articleService.findPage(page, article);
        List<Article> list = page.getList();
        for(Article a :list){
            String content = a.getContent();
            List<String> img = StringUtils.getImg(content, a.getTitle());
            a.setImg(img);
            content = StringUtils.abbr(content, 250);
            a.setContent(content);
        }
        model.addAttribute("page", page);
        return "modules/blog/blog";
    }

    /**
     * 发表博客
     */
    @RequestMapping(value="/blogFrom${urlSuffix}")
    public String blogFrom(Model model,String title, String articleType,String content, HttpServletRequest request) {
        Principal principal = UserUtils.getPrincipal();
        if(principal==null){
            return "redirect:frontLogin" + urlSuffix;
        }
        if(StringUtils.isNotBlank(content)){
            content = Encodes.unescapeHtml(content);
            Article article = new Article();
            article.setTitle(title);
            article.setType("blog");
            article.setArticleType(articleType);
            article.setContent(content);
            article.setIsAuditing("0"); //代表需要审核
            article.setHits(0);
            article.preInsert();
            articleDao.insert(article);
            LogUtils.saveLog(Servlets.getRequest(), "发表博客");
            model.addAttribute("message", "博客发表成功！已在审核中...");
        }
        Dict dict = new Dict();
        dict.setType("atricle_type");
        List<Dict> dictList = dictService.findList(dict);
        model.addAttribute("dictList", dictList);
        return "modules/blog/blogFrom";
    }
    /**
     * 查看博客详情
     */
    @RequestMapping(value="/blogView/{id}${urlSuffix}")
    public String blogView(Model model, @PathVariable String id) {
        articleService.updateHits(id);
        Article article = articleDao.get(id);
        article.setContent(StringUtils.ImageCode(article.getContent(),article.getTitle()));//重写源代码
        article.setCreateTime(DateUtils.formatDate(article.getCreateDate(), "yyyy-MM-dd HH:mm:ss"));
        model.addAttribute("article",article);
        return "modules/blog/blogView";
    }
}
