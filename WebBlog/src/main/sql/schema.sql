-- 数据库初始化脚本

--创建数据库表
CREATE DATBASE personalblog;
--使用数据库
use personalblog;
--创建数据库表
CREATE TABLE user_info(
user_id bigint NOT NULL AUTO_INCREMENT,
password varchar(120) NOT NULL,
description varchar(2000) ,
create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
modified_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (user_id),
key idx_create_time(create_time),
key idx_modified_time(modified_time)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;