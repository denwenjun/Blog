/**
 *
 */
package com.personal.blog.entity.dao;

import java.util.List;

import com.personal.blog.annotations.MyBatisDao;
import com.personal.blog.base.CrudDao;
import com.personal.blog.entity.Dict;

/**
 * 字典DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);
	
}
