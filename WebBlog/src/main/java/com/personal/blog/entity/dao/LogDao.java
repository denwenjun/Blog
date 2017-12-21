/**
 *
 */
package com.personal.blog.entity.dao;

import com.personal.blog.annotations.MyBatisDao;
import com.personal.blog.base.CrudDao;
import com.personal.blog.entity.Log;

/**
 * 日志DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface LogDao extends CrudDao<Log> {

}
