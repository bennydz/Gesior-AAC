-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28-Jun-2017 às 01:44
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gesior`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `secret` char(16) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `coins` int(12) NOT NULL DEFAULT '0',
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `creation` int(11) NOT NULL DEFAULT '0',
  `key` varchar(20) NOT NULL DEFAULT '0',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `birth_date` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `page_access` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vote` int(11) NOT NULL,
  `loyalty_points` bigint(20) NOT NULL DEFAULT '0',
  `authToken` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `secret`, `type`, `premdays`, `coins`, `lastday`, `email`, `creation`, `key`, `email_new`, `email_new_time`, `rlname`, `location`, `birth_date`, `gender`, `page_access`, `email_code`, `next_email`, `premium_points`, `create_date`, `create_ip`, `last_post`, `flag`, `vote`, `loyalty_points`, `authToken`) VALUES
(1, '1', '2f165e4cf99cd9298fas65d6s5da7924cfc9c', NULL, 1, 0, 0, 0, 'tibia@gmail.com', 1429670486, '', '', 0, '', '', '', '', 3, '', 0, 0, 0, 2147483647, 0, 'unknown', 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts_options`
--

CREATE TABLE `accounts_options` (
  `account_id` int(11) NOT NULL,
  `options` text COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `guild_logo` mediumblob,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Acionadores `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('the Leader', 3, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Vice-Leader', 2, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Member', 1, NEW.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT '0',
  `targetguild` int(11) NOT NULL DEFAULT '0',
  `warid` int(11) NOT NULL DEFAULT '0',
  `time` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL DEFAULT '0',
  `guild2` int(11) NOT NULL DEFAULT '0',
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `started` bigint(15) NOT NULL DEFAULT '0',
  `ended` bigint(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `bid` int(11) NOT NULL DEFAULT '0',
  `bid_end` int(11) NOT NULL DEFAULT '0',
  `last_bid` int(11) NOT NULL DEFAULT '0',
  `highest_bidder` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `beds` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `links`
--

CREATE TABLE `links` (
  `account_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `code_date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `links`
--

INSERT INTO `links` (`account_id`, `code`, `code_date`) VALUES
(4384, '3w9wgz8su6cgdaje1ib5', 1468805237),
(4384, 'xokeuwhmcdcmc6x4khhu', 1468805363),
(4384, '5ma8ho1gjnutx6gbk195', 1468805590),
(4384, 'gokr41gobj136cf3bi51', 1468805868),
(4384, 'kxbw1k4mjqtavqkgufe3', 1468805882),
(4384, 'qcrkyccqj2b1q2aimr3j', 1468805950),
(4384, 'uzr1z62bf6hcgdxndtsh', 1468806072),
(4383, 'lu7cg697yelg3hv6oh5h', 1469416285),
(4383, 'huyejrto7m48mk8j81ov', 1469416369),
(4383, 'lkz24xf4zjzbexe588xu', 1469416391),
(4383, 'sez37nwx8yanhbbws6c1', 1469416406),
(4383, 'fdr23849wrn3zsxwnule', 1469416558),
(4383, '2armh8f5irc1wtg5nk84', 1480199355),
(4383, 'lc9ikdjxymyjfr61nv3o', 1480199464),
(4383, '9h78myg5r9lycwshdaou', 1480199485),
(4383, '8c84uhcwrj21a5bguo88', 1480199518),
(4383, 'lfyls21t74hjnic1wmks', 1480199573),
(4383, 'xkqet6ecnc3cqf7wenta', 1480199587),
(4383, 's8sk5fxud2bxaricjgqa', 1480199632),
(4383, 'gblirbom8bghtx1r5cek', 1480199788);

-- --------------------------------------------------------

--
-- Estrutura da tabela `live_casts`
--

CREATE TABLE `live_casts` (
  `player_id` int(11) NOT NULL,
  `cast_name` varchar(255) NOT NULL,
  `password` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `spectators` smallint(5) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsticker`
--

CREATE TABLE `newsticker` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagseguro`
--

CREATE TABLE `pagseguro` (
  `date` datetime NOT NULL,
  `code` varchar(50) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `lastEventDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `soul` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `onlinetime` int(11) NOT NULL DEFAULT '0',
  `deletion` bigint(15) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `stamina` smallint(5) UNSIGNED NOT NULL DEFAULT '2520',
  `skill_fist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_club` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_sword` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_axe` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_dist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_shielding` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_fishing` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `signature` varchar(255) NOT NULL,
  `marriage_status` tinyint(1) NOT NULL DEFAULT '0',
  `marriage_spouse` int(11) NOT NULL DEFAULT '-1',
  `loyalty_ranking` tinyint(1) NOT NULL DEFAULT '0',
  `skill_critical_hit_chance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_damage` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_damage_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `onlinetime`, `deletion`, `deleted`, `balance`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `description`, `comment`, `create_ip`, `create_date`, `hide_char`, `signature`, `marriage_status`, `marriage_spouse`, `loyalty_ranking`, `skill_critical_hit_chance`, `skill_critical_hit_chance_tries`, `skill_critical_hit_damage`, `skill_critical_hit_damage_tries`, `skill_life_leech_chance`, `skill_life_leech_chance_tries`, `skill_life_leech_amount`, `skill_life_leech_amount_tries`, `skill_mana_leech_chance`, `skill_mana_leech_chance_tries`, `skill_mana_leech_amount`, `skill_mana_leech_amount_tries`) VALUES
(1, 'Account Manager', 1, 1, 8, 0, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 1, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, '', '', 0, 0, 0, '', 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Rook Sample', 1, 1, 1, 0, 150, 150, 0, 69, 76, 78, 58, 128, 0, 0, 5, 5, 0, 100, 6, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, '', '', 0, 0, 0, '', 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Sorcerer Sample', 1, 1, 8, 1, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 1, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, '', '', 0, 0, 0, '', 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'Druid Sample', 1, 1, 8, 2, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 1, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, '', '', 0, 0, 0, '', 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'Paladin Sample', 1, 1, 8, 3, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 1, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, '', '', 0, 0, 0, '', 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'Knight Sample', 1, 1, 8, 4, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 1, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, '', '', 0, 0, 0, '', 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

--
-- Acionadores `players`
--
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
    UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT '1',
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) NOT NULL DEFAULT '0',
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_former_names`
--

CREATE TABLE `player_former_names` (
  `player_id` int(11) NOT NULL,
  `former_name` varchar(35) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL DEFAULT '0',
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_rewards`
--

CREATE TABLE `player_rewards` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '24'),
('double', 'desactived'),
('motd_hash', 'd40f8dcfa99c13f947571211f86d3e1edd1b329c'),
('motd_num', '2'),
('players_record', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_history`
--

CREATE TABLE `store_history` (
  `account_id` int(11) NOT NULL,
  `mode` smallint(2) NOT NULL DEFAULT '0',
  `description` varchar(3500) NOT NULL,
  `coin_amount` int(12) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_forum`
--

CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` int(11) NOT NULL,
  `news_icon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_category`
--

CREATE TABLE `z_shop_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `button` varchar(50) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_shop_category`
--

INSERT INTO `z_shop_category` (`id`, `name`, `desc`, `button`, `hide`) VALUES
(2, 'Extra Services', 'Buy an extra service to transfer a character to another game world, to change your character name or sex, to change your account name, or to get a new recovery key.', '_sbutton_getextraservice.gif', 0),
(3, 'Mounts', 'Buy your characters one or more of the fabulous mounts offered here.', '_sbutton_getmount.gif', 1),
(4, 'Outfits', 'Buy your characters one or more of the fancy outfits offered here.', '_sbutton_getoutfit.gif', 1),
(5, 'Items', 'Buy items for your character be more stronger in the game.', '_sbutton_getextraservice.gif', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_donates`
--

CREATE TABLE `z_shop_donates` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `price` varchar(20) NOT NULL,
  `points` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_shop_donates`
--

INSERT INTO `z_shop_donates` (`id`, `date`, `reference`, `account_name`, `method`, `price`, `points`, `status`) VALUES
(249, 1437322115, 'LIFT0P', 'MANCHA123', 'pagseguro', '30.00', 30, 'waiting'),
(250, 1437330819, 'EZ0ORI', 'THIAGOSHOT', 'pagseguro', '45.00', 45, 'waiting'),
(251, 1437334842, '5KEXKG', 'TONYCRUZM', 'pagseguro', '20.00', 20, 'waiting'),
(252, 1437340193, '2E23FZ', 'GAMST123', 'pagseguro', '300.00', 300, 'waiting'),
(253, 1437402041, 'PSLOR5', 'HALO10', 'paypal', '200.00', 200, 'confirm'),
(254, 1437414629, 'M5VENK', '2520720LEO', 'pagseguro', '5.00', 5, 'waiting'),
(255, 1437425884, 'W0YRTV', '850163', 'paypal', '5.00', 5, 'confirm'),
(256, 1437425900, 'ALJACA', '850163', 'paypal', '5.00', 5, 'confirm'),
(257, 1467954290, '-Caixa Economica', '451994', 'banktransfer', '300.00', 300, 'received'),
(258, 1467954615, '-Caixa Economica', '451994', 'banktransfer', '5.00', 5, 'received'),
(259, 1467954689, '-Caixa Economica', '451994', 'banktransfer', '5.00', 5, 'received'),
(260, 1467954702, '-Caixa Economica', '451994', 'banktransfer', '5.00', 5, 'received'),
(261, 1467954716, 'SEVVS-Caixa Economica', '451994', 'banktransfer', '5.00', 5, 'received'),
(262, 1470607117, 'SEVVS', '451994', 'pagseguro', '5.00', 5, 'waiting'),
(263, 1470611654, 'SEVVS-Caixa Economica', '451994', 'banktransfer', '5.00', 5, 'received'),
(264, 1470612017, '9WSOT-Caixa Economica', '451994', 'banktransfer', '300.00', 300, 'received'),
(265, 1480018968, 'IS1TL-Caixa Economica', '451994', 'banktransfer', '5.00', 5, 'confirmed');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_donate_confirm`
--

CREATE TABLE `z_shop_donate_confirm` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `donate_id` int(11) NOT NULL,
  `msg` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_shop_donate_confirm`
--

INSERT INTO `z_shop_donate_confirm` (`id`, `date`, `account_name`, `donate_id`, `msg`) VALUES
(33, 1467954347, '451994', 257, 'Fiz o pagamento da doaÃ§Ã£o, aguardo resposta.'),
(34, 1470611691, '451994', 263, 'asdasdasdasdsadasdsadasdsadasdasdasdasdasdas\r\ndas\r\ndas\r\ndas\r\ndasd\r\nasd\r\nasd'),
(35, 1470611710, '451994', 258, 'ALDPLDP`SALDPÃ¡sldpÃ¡sldasdijasduasdashduashduashdusahduiashduisahduiasdhuiasdhiuasdhuiasdhiuadhuaisdhuishd'),
(36, 1470611728, '451994', 259, 'm3JQ3NQ3N4IQ3N4IUQN4UI3N4IUQ3NQ34'),
(37, 1470611747, '451994', 260, 'aisjidajiodjaeiorjijraiejioaerjiorjioajrioaejrioajriorjioaejrioaerj'),
(38, 1470611769, '451994', 261, 'NJAenjanernaerunaernIURAENARUNARunarnauirnuirnaiunriuaenr'),
(39, 1470612062, '451994', 264, 'okopkopokop1kok3o1k3op12k3op1k3op1k321'),
(40, 1480343198, '451994', 265, 'fefaefaeradfadfafasdsadafaesasdsadasdasdadfasdasdaveafzc');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_item`
--

CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `price` varchar(50) NOT NULL,
  `itemid` int(11) NOT NULL DEFAULT '0',
  `mount_id` varchar(100) NOT NULL,
  `addon_name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `offer_date` int(11) NOT NULL,
  `default_image` varchar(50) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `category`, `points`, `price`, `itemid`, `mount_id`, `addon_name`, `count`, `offer_type`, `offer_description`, `offer_name`, `offer_date`, `default_image`, `hide`) VALUES
(5, 2, 12, '', 0, '', '', 1, 'changename', 'Buy a character name change to rename one of your characters.', 'Character Change Name', 1416865577, 'changename.png', 1),
(6, 2, 10, '', 0, '', '', 1, 'changesex', 'Buy a character sex change to turn your male character into a female one, or your female character into a male one.', 'Character Change Sex', 1416874417, 'changesex.png', 1),
(7, 2, 12, '', 0, '', '', 1, 'changeaccountname', 'Buy an account name change to select a different name for your account.', 'Account Name Change', 1416874601, 'changeaccountname.png', 1),
(8, 2, 25, '', 0, '', '', 1, 'newrk', 'If you need a new recovery key, you can order it here. Note that the letter for the new recovery key can only be sent to the address in the account registration.', 'Recovery Key', 1416874816, 'newrk.png', 0),
(19, 4, 30, '', 0, '', 'Conjurer', 1, 'outfits', '', 'Conjurer Outfit', 1429676615, '', 0),
(21, 4, 15, '', 0, '', 'Beastmaster', 1, 'outfits', '', 'Beastmaster Outfit', 1429676648, '', 0),
(22, 3, 20, '', 0, '74', '', 1, 'mounts', '', 'Emerald Waccoon', 1429876622, '', 0),
(23, 3, 20, '', 0, '72', '', 1, 'mounts', '', 'Ringtail Waccoon', 1429876713, '', 0),
(24, 3, 20, '', 0, '73', '', 1, 'mounts', '', 'Night Waccoon', 1429876820, '', 0),
(26, 3, 25, '', 0, '44', '', 1, 'mounts', '', 'Azudocus', 1429876911, '', 0),
(27, 3, 25, '', 0, '67', '', 1, 'mounts', '', 'Black Stag', 1429876936, '', 0),
(28, 3, 25, '', 0, '58', '', 1, 'mounts', '', 'Blackpelt', 1429876956, '', 0),
(29, 3, 20, '', 0, '61', '', 1, 'mounts', '', 'Copper Fly', 1429876998, '', 0),
(30, 3, 25, '', 0, '46', '', 1, 'mounts', '', 'Death Crawler', 1429877035, '', 0),
(31, 3, 20, '', 0, '41', '', 1, 'mounts', '', 'Desert King', 1429877076, '', 0),
(32, 3, 25, '', 0, '53', '', 1, 'mounts', '', 'Doombringer', 1429877116, '', 0),
(33, 3, 20, '', 0, '68', '', 1, 'mounts', '', 'Emperor Deer', 1429877141, '', 0),
(34, 3, 30, '', 0, '47', '', 1, 'mounts', '', 'Flamesteed', 1429877168, '', 0),
(35, 3, 25, '', 0, '71', '', 1, 'mounts', '', 'Floating Kashmir', 1429877190, '', 0),
(36, 3, 25, '', 0, '69', '', 1, 'mounts', '', 'Flying Divan', 1429877207, '', 0),
(37, 3, 25, '', 0, '64', '', 1, 'mounts', '', 'Glacier Vagabond', 1429877226, '', 0),
(38, 3, 25, '', 0, '59', '', 1, 'mounts', '', 'Golden Dragonfly', 1429877247, '', 0),
(39, 3, 25, '', 0, '55', '', 1, 'mounts', '', 'Hailtorm Fury', 1429877267, '', 0),
(40, 3, 25, '', 0, '63', '', 1, 'mounts', '', 'Highland Yak', 1429877288, '', 0),
(41, 3, 25, '', 0, '48', '', 1, 'mounts', '', 'Jade Lion', 1429877302, '', 0),
(42, 3, 25, '', 0, '49', '', 1, 'mounts', '', 'Jade Pincer', 1429877315, '', 0),
(43, 3, 25, '', 0, '70', '', 1, 'mounts', '', 'Magic Carpet', 1429877334, '', 0),
(44, 3, 30, '', 0, '50', '', 1, 'mounts', '', 'Nethersteed', 1429877347, '', 0),
(45, 3, 20, '', 0, '37', '', 1, 'mounts', '', 'Platesaurian', 1429877368, '', 0),
(46, 3, 25, '', 0, '57', '', 1, 'mounts', '', 'Poisonbane', 1429877382, '', 0),
(47, 3, 25, '', 0, '66', '', 1, 'mounts', '', 'Shadow Hart', 1429877394, '', 0),
(48, 3, 25, '', 0, '56', '', 1, 'mounts', '', 'Siegebreaker', 1429877408, '', 0),
(49, 3, 25, '', 0, '60', '', 1, 'mounts', '', 'Steel Bee', 1429877417, '', 0),
(50, 3, 25, '', 0, '51', '', 1, 'mounts', '', 'Tempest', 1429877428, '', 0),
(51, 3, 25, '', 0, '36', '', 1, 'mounts', '', 'Tombstinger', 1429877444, '', 0),
(52, 3, 25, '', 0, '62', '', 1, 'mounts', '', 'Tundra Rambler', 1429877456, '', 0),
(53, 3, 25, '', 0, '52', '', 1, 'mounts', '', 'Winter King', 1429877471, '', 0),
(54, 3, 25, '', 0, '54', '', 1, 'mounts', '', 'Woodland Prince', 1429877481, '', 0),
(55, 4, 20, '', 0, '', 'Ceremonial Garb', 1, 'outfits', '', 'Ceremonial Garb Outfit', 1429877536, '', 0),
(56, 4, 15, '', 0, '', 'Champion', 1, 'outfits', '', 'Champion Outfit', 1429877546, '', 0),
(57, 4, 25, '', 0, '', 'Chaos Acolyte', 1, 'outfits', '', 'Chaos Acolyte Outfit', 1429877559, '', 0),
(58, 4, 20, '', 0, '', 'Death Herald', 1, 'outfits', '', 'Death Herald Outfit', 1429877572, '', 0),
(60, 4, 15, '', 0, '', 'Ranger', 1, 'outfits', '', 'Ranger Outfit', 1429877652, '', 0),
(64, 5, 20, '', 22421, '', '', 1, 'items', '', 'Umbral Master Crossbow', 1429878710, '', 0),
(65, 5, 20, '', 22400, '', '', 1, 'items', '', 'Umbral Masterblade', 1429878866, '', 0),
(66, 5, 20, '', 22415, '', '', 1, 'items', '', 'Umbral Master Hammer', 1429878941, '', 0),
(67, 5, 20, '', 22418, '', '', 1, 'items', '', 'Umbral Master Bow', 1429879017, '', 0),
(68, 5, 20, '', 22424, '', '', 1, 'items', '', 'Umbral Master Spellbook', 1429879103, '', 0),
(69, 5, 20, '', 22403, '', '', 1, 'items', '', 'Umbral Master Slayer', 1429879158, '', 0),
(70, 5, 20, '', 22406, '', '', 1, 'items', '', 'Umbral Master Axe', 1429879225, '', 0),
(71, 4, 50, '', 0, '', 'Mage', 1, 'outfits', '', 'Mage Outfit', 1430279056, '', 0),
(72, 4, 25, '', 0, '', 'Assassin', 1, 'outfits', '', 'Assassin Outfit', 1430279151, '', 0),
(73, 4, 20, '', 0, '', 'Insectoid', 1, 'outfits', '', 'Insectoid Outfit', 1430279172, '', 0),
(74, 5, 10, '', 2160, '', '', 100, 'items', '100 Cristal Coins. 1kk', 'Crystal Coins', 1430313846, '', 0),
(75, 3, 25, '', 0, '24', '', 1, 'mounts', '', 'Shadow Draptor', 1430429837, '', 0),
(76, 5, 15, '', 6132, '', '', 1, 'items', 'You see pair of soft boots that is brand-new. It weighs 8.00 oz.', 'Pair of Soft Boots', 1430586851, '', 0),
(77, 5, 10, '', 21725, '', '', 1, 'items', 'You see a furious frock (Arm:12, magic level +2, protection fire +5%). It can only be wielded properly by sorcerers and druids of level 130 or higher.', 'Furious Frock', 1430587054, '', 0),
(78, 5, 10, '', 8890, '', '', 1, 'items', 'You see a robe of the underworld (Arm:12, protection holy -12%, death +12%). It can only be wielded properly by sorcerers of level 100 or higher.', 'Robe of the Underworld', 1430587140, '', 0),
(79, 5, 10, '', 12643, '', '', 1, 'items', 'You see a royal scale robe (Arm:12, magic level +2, protection fire +5%). It can only be wielded properly by sorcerers and druids of level 100 or higher.', 'Royal Scale Robe', 1430587193, '', 0),
(80, 5, 12, '', 15407, '', '', 1, 'items', 'You see a depth lorica (Arm:16, distance fighting +3, protection death +5%). It can only be wielded properly by paladins of level 150 or higher.', 'Depth Lorica', 1430587285, '', 0),
(81, 5, 10, '', 8888, '', '', 1, 'items', 'You see a master archers armor (Arm:15, distance fighting +3). It can only be wielded properly by paladins of level 100 or higher.', 'Master Archers Armor', 1430587388, '', 0),
(82, 5, 10, '', 15406, '', '', 1, 'items', 'You see an ornate chestplate (Arm:16, shielding +3, protection physical +8%). It can only be wielded properly by knights of level 200 or higher.', 'Ornate Chestplate', 1430587442, '', 0),
(83, 5, 10, '', 12642, '', '', 1, 'items', 'You see a royal draken mail (Arm:16, shielding +3, protection physical +5%). It can only be wielded properly by knights of level 100 or higher.', 'Royal Draken Mail', 1430587501, '', 0),
(84, 5, 10, '', 8882, '', '', 1, 'items', 'You see an earthborn titan armor (Arm:15, axe fighting +2, protection earth +5%, fire -5%). It can only be wielded properly by knights of level 100 or higher.', 'Earthborn Titan Armor', 1430587563, '', 0),
(85, 5, 10, '', 8883, '', '', 1, 'items', 'You see a windborn colossus armor (Arm:15, club fighting +2, protection energy +5%, earth -5%). It can only be wielded properly by knights of level 100 or higher.', 'Windborn Colossus Armor', 1430587612, '', 0),
(86, 5, 10, '', 8881, '', '', 1, 'items', 'You see a fireborn giant armor (Arm:15, sword fighting +2, protection fire +5%, ice -5%). It can only be wielded properly by knights of level 100 or higher.', 'Fireborn Giant Armor', 1430587657, '', 0),
(87, 5, 8, '', 2494, '', '', 1, 'items', 'You see a demon armor (Arm:16).', 'Demon Armor ', 1430587701, '', 0),
(88, 5, 10, '', 15412, '', '', 1, 'items', 'You see an ornate legs (Arm:8, protection physical +5%). It can only be wielded properly by knights of level 185 or higher.', 'Ornate Legs', 1430587784, '', 0),
(89, 5, 12, '', 15409, '', '', 1, 'items', 'You see a depth ocrea (Arm:8, protection manadrain +15%). It can only be wielded properly by sorcerers and druids.', 'Depth Ocrea', 1430587846, '', 0),
(90, 5, 12, '', 15408, '', '', 1, 'items', 'You see a depth galea (Arm:8, protection drown +100%). It can only be wielded properly by players of level 150 or higher.', 'Depth Galea', 1430587958, '', 0),
(91, 5, 20, '', 2471, '', '', 1, 'items', 'You see a golden helmet (Arm:12).', 'Golden Helmet', 1430588057, '', 0),
(92, 5, 10, '', 12645, '', '', 1, 'items', 'You see an elite draken helmet (Arm:9, distance fighting +1, protection death +3%). It can only be wielded properly by paladins of level 100 or higher.', 'Elite Draken Helmet', 1430588107, '', 0),
(93, 5, 10, '', 18390, '', '', 1, 'items', 'You see a wand of defiance (magic level +1). It can only be wielded properly by sorcerers of level 65 or higher.', 'Wand of Defiance', 1430588185, '', 0),
(94, 5, 10, '', 18409, '', '', 1, 'items', 'You see a wand of everblazing (magic level +1). It can only be wielded properly by sorcerers of level 65 or higher.', 'Wand of Everblazing', 1430588228, '', 0),
(95, 5, 10, '', 18412, '', '', 1, 'items', 'You see a glacial rod (magic level +1). It can only be wielded properly by druids of level 65 or higher.', 'Glacial Rod', 1430588296, '', 0),
(96, 5, 20, '', 22412, '', '', 1, 'items', 'umbral master mace (Atk:52, Def:30 +3, club fighting +1). It can only be wielded properly by knights of level 250 or higher.', 'Umbral Master Mace', 1430588383, '', 0),
(97, 5, 10, '', 18452, '', '', 1, 'items', 'You see a mycological mace (Atk:50, Def:31 +3, club fighting +1). It can only be wielded properly by players of level 120 or higher.', 'Mycological Mace', 1430588527, '', 0),
(98, 5, 10, '', 8928, '', '', 1, 'items', 'You see an obsidian truncheon (Atk:50, Def:30 +2). It can only be wielded properly by players of level 100 or higher.', 'Obsidian Truncheon', 1430588585, '', 0),
(99, 5, 10, '', 8924, '', '', 1, 'items', 'You see a hellforged axe (Atk:51, Def:28 +2). It can only be wielded properly by players of level 110 or higher.', 'Hellforged Axe', 1430588698, '', 0),
(100, 5, 10, '', 8930, '', '', 1, 'items', 'You see an emerald sword (Atk:49, Def:33 +3). It can only be wielded properly by players of level 100 or higher.', 'Emerald Sword', 1430588749, '', 0),
(101, 5, 12, '', 16111, '', '', 1, 'items', 'You see a thorn spitter (Range:6, Atk+9, Hit%+1). It can only be wielded properly by paladins of level 150 or higher.', 'Thorn Spitter', 1430589171, '', 0),
(102, 5, 10, '', 8851, '', '', 1, 'items', 'You see a royal crossbow (Range:6, Atk+5, Hit%+3). It can only be wielded properly by paladins of level 130 or higher.', 'Royal Crossbow', 1430589219, '', 0),
(103, 5, 10, '', 8854, '', '', 1, 'items', 'You see a warsinger bow (Range:7, Atk+3, Hit%+5). It can only be wielded properly by paladins of level 80 or higher.', 'Warsinger Bow', 1430589313, '', 0),
(104, 5, 15, '', 2495, '', '', 1, 'items', 'You see a warsinger bow (Range:7, Atk+3, Hit%+5). It can only be wielded properly by paladins of level 80 or higher.', 'Demon Legs', 1430589364, '', 0),
(105, 5, 25, '', 2646, '', '', 1, 'items', 'You see golden boots (Arm:4).', 'Golden Boots', 1430589418, '', 0),
(106, 5, 10, '', 16112, '', '', 1, 'items', 'You see a spellbook of ancient arcana (Def:19, magic level +4, protection death +5%). It can only be wielded properly by sorcerers and druids of level 150 or higher.', 'spellbook of ancient arcana', 1430589457, '', 0),
(107, 5, 12, '', 12644, '', '', 1, 'items', 'You see a shield of corruption (Def:36, sword fighting +3). It can only be wielded properly by knights of level 80 or higher.', 'Shield of Corruption', 1430589590, '', 0),
(108, 5, 10, '', 8918, '', '', 1, 'items', 'You see a spellbook of dark mysteries (Def:16, magic level +3). It can only be wielded properly by sorcerers and druids of level 80 or higher. It weighs 28.50 oz. It shows your spells and can also shield against attack when worn.', 'Spellbook of Dark Mysteries', 1430589647, '', 0),
(109, 5, 10, '', 6391, '', '', 1, 'items', 'You see a nightmare shield (Def:37). It weighs 32.00 oz. It was crafted by the ancient order of the nightmare knights.', 'Nightmare Shield', 1430589683, '', 0),
(110, 5, 10, '', 6433, '', '', 1, 'items', 'You see a necromancer shield (Def:37). It weighs 32.00 oz. It is enchanted with unholy, necromantic powers.', 'Necromancer Shield', 1430589732, '', 0),
(111, 5, 5, '', 2798, '', '', 10, 'items', '', '10x Blood Herb', 1430589821, '', 0),
(112, 5, 20, '', 22409, '', '', 1, 'items', 'You see a umbral master chopper (Atk:54, Def:34, axe fighting +3). It can only be wielded properly by knights of level 250 or higher. It weighs 110.00 oz.', 'Umbral Master Chopper', 1430706015, '', 0),
(113, 4, 25, '', 0, '', 'Summoner', 1, 'outfits', '', 'Summoner Outfit', 1430762396, '', 0),
(114, 5, 10, '', 12544, '', '', 1, 'items', 'You see a max stamina. It weighs 3.00 oz. Deixa sua stamina full com apenas um click.', 'Max Stamina', 1430965461, '', 0),
(116, 5, 10, '', 9778, '', '', 1, 'items', 'You see a yalahari mask (Arm:5, magic level +2). It can only be wielded properly by sorcerers and druids of level 80 or higher. It weighs 35.00 oz.', 'Yalahari Mask', 1433139590, '', 0),
(117, 5, 15, '', 2504, '', '', 1, 'items', 'You see dwarven legs (Arm:7, protection physical +3%).', 'Dwaren Legs', 1433139714, '', 0),
(118, 5, 45, '', 2358, '', '', 1, 'items', 'You see a max boots (faster regeneration and speed) (speed +20). It weighs 2.50 oz.', 'Max Boots', 1433452999, '', 0),
(120, 4, 15, '', 0, '', 'Knight', 1, 'outfits', '', 'Knight Outfit', 1434045065, '', 0),
(121, 4, 15, '', 0, '', 'Pirate', 1, 'outfits', '', 'Pirate Outfit', 1434045089, '', 0),
(122, 4, 15, '', 0, '', 'Oriental', 1, 'outfits', '', 'Oriental Outfit', 1434045106, '', 0),
(123, 4, 15, '', 0, '', 'Shaman', 1, 'outfits', '', 'Shaman Outfit', 1434045120, '', 0),
(124, 4, 20, '', 0, '', 'Glooth Engineer', 1, 'outfits', '', 'Glooth Engineer Outfit', 1434045138, '', 0),
(125, 4, 15, '', 0, '', 'Druid', 1, 'outfits', '', 'Druid Outfit', 1435857029, '', 0),
(126, 4, 15, '', 0, '', 'Deepling', 1, 'outfits', '', 'Deepling Outfit', 1435857116, '', 0),
(127, 4, 10, '', 0, '', 'Hunter', 1, 'outfits', '', 'Hunter Outfit', 1435857150, '', 0),
(129, 4, 25, '', 0, '', 'Elementalist', 1, 'outfits', '', 'Elementalist Outfit', 1435857205, '', 0),
(130, 4, 10, '', 0, '', 'Warmaster', 1, 'outfits', '', 'Warmaster Outfit', 1435857218, '', 0),
(131, 4, 10, '', 0, '', 'Wayfarer', 1, 'outfits', '', 'Wayfarer Outfit', 1435857227, '', 0),
(132, 4, 15, '', 0, '', 'Nightmare', 1, 'outfits', '', 'Nightmare Outfit', 1435857267, '', 0),
(133, 4, 15, '', 0, '', 'Brotherhood', 1, 'outfits', '', 'Brotherhood Outfit', 1435857281, '', 0),
(134, 4, 10, '', 0, '', 'Jester', 1, 'outfits', '', 'Jester Outfit', 1435857314, '', 0),
(135, 4, 15, '', 0, '', 'Crystal Warlord', 1, 'outfits', '', 'Crystal Warlord Outfit', 1435857330, '', 0),
(136, 4, 15, '', 0, '', 'Cave Explorer', 1, 'outfits', '', 'Cave Explorer Outfit', 1435857504, '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_payment`
--

CREATE TABLE `z_shop_payment` (
  `id` int(11) NOT NULL,
  `ref` varchar(10) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_category_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `price` varchar(50) NOT NULL,
  `points` int(11) UNSIGNED NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'waiting',
  `date` int(11) NOT NULL,
  `gift` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_shop_payment`
--

INSERT INTO `z_shop_payment` (`id`, `ref`, `account_name`, `service_id`, `service_category_id`, `payment_method_id`, `price`, `points`, `status`, `date`, `gift`) VALUES
(1580, '', '451994', 118, 5, 1, '', 45, 'received', 1467954803, 0),
(1581, '', '451994', 118, 5, 1, '', 45, 'received', 1479226543, 0),
(1582, '', '451994', 93, 5, 1, '', 10, 'received', 1479244664, 0),
(1583, '', '451994', 74, 5, 1, '', 10, 'received', 1480198560, 0),
(1584, '', '451994', 117, 5, 1, '', 15, 'received', 1480199128, 0),
(1585, '', '451994', 8, 2, 1, '', 25, 'received', 1480199242, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`),
  ADD KEY `account_id_2` (`account_id`);

--
-- Indexes for table `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_player_index` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`,`world_id`);

--
-- Indexes for table `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `ownerid` (`ownerid`);

--
-- Indexes for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warid` (`warid`);

--
-- Indexes for table `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Indexes for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild1` (`guild1`),
  ADD KEY `guild2` (`guild2`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `house_lists`
--
ALTER TABLE `house_lists`
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `live_casts`
--
ALTER TABLE `live_casts`
  ADD UNIQUE KEY `player_id_2` (`player_id`);

--
-- Indexes for table `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Indexes for table `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `newsticker`
--
ALTER TABLE `newsticker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vocation` (`vocation`);

--
-- Indexes for table `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `killed_by` (`killed_by`),
  ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Indexes for table `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_items`
--
ALTER TABLE `player_items`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Indexes for table `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_spells`
--
ALTER TABLE `player_spells`
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_storage`
--
ALTER TABLE `player_storage`
  ADD PRIMARY KEY (`player_id`,`key`);

--
-- Indexes for table `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Indexes for table `store_history`
--
ALTER TABLE `store_history`
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `z_forum`
--
ALTER TABLE `z_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Indexes for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_category`
--
ALTER TABLE `z_shop_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_donates`
--
ALTER TABLE `z_shop_donates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_donate_confirm`
--
ALTER TABLE `z_shop_donate_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_payment`
--
ALTER TABLE `z_shop_payment`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4386;
--
-- AUTO_INCREMENT for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsticker`
--
ALTER TABLE `newsticker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5775;
--
-- AUTO_INCREMENT for table `z_forum`
--
ALTER TABLE `z_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;
--
-- AUTO_INCREMENT for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `z_polls`
--
ALTER TABLE `z_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `z_shop_category`
--
ALTER TABLE `z_shop_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `z_shop_donates`
--
ALTER TABLE `z_shop_donates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;
--
-- AUTO_INCREMENT for table `z_shop_donate_confirm`
--
ALTER TABLE `z_shop_donate_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT for table `z_shop_payment`
--
ALTER TABLE `z_shop_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1586;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `live_casts`
--
ALTER TABLE `live_casts`
  ADD CONSTRAINT `live_casts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD CONSTRAINT `player_rewards_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `store_history`
--
ALTER TABLE `store_history`
  ADD CONSTRAINT `store_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
