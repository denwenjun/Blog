/**
 *
 */
package com.itdaima.modules.sys.dao;

import com.itdaima.modules.sys.entity.Role;
import com.itdaima.common.persistence.CrudDao;
import com.itdaima.common.persistence.annotation.MyBatisDao;

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
