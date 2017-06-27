-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 22-Jan-2017 às 00:33
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ot`
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
(1, '1', '2f165e4cf99cd9298fas65d6s5da7924cfc9c', NULL, 1, 0, 0, 0, '318801@gmail.com', 1429670486, '', '', 0, '', '', '', '', 3, '', 0, 0, 0, 2147483647, 0, 'unknown', 0, 0, ''),
(4383, '451994', '3f90224a065128ad8d4dace6dba1989f29e07775', NULL, 1, 363, 0, 1480344432, 'victorfasanoraful@gmail.com', 1467780487, 'XU7I-SO3A-NODA-SELO', 'victorfasanoraful@gmail.com', 1469064339, 'Victor Fasano', 'Sao paulo', '4/5/1994', 'male', 3, '', 0, 5455005, 0, 2130706433, 1470611481, 'unknown', 0, 625, '4MP9UVk5sQ6Ay3EI7gdSa2xq8YJHjv'),
(4384, '101010', '3f90224a065128ad8d4dace6dba1989f29e07775', NULL, 1, 0, 0, 0, '33@gmail.com', 1468805192, '', '', 0, '', '', '', '', 0, '', 0, 0, 0, 2130706433, 0, 'unknown', 0, 0, ''),
(4385, '333333333', '7068120e66aea0c64b1fde1b3be7b88e62e53be2', NULL, 1, 0, 0, 0, 'victorfasanor2aful@gmail.com', 1468807640, '', '', 0, '', '', '', '', 0, '', 0, 0, 0, 2130706433, 0, 'unknown', 0, 0, '');

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

--
-- Extraindo dados da tabela `account_bans`
--

INSERT INTO `account_bans` (`account_id`, `reason`, `banned_at`, `expires_at`, `banned_by`) VALUES
(1, '1, 1', 1480347712, 2344261312, 5771),
(4384, '1, 1', 1480347738, 2344261338, 5771);

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

--
-- Extraindo dados da tabela `account_ban_history`
--

INSERT INTO `account_ban_history` (`id`, `account_id`, `reason`, `banned_at`, `expired_at`, `banned_by`) VALUES
(1, 4383, '2', 1470605092, 1470605092, 1);

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
-- Extraindo dados da tabela `guilds`
--

INSERT INTO `guilds` (`id`, `name`, `ownerid`, `creationdata`, `motd`, `description`, `guild_logo`, `create_ip`, `balance`) VALUES
(1, 'Whata Hell', 5771, 1468294077, '', 'New guild. Leader must edit this text :)', 0x313436383239343037373b646174613a696d6167652f6769663b6261736536342c52306c474f446c68514142414150634141414141414167414142414141426741414267494143454941436b494144454941446b4941446b514145495141456f514146495141466f5141466f5941474d5941474e6a556d73594147744b4147746a556d746a576d7472576e4d5941484e5341484e72576e4e72593373594148736841487453414874614148747a5933747a6134516841495261414952614349526a4349523761345237633477684149786a434979456334794565355168414a5272434a534d65357770414a7872434a787a434a794d6535794d684a7955684b5570414b567a434b5637434b5755684b57636a4b3070414b3137434b32636a4c5570414c5637434c5745434c576c6c4c57746c4c3078414c3245434c324d434c32316e4d5978414d614d434d6155434d613170633478414d3655434d363972645978414e5935414e6155434e6163434e3435414f2f657876666e7a762f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f79483542414541414645414c414141414142414145414141416a2b414b4e4543514367494d454143424d614e4b6a774945494143523832584168526f734f43416a4e7144494345434a4b50486b4d7943596c6b704567695445717137496753704d6d534b564e2b424e6b785a514162476a554347466d795a63715750556b7947597079364a4f6951486c366a456c7a4a70475141456a677a446c514a644759517a753672506b7861396169566e334b354e6e314b63696f55334d475942717a3645696c4d4a64794e5174544a6b69554872757964456b4567496359564b75614841757a37744359543868364e566f54373958446b4c4d69415a4342525741414d346d7566496c334a52496749427759534a444167516f634d7a305870706c334a6d584c5644482f334e454368496b574c585a6b3172736a41634944466d3672734a424167414146514754694a644969416f4d45437851343244446a4b5a4d416c533854595641516749414443784c2b474341674945414243302b424741415141516752484245576a485a674167675142774149754e39517675427842632b743939414f324d4757303034426e4a424545556b306d4951525267685278417348454151414345793051414242423051414167675062426a41427570565a454551437a375949494d4e42684641424156656c6d45424434366741476b5858464144697755454145514c454946515630307041516c52424431495749515251627777516764516a6c4145677744733846706761303357517848486d61444341777751304a304354437751514163416243415a5351514738494345456c37775541476c4d6141414141636b55634e615638615730674d4a4f464744624a6b5a344141537667584234414836465561454351416b30454f456778365558463432695a4445416739636c78315657524952774b5146624a425a4241596755594143437844775942482b4b775267416c356d4b696745445155416f4943504368786746334d4154426b41536a474343744a7a547651416746764450724157456230426b494f4542546841684a67354a424845726970305a4d4777736e34567741704a4d4c4341545a3865364251414c7851686751456a4b624242437a36715249514b4144516f78486f4353446a6f41756c35564a715653346c57684c4974466175755376516d4b59414451484145774b78443968564145454c514b63514a41594241524849647565646a41685a6b43454151526e53386c4d493639545153615577574641472b4c6d7631314b364b356864416456725a2b3441434f46514a41413146524b41415633327136785954424851675951414f455042415479795a42536b4151675278595770504c53633041437641796c4856536266383030635232316f65616e6c5a39786b4133795a51524137444f70575a714276594b55542b724343666c65354776336f5573616237476f42443132574e31304d5043536278674146306d51567441515759454d41494146545847684e6c5a3751543155516346664544443536416d585650425a3244455865654c4951414d365132457043354267324143707131314c6c416d4b56476b374d4739494379413141443052486c526777365177494b4643464333552f4e414941424b7942634a56746d73657a35556b546c746344304147697137613553427a427474522b6258775141755431515541634d756944415a46687078766e666e6e2f464642494f4641426a414161676752416b4e49494148454149644a7542416774676743496b4a41453779747175647249736c78786d4d766754534a597959784956794b6f41524141425175416e4241433449416c30497739434b4865434771424d4344333458674677344b4e6c59636f3948646c64464862696b5365774a43582b45597459567a62676e32414a5956525453704b454d4559445a786c514e797049414c3161307a4d4d476b676e5a6c6e5453495a56706377416759467a4330434f4c694343437a43675277525267417263746f41494f4941425a45456345725448753851677759655355785549456843426c6a7846616b5777674147494978344437476f466739494c536741514d5a37465a535a303347486b674149457930305264514b676752454b344b69524145423477364b4c42794f47756a6836366f716549354a71356a6944414a53736136344c35534d4c4d49496b464541334c4e6c5a4168696746636241524965396f31705969436739397a776c5830666b79646c6f756138574c4d55434d78795763694a6a52537a31386965646d654d4469476566566a5a6f4c5639425351474d554951446d43416c725153434145716d484c64395249636349556c5a56424b304670514843506a2b61684142756b615763526242415267436b676f59634143364b4b55316b6253682f727a794759486d4b674c42536f493073556d45635a5a724178343067625069346a596677695368636c466b46596b49417535674c5a6c5753596b2f665a4f3537786e76626b785a436a7a74395a4b7274415249426d68426a7867774e73574d4d77674530413842447443567439776c6d7a506c7a503532383858623351636942466a5665416f4349664f6f7a4334586c4d785051496f7059626154595242355147356134494146744c4668367a4f41653743796c634b38425a3559736335536c374b554135545651674567674145535567535552693473512f6f4956307543522b57416a69576f4d6b494f436c436244637a4c41766e71774c6d415971386668724f61666a724b543635694c7a2b2b6255474d564934424c6d444c47627a454b596954584662676d553348644d576a7167332b514c735530456367427141494c68714c5a4f7a326c74346d315732516f577732475743416d49586b63556b514151502b537357694a6957536f5451713934424c555341594d56787a66427262376c6931754a416c4e5343747246587531726152464f424e4c786957644a4b77676752383569324f79654e6a33706e4248536f46767463384446412b64744c79584f78314f78694b38654a344e77344b747236395178316656684936716a48426b4e6f53514e6a736c4a53754f63596b46393569666366576b614e4d6c79316e49347130466d5345463152517158495662336354366a764e37455a794b456e4d6f774a67684353556349337a50416c58636b7866565049756342656379335342306a2b674c74646c2b6c506b56316547344b2b6f3248647553773451453643724b7562596a2b46306d366732544b547039704a37527430746a724d595a674f7a465373363347482b5948736231386a6f5679357370534a6b65676d3641464441417a49496a4833745674546473466b7839514f4c522b66363353315367415133304c4d6b6434766b42644f454a35716c4d354b7a367061455461432b47564843546e436f573077742b596339477a4347645473586d3041414134685774454347554a436c787457796b705a6e46532f59747134555a414b6f7a724f71567932445545355356424b70794c496b45784749474b544459706b6a4243695141524c6f65746572766b477847554942436d416741396a4f64743275732b774b5a44766233566b495169685167512b6b494e4851316f675366434344456e6a6732786e7741416c5177494a363235734645694f33422b68393733716a674154762f72594853694144483651374d45505167517a364c514e30553855484151413443525474677873732f4e3479304d48424e773774496477414d4277507563674c566533774b45426835496f4f434141414f773d3d, 0, 0);

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

--
-- Extraindo dados da tabela `guild_membership`
--

INSERT INTO `guild_membership` (`player_id`, `guild_id`, `rank_id`, `nick`) VALUES
(5771, 1, 1, '');

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

--
-- Extraindo dados da tabela `guild_ranks`
--

INSERT INTO `guild_ranks` (`id`, `guild_id`, `name`, `level`) VALUES
(1, 1, 'the Leader', 3),
(2, 1, 'a Vice-Leader', 2),
(3, 1, 'a Member', 1);

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

--
-- Extraindo dados da tabela `newsticker`
--

INSERT INTO `newsticker` (`id`, `date`, `text`, `icon`) VALUES
(35, 1467953991, 'Testando versÃ£o 1.0.1 do website.', 'newsicon_cipsoft');

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
(6, 'Knight Sample', 1, 1, 8, 4, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 1, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, '', '', 0, 0, 0, '', 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5771, 'GM Ignouth', 5, 4383, 1, 0, 150, 150, 0, 69, 76, 78, 58, 266, 0, 0, 5, 5, 0, 100, 1, 1040, 1025, 7, 0x010000000202ffffffff03d00700001a001b00000000fe, 420, 1, 1480348091, 16777343, 1, 0, 0, 1480348091, 63, 2592, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, '', '', 2130706433, 1467780489, 0, '', 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5772, 'Teste', 1, 4384, 1, 0, 150, 150, 0, 69, 76, 78, 58, 128, 0, 0, 5, 5, 0, 100, 6, 0, 0, 0, '', 420, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, '', '', 2130706433, 1468805193, 0, '', 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5773, 'Hah', 1, 4385, 1, 0, 150, 150, 0, 69, 76, 78, 58, 128, 0, 0, 5, 5, 0, 100, 6, 0, 0, 0, '', 420, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, '', '', 2130706433, 1468807640, 0, '', 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5774, 'Crumble Numble', 1, 4383, 1, 0, 150, 150, 0, 69, 76, 78, 58, 128, 0, 0, 5, 5, 0, 100, 6, 0, 0, 0, '', 420, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, '', '', 2130706433, 1470607359, 0, '', 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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

--
-- Extraindo dados da tabela `player_deaths`
--

INSERT INTO `player_deaths` (`player_id`, `time`, `level`, `killed_by`, `is_player`, `mostdamage_by`, `mostdamage_is_player`, `unjustified`, `mostdamage_unjustified`) VALUES
(5772, 356363535, 1, '5771', 1, '', 1, 0, 0);

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

--
-- Extraindo dados da tabela `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(5771, 2, 101, 2173, 1, 0x160100),
(5771, 3, 102, 1987, 1, ''),
(5771, 4, 103, 2651, 1, ''),
(5771, 5, 104, 2530, 1, ''),
(5771, 6, 105, 2398, 1, ''),
(5771, 11, 106, 26052, 1, ''),
(5771, 102, 107, 2160, 1, 0x0f01),
(5771, 102, 108, 2160, 98, 0x0f62),
(5771, 102, 109, 2120, 1, ''),
(5771, 106, 110, 2643, 1, ''),
(5771, 106, 111, 2358, 1, '');

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

--
-- Extraindo dados da tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(5771, 50722, 1480348101),
(5771, 299551, 1480347144),
(5771, 10001001, 8781827),
(5771, 10002001, 2),
(5771, 10002004, 256),
(5771, 10002011, 23);

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

--
-- Extraindo dados da tabela `store_history`
--

INSERT INTO `store_history` (`account_id`, `mode`, `description`, `coin_amount`, `time`) VALUES
(4383, 0, 'Snow Pelt', -5, 1480346906),
(4383, 0, 'Racing Bird', -5, 1480346925),
(4383, 0, 'Warrior Addon', -5, 1480346967);

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

--
-- Extraindo dados da tabela `z_forum`
--

INSERT INTO `z_forum` (`id`, `first_post`, `last_post`, `section`, `replies`, `views`, `author_aid`, `author_guid`, `post_text`, `post_topic`, `post_smile`, `post_date`, `last_edit_aid`, `edit_date`, `post_ip`, `icon_id`, `news_icon`) VALUES
(210, 210, 1437315338, 1, 0, 34, 2, 7, '<p>[letter]A[/letter]gora &eacute; pra valer!</p>\r\n<p>Entraremos em um novo tempo, nosso servidor esta muito mais maduro e pronto pra trabalhar e trazer o melhor cont&uacute;do open tibia pra voc&ecirc;, ent&atilde;o n&atilde;o perca tempo e venha fazer parte dessa familia. Temos muitas novidades, que at&eacute; o dia da reinaugura&ccedil;&atilde;o iremos postar pra voc&ecirc;s, &eacute; s&oacute; o come&ccedil;o de um novo tempo, ent&atilde;o n&atilde;o perca tempo, crie j&aacute; sua conta e aguarde pelo recome&ccedil;o!</p>\r\n<h3>Informa&ccedil;&otilde;es de conex&atilde;o</h3>\r\n<ul>\r\n<li><strong>Vers&atilde;o:</strong>&nbsp;10.76 - 10.79</li>\r\n<li><strong>IP:</strong>&nbsp;tibiamax.com</li>\r\n<li><strong>Porta:</strong>&nbsp;7171</li>\r\n<li><strong>Exp:</strong>&nbsp;200x (estagiadas, veja os stages em&nbsp;<a href="?subtopic=serverinfo">Server Info</a>)</li>\r\n</ul>\r\n<h3>Novidades</h3>\r\n<p>Uma das principais novidades, que voc&ecirc; j&aacute; deve ter percebido &eacute; nosso site, esta completamente limpo, simples e objetivo, com o layout global e acompanhado de algumas novas funcionalidades.</p>\r\n<p><img style="float: right;" title="New Shop" src="layouts/monteiro/images/shop/info.jpg" alt="" width="250" height="203" /></p>\r\n<p>Nosso sistema de doa&ccedil;&otilde;es e de compra de itens e servi&ccedil;os foi totalmente refeito e melhorado, agora ele se encontra na&nbsp;<a href="?subtopic=accountmanagement&amp;action=manage">p&aacute;gina principal de sua conta</a>. L&aacute; tamb&eacute;m voc&ecirc; vai encontrar hist&oacute;rico de doa&ccedil;&otilde;es, status de suas doa&ccedil;&otilde;es, hist&oacute;rico da compra de itens e servi&ccedil;os no shopping, produtos a serem ativados. Bastante coisa n&eacute; ? Foi por isso que criamos um super tutorial, lhe mostrando como usar todas essas novidades, com praticidade e facilidade, basta voc&ecirc; entrar em&nbsp;<a href="?subtopic=serverinfo">Server Info</a>, logo abaixo das informa&ccedil;&otilde;es do servidor voc&ecirc; ver&aacute; um box falando desses sistemas novos, e os links para os tutoriais.</p>\r\n<p>Esperamos que voc&ecirc; goste e que possa com mais facilidade ajudar o servidor a crescer, e assim possamos trazer muito mais conte&uacute;do para voc&ecirc;s.</p>\r\n<h3>Informa&ccedil;&otilde;es do servidor</h3>\r\n<ul>\r\n<li>Task system, com bosses e ranks</li>\r\n<li>Gray Beach City completa 100% (incluindo Subsolo)</li>\r\n<li>Monstros 100%</li>\r\n<li>Todas montarias</li>\r\n<li>Taming system funcionando 100%</li>\r\n<li>Wrath of Emperor Quest</li>\r\n<li>War System 100%</li>\r\n<li>Roshamull Completa100% (incluindo subsolo)</li>\r\n<li>Oramond Full</li>\r\n<li>Sem bug de pegar items com o browse field</li>\r\n<li>Blood Herb Quest 100%</li>\r\n<li>Chayenne Realm Quest</li>\r\n<li>Pythius The Rotten Quest 100%</li>\r\n<li>Lions Rock quest</li>\r\n<li>Taming Walker e Noble Lion</li>\r\n<li>Reward System</li>\r\n<li>Loyalty System</li>\r\n<li>Exclusive Events</li>\r\n<li>Exclusive Quests</li>\r\n<li>Roshamuul Prison</li>\r\n<li>War Anti-Entrosa</li>\r\n<li>Engine TFS 1.2, muito mais est&aacute;vel</li>\r\n<li>Marriage System</li>\r\n</ul>\r\n<p>Entre essas e outras mais que voc&ecirc; ver&aacute; quando iniciar sua jornada aqui, esperamos que o servidor possa o satisfazer, por&eacute;m o que n&atilde;o satisfazer esperamos tamb&eacute;m que voc&ecirc; possa nos falar, para que assim possamos encontrar uma maneira de deixa-los feliz.</p>\r\n<p>Equipe Tibiamax<br />Buscando sua divers&atilde;o!</p>', 'ReinauguraÃ§Ã£o Marcada !', 0, 1437315338, 2, 1437333096, '200.181.194.117', 0, 'newsicon_community_big'),
(211, 211, 1470611481, 1, 0, 2, 4383, 5774, '<p>Todos da comunidade dando um salve a todos os desenvolvedores desse game.</p>', 'Say Hey Ha!!', 0, 1470611481, 0, 0, '127.0.0.1', 0, 'newsicon_community_big');

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

--
-- Extraindo dados da tabela `z_ots_comunication`
--

INSERT INTO `z_ots_comunication` (`id`, `name`, `type`, `action`, `param1`, `param2`, `param3`, `param4`, `param5`, `param6`, `param7`, `delete_it`) VALUES
(2, 'Crumble Numble', 'login', 'give_item', '2358', '1', '', '', 'item', 'Max Boots', '118', 1),
(3, 'Crumble Numble', 'login', 'give_item', '18390', '1', '', '', 'item', 'Wand of Defiance', '93', 1),
(4, 'Crumble Numble', 'login', 'give_item', '2504', '1', '', '', 'item', 'Dwaren Legs', '117', 1);

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
