package com.itdaima.modules.talk.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2017/7/14.
 */
@Controller
@RequestMapping(value = "${frontPath}/viewF")
public class ViewF {

    @RequestMapping("index")
      public ModelAndView Add(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("ftl/view");
        mav.addObject("xiaoming","xiaoming");
    //    mav.addObject("CREATE_HTML",false);
        return mav;
    }
}
