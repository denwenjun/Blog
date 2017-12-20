package com.itdaima.modules.sys.utils;

import com.itdaima.common.persistence.Page;
import com.itdaima.common.utils.RelativeDateFormat;
import com.itdaima.common.utils.SpringContextHolder;
import com.itdaima.modules.front.dao.SayDao;
import com.itdaima.modules.front.entity.Say;
import com.itdaima.modules.front.service.SayService;
import com.itdaima.modules.sys.dao.ArticleDao;
import com.itdaima.modules.sys.entity.Article;
import com.itdaima.modules.sys.service.ArticleService;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/7/23.
 */
public class ArticleUtils {

    private static ArticleService articleService = SpringContextHolder.getBean(ArticleService.class);
    private static SayService sayService = SpringContextHolder.getBean(SayService.class);

    public static List<Article> getArticleList(String type, int number){
        Page<Article> page = new Page<Article>(1, number, -1);
        Article article = new Article();
        article.setType(type);
        page = articleService.findPage(page, article);
        return page.getList();
    }

    public static List<Say> getSayList(int number){
        Page<Say> page = new Page<Say>(1, number, -1);
        Say say = new Say();
        page = sayService.findPage(page, say);
        return page.getList();
    }
}
