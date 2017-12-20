/**
 *
 */
package com.itdaima.common.service;

import java.util.List;

import com.itdaima.common.persistence.BaseEntity;
import com.itdaima.common.utils.StringUtils;
import com.itdaima.modules.sys.entity.Role;
import com.itdaima.modules.sys.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;

/**
 * Service基类
 * @author ThinkGem
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class BaseService {
	
	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());


}
