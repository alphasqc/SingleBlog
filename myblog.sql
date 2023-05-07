/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : myblog1

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2022-10-04 02:35:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adminname` (`adminname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', '973112765@qq.com');
INSERT INTO `admin` VALUES ('5', 'zxl', '123456', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', '973112765@qq.com');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click` int(11) DEFAULT '0',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) DEFAULT '0' COMMENT '文章浏览量',
  `introduction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(255) DEFAULT '0' COMMENT '0表示正常，1表示存在回收站',
  `tag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0 表示上架 1表示下架',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('12', 'Vue点击返回顶部功能', '52', '', 'admin', '420', 'Vue点击返回顶部功能', '0', '6,8', 'http://localhost:8989/1663657295016-566209BBDCA2235284A0441A0725BB89.jpg', '一开始直接用window.scrollTo的时候，发现一瞬间就滚上去了，不是我想要的效果，后来就要定时器实现了平滑滚动。\n```js\nlet timer = setInterval(() => {\n          let ispeed = Math.floor(-this.$refs.content.offsetTop / 7)\n          document.documentElement.scrollTop = this.scrollTop + ispeed\n          if (that.scrollTop === 0) {\n            clearInterval(timer)\n          }\n        }, 10)\n```\n\n后来查MDN的时候，原来scrollTo可以传另外的参数。\n```js\nwindow.scrollTo(x-coord,y-coord )\nwindow.scrollTo(options)\n```js\n\n- x-coord 是文档中的横轴坐标。\n- y-coord 是文档中的纵轴坐标。\n- options 是一个包含三个属性的对象。\n\n1、top  等同于  y-coord\n2、left  等同于  x-coord\n3、ehavior 类型String,表示滚动行为,支持参数 smooth(平滑滚动),instant(瞬间滚动),默认值auto\n```js\nwindow.scrollTo( 0, 1000 );  // 设置滚动行为改为平滑的滚动 \nwindow.scrollTo({    top: 1000,     behavior: \"smooth\" });\n```\n所以就直接设置behavior:smooth就可以了\n```js\nwindow.scrollTo({\n        top: this.$refs.content.offsetTop - 135,\n        behavior: \"smooth\",\n      });\n```', '0', '2022-01-07 09:56:49', '2022-10-04 02:05:43');
INSERT INTO `article` VALUES ('13', '判断是IOS系统还是android系统', '52', '', 'admin', '405', '判断是IOS系统还是android系统', '0', '13', 'http://localhost:8989/1663223535156-BC4EE59E775DAE22067E4847EB584DC5.jpg', '```js\nfunction detect(){\n         var equipmentType = \"\";\n         var agent = navigator.userAgent.toLowerCase();\n         var android = agent.indexOf(\"android\");\n         var iphone = agent.indexOf(\"iphone\");\n         var ipad = agent.indexOf(\"ipad\");\n         if(android != -1){\n             equipmentType = \"android\";\n         }\n         if(iphone != -1 || ipad != -1){\n             equipmentType = \"ios\";\n         }\n         return equipmentType;\n     }\n```', '0', '2022-01-07 09:57:35', '2022-10-04 02:06:32');
INSERT INTO `article` VALUES ('40', '朱晓亮模式', '0', '', 'admin', '459', '5201314', '0', '14', 'http://localhost:8989/1663656297069-7BB098FF572B3F94CA0F0C26855A8674.jpg', '|column1|column2|column3|\n|-|-|-|\n|content1|content2|content3|\n```js\n//添加文章\nrouter.post(\'/addarticle\', (req, res) => {\n    console.log(\'添加文章\', req.body);\n    const article = req.body\n    console.log(article);\n    const sql = \'insert into article set ?\'\n    db.query(sql, req.body, (err, result) => {\n        console.log(result);\n        if (result.affectedRows > 0) {\n            res.send({\n                status: 200,\n                msg: \'添加成功\'\n            })\n        } else {\n            res.send({\n                status: 500,\n                msg: \"添加失败\"\n            })\n        }\n    })\n})\n```\n', '0', '2022-09-20 14:21:03', '2022-10-04 02:09:10');
INSERT INTO `article` VALUES ('53', '555', '0', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', 'admin', '111', '555', '0', '3', 'http://localhost:8989/1664820219058-090C442D174AABC7E4B31FB2469474BF.jpg', '```js\nfunction getData() {\n  return new Promise(function(resolve) {\n    let data = { name: \"Tom\" };\n    resolve(data);\n  });\n}\nlet p = getData();\np.then(data => {\n  console.log(data);\n  return \"over\";\n});\n $imgAdd(pos, $file) {\n      this.img_file[pos] = $file;\n      // 第一步.将图片上传到服务器.\n      var formdata = new FormData();\n      formdata.append(\"file\", $file);\n      this.img_file[pos] = $file;\n      axios({\n        url: base.uploadUrl,\n        method: \"post\",\n        data: formdata,\n        headers: { \"Content-Type\": \"multipart/form-data\" },\n      }).then((res) => {\n        // let _res = res.data;\n        console.log(res.data.url);\n        let zxl = this.baseurl + \"/\" + res.data.url.slice(7);\n        // 第二步.将返回的url替换到文本原位置![...](0) -> ![...](url)\n        this.$refs.md.$img2Url(pos, zxl);\n      });\n    },\n    $imgDel(pos) {\n      delete this.img_file[pos];\n    },\n```\n```css\n.list-content li {\n  height: 100px;\n}\n\n.list-content li:nth-of-type(odd) {\n  background: #00ccff;\n}\n```\n\n\n\n\n\n\n![090C442D174AABC7E4B31FB2469474BF.jpg](http://localhost:8989/1664431307768-090C442D174AABC7E4B31FB2469474BF.jpg)![FF6C6F956213A0671968CDD82920451F.jpg](http://localhost:8989/1664431316657-FF6C6F956213A0671968CDD82920451F.jpg)', '0', '2022-09-29 13:58:34', '2022-10-04 02:04:00');
INSERT INTO `article` VALUES ('54', '5555551314', '0', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', 'admin', '13', '55555', '0', '3,6', '', '1111', '0', '2022-10-02 13:37:51', '2022-10-03 23:00:08');
INSERT INTO `article` VALUES ('56', '55', '0', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', 'admin', '13', '55', '0', '11', 'http://rj35h5gq5.hd-bkt.clouddn.com/1664713357118090C442D174AABC7E4B31FB2469474BF.jpg', '![090C442D174AABC7E4B31FB2469474BF.jpg](http://rj35h5gq5.hd-bkt.clouddn.com/1664713308305090C442D174AABC7E4B31FB2469474BF.jpg)', '0', '2022-10-02 20:22:39', null);
INSERT INTO `article` VALUES ('57', '猪55', '0', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', 'admin', '12', '6666', '0', '10,11', 'http://rj35h5gq5.hd-bkt.clouddn.com/16647142895729B43925C99E995AE37FC5FB9D097E5D7.jpg', '![9B43925C99E995AE37FC5FB9D097E5D7.jpg](http://rj35h5gq5.hd-bkt.clouddn.com/16647142825719B43925C99E995AE37FC5FB9D097E5D7.jpg)', '0', '2022-10-02 20:30:15', '2022-10-04 02:03:16');

-- ----------------------------
-- Table structure for articlecomment
-- ----------------------------
DROP TABLE IF EXISTS `articlecomment`;
CREATE TABLE `articlecomment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `articleid` int(10) DEFAULT NULL COMMENT '该评论属于哪一篇文章',
  `come` int(11) DEFAULT NULL COMMENT '评论级别，发表评论是0，回复别人评论是回复评论的id',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复谁，id',
  `email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(10) unsigned DEFAULT '0' COMMENT '0 待审核 1通过 2拒绝',
  `created_at` datetime DEFAULT NULL,
  `answertime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of articlecomment
-- ----------------------------
INSERT INTO `articlecomment` VALUES ('148', '50', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', '5252', '0', '2022-09-27 13:01:10', null);
INSERT INTO `articlecomment` VALUES ('149', '50', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', '5252', '0', '2022-09-27 13:01:12', null);
INSERT INTO `articlecomment` VALUES ('150', '50', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', '555', '1', '2022-09-27 13:06:11', null);
INSERT INTO `articlecomment` VALUES ('161', '50', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', '你你你', '0', '2022-09-27 20:25:40', null);
INSERT INTO `articlecomment` VALUES ('162', '50', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', '你你你', '1', '2022-09-27 20:25:42', null);
INSERT INTO `articlecomment` VALUES ('163', '50', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', '你你你', '1', '2022-09-27 20:25:44', null);
INSERT INTO `articlecomment` VALUES ('164', '50', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', '男男女女', '1', '2022-09-27 20:25:46', null);
INSERT INTO `articlecomment` VALUES ('165', '50', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', '浏览量', '1', '2022-09-27 20:26:01', null);
INSERT INTO `articlecomment` VALUES ('166', '50', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', '不不不', '1', '2022-09-27 20:26:05', null);
INSERT INTO `articlecomment` VALUES ('167', '50', '150', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', 'admin', '2222@qq.com', '5555', '1', '2022-09-28 11:37:55', null);
INSERT INTO `articlecomment` VALUES ('168', '50', '150', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', 'admin', '2222@qq.com', '555555', '1', '2022-09-28 11:37:59', null);
INSERT INTO `articlecomment` VALUES ('169', '50', '150', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', 'admin', '2222@qq.com', '好呢好呢', '1', '2022-09-28 11:38:03', null);
INSERT INTO `articlecomment` VALUES ('170', '50', '150', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', 'admin', '2222@qq.com', '还没好吗', '1', '2022-09-28 11:38:07', null);
INSERT INTO `articlecomment` VALUES ('171', '50', '150', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', 'admin', '2222@qq.com', '好呢好呢', '1', '2022-09-28 11:38:10', null);
INSERT INTO `articlecomment` VALUES ('172', '49', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', '5252', '0', '2022-09-28 11:53:35', null);
INSERT INTO `articlecomment` VALUES ('173', '49', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', '5252', '1', '2022-09-28 11:53:37', null);
INSERT INTO `articlecomment` VALUES ('175', '53', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', 'hhh', '1', '2022-09-29 15:50:03', null);
INSERT INTO `articlecomment` VALUES ('178', '53', '0', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', null, '2222@qq.com', '快快快', '0', '2022-09-29 15:51:02', null);
INSERT INTO `articlecomment` VALUES ('179', '57', '0', 'admin', 'http://localhost:8989/1664693288772-BC4EE59E775DAE22067E4847EB584DC5.jpg', null, '2222@qq.com', '5555', '2', '2022-10-03 12:40:45', null);
INSERT INTO `articlecomment` VALUES ('180', '57', '0', 'admin', 'http://localhost:8989/1664693288772-BC4EE59E775DAE22067E4847EB584DC5.jpg', null, '2222@qq.com', '55555', '2', '2022-10-03 12:40:47', null);
INSERT INTO `articlecomment` VALUES ('181', '57', '0', 'admin', 'http://localhost:8989/1664693288772-BC4EE59E775DAE22067E4847EB584DC5.jpg', null, '2222@qq.com', '555555', '1', '2022-10-03 12:40:49', null);
INSERT INTO `articlecomment` VALUES ('182', '10', '0', 'admin', 'http://localhost:8989/1664693288772-BC4EE59E775DAE22067E4847EB584DC5.jpg', null, '2222@qq.com', '555', '1', '2022-10-03 13:28:52', null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('3', 'Node', 'admin', '2022-09-19 14:15:37', '2022-09-19 09:16:13');
INSERT INTO `category` VALUES ('6', 'Vue', 'admin', '2022-09-19 14:14:30', '2022-09-19 09:07:37');
INSERT INTO `category` VALUES ('10', 'Js', 'admin', '2022-09-19 14:15:37', '2022-01-07 09:07:57');
INSERT INTO `category` VALUES ('11', '移动端', 'admin', '2022-09-19 14:15:37', '2022-01-07 09:08:08');
INSERT INTO `category` VALUES ('13', '其他类', 'admin', '2022-09-19 14:15:37', '2022-01-07 09:08:26');
INSERT INTO `category` VALUES ('14', '生活杂记', null, '2022-10-03 22:59:01', null);
INSERT INTO `category` VALUES ('15', '动漫', null, '2022-10-03 22:59:41', null);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `iscallback` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('143', '0', null, 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', '2222@qq.com', '55555', '0', '2022-09-27 21:45:02');
INSERT INTO `message` VALUES ('144', '0', null, 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', '2222@qq.com', '55555', '0', '2022-09-27 21:45:05');
INSERT INTO `message` VALUES ('148', '0', null, 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', '2222@qq.com', '冲冲冲', '1', '2022-09-27 21:45:16');
INSERT INTO `message` VALUES ('149', '0', null, 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', '2222@qq.com', '冲冲冲', '0', '2022-09-27 21:45:17');
INSERT INTO `message` VALUES ('150', '0', null, 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', '2222@qq.com', '冲冲冲', '0', '2022-09-27 21:45:18');
INSERT INTO `message` VALUES ('151', '0', null, 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', '2222@qq.com', '冲冲冲', '0', '2022-09-27 21:45:20');
INSERT INTO `message` VALUES ('152', '0', null, 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', '2222@qq.com', '555', '0', '2022-09-29 21:52:42');
INSERT INTO `message` VALUES ('156', '0', null, 'admin', 'http://localhost:8989/1664693288772-BC4EE59E775DAE22067E4847EB584DC5.jpg', '2222@qq.com', '8080', '0', '2022-10-03 22:53:34');
INSERT INTO `message` VALUES ('157', '0', null, 'admin', 'http://localhost:8989/1664693288772-BC4EE59E775DAE22067E4847EB584DC5.jpg', '2222@qq.com', '8080', '0', '2022-10-03 22:53:36');
INSERT INTO `message` VALUES ('158', '0', null, 'admin', 'http://localhost:8989/1664693288772-BC4EE59E775DAE22067E4847EB584DC5.jpg', '2222@qq.com', '80808', '1', '2022-10-03 22:53:38');
INSERT INTO `message` VALUES ('159', '0', null, 'admin', 'http://localhost:8989/1664693288772-BC4EE59E775DAE22067E4847EB584DC5.jpg', '2222@qq.com', '808080', '1', '2022-10-03 22:53:40');
INSERT INTO `message` VALUES ('162', '148', 'admin', 'admin', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', '973112765@qq.com', '好男孩女孩', '0', '2022-10-03 22:56:22');
INSERT INTO `message` VALUES ('163', '159', 'admin', 'zxl', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', '973112765@qq.com', '男男女女', '0', '2022-10-03 22:57:12');
INSERT INTO `message` VALUES ('164', '158', 'admin', 'zxl', 'http://localhost:8989/1663467154628-7BB098FF572B3F94CA0F0C26855A8674.jpg', '973112765@qq.com', '好呢好呢', '0', '2022-10-03 22:57:16');

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES ('70', '薇尔莉特', 'http://localhost:8989/1664819061786-5C7A96DE618705BEADFC3E22B9C68B2F.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(20) CHARACTER SET utf8mb4 DEFAULT '男',
  `age` int(20) DEFAULT '18',
  `created_at` datetime DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '/upload/1.png',
  `introduction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '这里还是空的，写一些介绍你吧  (๑•̀ㅂ•́)و✧',
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '您还没有设置属于自己的呢称哦 ｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡",',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('34', 'admin', '123456', '2222@qq.com', '男', '18', '2022-09-13 13:33:11', 'http://rj35h5gq5.hd-bkt.clouddn.com/1664766032323090C442D174AABC7E4B31FB2469474BF.jpg', '这里还是空的，写一些介绍你吧  (๑•̀ㅂ•́)و✧', '您还没有设置属于自己的呢称哦 ｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡\",', '2022-10-03 23:00:49');
INSERT INTO `user` VALUES ('41', 'lw', '123456', '555@qq.com', '男', '12', '2022-09-13 15:04:39', 'http://localhost:8989/1664221762387-BC4EE59E775DAE22067E4847EB584DC5.jpg', '5555', '55588', '2022-10-03 22:35:57');
INSERT INTO `user` VALUES ('47', '8888', '8888888', '85555@qqq.com', '男', '35', '2022-09-15 14:05:10', 'http://localhost:8989/1663221908983-7BB098FF572B3F94CA0F0C26855A8674.jpg', '这里还是空的，写一些介绍你吧  (๑•̀ㅂ•́)و✧', '您还没有设置属于自己的呢称哦 ｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡\",', null);
INSERT INTO `user` VALUES ('48', '88888', '8888', '5555@qqq.com', '男', '25', '2022-09-15 14:05:25', 'http://localhost:8989/1663221923531-9B43925C99E995AE37FC5FB9D097E5D7.jpg', '这里还是空的，写一些介绍你吧  (๑•̀ㅂ•́)و✧', '您还没有设置属于自己的呢称哦 ｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡\",', null);
INSERT INTO `user` VALUES ('55', '987', '4444444', '55555@qq.com', '女', '88', '2022-09-15 18:24:46', 'http://localhost:8989/1663237461086-566209BBDCA2235284A0441A0725BB89.jpg', '8888', '888', null);
INSERT INTO `user` VALUES ('56', '9999999999', '999999999999999999', '55555555@qq.com', '男', '25', '2022-09-15 22:44:30', 'http://localhost:8989/1663253068572-1647498089427.jpg', '555555', '5555555555555555555', null);
INSERT INTO `user` VALUES ('58', 'zxl', '123456', '520@qq.com', '男', '18', '2022-09-19 01:51:37', 'http://localhost:8989/1663523496950-090C442D174AABC7E4B31FB2469474BF.jpg', '这里还是空的，写一些介绍你吧  (๑•̀ㅂ•́)و✧', '您还没有设置属于自己的呢称哦 ｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡\",', null);
INSERT INTO `user` VALUES ('61', '123456', '45645521', '555@qq.com', '男', '55', '2022-09-19 16:10:33', 'http://localhost:8989/1663575030042-1648007519349.jpg', '', '55', null);
INSERT INTO `user` VALUES ('63', '888885', '5555888', '5555@qq.com', '男', '18', '2022-09-20 01:53:35', 'http://localhost:8989/1663610014874-CD640896E576F9C2E875317EF083B31D.jpg', '这里还是空的，写一些介绍你吧  (๑•̀ㅂ•́)و✧', '您还没有设置属于自己的呢称哦 ｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡\",', '2022-10-03 11:55:36');
INSERT INTO `user` VALUES ('64', 'zzzzzmmm', '123456', '55@qq.com', '女', '18', '2022-09-20 01:55:47', 'http://localhost:8989/1664437424903-090C442D174AABC7E4B31FB2469474BF.jpg', '这里还是空的，写一些介绍你吧  (๑•̀ㅂ•́)و✧', '您还没有设置属于自己的呢称哦 ｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡\",', '2022-10-03 11:25:48');
INSERT INTO `user` VALUES ('65', 'lwlwlw', '123456', '2222@qq.com', '男', '18', '2022-10-02 18:26:28', '', '这里还是空的，写一些介绍你吧  (๑•̀ㅂ•́)و✧', '您还没有设置属于自己的呢称哦 ｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡\",', null);
INSERT INTO `user` VALUES ('66', 'zxlzxl', '123456', '1111@qq.com', '男', '18', '2022-10-02 18:27:59', '', '这里还是空的，写一些介绍你吧  (๑•̀ㅂ•́)و✧', '您还没有设置属于自己的呢称哦 ｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡\",', null);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('40', '55', 'http://localhost:8989/1664819908903-3fae1a74b9cbd57231efee5648aeebb9(2).mp4');
