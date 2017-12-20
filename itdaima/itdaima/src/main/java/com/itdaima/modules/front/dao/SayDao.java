package com.itdaima.modules.front.dao;

import com.itdaima.common.persistence.CrudDao;
import com.itdaima.common.persistence.annotation.MyBatisDao;
import com.itdaima.modules.front.entity.Say;

/**
 * Created by Administrator on 2017/7/22.
 */
@MyBatisDao
public interface SayDao  extends CrudDao<Say> {
}
