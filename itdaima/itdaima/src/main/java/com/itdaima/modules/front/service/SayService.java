package com.itdaima.modules.front.service;

import com.itdaima.common.persistence.Page;
import com.itdaima.common.service.CrudService;
import com.itdaima.common.utils.RelativeDateFormat;
import com.itdaima.modules.front.dao.SayDao;
import com.itdaima.modules.front.entity.Say;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2017/7/27.
 */
@Service
@Transactional(readOnly = true)
public class SayService extends CrudService<SayDao, Say> {

    public Page<Say> findPage(Page<Say> page, Say say) {
        page = super.findPage(page, say);
        List<Say> list = page.getList();
        for(Say s:list){
            s.setAgoDate(RelativeDateFormat.format(s.getCreateDate()));
        }
        return page;
    }
}
