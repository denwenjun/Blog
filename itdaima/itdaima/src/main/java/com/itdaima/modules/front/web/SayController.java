package com.itdaima.modules.front.web;

import com.itdaima.common.utils.Result;
import com.itdaima.common.web.BaseController;
import com.itdaima.modules.front.dao.SayDao;
import com.itdaima.modules.front.entity.Say;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2017/7/27.
 * 发表说说
 */
@Controller
@RequestMapping(value = "${frontPath}/say")
public class SayController extends BaseController {
    @Autowired
    private SayDao sayDao;

    @RequestMapping(value="")
    @ResponseBody
    public Result shareView(String sayContent) {
        Say say = new Say();
        say.setContent(sayContent);
        say.preInsert();
        sayDao.insert(say);
        Result result = Result.successResult();
        result.setMsg("说说发表成功");
        return result;
    }

}
