/**
 *
 */
package com.personal.blog.entity.dao;

import com.personal.blog.annotations.MyBatisDao;
import com.personal.blog.base.CrudDao;
import com.personal.blog.entity.Role;

/**
 * 角色DAO接口
 * @author ThinkGem
 * @version 2013-12-05
 */
@MyBatisDao
public interface RoleDao extends CrudDao<Role> {

	public Role getByName(Role role);
	
	public Role getByEnname(Role role);

	/**
	 * 维护角色与菜单权限关系
	 * @param role
	 * @return
	 */
	public int deleteRoleMenu(Role role);

	public int insertRoleMenu(Role role);

	Role getRoleByLoginName(String loginName);



}
