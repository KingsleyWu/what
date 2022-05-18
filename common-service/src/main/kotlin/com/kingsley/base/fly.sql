/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : ry-vue

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2022-04-19 15:08:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('12', 'im_friend', 'friend', null, null, 'ImFriend', 'crud', 'com.ruoyi.vim', 'system', '好友', '好友', '乐天', '0', '/', '{\"parentMenuId\":\"4\"}', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:16:54', null);
INSERT INTO `gen_table` VALUES ('13', 'im_group', '群管理', null, null, 'ImGroup', 'crud', 'com.ruoyi.vim', 'vim', 'group', '群', '乐天', '0', '/', '{\"parentMenuId\":\"4\"}', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46', null);
INSERT INTO `gen_table` VALUES ('14', 'im_group_user', 'group_user', null, null, 'ImGroupUser', 'crud', 'com.ruoyi.vim', 'system', 'user', '群关系', '乐天', '0', '/', '{\"parentMenuId\":\"4\"}', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:40', null);
INSERT INTO `gen_table` VALUES ('15', 'im_message', 'message', null, null, 'ImMessage', 'crud', 'com.ruoyi.vim', 'system', 'message', '聊天信息', '乐天', '0', '/', '{\"parentMenuId\":\"4\"}', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:18', null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('112', '12', 'id', null, 'bigint(20)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:16:54');
INSERT INTO `gen_table_column` VALUES ('113', '12', 'user_id', '用户id', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:16:54');
INSERT INTO `gen_table_column` VALUES ('114', '12', 'friend_id', '用户id', 'bigint(20)', 'Long', 'friendId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:16:54');
INSERT INTO `gen_table_column` VALUES ('115', '12', 'check_flag', '审核状态', 'char(1)', 'String', 'checkFlag', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', '4', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:16:54');
INSERT INTO `gen_table_column` VALUES ('116', '12', 'message', '申请信息', 'varchar(255)', 'String', 'message', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:16:54');
INSERT INTO `gen_table_column` VALUES ('117', '12', 'create_time', null, 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '6', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:16:54');
INSERT INTO `gen_table_column` VALUES ('118', '12', 'update_time', null, 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '7', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:16:54');
INSERT INTO `gen_table_column` VALUES ('119', '12', 'create_by', null, 'bigint(20)', 'Long', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '8', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:16:54');
INSERT INTO `gen_table_column` VALUES ('120', '12', 'update_by', null, 'bigint(20)', 'Long', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '9', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:16:54');
INSERT INTO `gen_table_column` VALUES ('121', '12', 'del_flag', null, 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', null, null, null, 'EQ', 'input', '', '10', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:16:54');
INSERT INTO `gen_table_column` VALUES ('122', '12', 'remarks', null, 'varchar(255)', 'String', 'remarks', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:16:54');
INSERT INTO `gen_table_column` VALUES ('123', '13', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46');
INSERT INTO `gen_table_column` VALUES ('124', '13', 'name', '群名称', 'varchar(255)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46');
INSERT INTO `gen_table_column` VALUES ('125', '13', 'avatar', '群头像', 'varchar(255)', 'String', 'avatar', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46');
INSERT INTO `gen_table_column` VALUES ('126', '13', 'master', '群主', 'bigint(20)', 'Long', 'master', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46');
INSERT INTO `gen_table_column` VALUES ('127', '13', 'announcement', '公告', 'varchar(1000)', 'String', 'announcement', '0', '0', null, '1', '1', '1', '1', 'EQ', 'textarea', '', '5', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46');
INSERT INTO `gen_table_column` VALUES ('128', '13', 'need_check', '需要审核吗？', 'char(1)', 'String', 'needCheck', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', '6', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46');
INSERT INTO `gen_table_column` VALUES ('129', '13', 'create_time', null, 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '7', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46');
INSERT INTO `gen_table_column` VALUES ('130', '13', 'update_time', null, 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '8', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46');
INSERT INTO `gen_table_column` VALUES ('131', '13', 'create_by', null, 'bigint(20)', 'Long', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '9', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46');
INSERT INTO `gen_table_column` VALUES ('132', '13', 'update_by', null, 'bigint(20)', 'Long', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '10', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46');
INSERT INTO `gen_table_column` VALUES ('133', '13', 'del_flag', null, 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', null, null, null, 'EQ', 'radio', '', '11', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46');
INSERT INTO `gen_table_column` VALUES ('134', '13', 'remarks', null, 'varchar(255)', 'String', 'remarks', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '12', 'admin', '2022-01-25 15:14:09', '', '2022-01-28 10:25:46');
INSERT INTO `gen_table_column` VALUES ('135', '14', 'id', null, 'bigint(20)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:40');
INSERT INTO `gen_table_column` VALUES ('136', '14', 'group_id', '群id ', 'bigint(20)', 'Long', 'groupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:40');
INSERT INTO `gen_table_column` VALUES ('137', '14', 'user_id', '用户id', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:40');
INSERT INTO `gen_table_column` VALUES ('138', '14', 'check_flag', '审核状态', 'char(1)', 'String', 'checkFlag', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:40');
INSERT INTO `gen_table_column` VALUES ('139', '14', 'message', '申请信息', 'varchar(255)', 'String', 'message', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:40');
INSERT INTO `gen_table_column` VALUES ('140', '14', 'create_time', null, 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '6', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:40');
INSERT INTO `gen_table_column` VALUES ('141', '14', 'update_time', null, 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '7', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:40');
INSERT INTO `gen_table_column` VALUES ('142', '14', 'create_by', null, 'bigint(20)', 'Long', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '8', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:40');
INSERT INTO `gen_table_column` VALUES ('143', '14', 'update_by', null, 'bigint(20)', 'Long', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '9', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:40');
INSERT INTO `gen_table_column` VALUES ('144', '14', 'del_flag', null, 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', null, null, null, 'EQ', 'input', '', '10', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:40');
INSERT INTO `gen_table_column` VALUES ('145', '14', 'remarks', null, 'varchar(255)', 'String', 'remarks', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:40');
INSERT INTO `gen_table_column` VALUES ('146', '15', 'id', null, 'bigint(20)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:18');
INSERT INTO `gen_table_column` VALUES ('147', '15', 'to_id', '接收人', 'bigint(20)', 'Long', 'toId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:18');
INSERT INTO `gen_table_column` VALUES ('148', '15', 'from_id', '发送人', 'bigint(20)', 'Long', 'fromId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:18');
INSERT INTO `gen_table_column` VALUES ('149', '15', 'send_time', '发送时间', 'bigint(20)', 'Long', 'sendTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:18');
INSERT INTO `gen_table_column` VALUES ('150', '15', 'content', '内容', 'varchar(4000)', 'String', 'content', '0', '0', null, '1', '1', '1', '1', 'EQ', 'editor', '', '5', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:18');
INSERT INTO `gen_table_column` VALUES ('151', '15', 'type', '类型', 'char(1)', 'String', 'type', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '6', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:18');
INSERT INTO `gen_table_column` VALUES ('152', '15', 'read_status', '读状态', 'char(1)', 'String', 'readStatus', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', '7', 'admin', '2022-01-25 15:14:09', '', '2022-01-25 16:17:18');

-- ----------------------------
-- Table structure for im_friend
-- ----------------------------
DROP TABLE IF EXISTS `im_friend`;
CREATE TABLE `im_friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `friend_id` bigint(20) NOT NULL COMMENT '用户id',
  `state` char(1) DEFAULT NULL COMMENT '审核状态',
  `message` varchar(255) DEFAULT NULL COMMENT '信息',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `del_flag` char(1) NOT NULL DEFAULT '0',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index2` (`user_id`,`friend_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1506140117020000258 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of im_friend
-- ----------------------------
INSERT INTO `im_friend` VALUES ('1506140117020000257', '1', '2', '0', null, null, null, null, null, '0', null);

-- ----------------------------
-- Table structure for im_group
-- ----------------------------
DROP TABLE IF EXISTS `im_group`;
CREATE TABLE `im_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '群名称',
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '群头像',
  `master` bigint(20) DEFAULT NULL COMMENT '群主',
  `announcement` varchar(1000) DEFAULT NULL COMMENT '公告',
  `need_check` char(1) DEFAULT NULL COMMENT '需要审核吗？',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `del_flag` char(1) NOT NULL DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1503638410427985923 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of im_group
-- ----------------------------
INSERT INTO `im_group` VALUES ('1491267109814104066', 'asdsad', '/img/default-group.png', '1', null, '1', '2022-02-09 12:26:00', null, '1', null, '0', null);
INSERT INTO `im_group` VALUES ('1491267500601602049', 'dddddd', '/img/default-group.png', '1', null, '0', '2022-02-09 12:27:33', null, '1', null, '0', null);
INSERT INTO `im_group` VALUES ('1491268427668594690', 'xxxxxxxx', 'http://127.0.0.1:8080/profile/upload/2022/02/09/82a67179-56f0-4674-b592-652f6e65cba6.png', '1', null, '0', '2022-02-09 12:31:14', null, '1', null, '0', null);
INSERT INTO `im_group` VALUES ('1491698873636278274', '电影群', 'http://127.0.0.1:8080/profile/upload/2022/02/10/f1920d27-5420-4192-a921-efdd16cf9d88.png', '1', null, '0', '2022-02-10 17:01:41', '2022-04-01 13:15:22', '1', '1', '0', null);
INSERT INTO `im_group` VALUES ('1503638410427985922', '2dsdasd', 'http://127.0.0.1:8080/profile/upload/2022/03/15/abe886dd-edde-4310-8e60-878f8f43cb35.png', '2', null, '0', '2022-03-15 15:45:08', null, '2', null, '0', null);

-- ----------------------------
-- Table structure for im_group_user
-- ----------------------------
DROP TABLE IF EXISTS `im_group_user`;
CREATE TABLE `im_group_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL COMMENT '群id ',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `state` char(1) DEFAULT NULL COMMENT '审核状态',
  `message` varchar(255) DEFAULT NULL COMMENT '申请信息',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `del_flag` char(1) NOT NULL DEFAULT '0',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1509793756821430274 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of im_group_user
-- ----------------------------
INSERT INTO `im_group_user` VALUES ('1491268427735703553', '1491268427668594690', '1', '0', null, null, null, null, null, '0', null);
INSERT INTO `im_group_user` VALUES ('1491268448736583682', '1491268427668594690', '2', '0', null, null, null, null, null, '0', null);
INSERT INTO `im_group_user` VALUES ('1491698873636278275', '1491698873636278274', '1', '0', null, null, null, null, null, '0', null);
INSERT INTO `im_group_user` VALUES ('1503638410448957441', '1503638410427985922', '2', '0', null, null, null, null, null, '0', null);
INSERT INTO `im_group_user` VALUES ('1503638429222662146', '1503638410427985922', '1', '0', null, null, null, null, null, '0', null);
INSERT INTO `im_group_user` VALUES ('1509793756821430273', '1491698873636278274', '2', '0', null, null, null, null, null, '0', null);

-- ----------------------------
-- Table structure for im_message
-- ----------------------------
DROP TABLE IF EXISTS `im_message`;
CREATE TABLE `im_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `to_id` bigint(20) DEFAULT NULL COMMENT '接收人',
  `from_id` bigint(20) DEFAULT NULL COMMENT '发送人',
  `send_time` bigint(20) DEFAULT NULL COMMENT '发送时间',
  `content` varchar(4000) CHARACTER SET utf8 DEFAULT NULL COMMENT '内容',
  `type` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `read_status` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '读状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of im_message
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1650259290000', '-1', '5', 'PAUSED', 'CRON', '1650259289000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1650259290000', '-1', '5', 'PAUSED', 'CRON', '1650259289000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1650259300000', '-1', '5', 'PAUSED', 'CRON', '1650259289000', '0', null, '2', '');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017E8F2114E878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017E8F2114E878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017E8F2118D078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'LAPTOP-PPJGL4GL1650259289443', '1650260313691', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-01-25 10:46:57', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-01-25 10:46:57', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-01-25 10:46:57', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-01-25 10:46:57', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-01-25 10:46:57', '', null, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-25 10:46:49', '', null, null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-25 10:46:49', '', null, null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-25 10:46:49', '', null, null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-25 10:46:49', '', null, null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-25 10:46:50', '', null, null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-25 10:46:50', '', null, null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-25 10:46:50', '', null, null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-25 10:46:50', '', null, null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-25 10:46:50', '', null, null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-25 10:46:50', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-01-25 10:46:56', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-01-25 10:46:56', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-01-25 10:46:56', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-01-25 10:46:56', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-01-25 10:46:56', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-01-25 10:46:56', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-01-25 10:46:56', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-01-25 10:46:56', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-01-25 10:46:56', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-01-25 10:46:56', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-01-25 10:46:56', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-01-25 10:46:56', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-01-25 10:46:56', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-01-25 10:46:56', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-01-25 10:46:56', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-01-25 10:46:56', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-01-25 10:46:56', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-25 10:46:57', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-25 10:46:57', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-25 10:46:57', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-01-25 10:46:57', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-25 10:46:57', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-25 10:46:57', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-25 10:46:57', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-25 10:46:57', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-25 10:46:57', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-01-25 10:46:57', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-01-25 10:46:57', '', null, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-01-25 10:46:56', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-01-25 10:46:56', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-01-25 10:46:56', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-01-25 10:46:56', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-01-25 10:46:56', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-01-25 10:46:56', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-01-25 10:46:56', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-01-25 10:46:56', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-01-25 10:46:56', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-01-25 10:46:56', '', null, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-01-25 10:46:57', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-01-25 10:46:57', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-01-25 10:46:58', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_info`;
CREATE TABLE `sys_login_info` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_login_info
-- ----------------------------
INSERT INTO `sys_login_info` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-25 12:38:34');
INSERT INTO `sys_login_info` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-01-25 13:12:08');
INSERT INTO `sys_login_info` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-25 13:12:14');
INSERT INTO `sys_login_info` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-25 13:12:30');
INSERT INTO `sys_login_info` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-25 13:47:52');
INSERT INTO `sys_login_info` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-25 14:18:48');
INSERT INTO `sys_login_info` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-25 15:13:12');
INSERT INTO `sys_login_info` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-28 10:24:21');
INSERT INTO `sys_login_info` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-28 11:16:41');
INSERT INTO `sys_login_info` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-28 12:18:13');
INSERT INTO `sys_login_info` VALUES ('110', 'wangwu', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：wangwu 不存在', '2022-02-09 12:13:41');
INSERT INTO `sys_login_info` VALUES ('111', 'wangwu', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-02-09 12:13:50');
INSERT INTO `sys_login_info` VALUES ('112', 'wangwu', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：wangwu 不存在', '2022-02-09 12:13:58');
INSERT INTO `sys_login_info` VALUES ('113', 'wangwu', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：wangwu 不存在', '2022-02-09 12:14:38');
INSERT INTO `sys_login_info` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-02-09 12:15:01');
INSERT INTO `sys_login_info` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-02-09 12:15:09');
INSERT INTO `sys_login_info` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-02-09 12:15:18');
INSERT INTO `sys_login_info` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-09 12:15:28');
INSERT INTO `sys_login_info` VALUES ('118', 'wangwu', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：wangwu 不存在', '2022-02-10 12:20:47');
INSERT INTO `sys_login_info` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-02-10 12:20:54');
INSERT INTO `sys_login_info` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-02-10 12:20:57');
INSERT INTO `sys_login_info` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-10 12:21:07');
INSERT INTO `sys_login_info` VALUES ('122', 'ruoyi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：ruoyi 不存在', '2022-02-10 13:15:06');
INSERT INTO `sys_login_info` VALUES ('123', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-02-10 13:15:10');
INSERT INTO `sys_login_info` VALUES ('124', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-10 13:15:20');
INSERT INTO `sys_login_info` VALUES ('125', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-10 16:35:35');
INSERT INTO `sys_login_info` VALUES ('126', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：ry 不存在', '2022-02-10 16:35:42');
INSERT INTO `sys_login_info` VALUES ('127', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-10 16:36:38');
INSERT INTO `sys_login_info` VALUES ('128', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-10 16:39:49');
INSERT INTO `sys_login_info` VALUES ('129', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-10 16:40:00');
INSERT INTO `sys_login_info` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-10 16:43:01');
INSERT INTO `sys_login_info` VALUES ('131', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-11 15:38:11');
INSERT INTO `sys_login_info` VALUES ('132', 'wangwu', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：wangwu 不存在', '2022-03-14 10:30:18');
INSERT INTO `sys_login_info` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-14 10:30:28');
INSERT INTO `sys_login_info` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-14 10:30:42');
INSERT INTO `sys_login_info` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-14 10:31:27');
INSERT INTO `sys_login_info` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-14 10:34:20');
INSERT INTO `sys_login_info` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 10:34:30');
INSERT INTO `sys_login_info` VALUES ('138', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 10:37:12');
INSERT INTO `sys_login_info` VALUES ('139', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 13:10:50');
INSERT INTO `sys_login_info` VALUES ('140', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-14 13:12:09');
INSERT INTO `sys_login_info` VALUES ('141', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 13:12:14');
INSERT INTO `sys_login_info` VALUES ('142', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-14 13:43:34');
INSERT INTO `sys_login_info` VALUES ('143', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 13:43:39');
INSERT INTO `sys_login_info` VALUES ('144', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 16:22:40');
INSERT INTO `sys_login_info` VALUES ('145', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-15 15:37:04');
INSERT INTO `sys_login_info` VALUES ('146', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-15 15:37:11');
INSERT INTO `sys_login_info` VALUES ('147', 'wangwu', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：wangwu 不存在', '2022-03-15 15:37:20');
INSERT INTO `sys_login_info` VALUES ('148', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-15 15:39:00');
INSERT INTO `sys_login_info` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 15:43:14');
INSERT INTO `sys_login_info` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-15 15:44:04');
INSERT INTO `sys_login_info` VALUES ('151', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 15:44:12');
INSERT INTO `sys_login_info` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 15:45:37');
INSERT INTO `sys_login_info` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 16:27:48');
INSERT INTO `sys_login_info` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-17 15:33:59');
INSERT INTO `sys_login_info` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-17 15:46:07');
INSERT INTO `sys_login_info` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-18 11:00:49');
INSERT INTO `sys_login_info` VALUES ('157', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-18 11:01:49');
INSERT INTO `sys_login_info` VALUES ('158', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-18 12:03:30');
INSERT INTO `sys_login_info` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-18 12:21:00');
INSERT INTO `sys_login_info` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-21 12:16:42');
INSERT INTO `sys_login_info` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-21 12:19:39');
INSERT INTO `sys_login_info` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-21 13:10:14');
INSERT INTO `sys_login_info` VALUES ('163', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-21 13:57:36');
INSERT INTO `sys_login_info` VALUES ('164', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-21 16:05:17');
INSERT INTO `sys_login_info` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-21 16:05:40');
INSERT INTO `sys_login_info` VALUES ('166', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-21 16:43:32');
INSERT INTO `sys_login_info` VALUES ('167', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-21 16:51:27');
INSERT INTO `sys_login_info` VALUES ('168', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-21 16:54:20');
INSERT INTO `sys_login_info` VALUES ('169', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 09:39:01');
INSERT INTO `sys_login_info` VALUES ('170', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 10:15:55');
INSERT INTO `sys_login_info` VALUES ('171', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 10:31:41');
INSERT INTO `sys_login_info` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 10:32:19');
INSERT INTO `sys_login_info` VALUES ('173', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 10:51:08');
INSERT INTO `sys_login_info` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-22 10:53:47');
INSERT INTO `sys_login_info` VALUES ('175', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 10:53:56');
INSERT INTO `sys_login_info` VALUES ('176', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-22 10:54:44');
INSERT INTO `sys_login_info` VALUES ('177', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-22 10:54:56');
INSERT INTO `sys_login_info` VALUES ('178', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 11:07:39');
INSERT INTO `sys_login_info` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-22 11:08:57');
INSERT INTO `sys_login_info` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-22 11:09:01');
INSERT INTO `sys_login_info` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 11:09:26');
INSERT INTO `sys_login_info` VALUES ('182', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 11:17:46');
INSERT INTO `sys_login_info` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 13:24:06');
INSERT INTO `sys_login_info` VALUES ('184', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 13:25:36');
INSERT INTO `sys_login_info` VALUES ('185', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 13:36:36');
INSERT INTO `sys_login_info` VALUES ('186', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-22 13:42:34');
INSERT INTO `sys_login_info` VALUES ('187', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 13:45:28');
INSERT INTO `sys_login_info` VALUES ('188', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 14:24:59');
INSERT INTO `sys_login_info` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 14:26:08');
INSERT INTO `sys_login_info` VALUES ('190', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-22 14:32:17');
INSERT INTO `sys_login_info` VALUES ('191', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 14:32:21');
INSERT INTO `sys_login_info` VALUES ('192', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-22 14:32:24');
INSERT INTO `sys_login_info` VALUES ('193', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 14:32:47');
INSERT INTO `sys_login_info` VALUES ('194', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 13:55:27');
INSERT INTO `sys_login_info` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 13:55:59');
INSERT INTO `sys_login_info` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 13:57:44');
INSERT INTO `sys_login_info` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-27 14:00:02');
INSERT INTO `sys_login_info` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 14:00:05');
INSERT INTO `sys_login_info` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 14:00:40');
INSERT INTO `sys_login_info` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 14:00:44');
INSERT INTO `sys_login_info` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 15:15:54');
INSERT INTO `sys_login_info` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 09:37:04');
INSERT INTO `sys_login_info` VALUES ('203', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 10:01:36');
INSERT INTO `sys_login_info` VALUES ('204', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 12:08:38');
INSERT INTO `sys_login_info` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 12:10:31');
INSERT INTO `sys_login_info` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 12:20:38');
INSERT INTO `sys_login_info` VALUES ('207', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 12:20:43');
INSERT INTO `sys_login_info` VALUES ('208', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 12:21:09');
INSERT INTO `sys_login_info` VALUES ('209', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 12:21:13');
INSERT INTO `sys_login_info` VALUES ('210', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-29 13:07:08');
INSERT INTO `sys_login_info` VALUES ('211', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 13:07:12');
INSERT INTO `sys_login_info` VALUES ('212', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 13:21:33');
INSERT INTO `sys_login_info` VALUES ('213', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-29 13:21:34');
INSERT INTO `sys_login_info` VALUES ('214', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 13:21:38');
INSERT INTO `sys_login_info` VALUES ('215', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 13:23:44');
INSERT INTO `sys_login_info` VALUES ('216', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-29 15:35:33');
INSERT INTO `sys_login_info` VALUES ('217', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-29 15:35:38');
INSERT INTO `sys_login_info` VALUES ('218', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-29 15:35:43');
INSERT INTO `sys_login_info` VALUES ('219', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 15:35:51');
INSERT INTO `sys_login_info` VALUES ('220', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 16:01:17');
INSERT INTO `sys_login_info` VALUES ('221', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 16:02:31');
INSERT INTO `sys_login_info` VALUES ('222', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:06:52');
INSERT INTO `sys_login_info` VALUES ('223', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:07:18');
INSERT INTO `sys_login_info` VALUES ('224', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 17:10:39');
INSERT INTO `sys_login_info` VALUES ('225', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:10:57');
INSERT INTO `sys_login_info` VALUES ('226', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 17:11:08');
INSERT INTO `sys_login_info` VALUES ('227', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:11:28');
INSERT INTO `sys_login_info` VALUES ('228', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 17:13:18');
INSERT INTO `sys_login_info` VALUES ('229', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-29 17:13:52');
INSERT INTO `sys_login_info` VALUES ('230', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:13:57');
INSERT INTO `sys_login_info` VALUES ('231', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 17:15:03');
INSERT INTO `sys_login_info` VALUES ('232', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:15:23');
INSERT INTO `sys_login_info` VALUES ('233', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 17:20:34');
INSERT INTO `sys_login_info` VALUES ('234', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-29 17:22:05');
INSERT INTO `sys_login_info` VALUES ('235', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:22:11');
INSERT INTO `sys_login_info` VALUES ('236', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 17:27:29');
INSERT INTO `sys_login_info` VALUES ('237', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:27:54');
INSERT INTO `sys_login_info` VALUES ('238', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 17:29:49');
INSERT INTO `sys_login_info` VALUES ('239', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:30:31');
INSERT INTO `sys_login_info` VALUES ('240', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 17:30:45');
INSERT INTO `sys_login_info` VALUES ('241', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:31:02');
INSERT INTO `sys_login_info` VALUES ('242', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 17:37:42');
INSERT INTO `sys_login_info` VALUES ('243', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:38:05');
INSERT INTO `sys_login_info` VALUES ('244', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 17:38:12');
INSERT INTO `sys_login_info` VALUES ('245', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:38:15');
INSERT INTO `sys_login_info` VALUES ('246', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 17:38:21');
INSERT INTO `sys_login_info` VALUES ('247', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:38:29');
INSERT INTO `sys_login_info` VALUES ('248', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 17:41:39');
INSERT INTO `sys_login_info` VALUES ('249', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 17:41:48');
INSERT INTO `sys_login_info` VALUES ('250', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 13:11:42');
INSERT INTO `sys_login_info` VALUES ('251', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 13:13:21');
INSERT INTO `sys_login_info` VALUES ('252', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 13:13:39');
INSERT INTO `sys_login_info` VALUES ('253', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 13:13:50');
INSERT INTO `sys_login_info` VALUES ('254', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-01 13:14:09');
INSERT INTO `sys_login_info` VALUES ('255', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 13:14:32');
INSERT INTO `sys_login_info` VALUES ('256', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-01 13:14:49');
INSERT INTO `sys_login_info` VALUES ('257', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 13:15:02');
INSERT INTO `sys_login_info` VALUES ('258', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-01 13:15:31');
INSERT INTO `sys_login_info` VALUES ('259', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 13:15:35');
INSERT INTO `sys_login_info` VALUES ('260', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-01 13:15:41');
INSERT INTO `sys_login_info` VALUES ('261', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 13:15:53');
INSERT INTO `sys_login_info` VALUES ('262', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-01 13:16:03');
INSERT INTO `sys_login_info` VALUES ('263', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 13:16:15');
INSERT INTO `sys_login_info` VALUES ('264', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-01 13:16:44');
INSERT INTO `sys_login_info` VALUES ('265', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 13:17:02');
INSERT INTO `sys_login_info` VALUES ('266', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-01 13:18:48');
INSERT INTO `sys_login_info` VALUES ('267', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 13:19:00');
INSERT INTO `sys_login_info` VALUES ('268', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-01 13:29:27');
INSERT INTO `sys_login_info` VALUES ('269', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 13:51:27');
INSERT INTO `sys_login_info` VALUES ('270', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 13:52:21');
INSERT INTO `sys_login_info` VALUES ('271', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 13:52:34');
INSERT INTO `sys_login_info` VALUES ('272', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 13:52:42');
INSERT INTO `sys_login_info` VALUES ('273', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 13:52:57');
INSERT INTO `sys_login_info` VALUES ('274', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 13:53:06');
INSERT INTO `sys_login_info` VALUES ('275', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 13:53:16');
INSERT INTO `sys_login_info` VALUES ('276', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 13:54:11');
INSERT INTO `sys_login_info` VALUES ('277', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 13:54:15');
INSERT INTO `sys_login_info` VALUES ('278', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 13:54:18');
INSERT INTO `sys_login_info` VALUES ('279', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 13:54:28');
INSERT INTO `sys_login_info` VALUES ('280', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 13:57:50');
INSERT INTO `sys_login_info` VALUES ('281', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 14:27:11');
INSERT INTO `sys_login_info` VALUES ('282', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 14:27:48');
INSERT INTO `sys_login_info` VALUES ('283', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 14:28:00');
INSERT INTO `sys_login_info` VALUES ('284', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 14:28:11');
INSERT INTO `sys_login_info` VALUES ('285', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 14:28:23');
INSERT INTO `sys_login_info` VALUES ('286', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 14:28:38');
INSERT INTO `sys_login_info` VALUES ('287', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 14:37:51');
INSERT INTO `sys_login_info` VALUES ('288', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 14:38:00');
INSERT INTO `sys_login_info` VALUES ('289', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 14:38:26');
INSERT INTO `sys_login_info` VALUES ('290', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 14:38:35');
INSERT INTO `sys_login_info` VALUES ('291', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 14:39:06');
INSERT INTO `sys_login_info` VALUES ('292', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 14:39:14');
INSERT INTO `sys_login_info` VALUES ('293', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-01 14:40:39');
INSERT INTO `sys_login_info` VALUES ('294', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 14:41:01');
INSERT INTO `sys_login_info` VALUES ('295', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 14:41:10');
INSERT INTO `sys_login_info` VALUES ('296', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 14:41:19');
INSERT INTO `sys_login_info` VALUES ('297', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 14:41:39');
INSERT INTO `sys_login_info` VALUES ('298', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 14:41:42');
INSERT INTO `sys_login_info` VALUES ('299', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 14:48:46');
INSERT INTO `sys_login_info` VALUES ('300', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 14:49:02');
INSERT INTO `sys_login_info` VALUES ('301', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-01 14:49:10');
INSERT INTO `sys_login_info` VALUES ('302', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 14:49:21');
INSERT INTO `sys_login_info` VALUES ('303', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 15:22:18');
INSERT INTO `sys_login_info` VALUES ('304', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-01 17:27:21');
INSERT INTO `sys_login_info` VALUES ('305', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2022-04-11 09:59:28');
INSERT INTO `sys_login_info` VALUES ('306', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-11 09:59:32');
INSERT INTO `sys_login_info` VALUES ('307', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 10:00:07');
INSERT INTO `sys_login_info` VALUES ('308', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 10:27:46');
INSERT INTO `sys_login_info` VALUES ('309', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-11 10:28:15');
INSERT INTO `sys_login_info` VALUES ('310', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 10:28:19');
INSERT INTO `sys_login_info` VALUES ('311', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-11 10:32:24');
INSERT INTO `sys_login_info` VALUES ('312', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 10:32:28');
INSERT INTO `sys_login_info` VALUES ('313', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-11 10:32:32');
INSERT INTO `sys_login_info` VALUES ('314', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 10:32:36');
INSERT INTO `sys_login_info` VALUES ('315', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-11 10:33:21');
INSERT INTO `sys_login_info` VALUES ('316', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 10:33:25');
INSERT INTO `sys_login_info` VALUES ('317', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-11 10:37:50');
INSERT INTO `sys_login_info` VALUES ('318', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 10:37:53');
INSERT INTO `sys_login_info` VALUES ('319', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 12:53:11');
INSERT INTO `sys_login_info` VALUES ('320', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-04-11 12:54:34');
INSERT INTO `sys_login_info` VALUES ('321', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 12:54:39');
INSERT INTO `sys_login_info` VALUES ('322', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 16:12:10');
INSERT INTO `sys_login_info` VALUES ('323', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 14:49:10');
INSERT INTO `sys_login_info` VALUES ('324', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-15 14:49:41');
INSERT INTO `sys_login_info` VALUES ('325', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-18 11:07:33');
INSERT INTO `sys_login_info` VALUES ('326', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-18 12:26:01');
INSERT INTO `sys_login_info` VALUES ('327', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-18 13:21:53');
INSERT INTO `sys_login_info` VALUES ('328', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-18 13:23:18');
INSERT INTO `sys_login_info` VALUES ('329', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-18 13:23:23');
INSERT INTO `sys_login_info` VALUES ('330', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-18 13:23:30');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1067 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2022-01-25 10:46:51', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2022-01-25 10:46:51', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2022-01-25 10:46:51', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '若依官网', '0', '4', 'vim', null, '', '1', '0', 'M', '0', '0', '', 'guide', 'admin', '2022-01-25 10:46:51', 'admin', '2022-01-28 10:27:52', '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-01-25 10:46:51', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-01-25 10:46:51', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-01-25 10:46:51', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-01-25 10:46:51', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-01-25 10:46:51', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-01-25 10:46:51', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-01-25 10:46:51', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-01-25 10:46:51', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2022-01-25 10:46:51', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-01-25 10:46:51', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-01-25 10:46:51', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-01-25 10:46:51', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-01-25 10:46:51', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-01-25 10:46:51', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-01-25 10:46:51', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-01-25 10:46:51', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-01-25 10:46:51', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-01-25 10:46:51', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'loginInfo', 'monitor/loginInfo/index', '', '1', '0', 'C', '0', '0', 'monitor:loginInfo:list', 'logininfor', 'admin', '2022-01-25 10:46:51', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-01-25 10:46:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-01-25 10:46:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-01-25 10:46:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-01-25 10:46:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-01-25 10:46:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-01-25 10:46:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:loginInfo:query', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:loginInfo:remove', '#', 'admin', '2022-01-25 10:46:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:loginInfo:export', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '7', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '115', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '115', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '115', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '115', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-01-25 10:46:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1061', '群', '4', '1', 'group', 'vim/group/index', null, '1', '0', 'C', '0', '0', 'vim:group:list', '#', 'admin', '2022-01-28 10:27:14', '', null, '群菜单');
INSERT INTO `sys_menu` VALUES ('1062', '群查询', '1061', '1', '#', '', null, '1', '0', 'F', '0', '0', 'vim:group:query', '#', 'admin', '2022-01-28 10:27:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1063', '群新增', '1061', '2', '#', '', null, '1', '0', 'F', '0', '0', 'vim:group:add', '#', 'admin', '2022-01-28 10:27:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1064', '群修改', '1061', '3', '#', '', null, '1', '0', 'F', '0', '0', 'vim:group:edit', '#', 'admin', '2022-01-28 10:27:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1065', '群删除', '1061', '4', '#', '', null, '1', '0', 'F', '0', '0', 'vim:group:remove', '#', 'admin', '2022-01-28 10:27:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1066', '群导出', '1061', '5', '#', '', null, '1', '0', 'F', '0', '0', 'vim:group:export', '#', 'admin', '2022-01-28 10:27:14', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-01-25 10:46:58', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-01-25 10:46:58', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_notice', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 12:38:52');
INSERT INTO `sys_oper_log` VALUES ('101', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-01-25 12:38:54');
INSERT INTO `sys_oper_log` VALUES ('102', '在线用户', '7', 'com.ruoyi.web.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', '1', 'admin', null, '/monitor/online/24f4b5c9-4657-4c2c-94d4-aeae94851988', '127.0.0.1', '内网IP', '{tokenId=24f4b5c9-4657-4c2c-94d4-aeae94851988}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 13:12:24');
INSERT INTO `sys_oper_log` VALUES ('103', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 13:48:21');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'im_message,im_group_user,im_group,im_friend,sys_job_log,sys_notice,sys_job,sys_config,sys_login_info,sys_dict_type', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 14:48:55');
INSERT INTO `sys_oper_log` VALUES ('105', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/2,3,4,5', '127.0.0.1', '内网IP', '{tableIds=2,3,4,5}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 14:49:41');
INSERT INTO `sys_oper_log` VALUES ('106', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/6,7,8,9,10,11', '127.0.0.1', '内网IP', '{tableIds=6,7,8,9,10,11}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 14:49:44');
INSERT INTO `sys_oper_log` VALUES ('107', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'im_friend,im_group,im_group_user,im_message', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 15:14:09');
INSERT INTO `sys_oper_log` VALUES ('108', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-01-25 15:14:17');
INSERT INTO `sys_oper_log` VALUES ('109', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":123,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":13,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":124,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Avatar\",\"usableColumn\":false,\"columnId\":125,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"avatar\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群头像\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"avatar\"},{\"capJavaField\":\"Master\",\"usableColumn\":false,\"columnId\":126,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"master\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群主\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tab', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 15:19:49');
INSERT INTO `sys_oper_log` VALUES ('110', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":112,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":12,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"UserId\",\"usableColumn\":false,\"columnId\":113,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"user_id\"},{\"capJavaField\":\"FriendId\",\"usableColumn\":false,\"columnId\":114,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"friendId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"friend_id\"},{\"capJavaField\":\"CheckFlag\",\"usableColumn\":false,\"columnId\":115,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"checkFlag\",\"htmlType\":\"radio\",\"edit\":true,\"query\":true,\"columnComment\":\"审核状态\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 15:20:53');
INSERT INTO `sys_oper_log` VALUES ('111', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":123,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1643095189000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":13,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":124,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群名称\",\"isQuery\":\"1\",\"updateTime\":1643095189000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Avatar\",\"usableColumn\":false,\"columnId\":125,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"avatar\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群头像\",\"isQuery\":\"1\",\"updateTime\":1643095189000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"avatar\"},{\"capJavaField\":\"Master\",\"usableColumn\":false,\"columnId\":126,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"master\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群主\",\"isQuery\":\"1\",\"updateTime\":1643095189000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 15:21:10');
INSERT INTO `sys_oper_log` VALUES ('112', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":146,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":15,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ToId\",\"usableColumn\":false,\"columnId\":147,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"toId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"接收人\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"to_id\"},{\"capJavaField\":\"FromId\",\"usableColumn\":false,\"columnId\":148,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"fromId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"发送人\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"from_id\"},{\"capJavaField\":\"SendTime\",\"usableColumn\":false,\"columnId\":149,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sendTime\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"发送时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 15:22:27');
INSERT INTO `sys_oper_log` VALUES ('113', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":146,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1643095347000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":15,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ToId\",\"usableColumn\":false,\"columnId\":147,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"toId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"接收人\",\"isQuery\":\"1\",\"updateTime\":1643095347000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"to_id\"},{\"capJavaField\":\"FromId\",\"usableColumn\":false,\"columnId\":148,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"fromId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"发送人\",\"isQuery\":\"1\",\"updateTime\":1643095347000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"from_id\"},{\"capJavaField\":\"SendTime\",\"usableColumn\":false,\"columnId\":149,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sendTime\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"发送时间\",\"isQuery\":\"1\",\"updateTime\":1643095347000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"E', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 15:22:38');
INSERT INTO `sys_oper_log` VALUES ('114', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":112,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1643095253000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":12,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"UserId\",\"usableColumn\":false,\"columnId\":113,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"updateTime\":1643095253000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"user_id\"},{\"capJavaField\":\"FriendId\",\"usableColumn\":false,\"columnId\":114,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"friendId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"updateTime\":1643095253000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"friend_id\"},{\"capJavaField\":\"CheckFlag\",\"usableColumn\":false,\"columnId\":115,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"checkFlag\",\"htmlType\":\"radio\",\"edit\":true,\"query\":true,\"columnComment\":\"审核状态\",\"isQuery\":\"1\",\"updateTime\":1643095253000,\"sort\":', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 15:22:49');
INSERT INTO `sys_oper_log` VALUES ('115', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":123,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1643095270000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":13,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":124,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群名称\",\"isQuery\":\"1\",\"updateTime\":1643095270000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Avatar\",\"usableColumn\":false,\"columnId\":125,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"avatar\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群头像\",\"isQuery\":\"1\",\"updateTime\":1643095270000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"avatar\"},{\"capJavaField\":\"Master\",\"usableColumn\":false,\"columnId\":126,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"master\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群主\",\"isQuery\":\"1\",\"updateTime\":1643095270000,\"sort\":4,\"list\":true,\"params\":{},\"javaType', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 15:23:52');
INSERT INTO `sys_oper_log` VALUES ('116', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-01-25 15:57:42');
INSERT INTO `sys_oper_log` VALUES ('117', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":135,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":14,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"GroupId\",\"usableColumn\":false,\"columnId\":136,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"groupId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群id \",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"group_id\"},{\"capJavaField\":\"UserId\",\"usableColumn\":false,\"columnId\":137,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"user_id\"},{\"capJavaField\":\"CheckFlag\",\"usableColumn\":false,\"columnId\":138,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"checkFlag\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"审核状态\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"crea', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 15:58:55');
INSERT INTO `sys_oper_log` VALUES ('118', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-01-25 15:58:58');
INSERT INTO `sys_oper_log` VALUES ('119', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":112,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1643095369000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":12,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"UserId\",\"usableColumn\":false,\"columnId\":113,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"updateTime\":1643095369000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"user_id\"},{\"capJavaField\":\"FriendId\",\"usableColumn\":false,\"columnId\":114,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"friendId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"updateTime\":1643095369000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"friend_id\"},{\"capJavaField\":\"CheckFlag\",\"usableColumn\":false,\"columnId\":115,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_yes_no\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"checkFlag\",\"htmlType\":\"radio\",\"edit\":true,\"query\":true,\"columnComment\":\"审核状态\",\"isQuery\":\"1\",\"updateTime\":1643095369000,\"sort\":', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 16:16:54');
INSERT INTO `sys_oper_log` VALUES ('120', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":123,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1643095432000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":13,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":124,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群名称\",\"isQuery\":\"1\",\"updateTime\":1643095432000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Avatar\",\"usableColumn\":false,\"columnId\":125,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"avatar\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群头像\",\"isQuery\":\"1\",\"updateTime\":1643095432000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"avatar\"},{\"capJavaField\":\"Master\",\"usableColumn\":false,\"columnId\":126,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"master\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群主\",\"isQuery\":\"1\",\"updateTime\":1643095432000,\"sort\":4,\"list\":true,\"params\":{},\"javaType', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 16:17:03');
INSERT INTO `sys_oper_log` VALUES ('121', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":146,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1643095357000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":15,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ToId\",\"usableColumn\":false,\"columnId\":147,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"toId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"接收人\",\"isQuery\":\"1\",\"updateTime\":1643095357000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"to_id\"},{\"capJavaField\":\"FromId\",\"usableColumn\":false,\"columnId\":148,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"fromId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"发送人\",\"isQuery\":\"1\",\"updateTime\":1643095357000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"from_id\"},{\"capJavaField\":\"SendTime\",\"usableColumn\":false,\"columnId\":149,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sendTime\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"发送时间\",\"isQuery\":\"1\",\"updateTime\":1643095357000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"E', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 16:17:19');
INSERT INTO `sys_oper_log` VALUES ('122', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":135,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1643097535000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":14,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"GroupId\",\"usableColumn\":false,\"columnId\":136,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"groupId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群id \",\"isQuery\":\"1\",\"updateTime\":1643097535000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"group_id\"},{\"capJavaField\":\"UserId\",\"usableColumn\":false,\"columnId\":137,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"updateTime\":1643097535000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"user_id\"},{\"capJavaField\":\"CheckFlag\",\"usableColumn\":false,\"columnId\":138,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"checkFlag\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"审核状态\",\"isQuery\":\"1\",\"updateTime\":1643097535000,\"sort\":4,\"list\":true', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-25 16:17:40');
INSERT INTO `sys_oper_log` VALUES ('123', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":123,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1643098623000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":13,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":124,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群名称\",\"isQuery\":\"1\",\"updateTime\":1643098623000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Avatar\",\"usableColumn\":false,\"columnId\":125,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"avatar\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群头像\",\"isQuery\":\"1\",\"updateTime\":1643098623000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"avatar\"},{\"capJavaField\":\"Master\",\"usableColumn\":false,\"columnId\":126,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"master\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群主\",\"isQuery\":\"1\",\"updateTime\":1643098623000,\"sort\":4,\"list\":true,\"params\":{},\"javaType', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-28 10:24:46');
INSERT INTO `sys_oper_log` VALUES ('124', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"乐天\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":123,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1643336686000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1643094849000,\"tableId\":13,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":124,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群名称\",\"isQuery\":\"1\",\"updateTime\":1643336686000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Avatar\",\"usableColumn\":false,\"columnId\":125,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"avatar\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群头像\",\"isQuery\":\"1\",\"updateTime\":1643336686000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1643094849000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"avatar\"},{\"capJavaField\":\"Master\",\"usableColumn\":false,\"columnId\":126,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"master\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"群主\",\"isQuery\":\"1\",\"updateTime\":1643336686000,\"sort\":4,\"list\":true,\"params\":{},\"javaType', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-28 10:25:46');
INSERT INTO `sys_oper_log` VALUES ('125', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-01-28 10:25:58');
INSERT INTO `sys_oper_log` VALUES ('126', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":4,\"menuName\":\"若依官网\",\"params\":{},\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1643078811000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-28 10:27:44');
INSERT INTO `sys_oper_log` VALUES ('127', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":4,\"menuName\":\"若依官网\",\"params\":{},\"isCache\":\"0\",\"path\":\"vim\",\"children\":[],\"createTime\":1643078811000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-28 10:27:52');
INSERT INTO `sys_oper_log` VALUES ('128', '群管理', '1', 'com.ruoyi.vim.controller.ImGroupController.add()', 'POST', '1', 'admin', null, '/vim/group', '127.0.0.1', '内网IP', '{\"remark\":\"sadasd\",\"avatar\":\"/profile/upload/2022/01/28/84b6dc39-7fb7-4d17-ae61-e384873c944f.png\",\"needCheck\":\"Y\",\"params\":{},\"name\":\"ss\",\"id\":\"1486889004139933697\",\"announcement\":\"sd\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-28 10:28:58');
INSERT INTO `sys_oper_log` VALUES ('129', '群管理', '2', 'com.ruoyi.vim.controller.ImGroupController.edit()', 'PUT', '1', 'admin', null, '/vim/group', '127.0.0.1', '内网IP', '{\"remark\":\"sadasd\",\"avatar\":\"/profile/upload/2022/01/28/411c4e53-988f-49b1-9541-156234d25e02.png\",\"needCheck\":\"Y\",\"delFlag\":\"0\",\"params\":{},\"name\":\"ss\",\"id\":\"1486889004139933697\",\"announcement\":\"sd\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-28 11:34:14');
INSERT INTO `sys_oper_log` VALUES ('130', '群管理', '2', 'com.ruoyi.vim.controller.ImGroupController.edit()', 'PUT', '1', 'admin', null, '/vim/group', '127.0.0.1', '内网IP', '{\"remark\":\"sadasd\",\"avatar\":\"\",\"needCheck\":\"Y\",\"delFlag\":\"0\",\"params\":{},\"name\":\"ss\",\"id\":\"1486889004139933697\",\"announcement\":\"sd\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-28 12:18:20');
INSERT INTO `sys_oper_log` VALUES ('131', '群管理', '2', 'com.ruoyi.vim.controller.ImGroupController.edit()', 'PUT', '1', 'admin', null, '/vim/group', '127.0.0.1', '内网IP', '{\"remark\":\"sadasd\",\"avatar\":\"/profile/upload/2022/01/28/66d1cf8b-eee6-475f-be7f-d79eb22b3c0a.png\",\"needCheck\":\"Y\",\"delFlag\":\"0\",\"params\":{},\"name\":\"ss\",\"id\":\"1486889004139933697\",\"announcement\":\"sd\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-01-28 12:18:34');
INSERT INTO `sys_oper_log` VALUES ('132', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"remark\":\"kunchong\",\"password\":\"kunchong\",\"postIds\":[4],\"email\":\"zkp55@163.com\",\"nickName\":\"kunchong\",\"sex\":\"0\",\"deptId\":100,\"mobile\":\"13610959735\",\"params\":{},\"userName\":\"kunchong\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"新增用户\'kunchong\'失败，邮箱账号已存在\",\"code\":500}', '0', null, '2022-03-21 12:20:10');
INSERT INTO `sys_oper_log` VALUES ('133', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"remark\":\"kunchong\",\"password\":\"$2a$10$SotUSAJxGkn0HhLHX43amOkwaNM/BoCse166UKyBTNOl8g4.zSJ4O\",\"postIds\":[4],\"email\":\"zkp551@163.com\",\"nickName\":\"kunchong\",\"sex\":\"0\",\"deptId\":100,\"mobile\":\"13610959735\",\"params\":{},\"userName\":\"kunchong\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-21 12:20:14');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2022-01-25 10:46:50', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2022-01-25 10:46:50', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2022-01-25 10:46:50', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2022-01-25 10:46:50', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2022-01-25 10:46:50', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2022-01-25 10:46:51', '', null, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '管理员', '00', 'ry@163.com', '15888888888', '0', 'http://127.0.0.1:8080/profile/upload/2022/02/10/3557d527-361a-48a9-9c6b-0c5cac60d489.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-04-18 13:23:18', 'admin', '2022-01-25 10:46:50', '', '2022-04-18 13:23:18', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依2', '00', 'zkp55@163.com', '15666666666', '0', 'http://127.0.0.1:8080/profile/upload/2022/02/10/c88da7b6-dfd5-4a77-92e5-db33ae40588a.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-04-18 13:23:31', 'admin', '2022-01-25 10:46:50', '', '2022-04-18 13:23:30', '测试员');
INSERT INTO `sys_user` VALUES ('3', '100', 'kunchong', 'kunchong', '00', 'zkp551@163.com', '13610959735', '0', '', '$2a$10$SotUSAJxGkn0HhLHX43amOkwaNM/BoCse166UKyBTNOl8g4.zSJ4O', '0', '0', '', null, 'admin', '2022-03-21 12:20:14', '', null, 'kunchong');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('3', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('3', '2');
