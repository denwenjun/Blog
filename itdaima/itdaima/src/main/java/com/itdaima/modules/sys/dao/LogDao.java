/**
 *
 */
package com.itdaima.modules.sys.dao;

import com.itdaima.common.persistence.CrudDao;
import com.itdaima.common.persistence.annotation.MyBatisDao;
import com.itdaima.modules.sys.entity.Log;

/**
 * 日志DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface LogDao extends CrudDao<Log> {

}
