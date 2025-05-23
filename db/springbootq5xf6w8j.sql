-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: springbootq5xf6w8j
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `springbootq5xf6w8j`
--

/*!40000 DROP DATABASE IF EXISTS `springbootq5xf6w8j`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `springbootq5xf6w8j` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `springbootq5xf6w8j`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  `url` varchar(500) DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg',NULL),(2,'picture2','upload/picture2.jpg',NULL),(3,'picture3','upload/1743769165778.jpg',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussxuexiziyuan`
--

DROP TABLE IF EXISTS `discussxuexiziyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussxuexiziyuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `nickname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `reply` longtext COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  `istop` int(11) DEFAULT '0' COMMENT '置顶(1:置顶,0:非置顶)',
  `tuserids` longtext COLLATE utf8mb4_unicode_ci COMMENT '赞用户ids',
  `cuserids` longtext COLLATE utf8mb4_unicode_ci COMMENT '踩用户ids',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学习资源评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussxuexiziyuan`
--

LOCK TABLES `discussxuexiziyuan` WRITE;
/*!40000 ALTER TABLE `discussxuexiziyuan` DISABLE KEYS */;
INSERT INTO `discussxuexiziyuan` VALUES (1,'2025-04-04 12:19:41',9,1743769037439,'upload/1743769036638.jpeg','11','<p>1111</p>','<p>2222</p>',0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `discussxuexiziyuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exampaper`
--

DROP TABLE IF EXISTS `exampaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题库名称',
  `time` int(11) NOT NULL COMMENT '练习时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '题库状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='题库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exampaper`
--

LOCK TABLES `exampaper` WRITE;
/*!40000 ALTER TABLE `exampaper` DISABLE KEYS */;
INSERT INTO `exampaper` VALUES (1,'2025-04-04 12:13:31','十万个为什么',60,1),(2,'2025-04-04 12:18:28','考公',1,1);
/*!40000 ALTER TABLE `exampaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestion`
--

DROP TABLE IF EXISTS `examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属题库id（外键）',
  `papername` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题库名称',
  `questionname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题目名称',
  `options` longtext COLLATE utf8mb4_unicode_ci COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COLLATE utf8mb4_unicode_ci COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '题目类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）4:主观题',
  `sequence` bigint(20) DEFAULT '100' COMMENT '题目排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='题目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestion`
--

LOCK TABLES `examquestion` WRITE;
/*!40000 ALTER TABLE `examquestion` DISABLE KEYS */;
INSERT INTO `examquestion` VALUES (1,'2025-04-04 12:13:31',2,'考公','<p>下面动物不属于昆虫的是（）。</p>','[{\"text\":\"A.苍蝇\",\"code\":\"A\"},{\"text\":\"B.蜜蜂\",\"code\":\"B\"},{\"text\":\"C.蜂鸟\",\"code\":\"C\"}]',20,'C','蜂鸟',0,1),(2,'2025-04-04 12:13:31',2,'考公','<p>油着火后可以用水扑灭。</p>','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',20,'B','油着火后不可以用水扑灭',2,2),(3,'2025-04-04 12:13:31',2,'考公','<p>地球是个球体，中间是（ ）。</p>','[]',30,'赤道','赤道',3,3),(4,'2025-04-04 12:13:31',2,'考公','<p>下面动物中会流汗的有（ ）。</p>','[{\"text\":\"A.马\",\"code\":\"A\"},{\"text\":\"B.猫\",\"code\":\"B\"},{\"text\":\"C.狗\",\"code\":\"C\"}]',30,'A,B','狗不会流汗',1,4),(5,'2025-04-04 12:13:31',2,'考公','<p>世界上为什么不存在完美的圆？</p>','[]',30,'','目前没有证据表明现实中存在完美的圆',4,5),(6,'2025-04-04 12:18:54',2,'考公','<p>考公</p>','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',20,'A','1',0,1);
/*!40000 ALTER TABLE `examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestionbank`
--

DROP TABLE IF EXISTS `examquestionbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestionbank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `questionname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题目名称',
  `options` longtext COLLATE utf8mb4_unicode_ci COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COLLATE utf8mb4_unicode_ci COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '题目类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空） 4:主观题',
  `sequence` bigint(20) DEFAULT '100' COMMENT '题目排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='题目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestionbank`
--

LOCK TABLES `examquestionbank` WRITE;
/*!40000 ALTER TABLE `examquestionbank` DISABLE KEYS */;
INSERT INTO `examquestionbank` VALUES (1,'2025-04-04 12:13:31','下面动物不属于昆虫的是（）。','[{\"text\":\"A.苍蝇\",\"code\":\"A\"},{\"text\":\"B.蜜蜂\",\"code\":\"B\"},{\"text\":\"C.蜂鸟\",\"code\":\"C\"}]',20,'C','蜂鸟',0,1),(2,'2025-04-04 12:13:31','油着火后可以用水扑灭。','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',20,'B','油着火后不可以用水扑灭',2,2),(3,'2025-04-04 12:13:31','地球是个球体，中间是（ ）。','[]',30,'赤道','赤道',3,3),(4,'2025-04-04 12:13:31','下面动物中会流汗的有（ ）。','[{\"text\":\"A.马\",\"code\":\"A\"},{\"text\":\"B.猫\",\"code\":\"B\"},{\"text\":\"C.狗\",\"code\":\"C\"}]',30,'A,B','狗不会流汗',1,4),(5,'2025-04-04 12:13:31','世界上为什么不存在完美的圆？','[]',30,'','目前没有证据表明现实中存在完美的圆',4,5);
/*!40000 ALTER TABLE `examquestionbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examrecord`
--

DROP TABLE IF EXISTS `examrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '题库id（外键）',
  `papername` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题库名称',
  `questionid` bigint(20) NOT NULL COMMENT '题目id（外键）',
  `questionname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题目名称',
  `options` longtext COLLATE utf8mb4_unicode_ci COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COLLATE utf8mb4_unicode_ci COMMENT '答案解析',
  `ismark` bigint(20) DEFAULT '0' COMMENT '是否批卷',
  `type` bigint(20) DEFAULT '0' COMMENT '题目类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空） 4:主观题',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '题目得分',
  `myanswer` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='练习记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examrecord`
--

LOCK TABLES `examrecord` WRITE;
/*!40000 ALTER TABLE `examrecord` DISABLE KEYS */;
INSERT INTO `examrecord` VALUES (1,'2025-04-04 12:20:01',1743769037439,'张三',2,'考公',5,'<p>世界上为什么不存在完美的圆？</p>','[]',30,'','目前没有证据表明现实中存在完美的圆',1,4,10,'1'),(2,'2025-04-04 12:20:05',1743769037439,'张三',2,'考公',4,'<p>下面动物中会流汗的有（ ）。</p>','[{\"text\":\"A.马\",\"code\":\"A\"},{\"text\":\"B.猫\",\"code\":\"B\"},{\"text\":\"C.狗\",\"code\":\"C\"}]',30,'A,B','狗不会流汗',1,1,30,'A,B'),(3,'2025-04-04 12:20:07',1743769037439,'张三',2,'考公',3,'<p>地球是个球体，中间是（ ）。</p>','[]',30,'赤道','赤道',1,3,0,'1'),(4,'2025-04-04 12:20:08',1743769037439,'张三',2,'考公',2,'<p>油着火后可以用水扑灭。</p>','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',20,'B','油着火后不可以用水扑灭',1,2,20,'B'),(5,'2025-04-04 12:20:10',1743769037439,'张三',2,'考公',1,'<p>下面动物不属于昆虫的是（）。</p>','[{\"text\":\"A.苍蝇\",\"code\":\"A\"},{\"text\":\"B.蜜蜂\",\"code\":\"B\"},{\"text\":\"C.蜂鸟\",\"code\":\"C\"}]',20,'C','蜂鸟',1,0,0,'A'),(6,'2025-04-04 12:20:12',1743769037439,'张三',2,'考公',6,'<p>考公</p>','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',20,'A','1',1,0,20,'A');
/*!40000 ALTER TABLE `examrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '帖子标题',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `isdone` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `istop` int(11) DEFAULT '0' COMMENT '是否置顶',
  `toptime` datetime DEFAULT NULL COMMENT '置顶时间',
  `typename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  `cover` longtext COLLATE utf8mb4_unicode_ci COMMENT '封面',
  `isanon` int(11) DEFAULT '0' COMMENT '是否匿名(1:是,0:否)',
  `delflag` int(11) DEFAULT '0' COMMENT '是否删除(1:是,0:否)',
  PRIMARY KEY (`id`),
  KEY `typename` (`typename`),
  CONSTRAINT `forum_ibfk_1` FOREIGN KEY (`typename`) REFERENCES `forumtype` (`typename`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='互动交流';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (1,'2025-04-04 12:13:30','帖子标题1','帖子内容1',0,1,'用户名1','upload/forum_avatarurl1.jpg,upload/forum_avatarurl2.jpg,upload/forum_avatarurl3.jpg','开放',0,'2025-04-04 20:13:30','分类名称1','upload/forum_cover1.jpg,upload/forum_cover2.jpg,upload/forum_cover3.jpg',1,1),(2,'2025-04-04 12:13:30','帖子标题2','帖子内容2',0,2,'用户名2','upload/forum_avatarurl2.jpg,upload/forum_avatarurl3.jpg,upload/forum_avatarurl4.jpg','开放',0,'2025-04-04 20:13:30','分类名称2','upload/forum_cover2.jpg,upload/forum_cover3.jpg,upload/forum_cover4.jpg',2,0),(3,'2025-04-04 12:13:30','帖子标题3','帖子内容3',0,3,'用户名3','upload/forum_avatarurl3.jpg,upload/forum_avatarurl4.jpg,upload/forum_avatarurl5.jpg','开放',0,'2025-04-04 20:13:30','分类名称3','upload/forum_cover3.jpg,upload/forum_cover4.jpg,upload/forum_cover5.jpg',3,0),(4,'2025-04-04 12:13:30','帖子标题4','帖子内容4',0,4,'用户名4','upload/forum_avatarurl4.jpg,upload/forum_avatarurl5.jpg,upload/forum_avatarurl6.jpg','开放',0,'2025-04-04 20:13:30','分类名称4','upload/forum_cover4.jpg,upload/forum_cover5.jpg,upload/forum_cover6.jpg',4,0),(5,'2025-04-04 12:13:30','帖子标题5','帖子内容5',0,5,'用户名5','upload/forum_avatarurl5.jpg,upload/forum_avatarurl6.jpg,upload/forum_avatarurl7.jpg','开放',0,'2025-04-04 20:13:30','分类名称5','upload/forum_cover5.jpg,upload/forum_cover6.jpg,upload/forum_cover7.jpg',5,0),(6,'2025-04-04 12:13:30','帖子标题6','帖子内容6',0,6,'用户名6','upload/forum_avatarurl6.jpg,upload/forum_avatarurl7.jpg,upload/forum_avatarurl8.jpg','开放',0,'2025-04-04 20:13:30','分类名称6','upload/forum_cover6.jpg,upload/forum_cover7.jpg,upload/forum_cover8.jpg',6,0),(7,'2025-04-04 12:13:30','帖子标题7','帖子内容7',0,7,'用户名7','upload/forum_avatarurl7.jpg,upload/forum_avatarurl8.jpg,upload/forum_avatarurl1.jpg','开放',0,'2025-04-04 20:13:30','分类名称7','upload/forum_cover7.jpg,upload/forum_cover8.jpg,upload/forum_cover1.jpg',7,0),(8,'2025-04-04 12:13:30','帖子标题8','帖子内容8',0,8,'用户名8','upload/forum_avatarurl8.jpg,upload/forum_avatarurl1.jpg,upload/forum_avatarurl2.jpg','开放',0,'2025-04-04 20:13:30','分类名称8','upload/forum_cover8.jpg,upload/forum_cover1.jpg,upload/forum_cover2.jpg',8,0),(9,'2025-04-04 12:19:53','考公','<p>考公</p>',0,1743769037439,'11',NULL,'开放',0,'2025-04-04 20:19:53','考公','upload/1743769192711.jpg',0,0),(10,'2025-04-04 12:20:38',NULL,'<p>1111</p>',9,11,'用户账号1','upload/yonghu_touxiang1.jpg',NULL,0,NULL,NULL,NULL,0,0),(11,'2025-04-04 12:21:21',NULL,'<p>2222</p>',10,1743769037439,'11','upload/1743769036638.jpeg',NULL,0,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forumreport`
--

DROP TABLE IF EXISTS `forumreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forumreport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `forumid` bigint(20) DEFAULT NULL COMMENT '论坛id',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '帖子标题',
  `userid` bigint(20) NOT NULL COMMENT '举报用户id',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '举报用户名',
  `reporteduserid` bigint(20) NOT NULL COMMENT '被举报用户id',
  `reportedusername` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '被举报用户名',
  `reason` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '举报原因',
  `picture` longtext COLLATE utf8mb4_unicode_ci COMMENT '图片补充',
  `handleadvise` longtext COLLATE utf8mb4_unicode_ci COMMENT '处理建议',
  `status` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '处理中' COMMENT '状态',
  `reporttype` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '主题帖举报' COMMENT '举报类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='互动交流举报';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forumreport`
--

LOCK TABLES `forumreport` WRITE;
/*!40000 ALTER TABLE `forumreport` DISABLE KEYS */;
INSERT INTO `forumreport` VALUES (9,'2025-04-04 12:20:47',1,'帖子标题1',11,'用户账号1',1,'用户名1','111','upload/1743769246415.jpg','2222','已处理','主题帖举报');
/*!40000 ALTER TABLE `forumreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forumtype`
--

DROP TABLE IF EXISTS `forumtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forumtype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `typename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`),
  KEY `forumtype_6tu1` (`typename`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='互动交流类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forumtype`
--

LOCK TABLES `forumtype` WRITE;
/*!40000 ALTER TABLE `forumtype` DISABLE KEYS */;
INSERT INTO `forumtype` VALUES (1,'2025-04-04 12:13:30','分类名称1'),(2,'2025-04-04 12:13:30','分类名称2'),(3,'2025-04-04 12:13:30','分类名称3'),(4,'2025-04-04 12:13:30','分类名称4'),(5,'2025-04-04 12:13:30','分类名称5'),(6,'2025-04-04 12:13:30','分类名称6'),(7,'2025-04-04 12:13:30','分类名称7'),(8,'2025-04-04 12:13:30','分类名称8'),(9,'2025-04-04 12:18:33','考公');
/*!40000 ALTER TABLE `forumtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表名',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `picture` longtext COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '类型',
  `inteltype` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
INSERT INTO `storeup` VALUES (1,'2025-04-04 12:19:32',1743769037439,9,'xuexiziyuan','考公','upload/1743769093846.jpg','21',NULL,NULL),(2,'2025-04-04 12:19:33',1743769037439,9,'xuexiziyuan','考公','upload/1743769093846.jpg','1',NULL,NULL),(3,'2025-04-04 12:19:46',1743769037439,8,'xuexiziyuan','资源名称8','upload/xuexiziyuan_fengmian8.jpg','1',NULL,NULL),(4,'2025-04-04 12:20:30',11,8,'xuexiziyuan','资源名称8','upload/xuexiziyuan_fengmian8.jpg','1',NULL,NULL),(6,'2025-04-04 12:21:19',1743769037439,9,'forum','考公','upload/1743769192711.jpg','1',NULL,NULL),(7,'2025-04-04 12:21:20',1743769037439,9,'forum','考公','upload/1743769192711.jpg','21',NULL,NULL);
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tixingxinxi`
--

DROP TABLE IF EXISTS `tixingxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tixingxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `tixingbiaoti` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提醒标题',
  `tixingfengmian` longtext COLLATE utf8mb4_unicode_ci COMMENT '提醒封面',
  `tixingshijian` datetime DEFAULT NULL COMMENT '提醒时间',
  `tixingneirong` longtext COLLATE utf8mb4_unicode_ci COMMENT '提醒内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='提醒信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tixingxinxi`
--

LOCK TABLES `tixingxinxi` WRITE;
/*!40000 ALTER TABLE `tixingxinxi` DISABLE KEYS */;
INSERT INTO `tixingxinxi` VALUES (1,'2025-04-04 12:13:30','用户账号1','用户姓名1','提醒标题1','upload/tixingxinxi_tixingfengmian1.jpg,upload/tixingxinxi_tixingfengmian2.jpg,upload/tixingxinxi_tixingfengmian3.jpg','2025-04-04 20:13:30','提醒内容1'),(2,'2025-04-04 12:13:30','用户账号2','用户姓名2','提醒标题2','upload/tixingxinxi_tixingfengmian2.jpg,upload/tixingxinxi_tixingfengmian3.jpg,upload/tixingxinxi_tixingfengmian4.jpg','2025-04-04 20:13:30','提醒内容2'),(3,'2025-04-04 12:13:30','用户账号3','用户姓名3','提醒标题3','upload/tixingxinxi_tixingfengmian3.jpg,upload/tixingxinxi_tixingfengmian4.jpg,upload/tixingxinxi_tixingfengmian5.jpg','2025-04-04 20:13:30','提醒内容3'),(4,'2025-04-04 12:13:30','用户账号4','用户姓名4','提醒标题4','upload/tixingxinxi_tixingfengmian4.jpg,upload/tixingxinxi_tixingfengmian5.jpg,upload/tixingxinxi_tixingfengmian6.jpg','2025-04-04 20:13:30','提醒内容4'),(5,'2025-04-04 12:13:30','用户账号5','用户姓名5','提醒标题5','upload/tixingxinxi_tixingfengmian5.jpg,upload/tixingxinxi_tixingfengmian6.jpg,upload/tixingxinxi_tixingfengmian7.jpg','2025-04-04 20:13:30','提醒内容5'),(6,'2025-04-04 12:13:30','用户账号6','用户姓名6','提醒标题6','upload/tixingxinxi_tixingfengmian6.jpg,upload/tixingxinxi_tixingfengmian7.jpg,upload/tixingxinxi_tixingfengmian8.jpg','2025-04-04 20:13:30','提醒内容6'),(7,'2025-04-04 12:13:30','用户账号7','用户姓名7','提醒标题7','upload/tixingxinxi_tixingfengmian7.jpg,upload/tixingxinxi_tixingfengmian8.jpg,upload/tixingxinxi_tixingfengmian1.jpg','2025-04-04 20:13:30','提醒内容7'),(8,'2025-04-04 12:13:30','用户账号8','用户姓名8','提醒标题8','upload/tixingxinxi_tixingfengmian8.jpg,upload/tixingxinxi_tixingfengmian1.jpg,upload/tixingxinxi_tixingfengmian2.jpg','2025-04-04 20:13:30','提醒内容8'),(9,'2025-04-04 12:17:53','11','张三','考公','upload/1743769071899.jpg','2025-04-04 20:17:47','<p>考公</p>');
/*!40000 ALTER TABLE `tixingxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1743769037439,'11','yonghu','用户','ssxlrmkswqyexfy5xcmk8eo2mt5xf2yf','2025-04-04 12:17:21','2025-04-04 13:21:17'),(2,1,'admin','users','管理员','1mlwzocvxsa99rt8svi30728cznscl0q','2025-04-04 12:18:01','2025-04-04 13:20:56'),(3,11,'用户账号1','yonghu','用户','lh3nd5vlesos5gze232mabfiyyhh39wb','2025-04-04 12:20:27','2025-04-04 13:20:28');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `image` varchar(200) DEFAULT NULL COMMENT '头像',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','upload/image1.jpg','管理员','2025-04-04 12:13:31');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuexijilu`
--

DROP TABLE IF EXISTS `xuexijilu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuexijilu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `kechengmingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程名称',
  `tupian` longtext COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `jilushijian` datetime DEFAULT NULL COMMENT '记录时间',
  `xuexijindu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学习进度',
  `lianxiqingkuang` longtext COLLATE utf8mb4_unicode_ci COMMENT '练习情况',
  `xuexijilu` longtext COLLATE utf8mb4_unicode_ci COMMENT '学习记录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学习记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuexijilu`
--

LOCK TABLES `xuexijilu` WRITE;
/*!40000 ALTER TABLE `xuexijilu` DISABLE KEYS */;
INSERT INTO `xuexijilu` VALUES (1,'2025-04-04 12:13:30','用户账号1','用户姓名1','课程名称1','upload/xuexijilu_tupian1.jpg,upload/xuexijilu_tupian2.jpg,upload/xuexijilu_tupian3.jpg','2025-04-04 20:13:30','20%','练习情况1','学习记录1'),(2,'2025-04-04 12:13:30','用户账号2','用户姓名2','课程名称2','upload/xuexijilu_tupian2.jpg,upload/xuexijilu_tupian3.jpg,upload/xuexijilu_tupian4.jpg','2025-04-04 20:13:30','20%','练习情况2','学习记录2'),(3,'2025-04-04 12:13:30','用户账号3','用户姓名3','课程名称3','upload/xuexijilu_tupian3.jpg,upload/xuexijilu_tupian4.jpg,upload/xuexijilu_tupian5.jpg','2025-04-04 20:13:30','20%','练习情况3','学习记录3'),(4,'2025-04-04 12:13:30','用户账号4','用户姓名4','课程名称4','upload/xuexijilu_tupian4.jpg,upload/xuexijilu_tupian5.jpg,upload/xuexijilu_tupian6.jpg','2025-04-04 20:13:30','20%','练习情况4','学习记录4'),(5,'2025-04-04 12:13:30','用户账号5','用户姓名5','课程名称5','upload/xuexijilu_tupian5.jpg,upload/xuexijilu_tupian6.jpg,upload/xuexijilu_tupian7.jpg','2025-04-04 20:13:30','20%','练习情况5','学习记录5'),(6,'2025-04-04 12:13:30','用户账号6','用户姓名6','课程名称6','upload/xuexijilu_tupian6.jpg,upload/xuexijilu_tupian7.jpg,upload/xuexijilu_tupian8.jpg','2025-04-04 20:13:30','20%','练习情况6','学习记录6'),(7,'2025-04-04 12:13:30','用户账号7','用户姓名7','课程名称7','upload/xuexijilu_tupian7.jpg,upload/xuexijilu_tupian8.jpg,upload/xuexijilu_tupian1.jpg','2025-04-04 20:13:30','20%','练习情况7','学习记录7'),(8,'2025-04-04 12:13:30','用户账号8','用户姓名8','课程名称8','upload/xuexijilu_tupian8.jpg,upload/xuexijilu_tupian1.jpg,upload/xuexijilu_tupian2.jpg','2025-04-04 20:13:30','20%','练习情况8','学习记录8'),(9,'2025-04-04 12:17:45','11','张三','考公','upload/1743769061728.jpg','2025-04-04 20:17:28','40%','<p>考公</p>','<p>考公</p>');
/*!40000 ALTER TABLE `xuexijilu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuexiziyuan`
--

DROP TABLE IF EXISTS `xuexiziyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuexiziyuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ziyuanmingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源名称',
  `ziyuanfenlei` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源分类',
  `fengmian` longtext COLLATE utf8mb4_unicode_ci COMMENT '封面',
  `ziyuanwenjian` longtext COLLATE utf8mb4_unicode_ci COMMENT '资源文件',
  `ziyuanshipin` longtext COLLATE utf8mb4_unicode_ci COMMENT '资源视频',
  `ziyuanxiangqing` longtext COLLATE utf8mb4_unicode_ci COMMENT '资源详情',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  `discussnum` int(11) DEFAULT '0' COMMENT '评论数',
  `storeupnum` int(11) DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学习资源';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuexiziyuan`
--

LOCK TABLES `xuexiziyuan` WRITE;
/*!40000 ALTER TABLE `xuexiziyuan` DISABLE KEYS */;
INSERT INTO `xuexiziyuan` VALUES (1,'2025-04-04 12:13:30','资源名称1','资源分类1','upload/xuexiziyuan_fengmian1.jpg,upload/xuexiziyuan_fengmian2.jpg,upload/xuexiziyuan_fengmian3.jpg','','','资源详情1','2025-04-04 20:13:30',1,1,'2025-04-04 20:13:30',1,0,1),(2,'2025-04-04 12:13:30','资源名称2','资源分类2','upload/xuexiziyuan_fengmian2.jpg,upload/xuexiziyuan_fengmian3.jpg,upload/xuexiziyuan_fengmian4.jpg','','','资源详情2','2025-04-04 20:13:30',2,2,'2025-04-04 20:13:30',2,0,2),(3,'2025-04-04 12:13:30','资源名称3','资源分类3','upload/xuexiziyuan_fengmian3.jpg,upload/xuexiziyuan_fengmian4.jpg,upload/xuexiziyuan_fengmian5.jpg','','','资源详情3','2025-04-04 20:13:30',3,3,'2025-04-04 20:13:30',3,0,3),(4,'2025-04-04 12:13:30','资源名称4','资源分类4','upload/xuexiziyuan_fengmian4.jpg,upload/xuexiziyuan_fengmian5.jpg,upload/xuexiziyuan_fengmian6.jpg','','','资源详情4','2025-04-04 20:13:30',4,4,'2025-04-04 20:13:30',4,0,4),(5,'2025-04-04 12:13:30','资源名称5','资源分类5','upload/xuexiziyuan_fengmian5.jpg,upload/xuexiziyuan_fengmian6.jpg,upload/xuexiziyuan_fengmian7.jpg','','','资源详情5','2025-04-04 20:13:30',5,5,'2025-04-04 20:13:30',5,0,5),(6,'2025-04-04 12:13:30','资源名称6','资源分类6','upload/xuexiziyuan_fengmian6.jpg,upload/xuexiziyuan_fengmian7.jpg,upload/xuexiziyuan_fengmian8.jpg','','','资源详情6','2025-04-04 20:13:30',6,6,'2025-04-04 20:13:30',6,0,6),(7,'2025-04-04 12:13:30','资源名称7','资源分类7','upload/xuexiziyuan_fengmian7.jpg,upload/xuexiziyuan_fengmian8.jpg,upload/xuexiziyuan_fengmian1.jpg','','','资源详情7','2025-04-04 20:13:30',7,7,'2025-04-04 20:13:30',7,0,7),(8,'2025-04-04 12:13:30','资源名称8','资源分类8','upload/xuexiziyuan_fengmian8.jpg,upload/xuexiziyuan_fengmian1.jpg,upload/xuexiziyuan_fengmian2.jpg','','','资源详情8','2025-04-04 20:13:30',8,8,'2025-04-04 20:13:30',10,0,10),(9,'2025-04-04 12:18:23','考公','考公','upload/1743769093846.jpg','upload/1743769096855.doc','upload/1743769101624.mp4','<p>考公</p>','2025-04-04 20:18:07',1,0,NULL,2,1,1);
/*!40000 ALTER TABLE `xuexiziyuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `mima` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `xingbie` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `youxiang` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `shoujihao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `touxiang` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1743769037440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (11,'2025-04-04 12:13:30','用户账号1','123456','用户姓名1','男',1,'773890001@qq.com','13823888881','upload/yonghu_touxiang1.jpg'),(12,'2025-04-04 12:13:30','用户账号2','123456','用户姓名2','男',2,'773890002@qq.com','13823888882','upload/yonghu_touxiang2.jpg'),(13,'2025-04-04 12:13:30','用户账号3','123456','用户姓名3','男',3,'773890003@qq.com','13823888883','upload/yonghu_touxiang3.jpg'),(14,'2025-04-04 12:13:30','用户账号4','123456','用户姓名4','男',4,'773890004@qq.com','13823888884','upload/yonghu_touxiang4.jpg'),(15,'2025-04-04 12:13:30','用户账号5','123456','用户姓名5','男',5,'773890005@qq.com','13823888885','upload/yonghu_touxiang5.jpg'),(16,'2025-04-04 12:13:30','用户账号6','123456','用户姓名6','男',6,'773890006@qq.com','13823888886','upload/yonghu_touxiang6.jpg'),(17,'2025-04-04 12:13:30','用户账号7','123456','用户姓名7','男',7,'773890007@qq.com','13823888887','upload/yonghu_touxiang7.jpg'),(18,'2025-04-04 12:13:30','用户账号8','123456','用户姓名8','男',8,'773890008@qq.com','13823888888','upload/yonghu_touxiang8.jpg'),(1743769037439,'2025-04-04 12:17:17','11','11','张三','女',20,'111@qq.com','13012312311','upload/1743769036638.jpeg');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ziyuanfenlei`
--

DROP TABLE IF EXISTS `ziyuanfenlei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ziyuanfenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ziyuanfenlei` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '资源分类',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ziyuanfenlei` (`ziyuanfenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资源分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ziyuanfenlei`
--

LOCK TABLES `ziyuanfenlei` WRITE;
/*!40000 ALTER TABLE `ziyuanfenlei` DISABLE KEYS */;
INSERT INTO `ziyuanfenlei` VALUES (1,'2025-04-04 12:13:30','资源分类1'),(2,'2025-04-04 12:13:30','资源分类2'),(3,'2025-04-04 12:13:30','资源分类3'),(4,'2025-04-04 12:13:30','资源分类4'),(5,'2025-04-04 12:13:30','资源分类5'),(6,'2025-04-04 12:13:30','资源分类6'),(7,'2025-04-04 12:13:30','资源分类7'),(8,'2025-04-04 12:13:30','资源分类8'),(9,'2025-04-04 12:18:04','考公');
/*!40000 ALTER TABLE `ziyuanfenlei` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-08 21:11:10
