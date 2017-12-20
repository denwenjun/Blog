package com.itdaima.modules.front.entity;

import com.itdaima.common.persistence.DataEntity;
import com.itdaima.modules.sys.entity.User;

/**
 * Created by Administrator on 2017/7/27.
 * 说说
 */
public class Say extends DataEntity<Say> {
    private static final long serialVersionUID = 1L;
    private String content; //说说内容
    private User user; //用户
    private String agoDate;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAgoDate() {
        return agoDate;
    }

    public void setAgoDate(String agoDate) {
        this.agoDate = agoDate;
    }
}
