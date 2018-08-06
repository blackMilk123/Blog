/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-08-05 23:57:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `create_time` date DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `status` varchar(11) DEFAULT NULL,
  `describeArticle` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('2018-08-03', '1', '测试', '测试', '0', '测试', 'http://pcvisishu.bkt.clouddn.com/FuplkP3M51CmtTgNZZPqtgsxu4J-', '10', '2018-08-05');
INSERT INTO `article` VALUES ('2018-08-03', '5', '1111111', '<p></p><p>111111111<img src=\"http://pcvisishu.bkt.clouddn.com/FiPc7JMUuiP-IctWK5IahRIuxQTy\"></p><p></p>', '0', '111111111', 'http://pcvisishu.bkt.clouddn.com/FiPc7JMUuiP-IctWK5IahRIuxQTy', '10', '2018-08-03');
INSERT INTO `article` VALUES ('2018-08-05', '7', '服务器', '<p>服务器</p>', '0', '服务器', null, '13', null);
INSERT INTO `article` VALUES ('2018-08-05', '8', '静态变量初始化和获取环境变量', '<p></p><p></p><p>方案一：使用@PostConstruct注解</p><p><br></p><p>&nbsp;</p><p><br></p><p><span style=\"white-space:pre\">	</span>首先，声明一个静态变量staticTarget，静态变量staticTarget的类型要和非静态变量target的类型一致。</p><p><br></p><p><span style=\"white-space:pre\">	</span>然后，在带有@PostConstruct注解的方法中，将target的值赋给staticTarget。</p><p><br></p><p><span style=\"white-space:pre\">	</span>最后，在静态方法中通过调用静态变量staticTarget来实现对非静态变量target的调用。</p><p><br></p><p>&nbsp;</p><p><br></p><p><span style=\"white-space:pre\">	</span>说明：</p><p><br></p><p><span style=\"white-space:pre\">		</span>1)在指定方法上加上@PostConstruct 注解来指定该方法是在bean初始化之后调用</p><p><br></p><p><span style=\"white-space:pre\">		</span>2)在指定方法上加上@PreDestroy 注解来指定该方法是在bean销毁之前调用</p><p><br></p><p><span style=\"white-space:pre\">	</span></p><p><br></p><p>方案二：使用@PostConstruct注解</p><p><br></p><p>&nbsp;</p><p><br></p><p><span style=\"white-space:pre\">	</span>首先，声明一个静态变量factory，这个静态变量factory的类型为该类自身。</p><p><br></p><p><span style=\"white-space: pre;\">	</span>然后，在带有@PostConstruct注解的方法中，将this赋给这个静态变量factory，此时，factory指向了一个该类的实例(在容器启动的时候创建)，故factory可以访问到该实例中的字段。</p><p><br></p><p><span style=\"white-space:pre\">	</span>最后，在静态方法中，通过调用静态变量factory来访问该类中的非静态变量。</p><p><br></p><p><span style=\"white-space:pre\">	</span></p><p><br></p><p><span style=\"white-space:pre\">	</span>例子：</p><p></p><p></p>', '1', '方案一：使用@PostConstruct注解 	首先，声明一个静态变量staticTarget，静态变量staticTarget的类型要和非静态变量target的类型一致。	然后，在带有@PostCo', 'http://pcvisishu.bkt.clouddn.com/FqDq5uy5gLjYGOlqC-XFPn_rngM_', '10', '2018-08-05');
INSERT INTO `article` VALUES ('2018-08-05', '9', 'Spring中，给静态变量初始化的问题', '<p></p><p></p><p>方案一<b>：使用@Po</b>stConstruct注解</p><p><br></p><p>&nbsp;</p><p><br></p><p><span style=\"white-space:pre\">	</span>首先，声明一个静态变量staticTarget，静态变量staticTarget的类型要和非静态变量target的类型一致。</p><p><br></p><p><span style=\"white-space:pre\">	</span>然后，在带有@PostConstruct注解的方法中，将target的值赋给staticTarget。</p><p><br></p><p><span style=\"white-space:pre\">	</span>最后，在静态方法中通过调用静态变量staticTarget来实现对非静态变量target的调用。</p><p><br></p><p>&nbsp;</p><p><br></p><p><span style=\"white-space:pre\">	</span>说明：</p><p><br></p><p><span style=\"white-space:pre\">		</span>1)在指定方法上加上@PostConstruct 注解来指定该方法是在bean初始化之后调用</p><p><br></p><p><span style=\"white-space:pre\">		</span>2)在指定方法上加上@PreDestroy 注解来指定该方法是在bean销毁之前调用</p><p><br></p><p><span style=\"white-space:pre\">	</span></p><p><br></p><p>方案二：使用@PostConstruct注解</p><p><br></p><p>&nbsp;</p><p><br></p><p><span style=\"white-space:pre\">	</span>首先，声明一个静态变量factory，这个静态变量factory的类型为该类自身。</p><p><br></p><p><span style=\"white-space:pre\">	</span>然后，在带有@PostConstruct注解的方法中，将this赋给这个静态变量factory，此时，factory指向了一个该类的实例(在容器启动的时候创建)，故factory可以访问到该实例中的字段。</p><p><br></p><p><span style=\"white-space:pre\">	</span>最后，在静态方法中，通过调用静态变量factory来访问该类中的非静态变量。</p><p><br></p><p><span style=\"white-space:pre\">	</span></p><p><br></p><p><span style=\"white-space:pre\">	</span>例子：</p><p></p><p></p>', '1', '方案一：使用@PostConstruct注解 	首先，声明一个静态变量staticTarget，静态变量staticTarget的类型要和非静态变量target的类型一致。	然后，在带有@PostCo', 'http://pcvisishu.bkt.clouddn.com/FqDq5uy5gLjYGOlqC-XFPn_rngM_', '13', '2018-08-05');
INSERT INTO `article` VALUES ('2018-08-05', '10', '五月，冰城紫色浪漫的最美时光', '<p></p><p></p><p></p><p><br></p><p>方案一：使用<b>@PostC</b>onstruct注解</p><p>&nbsp;</p><p><span style=\"white-space:pre\">	</span>首先，声明一个静态变量staticTarget，静态变量staticTarget的类型要和非静态变量target的类型一致。</p><p><span style=\"white-space:pre\">	</span>然后，在带有@PostConstruct注解的方法中，将target的值赋给staticTarget。</p><p><span style=\"white-space:pre\">	</span>最后，在静态方法中通过调用静态变量staticTarget来实现对非静态变量target的调用。</p><p>&nbsp;</p><p><span style=\"white-space:pre\">	</span>说明：</p><p><span style=\"white-space:pre\">		</span>1)在指定方法上加上@PostConstruct 注解来指定该方法是在bean初始化之后调用</p><p><span style=\"white-space:pre\">		</span>2)在指定方法上加上@PreDestroy 注解来指定该方法是在bean销毁之前调用</p><p><span style=\"white-space:pre\">	</span></p><p>方案二：使用@PostConstruct注解</p><p>&nbsp;</p><p><span style=\"white-space:pre\">	</span>首先，声明一个静态变量factory，这个静态变量factory的类型为该类自身。</p><p><span style=\"white-space:pre\">	</span>然后，在带有@PostConstruct注解的方法中，将this赋给这个静态变量factory，此时，factory指向了一个该类的实例(在容器启动的时候创建)，故factory可以访问到该实例中的字段。</p><p><span style=\"white-space:pre\">	</span>最后，在静态方法中，通过调用静态变量factory来访问该类中的非静态变量。</p><p><span style=\"white-space:pre\">	</span></p><p><span style=\"white-space:pre\">	</span>例子：</p><p></p><p></p><p></p>', '1', '方案一：使用@PostConstruct注解 	首先，声明一个静态变量staticTarget，静态变量staticTarget的类型要和非静态变量target的类型一致。	然后，在带有@PostCo', 'http://pcvisishu.bkt.clouddn.com/FrEqYGS8ueukO5I0EQibMBeSCs2Z', '15', '2018-08-05');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `typeName` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('JavaSe', '10', '1');
INSERT INTO `type` VALUES ('服务器', '13', '2');
INSERT INTO `type` VALUES ('程序人生', '14', '3');
INSERT INTO `type` VALUES ('随写', '15', '4');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', 'admin');
