/**
 *
 */
package com.personal.blog.entity.dao;

import java.util.List;

import com.personal.blog.annotations.MyBatisDao;
import com.personal.blog.base.CrudDao;
import com.personal.blog.entity.Menu;

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
