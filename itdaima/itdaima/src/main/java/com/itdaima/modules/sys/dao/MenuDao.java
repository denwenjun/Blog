/**
 *
 */
package com.itdaima.modules.sys.dao;

import com.itdaima.common.persistence.CrudDao;
import com.itdaima.common.persistence.annotation.MyBatisDao;
import com.itdaima.modules.sys.entity.Menu;

import java.util.List;

/**
 * 菜单DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface MenuDao extends CrudDao<Menu> {

	public List<Menu> findByParentIdsLike(Menu menu);

	public List<Menu> findByUserId(Menu menu);
	
	public int updateParentIds(Menu menu);
	
	public int updateSort(Menu menu);
	
}
