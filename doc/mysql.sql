/**
 * 目录表
 */
drop table if exists folder;

CREATE TABLE folder (
  id int(11) not null auto_increment comment '目录id',
  name varchar(100) not null default '' comment '中文名',
  path varchar(200) not null default '' comment '路径',
  content text comment '描述',
  sort  int(11) default '1' comment '排序',
  status varchar(20) DEFAULT '1' comment '状态//radio/2,隐藏,1,显示',
  type  int(11) DEFAULT '1' comment '类型//radio/1,普通目录,2,单页',
  update_time varchar(64) DEFAULT NULL COMMENT '更新时间',
  create_time  varchar(64) DEFAULT NULL COMMENT '创建时间',
  create_id  int(11) DEFAULT 0 COMMENT '创建者',
  primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='目录';

/**
 * 文章表
 */
drop table if exists article;
CREATE TABLE article
(
  id int(11) not null auto_increment comment 'id',
  folder_id integer default 1 comment '目录id',
  title varchar(200) default '' comment '文章标题',
  content text comment '文章内容', 
  count_view int(11) default '0' comment '浏览数',
  count_comment int(11) default '0' comment '评论数',
  type  int(11) default '1' comment '类型//radio/1,原创,2,转载',
  status varchar(20) default '1' comment '状态//radio/2,隐藏,1,显示',
  is_comment varchar(20) default '1' comment '是否评论//radio/2,否,1,是',
  sort  int(11) default '1' comment '排序',
  image_url varchar(256) default null comment '图片路径',
  publish_time varchar(64) DEFAULT NULL COMMENT '发布时间',
  publish_user varchar(64) DEFAULT '1' COMMENT '发布者',
  update_time varchar(64) DEFAULT NULL COMMENT '更新时间',
  create_time  varchar(64) DEFAULT NULL COMMENT '创建时间',
  create_id  int(11) DEFAULT 0 COMMENT '创建者',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章';
-- 主键从100开始
alter table article AUTO_INCREMENT=100;


/**
 * 标签
 */
drop table if exists tags;
CREATE TABLE tags
(
  id int(11) not null auto_increment comment 'id',
  article_id int(11) DEFAULT NULL COMMENT '文章ID',
  tagname varchar(200) default '' comment '标签内容',
  create_time  varchar(64) DEFAULT NULL COMMENT '创建时间',
  create_id  int(11) DEFAULT 0 COMMENT '创建者',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签';


/**
 * 用户
 */
drop table if exists user;
CREATE TABLE user
(
  id int(11) not null auto_increment comment 'id',
  username varchar(32) default '' comment '帐户',
  password varchar(32) default '' comment '密码',
  name varchar(32) default '' comment '昵称',
  create_time  varchar(64) DEFAULT NULL COMMENT '创建时间',
  create_id  int(11) DEFAULT 0 COMMENT '创建者',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';




