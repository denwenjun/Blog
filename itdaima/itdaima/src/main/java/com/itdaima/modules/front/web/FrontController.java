package com.itdaima.modules.front.web;

import com.google.common.collect.Maps;
import com.itdaima.common.config.Global;
import com.itdaima.common.security.shiro.session.JedisSessionDAO;
import com.itdaima.common.security.shiro.session.SessionDAO;
import com.itdaima.common.servlet.ValidateCodeServlet;
import com.itdaima.common.utils.*;

import com.itdaima.common.web.BaseController;

import com.itdaima.common.web.Servlets;
import com.itdaima.modules.sys.entity.Menu;
import com.itdaima.modules.sys.entity.User;
import com.itdaima.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.itdaima.modules.sys.security.FormAuthenticationFilter;
import com.itdaima.modules.sys.service.SystemService;
import com.itdaima.modules.sys.utils.LogUtils;
import com.itdaima.modules.sys.utils.UserUtils;

import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/12.
 */
@Controller
@RequestMapping(value = "${frontPath}")
public class FrontController extends BaseController {

    @Autowired
    private SessionDAO sessionDAO;
    @Autowired
    private SystemService systemService;

    @ModelAttribute("user")
    public User get(@RequestParam(required=false) String id) {
        if (StringUtils.isNotBlank(id)){
            return systemService.getUser(id);
        }else{
            return new User();
        }
    }
    /**
     * 网站首页
     */
    @RequestMapping
    public String index(Model model,HttpServletRequest request, HttpServletResponse response) {
        model.addAttribute("navbarType", "default");
        return "modules/front/themes/basic/frontIndex";
    }

    /**
     * 前端登录
     */
    @RequestMapping(value = "frontLogin${urlSuffix}")
    public String frontLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
       Principal principal = UserUtils.getPrincipal();
        String username = request.getParameter("username");
        if (logger.isDebugEnabled()){
            logger.debug("login, active session size: {}", sessionDAO.getActiveSessions(false).size());
        }

        // 如果已登录，再次访问主页，则退出原账号。
        if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))){
            CookieUtils.setCookie(response, "LOGINED", "false");
        }

        // 如果已经登录，则跳转到登录之前的页面
        if(principal != null && !principal.isMobileLogin()){
            String redirect_url = request.getParameter("redirect_url");



            if(StringUtils.isNotBlank(redirect_url)){
                return "redirect:" +  redirect_url;
            }else {
                model.addAttribute("message", "账号：" + principal.getLoginName() + "已登录");
                model.addAttribute("isLogin", "true");
            }
        }
        return "modules/front/frontLogin";
    }

    /**
     * 登录失败，真正登录的POST请求由Filter完成
     */
    @RequestMapping(value = "frontLogin${urlSuffix}", method = RequestMethod.POST)
    public String loginFail(HttpServletRequest request, HttpServletResponse response, Model model) {
        Principal principal = UserUtils.getPrincipal();

        // 如果已经登录，则跳转到管理首页
        if(principal != null){
            return "redirect:" + request.getParameter("redirect_url");
        }

        String username = WebUtils.getCleanParam(request, FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);
        boolean rememberMe = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM);
        boolean mobile = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_MOBILE_PARAM);
        String exception = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        String message = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM);

        if (StringUtils.isBlank(message) || StringUtils.equals(message, "null")){
            message = "用户或密码错误, 请重试.";
        }

        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM, rememberMe);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_MOBILE_PARAM, mobile);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);

        if (logger.isDebugEnabled()){
            logger.debug("login fail, active session size: {}, message: {}, exception: {}",
                    sessionDAO.getActiveSessions(false).size(), message, exception);
        }

        // 非授权异常，登录失败，验证码加1。
        if (!UnauthorizedException.class.getName().equals(exception)){
            model.addAttribute("isValidateCodeLogin", isValidateCodeLogin(username, true, false));
        }

        // 验证失败清空验证码
        request.getSession().setAttribute(ValidateCodeServlet.VALIDATE_CODE, IdGen.uuid());

        // 如果是手机登录，则返回JSON字符串
        if (mobile){
            return renderString(response, model);
        }

        return "modules/front/frontLogin";
    }

    /**
     * 是否是验证码登录
     * @param useruame 用户名
     * @param isFail 计数加1
     * @param clean 计数清零
     * @return
     */
    @SuppressWarnings("unchecked")
    public static boolean isValidateCodeLogin(String useruame, boolean isFail, boolean clean){
        Map<String, Integer> loginFailMap = (Map<String, Integer>) CacheUtils.get("loginFailMap");
        if (loginFailMap==null){
            loginFailMap = Maps.newHashMap();
            CacheUtils.put("loginFailMap", loginFailMap);
        }
        Integer loginFailNum = loginFailMap.get(useruame);
        if (loginFailNum==null){
            loginFailNum = 0;
        }
        if (isFail){
            loginFailNum++;
            loginFailMap.put(useruame, loginFailNum);
        }
        if (clean){
            loginFailMap.remove(useruame);
        }
        return loginFailNum >= 3;
    }

    /**
     *  用户注册
     */

    @RequestMapping(value="register{urlSuffix}")
    public String register(HttpServletRequest request, HttpServletResponse response,
                           Model model, String loginName,String email,String password,String validateCode) {

        if(Servlets.isAjaxRequest(request)){
            String code = (String)request.getSession().getAttribute(ValidateCodeServlet.VALIDATE_CODE);
            if(!code.equalsIgnoreCase(validateCode)){
                return renderString(response, Result.errorResult().setMsg("验证码输入不正确"));
            }
            boolean bool = false;
            if (loginName !=null && systemService.getUserByLoginName(loginName) == null) {
                bool = true;
            }
            if(bool){
                User user = new User();
                user.setLoginName(loginName);
                user.setName(loginName);
                user.setEmail(email);
                user.setPhoto("/static/images/Img_head/default_head.jpg");
                user.setPassword(SystemService.entryptPassword(password));
                user.setCreateBy(user);
                user.setRoleId("6"); //默认赋予普通用户角色
                systemService.saveUser(user);
                return renderString(response, Result.successResult().setMsg("恭喜您注册成功"));
            }else {
                return renderString(response, Result.errorResult().setMsg("用户名已存在"));
            }
        }
        return "modules/front/frontRegister";
    }

}
