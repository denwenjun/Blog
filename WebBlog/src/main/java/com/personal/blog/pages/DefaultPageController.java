package com.personal.blog.pages;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "${frontPath}")
public class DefaultPageController {

	public static final String DEFAULT_PAGE = "frontIndex";

	 /**
     * 网站首页
     */
	@RequestMapping( method = RequestMethod.GET)
    public String index(Model model,HttpServletRequest request, HttpServletResponse response) {
        model.addAttribute("navbarType", "default");
        return DEFAULT_PAGE;
    }
}
