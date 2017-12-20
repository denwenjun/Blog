package com.itdaima.modules.sys.dao;

import com.itdaima.common.persistence.CrudDao;
import com.itdaima.common.persistence.annotation.MyBatisDao;
import com.itdaima.modules.sys.entity.Article;

/**
 * Created by Administrator on 2017/7/22.
 */
@MyBatisDao
public interface ArticleDao  extends CrudDao<Article> {


    Integer updateHits(String id);


}
