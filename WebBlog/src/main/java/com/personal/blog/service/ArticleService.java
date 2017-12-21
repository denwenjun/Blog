package com.personal.blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.personal.blog.base.Page;
import com.personal.blog.entity.Article;
import com.personal.blog.entity.dao.ArticleDao;
import com.personal.blog.service.base.CrudService;

/**
 * Created by Administrator on 2017/7/22.
 */
@Service
@Transactional(readOnly = true)
public class ArticleService extends CrudService<ArticleDao, Article> {
    @Autowired
    private ArticleDao dao;


    public Page<Article> findPage(Page<Article> page, Article article) {

        return super.findPage(page,article);
    }

    /**
     * 点击数+1
     * @param id
     * @return
     */
    @Transactional(readOnly = false)
    public Integer updateHits(String id){
       return dao.updateHits(id);
    }



}
