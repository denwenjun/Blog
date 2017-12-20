package com.itdaima.modules.sys.entity;

import com.itdaima.common.persistence.DataEntity;

import java.util.List;

/**
 * Created by Administrator on 2017/7/22.
 */
public class Article extends DataEntity<Article> {

    private static final long serialVersionUID = 1L;
    private String title; //title标题
    private String type; //类型
    private String articleType; //文章类型
    private String keywords; //关键字
    private String content; //文章内容
    private Integer hits; //文章点击数  默认为0
    private String isAuditing;//是否审核  默认为0

    private List<String> img; //获取到img标签的src地址

    private User user; //发表文章作者信息
    private String createTime;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getHits() {
        return hits;
    }

    public void setHits(Integer hits) {
        this.hits = hits;
    }

    public String getIsAuditing() {
        return isAuditing;
    }

    public void setIsAuditing(String isAuditing) {
        this.isAuditing = isAuditing;
    }

    public String getArticleType() {
        return articleType;
    }

    public void setArticleType(String articleType) {
        this.articleType = articleType;
    }

    public List<String> getImg() {
        return img;
    }

    public void setImg(List<String> img) {
        this.img = img;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}

