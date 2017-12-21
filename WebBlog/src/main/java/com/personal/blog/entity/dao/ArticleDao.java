package com.personal.blog.entity.dao;

import com.personal.blog.annotations.MyBatisDao;
import com.personal.blog.base.CrudDao;
import com.personal.blog.entity.Article;

/**
 * Created by Administrator on 2017/7/22.
 */
@MyBatisDao
public interface ArticleDao  extends CrudDao<Article> {

    Integer updateHits(String id);

}
