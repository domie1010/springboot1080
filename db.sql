/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - xiaoyuanyiqingfangkong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xiaoyuanyiqingfangkong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xiaoyuanyiqingfangkong`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'xueshengqingjia_types','请假类型',1,'请假类型1',NULL,NULL,'2022-03-08 21:14:51'),(2,'xueshengqingjia_types','请假类型',2,'家庭原因',NULL,NULL,'2022-03-08 21:14:51'),(3,'xueshengqingjia_types','请假类型',3,'病假',NULL,NULL,'2022-03-08 21:14:51'),(4,'xueshengqingjia_yesno_types','审核结果',1,'处理中',NULL,NULL,'2022-03-08 21:14:51'),(5,'xueshengqingjia_yesno_types','审核结果',2,'通过',NULL,NULL,'2022-03-08 21:14:51'),(6,'xueshengqingjia_yesno_types','审核结果',3,'拒绝',NULL,NULL,'2022-03-08 21:14:51'),(7,'xueshengqingjia_status_types','请假状态',1,'请假中',NULL,NULL,'2022-03-08 21:14:51'),(8,'xueshengqingjia_status_types','请假状态',2,'已销假',NULL,NULL,'2022-03-08 21:14:51'),(9,'jiaqiweizhi_yesno_types','审核结果',1,'判断中',NULL,NULL,'2022-03-08 21:14:51'),(10,'jiaqiweizhi_yesno_types','审核结果',3,'否',NULL,NULL,'2022-03-08 21:14:51'),(11,'jiaqiweizhi_yesno_types','审核结果',2,'是',NULL,NULL,'2022-03-08 21:14:51'),(12,'sex_types','性别',1,'男',NULL,NULL,'2022-03-08 21:14:51'),(13,'sex_types','性别',2,'女',NULL,NULL,'2022-03-08 21:14:52'),(14,'news_types','公告类型',1,'公告类型1',NULL,NULL,'2022-03-08 21:14:52'),(15,'news_types','公告类型',2,'公告类型2',NULL,NULL,'2022-03-08 21:14:52'),(16,'news_types','公告类型',3,'公告类型3',NULL,NULL,'2022-03-08 21:14:52'),(17,'banji_types','班级',1,'班级1',NULL,NULL,'2022-03-18 20:31:03'),(18,'banji_types','班级',2,'班级2',NULL,NULL,'2022-03-18 20:31:03'),(19,'banji_types','班级',3,'班级3',NULL,NULL,'2022-03-18 20:31:03'),(20,'xueyuan_types','学院',1,'学院1',NULL,NULL,'2022-03-18 20:31:03'),(21,'xueyuan_types','学院',2,'学院2',NULL,NULL,'2022-03-18 20:31:03'),(22,'xueyuan_types','学院',3,'学院3',NULL,NULL,'2022-03-18 20:31:03'),(23,'shangbao_types','健康状态',1,'正常',NULL,NULL,'2022-03-18 20:31:03'),(24,'shangbao_types','健康状态',2,'异常',NULL,NULL,'2022-03-18 20:31:03'),(25,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2022-03-18 20:31:03'),(26,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2022-03-18 20:31:03');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '学生',
  `jiaoshi_id` int(11) DEFAULT NULL COMMENT '教师',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='聊天室';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`jiaoshi_id`,`users_id`,`forum_content`,`super_ids`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',1,1,NULL,'发布内容1',NULL,1,'2022-03-18 20:31:08','2022-03-18 20:31:08','2022-03-18 20:31:08'),(2,'帖子标题2',1,2,NULL,'发布内容2',NULL,1,'2022-03-18 20:31:08','2022-03-18 20:31:08','2022-03-18 20:31:08'),(3,'帖子标题3',2,3,NULL,'发布内容3',NULL,1,'2022-03-18 20:31:08','2022-03-18 20:31:08','2022-03-18 20:31:08'),(4,'帖子标题4',1,4,NULL,'发布内容4',NULL,1,'2022-03-18 20:31:08','2022-03-18 20:31:08','2022-03-18 20:31:08'),(5,'帖子标题5',2,5,NULL,'发布内容5',NULL,1,'2022-03-18 20:31:08','2022-03-18 20:31:08','2022-03-18 20:31:08'),(6,NULL,2,NULL,NULL,'用户发言1111',5,2,'2022-03-18 21:35:53',NULL,'2022-03-18 21:35:53'),(7,NULL,NULL,1,NULL,'教师发言11111',5,2,'2022-03-18 21:38:18',NULL,'2022-03-18 21:38:18'),(8,NULL,NULL,NULL,1,'管理发言1111',5,2,'2022-03-18 21:40:32',NULL,'2022-03-18 21:40:32');

/*Table structure for table `jiaoshi` */

DROP TABLE IF EXISTS `jiaoshi`;

CREATE TABLE `jiaoshi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `jiaoshi_name` varchar(200) DEFAULT NULL COMMENT '教师姓名 Search111 ',
  `jiaoshi_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `jiaoshi_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `jiaoshi_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `xueyuan_types` int(11) DEFAULT NULL COMMENT '学院 Search111 ',
  `jiaoshi_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='教师';

/*Data for the table `jiaoshi` */

insert  into `jiaoshi`(`id`,`username`,`password`,`jiaoshi_name`,`jiaoshi_photo`,`sex_types`,`jiaoshi_phone`,`jiaoshi_email`,`xueyuan_types`,`jiaoshi_delete`,`create_time`) values (1,'a1','123456','教师姓名1','http://localhost:8080/xiaoyuanyiqingfangkong/upload/jiaoshi1.jpg',2,'17703786901','1@qq.com',1,1,'2022-03-18 20:31:08'),(2,'a2','123456','教师姓名2','http://localhost:8080/xiaoyuanyiqingfangkong/upload/jiaoshi2.jpg',1,'17703786902','2@qq.com',2,1,'2022-03-18 20:31:08'),(3,'a3','123456','教师姓名3','http://localhost:8080/xiaoyuanyiqingfangkong/upload/jiaoshi3.jpg',2,'17703786903','3@qq.com',2,1,'2022-03-18 20:31:08'),(4,'a4','123456','教师姓名4','http://localhost:8080/xiaoyuanyiqingfangkong/upload/jiaoshi4.jpg',2,'17703786904','4@qq.com',3,1,'2022-03-18 20:31:08'),(5,'a5','123456','教师姓名5','http://localhost:8080/xiaoyuanyiqingfangkong/upload/jiaoshi5.jpg',2,'17703786905','5@qq.com',1,1,'2022-03-18 20:31:08');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int(11) DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='公告信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_types`,`news_photo`,`insert_time`,`news_content`,`create_time`) values (1,'公告标题1',1,'http://localhost:8080/xiaoyuanyiqingfangkong/upload/news1.jpg','2022-03-18 20:31:08','公告详情1','2022-03-18 20:31:08'),(2,'公告标题2',1,'http://localhost:8080/xiaoyuanyiqingfangkong/upload/news2.jpg','2022-03-18 20:31:08','公告详情2','2022-03-18 20:31:08'),(3,'公告标题3',1,'http://localhost:8080/xiaoyuanyiqingfangkong/upload/news3.jpg','2022-03-18 20:31:08','公告详情3','2022-03-18 20:31:08'),(4,'公告标题4',1,'http://localhost:8080/xiaoyuanyiqingfangkong/upload/news4.jpg','2022-03-18 20:31:08','公告详情4','2022-03-18 20:31:08'),(5,'公告标题5',3,'http://localhost:8080/xiaoyuanyiqingfangkong/upload/news5.jpg','2022-03-18 20:31:08','公告详情5','2022-03-18 20:31:08');

/*Table structure for table `shangbao` */

DROP TABLE IF EXISTS `shangbao`;

CREATE TABLE `shangbao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '上报学生',
  `shangbao_types` int(11) DEFAULT NULL COMMENT '健康状态 Search111 ',
  `shangbao_tiwen` decimal(10,2) DEFAULT NULL COMMENT '体温',
  `shangbao_text` text COMMENT '详情',
  `insert_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='健康表';

/*Data for the table `shangbao` */

insert  into `shangbao`(`id`,`yonghu_id`,`shangbao_types`,`shangbao_tiwen`,`shangbao_text`,`insert_time`,`create_time`) values (1,3,2,'771.97','详情1','2022-03-18 20:31:08','2022-03-18 20:31:08'),(2,2,1,'620.09','详情2','2022-03-18 20:31:08','2022-03-18 20:31:08'),(3,2,1,'901.28','详情3','2022-03-18 20:31:08','2022-03-18 20:31:08'),(4,3,2,'588.74','详情4','2022-03-18 20:31:08','2022-03-18 20:31:08'),(5,3,1,'768.68','详情5','2022-03-18 20:31:08','2022-03-18 20:31:08'),(8,1,1,'36.50','正常','2022-03-18 21:18:44','2022-03-18 21:18:44'),(9,2,2,'39.50','添加自己每天的身体状态','2022-03-18 21:36:16','2022-03-18 21:36:16');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','hrtw8sbgwlduvcabcqhdlkn046x5q4s0','2022-03-18 20:38:16','2022-04-16 17:32:49'),(2,1,'a1','jiaoshi','教师','dj300ehl0qeoj2dpbxx5ot3m0h78g4wi','2022-03-18 21:15:52','2022-04-16 17:45:57'),(3,1,'a1','yonghu','学生','uxi91e2e4aieiyj26x1crgjhw097joqt','2022-03-18 21:18:19','2022-04-16 17:25:17'),(4,2,'a2','yonghu','学生','m50ib5hwp55ilu2qx9l1zwggausbctg5','2022-03-18 21:35:36','2022-03-18 22:35:36'),(5,2,'a2','jiaoshi','教师','yz0q7ha7egfsnpuvaystj6t0moyw6mxp','2022-04-16 16:44:00','2022-04-16 17:44:01');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2022-05-01 00:00:00');

/*Table structure for table `xueshengqingjia` */

DROP TABLE IF EXISTS `xueshengqingjia`;

CREATE TABLE `xueshengqingjia` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `xueshengqingjia_name` varchar(200) DEFAULT NULL COMMENT '请假原因 Search111 ',
  `xueshengqingjia_text` text COMMENT '详情',
  `xueshengqingjia_types` int(11) DEFAULT NULL COMMENT '请假类型 Search111',
  `xueshengqingjia_time` timestamp NULL DEFAULT NULL COMMENT '请假时间',
  `xueshengqingjia_number` int(200) DEFAULT NULL COMMENT '请假天数',
  `yonghu_id` int(200) DEFAULT NULL COMMENT '学生',
  `xueshengqingjia_yesno_types` int(11) DEFAULT NULL COMMENT '审核结果',
  `xueshengqingjia_yesno_text` text COMMENT '处理结果',
  `xueshengqingjia_status_types` int(11) DEFAULT NULL COMMENT '请假状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='学生请假';

/*Data for the table `xueshengqingjia` */

insert  into `xueshengqingjia`(`id`,`xueshengqingjia_name`,`xueshengqingjia_text`,`xueshengqingjia_types`,`xueshengqingjia_time`,`xueshengqingjia_number`,`yonghu_id`,`xueshengqingjia_yesno_types`,`xueshengqingjia_yesno_text`,`xueshengqingjia_status_types`,`insert_time`,`create_time`) values (1,'请假原因1','详情1',3,'2022-03-18 20:31:08',315,1,1,NULL,NULL,'2022-03-18 20:31:08','2022-03-18 20:31:08'),(2,'请假原因2','详情2',2,'2022-03-18 20:31:08',188,2,1,NULL,NULL,'2022-03-18 20:31:08','2022-03-18 20:31:08'),(3,'请假原因3','详情3',3,'2022-03-18 20:31:08',481,3,1,NULL,NULL,'2022-03-18 20:31:08','2022-03-18 20:31:08'),(4,'请假原因4','详情4',2,'2022-03-18 20:31:08',184,2,1,NULL,NULL,'2022-03-18 20:31:08','2022-03-18 20:31:08'),(5,'请假原因5','详情5',3,'2022-03-18 20:31:08',231,1,2,'通过',2,'2022-03-18 20:31:08','2022-03-18 20:31:08'),(8,'请假信息','123',2,'2022-03-19 00:00:00',10,2,2,'同意',1,'2022-03-18 21:36:41','2022-03-18 21:36:41');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '学生姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `banji_types` int(11) DEFAULT NULL COMMENT '班级 Search111 ',
  `xueyuan_types` int(11) DEFAULT NULL COMMENT '学院 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='学生';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`sex_types`,`banji_types`,`xueyuan_types`,`yonghu_phone`,`yonghu_id_number`,`yonghu_email`,`yonghu_delete`,`create_time`) values (1,'a1','123456','学生姓名1','http://localhost:8080/xiaoyuanyiqingfangkong/upload/yonghu1.jpg',2,3,3,'17703786901','410224199610232001','1@qq.com',1,'2022-03-18 20:31:08'),(2,'a2','123456','学生姓名2','http://localhost:8080/xiaoyuanyiqingfangkong/upload/yonghu2.jpg',2,3,1,'17703786902','410224199610232002','2@qq.com',1,'2022-03-18 20:31:08'),(3,'a3','123456','学生姓名3','http://localhost:8080/xiaoyuanyiqingfangkong/upload/yonghu3.jpg',2,1,2,'17703786903','410224199610232003','3@qq.com',1,'2022-03-18 20:31:08');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
