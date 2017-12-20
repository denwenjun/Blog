package com.itdaima.modules.sys.service;

import com.itdaima.common.persistence.Page;
import com.itdaima.common.service.BaseService;
import com.itdaima.common.service.CrudService;
import com.itdaima.modules.sys.dao.ArticleDao;
import com.itdaima.modules.sys.dao.LogDao;
import com.itdaima.modules.sys.entity.Article;
import com.itdaima.modules.sys.entity.Log;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
