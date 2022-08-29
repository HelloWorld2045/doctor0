-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-08-29 22:35:38
-- 服务器版本： 10.3.34-MariaDB-0+dde
-- PHP 版本： 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `dw`
--

-- --------------------------------------------------------

--
-- 表的结构 `体征`
--

CREATE TABLE `体征` (
  `id` int(10) UNSIGNED NOT NULL,
  `体征名称` varchar(36) NOT NULL,
  `简介` text NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `医生`
--

CREATE TABLE `医生` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '\r\n',
  `科室id` int(10) UNSIGNED NOT NULL,
  `医院id` int(10) UNSIGNED NOT NULL,
  `简介` text NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `医院`
--

CREATE TABLE `医院` (
  `id` int(10) UNSIGNED NOT NULL,
  `医院名称` varchar(36) NOT NULL,
  `上级医院id` int(10) UNSIGNED NOT NULL,
  `简介` text NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `已经删除` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='医院表';

-- --------------------------------------------------------

--
-- 表的结构 `商品条形码`
--

CREATE TABLE `商品条形码` (
  `id` int(10) UNSIGNED NOT NULL,
  `商品名称` varchar(36) NOT NULL,
  `商品条形码` int(10) UNSIGNED NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `权限`
--

CREATE TABLE `权限` (
  `id` int(10) UNSIGNED NOT NULL,
  `权限名称` varchar(36) NOT NULL,
  `上级权限id` int(10) UNSIGNED NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `用户`
--

CREATE TABLE `用户` (
  `id` int(10) UNSIGNED NOT NULL,
  `用户名` varchar(32) NOT NULL,
  `密码` char(32) NOT NULL,
  `email` varchar(36) DEFAULT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `修改时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `已经删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `用户`
--

INSERT INTO `用户` (`id`, `用户名`, `密码`, `email`, `创建时间`, `修改时间`, `已经删除`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', '2022-08-29 13:33:19', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `用户信息`
--

CREATE TABLE `用户信息` (
  `id` int(10) UNSIGNED NOT NULL,
  `用户id` int(10) UNSIGNED NOT NULL,
  `用户生日` int(8) NOT NULL,
  `身高` smallint(3) UNSIGNED NOT NULL,
  `体重` int(10) UNSIGNED NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `用户血糖`
--

CREATE TABLE `用户血糖` (
  `id` int(10) UNSIGNED NOT NULL,
  `用户id` int(10) UNSIGNED NOT NULL,
  `血糖值` double UNSIGNED NOT NULL,
  `血糖计量单位类型` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0为毫升1为毫克\r\n',
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `最后更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `已经删除` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `用户设备`
--

CREATE TABLE `用户设备` (
  `id` int(10) UNSIGNED NOT NULL,
  `用户id` int(10) UNSIGNED NOT NULL,
  `设备id` int(10) UNSIGNED NOT NULL,
  `设备型号` varchar(32) NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `修改时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `已经删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `用户诊断`
--

CREATE TABLE `用户诊断` (
  `id` int(10) UNSIGNED NOT NULL,
  `用户id` int(10) UNSIGNED NOT NULL,
  `症状id列表` text NOT NULL,
  `体征id列表` text NOT NULL,
  `诊断疾病id列表` text NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `用户运动`
--

CREATE TABLE `用户运动` (
  `id` int(10) UNSIGNED NOT NULL,
  `用户id` int(10) UNSIGNED NOT NULL,
  `运动类型` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `运动量` int(10) UNSIGNED NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `用户餐食`
--

CREATE TABLE `用户餐食` (
  `id` int(10) UNSIGNED NOT NULL,
  `类型` tinyint(3) UNSIGNED NOT NULL,
  `图片URL` text NOT NULL,
  `用户id` int(11) UNSIGNED NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `修改时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `已经删除` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `用户餐食内容`
--

CREATE TABLE `用户餐食内容` (
  `id` int(10) UNSIGNED NOT NULL,
  `餐食内容` varchar(36) NOT NULL,
  `卡路里估计` double UNSIGNED NOT NULL DEFAULT 0,
  `条形码` int(10) UNSIGNED NOT NULL,
  `用户餐食id` int(10) UNSIGNED NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `疾病`
--

CREATE TABLE `疾病` (
  `id` int(10) UNSIGNED NOT NULL,
  `疾病名称` varchar(36) NOT NULL,
  `简介` text NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `疾病体征`
--

CREATE TABLE `疾病体征` (
  `id` int(10) UNSIGNED NOT NULL,
  `疾病id` int(10) UNSIGNED NOT NULL,
  `体征id` int(10) UNSIGNED NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `疾病症状`
--

CREATE TABLE `疾病症状` (
  `id` int(10) UNSIGNED NOT NULL,
  `疾病id` int(10) UNSIGNED NOT NULL,
  `症状id` int(10) UNSIGNED NOT NULL,
  `简介` text NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `疾病药物`
--

CREATE TABLE `疾病药物` (
  `id` int(10) UNSIGNED NOT NULL,
  `疾病id` int(10) UNSIGNED NOT NULL,
  `药物id` int(10) UNSIGNED NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `症状`
--

CREATE TABLE `症状` (
  `id` int(10) UNSIGNED NOT NULL,
  `症状名称` varchar(36) NOT NULL,
  `简介` text NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `科室`
--

CREATE TABLE `科室` (
  `id` int(11) UNSIGNED NOT NULL,
  `科室名称` varchar(32) NOT NULL,
  `上级科室id` int(5) UNSIGNED DEFAULT 0,
  `医院id` int(10) UNSIGNED NOT NULL,
  `简介` text NOT NULL,
  `已经删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `科室`
--

INSERT INTO `科室` (`id`, `科室名称`, `上级科室id`, `医院id`, `简介`, `已经删除`) VALUES
(1, '外科', 0, 1, '这里是外科', 0);

-- --------------------------------------------------------

--
-- 表的结构 `管理员`
--

CREATE TABLE `管理员` (
  `id` int(11) UNSIGNED NOT NULL,
  `用户名` int(11) NOT NULL,
  `密码` varchar(36) NOT NULL,
  `角色id` int(10) UNSIGNED NOT NULL,
  `备注` text NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `药物`
--

CREATE TABLE `药物` (
  `id` int(10) UNSIGNED NOT NULL,
  `药物名称` varchar(36) NOT NULL,
  `简介` text NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `角色`
--

CREATE TABLE `角色` (
  `id` int(10) UNSIGNED NOT NULL,
  `角色名` varchar(36) NOT NULL,
  `权限列表` text NOT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `是否删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `设备`
--

CREATE TABLE `设备` (
  `id` int(10) UNSIGNED NOT NULL,
  `设备名称` varchar(36) NOT NULL,
  `设备类型` tinyint(4) NOT NULL DEFAULT 0,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `已经删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `预约`
--

CREATE TABLE `预约` (
  `id` int(10) UNSIGNED NOT NULL,
  `用户id` int(10) UNSIGNED NOT NULL,
  `医院id` int(10) UNSIGNED NOT NULL,
  `科室id` int(10) UNSIGNED NOT NULL,
  `医生id` int(10) UNSIGNED NOT NULL,
  `操作员id` tinyint(1) NOT NULL DEFAULT 0,
  `预约时间` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `备注` text DEFAULT NULL,
  `创建时间` timestamp NOT NULL DEFAULT current_timestamp(),
  `更新时间` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `已经删除` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转储表的索引
--

--
-- 表的索引 `体征`
--
ALTER TABLE `体征`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `医生`
--
ALTER TABLE `医生`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `医院`
--
ALTER TABLE `医院`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `商品条形码`
--
ALTER TABLE `商品条形码`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `权限`
--
ALTER TABLE `权限`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `用户`
--
ALTER TABLE `用户`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `用户信息`
--
ALTER TABLE `用户信息`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `用户血糖`
--
ALTER TABLE `用户血糖`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `用户设备`
--
ALTER TABLE `用户设备`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `用户诊断`
--
ALTER TABLE `用户诊断`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `用户运动`
--
ALTER TABLE `用户运动`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `用户餐食`
--
ALTER TABLE `用户餐食`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `用户餐食内容`
--
ALTER TABLE `用户餐食内容`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `疾病`
--
ALTER TABLE `疾病`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `疾病体征`
--
ALTER TABLE `疾病体征`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `疾病症状`
--
ALTER TABLE `疾病症状`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `疾病药物`
--
ALTER TABLE `疾病药物`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `症状`
--
ALTER TABLE `症状`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `科室`
--
ALTER TABLE `科室`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `管理员`
--
ALTER TABLE `管理员`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `药物`
--
ALTER TABLE `药物`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `角色`
--
ALTER TABLE `角色`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `设备`
--
ALTER TABLE `设备`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `预约`
--
ALTER TABLE `预约`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `体征`
--
ALTER TABLE `体征`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `医生`
--
ALTER TABLE `医生`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '\r\n';

--
-- 使用表AUTO_INCREMENT `商品条形码`
--
ALTER TABLE `商品条形码`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `权限`
--
ALTER TABLE `权限`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `用户`
--
ALTER TABLE `用户`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `用户信息`
--
ALTER TABLE `用户信息`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `用户设备`
--
ALTER TABLE `用户设备`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `用户诊断`
--
ALTER TABLE `用户诊断`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `用户运动`
--
ALTER TABLE `用户运动`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `用户餐食内容`
--
ALTER TABLE `用户餐食内容`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `疾病`
--
ALTER TABLE `疾病`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `疾病体征`
--
ALTER TABLE `疾病体征`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `疾病症状`
--
ALTER TABLE `疾病症状`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `疾病药物`
--
ALTER TABLE `疾病药物`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `症状`
--
ALTER TABLE `症状`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `科室`
--
ALTER TABLE `科室`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `管理员`
--
ALTER TABLE `管理员`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `药物`
--
ALTER TABLE `药物`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `设备`
--
ALTER TABLE `设备`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
