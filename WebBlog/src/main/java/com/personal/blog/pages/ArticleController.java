package com.personal.blog.pages;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.personal.blog.base.Page;
import com.personal.blog.entity.Article;
import com.personal.blog.entity.Dict;
import com.personal.blog.entity.dao.ArticleDao;
import com.personal.blog.service.ArticleService;
import com.personal.blog.service.DictService;
import com.personal.blog.utils.Encodes;
import com.personal.blog.utils.StringUtils;
import com.personal.blog.webutils.BaseController;

/**
 * Created by Administrator on 2017/7/30.
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/article")
public class ArticleController extends BaseController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleDao articleDao;
    @Autowired
    private DictService dictService;


    @ModelAttribute
    public Article get(@RequestParam(required=false) String id) {
        if (StringUtils.isNotBlank(id)){
            return articleDao.get(id);
        }else{
            return new Article();
        }
    }


/*
    @RequiresPermissions("sys:article:view")
*/
    @RequestMapping(value = {"list", ""})
    public String list(@ModelAttribute("model") Article article, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<Article> page = new Page<Article>(request, response);
        page = articleService.findPage(page, article);
        Dict dict = new Dict();
        dict.setType("atricle_type");
        List<Dict> dictList = dictService.findList(dict);
        dict.setType("isAuditing_type");
        List<Dict> isAuditingList = dictService.findList(dict);
        model.addAttribute("atricleType", dictList);
        model.addAttribute("isAuditingType", isAuditingList);
        model.addAttribute("page", page);
        return "modules/sys/articleList";
    }


    @RequestMapping(value = {"edit"})
    public String edit(String id, Model model) {
        Article article = new Article();
        article.setId(id);
        article = articleService.get(id);
        /*article.setContent(Encodes.unescapeHtml(article.getContent()));*/
        Dict dict = new Dict();
        dict.setType("atricle_type");
        List<Dict> dictList = dictService.findList(dict);
        model.addAttribute("dictList", dictList);
        model.addAttribute("article", article);
        return "modules/sys/ardicleEdit";
    }

    @RequestMapping(value = {"update"})
    public String update(String id, String title, String keywords,
                         String content,String isAuditing, String articleType, RedirectAttributes redirectAttributes){
        Article article = new Article();
        article.setId(id);
        article.setTitle(title);
        article.setKeywords(keywords);
        content = Encodes.unescapeHtml(content);
        article.setContent(content);
        article.setIsAuditing(isAuditing);
        article.setArticleType(articleType);
        article.preUpdate();
        int i = articleDao.update(article);
        if(i>0){
            addMessage(redirectAttributes, "编辑更新成功!");
            return "redirect:" + adminPath + "/sys/article?repage";
        }
        addMessage(redirectAttributes, "编辑更新失败!");
        return "redirect:" + adminPath + "/sys/edit?id=" + id;
    }

    @RequestMapping(value = {"delete"})
    public String delete(String id, HttpServletRequest request,RedirectAttributes redirectAttributes, HttpServletResponse response, Model model) {
        Article article = new Article();
        article.setId(id);
        int i = articleDao.delete(article);
        if(i > 0){
            addMessage(redirectAttributes, "删除成功!");
            return "redirect:" + adminPath + "/sys/article?repage";
        }
        addMessage(redirectAttributes, "删除失败!");
        return "redirect:" + adminPath + "/sys/article?repage";
    }

}
