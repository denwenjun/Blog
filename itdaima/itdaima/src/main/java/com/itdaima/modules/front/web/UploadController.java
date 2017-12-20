package com.itdaima.modules.front.web;

import com.itdaima.common.utils.ImageUploadUtil;
import com.itdaima.common.utils.UploadUtils;
import com.itdaima.common.web.BaseController;
import com.jspsmart.upload.SmartUpload;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Administrator on 2017/7/19.
 */
@Controller
@RequestMapping(value="${frontPath}/upload")
public class UploadController extends BaseController {

    /**
     *图片上传
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = {"uploadImage"})
    public String uploadImage(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String DirectoryName = "userfiles";
        try {
            ImageUploadUtil.ckeditor(request, response, DirectoryName);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
