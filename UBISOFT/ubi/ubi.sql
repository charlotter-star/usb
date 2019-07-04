#设置客户端连接服务器编码UTF-8
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS ubi;
#创建数据库
CREATE DATABASE ubi CHARSET=UTF8;
#使用数据库
USE ubi;

/*******************************/
/*************创建数据表************/
/*******************************/

/**用户**/
CREATE TABLE ubi_user(
	uid	INT PRIMARY KEY AUTO_INCREMENT,
	user_name VARCHAR(8),
	uname  VARCHAR(32) UNIQUE,
	upwd  VARCHAR(32),
	email  VARCHAR(32),
	birthday  DATE
);

/**系列游戏**/
CREATE TABLE ubi_game_series(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(32)
);

/***游戏***/
CREATE TABLE ubi_game(
	gid INT PRIMARY KEY AUTO_INCREMENT,
	series_id INT,							#所属系列游戏编号
	gname VARCHAR(32),					#游戏名称
	versions VARCHAR(32),				#版本
	price DECIMAL(10,2),				#价格
	discount DECIMAL(4,2),			#折扣
	shelf_time BIGINT,					#上架时间

	title VARCHAR(128),					#主标题
	game_img VARCHAR(128),			#游戏图片
	gamebg_img VARCHAR(128)			#游戏背景图
	-- subtitle VARCHAR(128),			#副标题
	-- brief	VARCHAR(1024),				#游戏简介
	-- platform VARCHAR(32),				#平台
	-- description VARCHAR(1024),	#游戏描述

	-- is_onsale BOOLEAN					#是否促销中
);


/*****购物车****/
-- CREATE TABLE ubi_shoppingcart_item(
-- 	iid INT PRIMARY KEY AUTO_INCREMENT,
-- 	user_id INT,					#用户编号
-- 	product_id INT,				#商品编号
-- 	is_checked BOOLEAN		#是否已勾选，确定购买
-- )




/********************************/
/***************数据插入*************/
/*******************************/

/*******系列游戏*********/
INSERT INTO ubi_game_series VALUES
(NULL,"纪元"),
(NULL,"刺客信条"),
(NULL,"孤岛惊魂"),
(NULL,"荣耀战魂"),
(NULL,"幽灵行动"),
(NULL,"彩虹六号"),
(NULL,"极限巅峰"),
(NULL,"飙酷车神"),
(NULL,"全境封锁"),
(NULL,"特技摩托"),
(NULL,"看门狗");

/*******用户******/
INSERT INTO ubi_user VALUES
(NULL,"婷婷","tingting","973165084","tingting@qq.com","2000-2-27"),
(NULL,"俊森","junsen","973165084","junsen@qq.com","2000-2-27"),
(NULL,"世鑫","shixing","973165084","shixing@qq.com","2000-2-27"),
(NULL,"陈震","chenzhen","973165084","chenzhen@qq.com","2000-2-27"),
(NULL,"丽琪","liqi","973165084","liqi@qq.com","2000-2-27"),
(NULL,"平源","pingyuan","973165084","pingyuan@qq.com","2000-2-27"),
(NULL,"怡情","yiqing","973165084","yiqing@qq.com","2000-2-27"),
(NULL,"大哥","yijie","973165084","yijie@qq.com","2000-2-27");



/****游戏****/
INSERT INTO ubi_game VALUES
-- 纪元
(1,1,"纪元合集","纪元合集",496,0.9,150123456789,"纪元合集","store_img/games/5964e10a88a7e334498b4567.jpg","store_img/games_bg/5964e10a88a7e334498b4567.jpg"),
(2,1,"纪元1404","黄金版",68,0.25,150223456789,"纪元1404","store_img/games/56c4947f88a7e300458b467c.jpg","store_img/games_bg/56c4947f88a7e300458b467c.jpg"),
(3,1,"纪元1503","标准版",18,0.25,150323456789,"纪元1503","store_img/games/56c4947e88a7e300458b4660.jpg","store_img/games_bg/56c4947e88a7e300458b4660.jpg"),
(4,1,"纪元1602","标准版",42,0.25,150323456789,"纪元1602","store_img/games/58ab345b6b54a4cc2a8b4567.jpg","store_img/games_bg/58ab345b6b54a4cc2a8b4567.jpg"),
(5,1,"纪元1701","标准版",42,0.25,157123456789,"纪元1701","store_img/games/58ab30190c8ee463688b4567.jpg","store_img/games_bg/58ab30190c8ee463688b4567.jpg"),
(6,1,"纪元2070","标准版",88,0.25,1539923456789,"纪元2070","store_img/games/56c4947e88a7e300458b4662.jpg","store_img/games_bg/56c4947e88a7e300458b4662.jpg"),
(7,1,"纪元2070","完整版",118,0.25,152423456789,"Anno 2070 Complete Edition","store_img/games/56c4947888a7e300458b456c.jpg","store_img/games_bg/56c4947888a7e300458b456c.jpg"),
(8,1,"纪元2205","标准版",168,0.25,149123456789,"纪元2205","store_img/games/56c4947888a7e300458b4570.jpg","store_img/games_bg/56c4947888a7e300458b4570.jpg"),
(9,1,"纪元2205","终极版",208,0.25, 150123456789,"Anno 2205 Ultimate Edition","store_img/games/57f37acaca1a649a6e8b4567.jpg","store_img/games_bg/57f37acaca1a649a6e8b4567.jpg"),
(10,1,"纪元1800","标准版",248,1,151123456789,"纪元1800","store_img/games/5b647010ef3aa548048c5958.jpg","store_img/games_bg/5b647010ef3aa548048c5958.jpg"),
(11,1,"纪元1800","豪华版",288,1,151123456789,"纪元1800","store_img/games/5b647010ef3aa548048c595c.jpg","store_img/games_bg/5b647010ef3aa548048c5958.jpg"),
-- 刺客信条
(12,2,"刺客信条","标准版",42,1,150323456789,"刺客信条","store_img/games/56c4947f88a7e300458b468e.png","store_img/games_bg/56c4947f88a7e300458b468e.jpg"),
(13,2,"刺客信条2","标准版",48,1,150323456789,"Assassin's Creed II","store_img/games/56c4947f88a7e300458b4690.jpg","store_img/games_bg/56c4947f88a7e300458b4690.jpg"),
(14,2,"刺客信条：兄弟会","标准版",68,1,1510123456789,"Assassin's Creed Brotherhood","store_img/games/56c4948088a7e300458b46b6.jpg","store_img/games_bg/56c4948088a7e300458b46b6.jpg"),
(15,2,"刺客信条：启示录","标准版",68,1,151123456789,"Assassin’s Creed Revelations","store_img/games/56c4948188a7e300458b46d2.jpg","store_img/games_bg/56c4948188a7e300458b46d2.jpg"),
(16,2,"刺客信条III：高清重制版","标准版",168,1,151123456789,"《刺客信条III》：高清重制版","store_img/games/5c62f61dadc72438053897eb.jpg","store_img/games_bg/5a16aed74e01658f462610a8.jpg"),
(17,2,"刺客信条：黑旗","标准版",88,1,151123456789,"刺客信条：黑旗","store_img/games/56c4948088a7e300458b46aa.jpg","store_img/games_bg/56c4948088a7e300458b46aa.jpg"),
(18,2,"刺客信条：叛变","标准版",88,1,151123456789,"刺客信条：叛变","store_img/games/56c4948288a7e300458b46da.jpg","store_img/games_bg/56c4947988a7e300458b45bc.jpg"),
(19,2,"刺客信条：叛变","豪华版",188,1,151123456789,"刺客信条：叛变","store_img/games/56c4947988a7e300458b45bc.jpg","store_img/games_bg/56c4948288a7e300458b46da.jpg"),
(20,2,"刺客信条：大革命","标准版",118,1,150323456789,"刺客信条：大革命","store_img/games/56c4947a88a7e300458b45d6.jpg","store_img/games_bg/56c4947a88a7e300458b45d6.jpg"),
(21,2,"刺客信条编年史","China",42,1,151123456789,"刺客信条编年史：中国","store_img/games/56c4947f88a7e300458b4682.jpg","store_img/games_bg/56c4947f88a7e300458b4682.jpg"),
(22,2,"刺客信条编年史","India",42,1,151123456789,"刺客信条编年史","store_img/games/56c4947f88a7e300458b4686.jpg","store_img/games_bg/56c4947f88a7e300458b4686.jpg"),
(23,2,"刺客信条编年史","Russia",42,1,150323456789,"刺客信条编年史","store_img/games/57062ec488a7e316728b469e.jpg","store_img/games_bg/57062ec488a7e316728b469e.jpg"),
(24,2,"刺客信条：枭雄","黄金版",288,1,151123456789,"刺客信条：枭雄","store_img/games/56c4948288a7e300458b46ee.jpg","store_img/games_bg/56c4948288a7e300458b46ee.jpg"),
(25,2,"刺客信条：枭雄","标准版",168,1,151123456789,"刺客信条：枭雄","store_img/games/56c4947988a7e300458b45c6.jpg","store_img/games_bg/56c4947988a7e300458b45c6.jpg"),
(26,2,"刺客信条：起源","标准版",248,1,151123456789,"刺客信条：起源","store_img/games/592450934e0165f46c8b4568.jpg","store_img/games_bg/592450934e0165f46c8b4568.jpg"),
(27,2,"刺客信条：起源","豪华版",288,1,150323456789,"刺客信条：起源","store_img/games/5924576188a7e3bc5a8b4568.jpg","store_img/games_bg/5924576188a7e3bc5a8b4568.jpg"),
(28,2,"刺客信条：起源","黄金版",368,1,151123456789,"刺客信条：起源","store_img/games/59245fb4adc724ef3f8b456c.jpg","store_img/games_bg/59245fb4adc724ef3f8b456c.jpg"),
(29,2,"刺客信条 奥赛德","黄金版",408,1,150323456789,"刺客信条 奥赛德","store_img/games/5afda8a96b54a4271407a85b.jpg","store_img/games_bg/5afda8a96b54a4271407a85b.jpg"),
(30,2,"刺客信条 奥赛德","豪华版",308,1,151123456789,"刺客信条 奥赛德","store_img/games/5afda8a96b54a4271407a857.jpg","store_img/games_bg/5afda8a96b54a4271407a857.jpg"),
(31,2,"刺客信条 奥赛德","标准版",248,1,151123456789,"刺客信条 奥赛德","store_img/games/5afda5f788a7e34d25b5012f.jpg","store_img/games_bg/5afda5f788a7e34d25b5012f.jpg"),
(32,2,"刺客信条 合辑","神话组合",496,1,151123456789,"Assassin's Creed Mythology Pack","store_img/games/5c9101796b54a4f661916015.jpg","store_img/games_bg/5c9101796b54a4f661916015.jpg"),
(33,2,"刺客信条 合辑","近代革命组合",446,1,151123456789,"Assassin's Creed Modern Revolutions Pack","store_img/games/5c9101796b54a4f66191600d.jpg","store_img/games_bg/5c9101796b54a4f66191600d.jpg"),
(34,2,"刺客信条 合辑","艾吉奥组合",178,1,151123456789,"《刺客信条》艾吉奥组合","store_img/games/5c9101796b54a4f661915fff.jpg","store_img/games_bg/5c9101796b54a4f661915fff.jpg"),
-- 孤岛惊魂
(35,3,"孤岛惊魂","标准版",42,1,151123456789,"孤岛惊魂","store_img/games/56c4948488a7e300458b4740.jpg","store_img/games_bg/56c4948488a7e300458b4740.jpg"),
(36,3,"孤岛惊魂 2","标准版",42,1,150323456789,"孤岛惊魂 2","store_img/games/56c4948488a7e300458b4742.jpg","store_img/games_bg/56c4948488a7e300458b4742.jpg"),
(37,3,"孤岛惊魂 3","血龙",68,1,150123456789,"孤岛惊魂 3","store_img/games/56c4948488a7e300458b4744.jpg","store_img/games_bg/56c4948488a7e300458b4744.jpg"),
(38,3,"孤岛惊魂 3","豪华版",118,1,150323456789,"孤岛惊魂 3","store_img/games/56c4948488a7e300458b4748.jpg","store_img/games_bg/56c4948488a7e300458b4748.jpg"),
(39,3,"孤岛惊魂 3","标准版",88,1,150123456789,"孤岛惊魂 3","store_img/games/56c4947a88a7e300458b45de.jpg","store_img/games_bg/56c4947a88a7e300458b45de.jpg"),
(40,3,"孤岛惊魂 4","黄金版",248,1,150323456789,"孤岛惊魂 4","store_img/games/56c4948488a7e300458b474e.jpg","store_img/games_bg/56c4948488a7e300458b474e.jpg"),
(41,3,"孤岛惊魂 4","标准版",118,1,150123456789,"孤岛惊魂 4","store_img/games/56c4947a88a7e300458b45e2.jpg","store_img/games_bg/56c4947a88a7e300458b45e2-2.jpg"),
(42,3,"野蛮纪源","标准版",208,1,150323456789,"野蛮纪源","store_img/games/56c4947a88a7e300458b45e8.jpg","store_img/games_bg/56c4947a88a7e300458b45e8.jpg"),
(43,3,"孤岛惊魂 5","终极同捆包",508,1,150223456789,"孤岛惊魂 5","store_img/games/5c462fff88a7e33b38290e49.jpg","store_img/games_bg/5c462fff88a7e33b38290e49.jpg"),
(44,3,"孤岛惊魂 5","豪华版同捆包",408,1,150223456789,"孤岛惊魂 5","store_img/games/5c462fff88a7e33b38290e45.jpg","store_img/games_bg/5c462fff88a7e33b38290e45.jpg"),
(45,3,"孤岛惊魂 5","黄金版",368,1,150123456789,"孤岛惊魂 5","store_img/games/591980f94e0165260a8b4568.jpg","store_img/games_bg/591486f90c8ee43e228b4567.jpg"),
(46,3,"孤岛惊魂合集","青铜合集",172,0.9,150223456789,"孤岛惊魂 青铜合集","store_img/games/5822f64c29e123e45e8b4567.jpg","store_img/games_bg/5822f64c29e123e45e8b4567.jpg"),
(47,3,"孤岛惊魂合集","白银合集",358,0.9,150823456789,"孤岛惊魂 白银合集","store_img/games/5823121988a7e367398b4567.jpg","store_img/games_bg/5823121988a7e367398b4567.jpg"),
(48,3,"孤岛惊魂合集","黄金合集",566,0.9,150123456789,"孤岛惊魂 黄金合集","store_img/games/5823123488a7e36b398b4567.jpg","store_img/games_bg/5823123488a7e36b398b4567.jpg"),
(49,3,"孤岛惊魂：新曙光","终极同捆包",508,1,150123456789,"孤岛惊魂：新曙光","store_img/games/5c462fff88a7e33b38290e49.jpg","store_img/games_bg/5c462fff88a7e33b38290e49.jpg"),
(50,3,"孤岛惊魂：新曙光","标准版",188,1,150223456789,"孤岛惊魂：新曙光","store_img/games/5bf319696b54a4ddc91e8843.jpg","store_img/games_bg/5bf319696b54a4ddc91e8843.jpg"),
(51,3,"孤岛惊魂：新曙光","豪华版",228,1,150223456789,"孤岛惊魂：新曙光","store_img/games/5bfd4c28ca1a64ea70fe0ef3.jpg","store_img/games_bg/5bf319696b54a4ddc91e8843.jpg"),
-- 荣耀战魂
(52,4,"荣耀战魂","烈火行军版",208,1,150823456789,"荣耀战魂","store_img/games/5b8fdf1c6b54a426c4fad31c.jpg","store_img/games_bg/5b8fdf1c6b54a426c4fad31c.jpg"),
(53,4,"荣耀战魂","新手版",68,1,150823456789,"荣耀战魂","store_img/games/5aa103940c8ee48384878ab2.jpg","store_img/games_bg/5759633788a7e3de678b4567.jpg"),
(54,4,"荣耀战魂","标准版",118,1,150323456789,"荣耀战魂","store_img/games/5759633788a7e3de678b4567.jpg","store_img/games_bg/5759633788a7e3de678b4567.jpg"),
-- 幽灵行动
(55,5,"幽灵行动：断点","标准版",358,1,150823456789,"幽灵行动：断点","store_img/games/5cc81f5f6b54a4cd3c0e9cfd.jpg","store_img/games_bg/5cc81f5f6b54a4cd3c0e9cfd-pdp.jpg"),
(56,5,"幽灵行动：断点","终极版",718,0.92,150823456789,"幽灵行动：断点","store_img/games/5cc81f626b54a4cd3c0e9d37.jpg","store_img/games_bg/5cc81f626b54a4cd3c0e9d37.jpg"),
(57,5,"幽灵行动：断点","黄金版",598,1,150323456789,"幽灵行动：断点","store_img/games/5cc81f606b54a4cd3c0e9d1b.jpg","store_img/games_bg/5cc81f606b54a4cd3c0e9d1b.jpg"),
(58,5,"幽灵行动：荒野","标准版",208,1,150823456789,"幽灵行动：荒野","store_img/games/574474b488a7e3b8638b456a.jpg","store_img/games_bg/574474b488a7e3b8638b456a.jpg"),
(59,5,"幽灵行动：荒野","终极版",408,1,150823456789,"幽灵行动：荒野","store_img/games/5b969c88ca1a64033f76fa29.jpg","store_img/games_bg/5b969c88ca1a64033f76fa29.jpg"),
(60,5,"幽灵行动：荒野","黄金版",288,1,150823456789,"幽灵行动：荒野","store_img/games/5b9696c3ca1a64023f76fa28.jpg","store_img/games_bg/5b9696c3ca1a64023f76fa28.jpg"),
(61,5,"幽灵行动：未来战士","标准版",68,1,150323456789,"幽灵行动：未来战士","store_img/games/56c4948588a7e300458b4768.jpg","store_img/games_bg/57ebc15fef3aa57d1f8b4567.jpg"),
(62,5,"幽灵行动：未来战士","豪华版",88,1,150323456789,"幽灵行动：未来战士","store_img/games/56c4948588a7e300458b4768.jpg","store_img/games_bg/56c4948588a7e300458b4768.jpg"),
(63,5,"幽灵行动","标准版",42,1,150823456789,"幽灵行动","store_img/games/58aebeb4ef3aa5c5148b4568.jpg","store_img/games_bg/58aebeb4ef3aa5c5148b4568.jpg"),
-- 彩虹六号
(64,6,"彩虹六号","终极版",408,1,150823456789,"彩虹六号","store_img/games/58e60b88ca1a64156f8b4567.jpg","store_img/games_bg/5c586c7d29e123fd15c55bba.jpg"),
(65,6,"彩虹六号","标准版",42,1,150823456789,"彩虹六号","store_img/games/5c586c7d29e123fd15c55bc6.jpg","store_img/games_bg/58e60b88ca1a64156f8b4567.jpg"),
(66,6,"彩虹六号3","黄金版",18,1,150823456789,"彩虹六号3","store_img/games/58aeb87e29e1236d368b4567.jpg","store_img/games_bg/58aeb87e29e1236d368b4567.jpg"),
(67,6,"彩虹六号：禁锢法则","标准版",18,1,150323456789,"彩虹六号：禁锢法则","store_img/games/56c4948888a7e300458b47d4.jpg","store_img/games_bg/56c4948888a7e300458b47d4.jpg"),
(68,6,"彩虹六号：维加斯","标准版",42,1,150323456789,"彩虹六号：维加斯","store_img/games/56c4948888a7e300458b47d6.jpg","store_img/games_bg/56c4948888a7e300458b47d6.jpg"),
(69,6,"彩虹六号：维加斯2","标准版",42,1,150823456789,"彩虹六号：维加斯2","store_img/games/56c4948888a7e300458b47d8.jpg","store_img/games_bg/56c4948888a7e300458b47d8.jpg"),
(70,6,"彩虹六号：围攻","豪华版",118,1,150323456789,"彩虹六号：围攻","store_img/games/56c494ad88a7e300458b4d5a.jpg","store_img/games_bg/5c586c7d29e123fd15c55bba.jpg"),
(71,6,"彩虹六号：围攻","黄金版",248,1,150823456789,"彩虹六号：围攻","store_img/games/5c586c7d29e123fd15c55bc0.jpg","store_img/games_bg/5c586c7d29e123fd15c55bba.jpg"),
(72,6,"彩虹六号：围攻","标准版",88,1,150323456789,"彩虹六号：围攻","store_img/games/5c586c7d29e123fd15c55bba.jpg","store_img/games_bg/56c494ad88a7e300458b4d5a.jpg"),
(73,6,"彩虹六号：Quarantine","标准版",NULL,1,150823456789,"《彩虹六号》：Quarantine","store_img/games/5cf15f1b39798c0870c076e6.jpg","store_img/games_bg/5cf15f1b39798c0870c076e6.jpg"),
-- 极限巅峰
(74,7,"极限巅峰","X Games-黄金版",168,1,150823456789,"极限巅峰","store_img/games/5ba265764e016529f4fc2177.jpg","store_img/games_bg/5ba265764e016529f4fc2177-1.jpg"),
(75,7,"极限巅峰","标准版",118,1,150823456789,"极限巅峰","store_img/games/57597f6a0c8ee468458b4567.jpg","store_img/games_bg/57597f6a0c8ee468458b4567.jpg"),
-- 飙酷车神
(76,8,"飙酷车神","标准版",118,1,150323456789,"飙酷车神","store_img/games/56c494ad88a7e300458b4d50.jpg","store_img/games_bg/56c494ad88a7e300458b4d50.jpg"),
(77,8,"飙酷车神","终极版",208,1,150323456789,"飙酷车神","store_img/games/57e8eac5ef3aa570618b4567.jpg","store_img/games_bg/57e8eac5ef3aa570618b4567.jpg"),
(78,8,"飙酷车神2","标准版",248,1,150323456789,"飙酷车神2","store_img/games/598c6a3e0c8ee469268b4568.jpg","store_img/games_bg/598c6a3e0c8ee469268b4568.jpg"),
(79,8,"飙酷车神2","豪华版",288,1,150123456789,"飙酷车神2","store_img/games/598d7de588a7e3b7368b4568.jpg","store_img/games_bg/598d7de588a7e3b7368b4568.jpg"),
(80,8,"飙酷车神2","黄金版",368,1,150323456789,"飙酷车神2","store_img/games/598d7de688a7e3b7368b4578.jpg","store_img/games_bg/598d7de688a7e3b7368b4578.jpg"),
-- 全境封锁
(81,9,"全境封锁","标准版",208,1,150123456789,"全境封锁","store_img/games/56c494ad88a7e300458b4d62.jpg","store_img/games_bg/56c494ad88a7e300458b4d62.jpg"),
(82,9,"全境封锁","黄金版",368,1,150323456789,"全境封锁","store_img/games/56c4948e88a7e300458b48ac.jpg","store_img/games_bg/56c4948e88a7e300458b48ac.jpg"),
(83,9,"全境封锁2","终极版",618,0.67,150123456789,"全境封锁2","store_img/games/5b06a39a4e0165fa45ffdcfb.jpg","store_img/games_bg/5b06a39a4e0165fa45ffdcfb.jpg"),
(84,9,"全境封锁2","标准版",308,0.67,150123456789,"全境封锁2","store_img/games/5b06a3984e0165fa45ffdcc5.jpg","store_img/games_bg/5b06a3984e0165fa45ffdcc5.jpg"),
(85,9,"全境封锁2","黄金版",508,0.67,150323456789,"全境封锁2","store_img/games/5b06a3994e0165fa45ffdce1.jpg","store_img/games_bg/5b06a3994e0165fa45ffdce1.jpg"),
-- 特技摩托
(86,10,"特技摩托：聚变","标准版",88,1,150123456789,"特技摩托：聚变","store_img/games/56c4948d88a7e300458b4888.jpg","store_img/games_bg/56c4948d88a7e300458b4888.jpg"),
(87,10,"特技摩托：崛起","黄金版",168,1,150323456789,"特技摩托：崛起","store_img/games/5b0e967a4e0165c827ee8dd2.jpg","store_img/games_bg/5b0e967a4e0165c827ee8dd2.jpg"),
(88,10,"特技摩托：崛起","标准版",98,1,150123456789,"特技摩托：崛起","store_img/games/5b0e967a4e0165c827ee8de0.jpg","store_img/games_bg/5b0e967a4e0165c827ee8de0.jpg"),
-- 看门狗
(89,11,"看门狗","标准版",118,1,150323456789,"看门狗","store_img/games/56c494ae88a7e300458b4d72.jpg","store_img/games_bg/56c494ae88a7e300458b4d72.jpg"),
(90,11,"看门狗2","标准版",248,1,150123456789,"看门狗2","store_img/games/574d3a8aca1a64fb3b8b4567.jpg","store_img/games_bg/574d3a8aca1a64fb3b8b4567.jpg"),
(91,11,"看门狗2","豪华版",288,1,150123456789,"看门狗2","store_img/games/574d3e3e6b54a406348b4567.jpg","store_img/games_bg/574d3e3e6b54a406348b4567.jpg"),
(92,11,"看门狗2","黄金版",408,1,150123456789,"看门狗2","store_img/games/574d3e9a0c8ee4c65d8b4567.jpg","store_img/games_bg/574d3e9a0c8ee4c65d8b4567.jpg"),
(93,11,"看门狗：军团","标准版",358,1,150123456789,"看门狗：军团","store_img/games/5cec2d5839798c0870c07698.jpg","store_img/games_bg/5cec2d5839798c0870c07698.jpg"),
(94,11,"看门狗：军团","黄金版",598,1,150123456789,"看门狗：军团","store_img/games/5cec2d8639798c0870c07699.jpg","store_img/games_bg/5cec2d8639798c0870c07699.jpg"),
(95,11,"看门狗：军团","终极版",718,0.92,150123456789,"看门狗：军团","store_img/games/5cec2d9939798c0870c0769a.jpg","store_img/games_bg/5cec2d9939798c0870c0769a.jpg");




