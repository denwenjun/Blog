/**
 *
 */
package com.itdaima.modules.sys.dao;

import com.itdaima.common.persistence.CrudDao;
import com.itdaima.common.persistence.annotation.MyBatisDao;
import com.itdaima.modules.sys.entity.Dict;

import java.util.List;

/**
 * 字典DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);
	
}
