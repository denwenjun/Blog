package com.itdaima.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2017/7/29.
 */
public class ImageCode {

    public static void getImg(String content){

        Pattern p_img = Pattern.compile("<p><(img|IMG)(.*?)(/>|></img>|><(/p)>)");
        Matcher m_img = p_img.matcher(content);
        boolean result_img = m_img.find();
        String newContent = "";
        while (result_img) {
            String str_img = m_img.group(2);
            String str_img_1 = "<p><img"+ str_img +"/></p>";  //原始
            Pattern p_src = Pattern.compile("(src|SRC)=(\"|\')(.*?)(\"|\')");
            Matcher m_src = p_src.matcher(str_img);
            if (m_src.find()) {
                String str_src = m_src.group(3);  //获取到图片的地址
                str_img = "<p><a href=\""+str_src+"\" target=\"_blank\" class=\"thumbnail\">" +
                        "<img data-original=\""+ str_src +"\" class=\"lazy\" src=\"/static/jquery/grey.gif\" />" +
                        "</a></p>";  // 现在的
                newContent = content.replace(str_img_1, str_img);
            }
            result_img = m_img.find();
        }
        System.out.println(newContent);
    }


    public static void main(String[] args) {
        String content = "<p>123123132</p>\n" +
                "\n" +
                "<p>&nbsp;</p>\n" +
                "\n" +
                "<p><img alt=\"123\" src=\"http://static.zuidaima.com/images/135806/201707/20170729115701573.jpg\" style=\"height:246px; width:820px\" /></p>\n" +
                "\n" +
                "<p>123123</p>\n";
        getImg(content);
    }




}
