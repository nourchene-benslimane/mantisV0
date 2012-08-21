-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 21, 2012 at 10:32 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bugtracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bugnote_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bugnote_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bugnote_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `note_type` int(11) DEFAULT '0',
  `note_attr` varchar(250) DEFAULT '',
  `time_tracking` int(10) unsigned NOT NULL DEFAULT '0',
  `last_modified` int(10) unsigned NOT NULL DEFAULT '1',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug` (`bug_id`),
  KEY `idx_last_mod` (`last_modified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bugnote_text_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bugnote_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_file_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob NOT NULL,
  `date_added` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bug_file_bug_id` (`bug_id`),
  KEY `idx_diskfile` (`diskfile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_history_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_history_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(64) NOT NULL,
  `old_value` varchar(255) NOT NULL,
  `new_value` varchar(255) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `date_modified` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_history_bug_id` (`bug_id`),
  KEY `idx_history_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_monitor_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_monitor_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_relationship_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_relationship_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `destination_bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `relationship_type` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_relationship_source` (`source_bug_id`),
  KEY `idx_relationship_destination` (`destination_bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_revision_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_revision_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL,
  `bugnote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_rev_type` (`type`),
  KEY `idx_bug_rev_id_time` (`bug_id`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `handler_id` int(10) unsigned NOT NULL DEFAULT '0',
  `duplicate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` smallint(6) NOT NULL DEFAULT '30',
  `severity` smallint(6) NOT NULL DEFAULT '50',
  `reproducibility` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `resolution` smallint(6) NOT NULL DEFAULT '10',
  `projection` smallint(6) NOT NULL DEFAULT '10',
  `eta` smallint(6) NOT NULL DEFAULT '10',
  `bug_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '',
  `fixed_in_version` varchar(64) NOT NULL DEFAULT '',
  `build` varchar(32) NOT NULL DEFAULT '',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `summary` varchar(128) NOT NULL DEFAULT '',
  `sponsorship_total` int(11) NOT NULL DEFAULT '0',
  `sticky` tinyint(4) NOT NULL DEFAULT '0',
  `target_version` varchar(64) NOT NULL DEFAULT '',
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  `due_date` int(10) unsigned NOT NULL DEFAULT '1',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_sponsorship_total` (`sponsorship_total`),
  KEY `idx_bug_fixed_in_version` (`fixed_in_version`),
  KEY `idx_bug_status` (`status`),
  KEY `idx_project` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_tag_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_tag_table` (
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_attached` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`bug_id`,`tag_id`),
  KEY `idx_bug_tag_tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_text_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `steps_to_reproduce` longtext NOT NULL,
  `additional_information` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_category_table`
--

CREATE TABLE IF NOT EXISTS `mantis_category_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_project_name` (`project_id`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mantis_category_table`
--

INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES
(1, 0, 0, 'General', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_config_table`
--

CREATE TABLE IF NOT EXISTS `mantis_config_table` (
  `config_id` varchar(64) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `access_reqd` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '90',
  `value` longtext NOT NULL,
  PRIMARY KEY (`config_id`,`project_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mantis_config_table`
--

INSERT INTO `mantis_config_table` (`config_id`, `project_id`, `user_id`, `access_reqd`, `type`, `value`) VALUES
('database_version', 0, 0, 90, 1, '183');

-- --------------------------------------------------------

--
-- Table structure for table `mantis_custom_field_project_table`
--

CREATE TABLE IF NOT EXISTS `mantis_custom_field_project_table` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sequence` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mantis_custom_field_project_table`
--

INSERT INTO `mantis_custom_field_project_table` (`field_id`, `project_id`, `sequence`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_custom_field_string_table`
--

CREATE TABLE IF NOT EXISTS `mantis_custom_field_string_table` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`bug_id`),
  KEY `idx_custom_field_bug` (`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_custom_field_table`
--

CREATE TABLE IF NOT EXISTS `mantis_custom_field_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `possible_values` text NOT NULL,
  `default_value` varchar(255) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `access_level_r` smallint(6) NOT NULL DEFAULT '0',
  `access_level_rw` smallint(6) NOT NULL DEFAULT '0',
  `length_min` int(11) NOT NULL DEFAULT '0',
  `length_max` int(11) NOT NULL DEFAULT '0',
  `require_report` tinyint(4) NOT NULL DEFAULT '0',
  `require_update` tinyint(4) NOT NULL DEFAULT '0',
  `display_report` tinyint(4) NOT NULL DEFAULT '0',
  `display_update` tinyint(4) NOT NULL DEFAULT '1',
  `require_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `display_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `display_closed` tinyint(4) NOT NULL DEFAULT '0',
  `require_closed` tinyint(4) NOT NULL DEFAULT '0',
  `filter_by` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_custom_field_name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mantis_custom_field_table`
--

INSERT INTO `mantis_custom_field_table` (`id`, `name`, `type`, `possible_values`, `default_value`, `valid_regexp`, `access_level_r`, `access_level_rw`, `length_min`, `length_max`, `require_report`, `require_update`, `display_report`, `display_update`, `require_resolved`, `display_resolved`, `display_closed`, `require_closed`, `filter_by`) VALUES
(1, 'Phase', 3, 'Analyse détaillée | Test D''intégration | Recette utilisateurs | Préproduction | Production', 'Analyse détaillée', '', 10, 10, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_email_table`
--

CREATE TABLE IF NOT EXISTS `mantis_email_table` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL DEFAULT '',
  `subject` varchar(250) NOT NULL DEFAULT '',
  `metadata` longtext NOT NULL,
  `body` longtext NOT NULL,
  `submitted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_filters_table`
--

CREATE TABLE IF NOT EXISTS `mantis_filters_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `is_public` tinyint(4) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `filter_string` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_news_table`
--

CREATE TABLE IF NOT EXISTS `mantis_news_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `announcement` tinyint(4) NOT NULL DEFAULT '0',
  `headline` varchar(64) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `last_modified` int(10) unsigned NOT NULL DEFAULT '1',
  `date_posted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_plugin_table`
--

CREATE TABLE IF NOT EXISTS `mantis_plugin_table` (
  `basename` varchar(40) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `priority` int(10) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`basename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mantis_plugin_table`
--

INSERT INTO `mantis_plugin_table` (`basename`, `enabled`, `protected`, `priority`) VALUES
('MantisCoreFormatting', 1, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_project_file_table`
--

CREATE TABLE IF NOT EXISTS `mantis_project_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob NOT NULL,
  `date_added` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_project_hierarchy_table`
--

CREATE TABLE IF NOT EXISTS `mantis_project_hierarchy_table` (
  `child_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `inherit_parent` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `idx_project_hierarchy_child_id` (`child_id`),
  KEY `idx_project_hierarchy_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mantis_project_hierarchy_table`
--

INSERT INTO `mantis_project_hierarchy_table` (`child_id`, `parent_id`, `inherit_parent`) VALUES
(2, 1, 1),
(15, 1, 1),
(3, 1, 1),
(13, 1, 1),
(14, 1, 1),
(12, 1, 1),
(11, 1, 1),
(10, 1, 1),
(9, 1, 1),
(8, 1, 1),
(7, 1, 1),
(6, 1, 1),
(5, 1, 1),
(4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_project_table`
--

CREATE TABLE IF NOT EXISTS `mantis_project_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `access_min` smallint(6) NOT NULL DEFAULT '10',
  `file_path` varchar(250) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `inherit_global` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_name` (`name`),
  KEY `idx_project_view` (`view_state`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mantis_project_table`
--

INSERT INTO `mantis_project_table` (`id`, `name`, `status`, `enabled`, `view_state`, `access_min`, `file_path`, `description`, `category_id`, `inherit_global`) VALUES
(1, 'BTL Afek integeation  du SI cible', 10, 1, 10, 10, '', '', 1, 1),
(2, 'AGE- agence', 10, 1, 10, 10, '', '', 1, 1),
(3, 'CPT- comptabilité', 10, 1, 10, 10, '', '', 1, 1),
(4, 'SDM- trésorerie / salle de marché', 10, 1, 10, 10, '', '', 1, 1),
(5, 'REF- référentiel client / compte', 10, 1, 10, 10, '', '', 1, 1),
(6, 'PRF- performance', 10, 1, 10, 10, '', '', 1, 1),
(7, 'MIG- migration des données', 10, 1, 10, 10, '', '', 1, 1),
(8, 'MDP- moyen de paiement', 10, 1, 10, 10, '', '', 1, 1),
(9, 'ITF- interface', 10, 1, 10, 10, '', '', 1, 1),
(10, 'INT- international', 10, 1, 10, 10, '', '', 1, 1),
(11, 'INF- infrastructure', 10, 1, 10, 10, '', '', 1, 1),
(12, 'GGR- garanties risque', 10, 1, 10, 10, '', '', 1, 1),
(13, 'EDT- architecture éditique', 10, 1, 10, 10, '', '', 1, 1),
(14, 'ENG- engagements', 10, 1, 10, 10, '', '', 1, 1),
(15, 'CDC- conduite du changement', 10, 1, 10, 10, '', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_project_user_list_table`
--

CREATE TABLE IF NOT EXISTS `mantis_project_user_list_table` (
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `access_level` smallint(6) NOT NULL DEFAULT '10',
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `idx_project_user` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mantis_project_user_list_table`
--

INSERT INTO `mantis_project_user_list_table` (`project_id`, `user_id`, `access_level`) VALUES
(3, 2, 25),
(3, 3, 25),
(3, 4, 25),
(3, 5, 25),
(14, 6, 25),
(14, 7, 25),
(14, 8, 25),
(14, 9, 25),
(14, 10, 25),
(14, 11, 25),
(14, 12, 25),
(12, 13, 25),
(12, 14, 25),
(12, 15, 25),
(12, 16, 25),
(15, 17, 25),
(15, 18, 25),
(15, 19, 25),
(4, 20, 25),
(2, 21, 25),
(8, 21, 25),
(5, 21, 25),
(2, 22, 25),
(8, 22, 25),
(5, 22, 25),
(5, 23, 25),
(2, 24, 25),
(8, 25, 25),
(8, 26, 25),
(10, 27, 25),
(10, 28, 25),
(8, 29, 25),
(1, 30, 25),
(1, 31, 70),
(1, 33, 70),
(1, 35, 70),
(1, 36, 70);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_project_version_table`
--

CREATE TABLE IF NOT EXISTS `mantis_project_version_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `version` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `released` tinyint(4) NOT NULL DEFAULT '1',
  `obsolete` tinyint(4) NOT NULL DEFAULT '0',
  `date_order` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_version` (`project_id`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_sponsorship_table`
--

CREATE TABLE IF NOT EXISTS `mantis_sponsorship_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(128) NOT NULL DEFAULT '',
  `paid` tinyint(4) NOT NULL DEFAULT '0',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_sponsorship_bug_id` (`bug_id`),
  KEY `idx_sponsorship_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_tag_table`
--

CREATE TABLE IF NOT EXISTS `mantis_tag_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `date_created` int(10) unsigned NOT NULL DEFAULT '1',
  `date_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`name`),
  KEY `idx_tag_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_tokens_table`
--

CREATE TABLE IF NOT EXISTS `mantis_tokens_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '1',
  `expiry` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_typeowner` (`type`,`owner`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mantis_tokens_table`
--

INSERT INTO `mantis_tokens_table` (`id`, `owner`, `type`, `value`, `timestamp`, `expiry`) VALUES
(15, 1, 4, '1', 1345537167, 1345537467);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_user_pref_table`
--

CREATE TABLE IF NOT EXISTS `mantis_user_pref_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_profile` int(10) unsigned NOT NULL DEFAULT '0',
  `default_project` int(10) unsigned NOT NULL DEFAULT '0',
  `refresh_delay` int(11) NOT NULL DEFAULT '0',
  `redirect_delay` int(11) NOT NULL DEFAULT '0',
  `bugnote_order` varchar(4) NOT NULL DEFAULT 'ASC',
  `email_on_new` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_assigned` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_feedback` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_closed` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_reopened` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_bugnote` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_status` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_priority` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_priority_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_status_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_bugnote_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_reopened_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_closed_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_resolved_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_feedback_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_assigned_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_new_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_bugnote_limit` smallint(6) NOT NULL DEFAULT '0',
  `language` varchar(32) NOT NULL DEFAULT 'english',
  `timezone` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_user_print_pref_table`
--

CREATE TABLE IF NOT EXISTS `mantis_user_print_pref_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `print_pref` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_user_profile_table`
--

CREATE TABLE IF NOT EXISTS `mantis_user_profile_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mantis_user_table`
--

CREATE TABLE IF NOT EXISTS `mantis_user_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `realname` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `access_level` smallint(6) NOT NULL DEFAULT '10',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `lost_password_request_count` smallint(6) NOT NULL DEFAULT '0',
  `failed_login_count` smallint(6) NOT NULL DEFAULT '0',
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '1',
  `date_created` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_cookie_string` (`cookie_string`),
  UNIQUE KEY `idx_user_username` (`username`),
  KEY `idx_enable` (`enabled`),
  KEY `idx_access` (`access_level`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `mantis_user_table`
--

INSERT INTO `mantis_user_table` (`id`, `username`, `realname`, `email`, `password`, `enabled`, `protected`, `access_level`, `login_count`, `lost_password_request_count`, `failed_login_count`, `cookie_string`, `last_visit`, `date_created`) VALUES
(1, 'administrator', '', 'nourchene.benslimane@targa-consult.com', '21232f297a57a5a743894a0e4a801fc3', 1, 0, 90, 18, 0, 0, '8ba9fbe6ca674ae163c78a810995ee6a4534f651ee41d3a0505ca2deca8faca1', 1345537179, 1345153420),
(2, 'Haythem NAJJAR', 'Haythem NAJJAR', 'haythem.najjar@gnet.tn', '72becee5ec9a298c307c74d40a9caebb', 1, 0, 70, 0, 0, 0, 'e4768e6944478b6ef890bf6a3b7d38192192677c5ee1c78d8f886bbec6f7f844', 1345162457, 1345162457),
(3, 'Fadoua BARKIA', 'Fadoua BARKIA', 'fadoua.barkia@gnet.tn', 'ed55bd81520b25e5cc284ef265734438', 1, 0, 25, 0, 0, 0, '8e64bc5df59a36c3451a3e927e9474d162d24032dc1968e4706a92792197194c', 1345162579, 1345162579),
(4, 'Badr MHIRI', 'Badr MHIRI', 'badr.mhiri@gnet.tn', '51405af1f9ffd8b5b784582775cd3b0d', 1, 0, 25, 0, 0, 0, '8dd03584e4bfa2059d6e4e704ca90915e8aa0f3f9361da0939c1c6c3d35c6602', 1345162622, 1345162622),
(5, 'Salah RIAHI', 'Salah RIAHI', 'salah.riahi@targa-consult.com', 'f6daaa3c16c2bf177f1f715d9cc4d505', 1, 0, 25, 0, 0, 0, 'f542d82e93f41d4921b2f4867471e593316a68eefc9640f27322fcb5d20304dc', 1345162732, 1345162732),
(6, 'Fadhel CHAMSI', 'Fadhel CHAMSI', 'fadhel.chamsi@gnet.tn', '3fd5109346b02db5efc8e31002f8bc34', 1, 0, 70, 0, 0, 0, 'e01a1883ecd633db2a10fe499542b3ac18788861109c39d83d8d4315e0146ec6', 1345162846, 1345162846),
(7, 'Mouna ZARAA', 'Mouna ZARAA', 'mouna.zaraa@gnet.tn', '73c13ca907bb5fd36af797bcdd225158', 1, 0, 25, 0, 0, 0, '53734088e649c4a7568a4db6e6edb25e25c128e9281d80abcbdd86fc84b13b5b', 1345162939, 1345162939),
(8, 'Souheila BOUAZIZ', 'Souheila BOUAZIZ', 'souhaila.bouaziz@gnet.tn', '40d18b37d506ae6ddc848ab459a3ee4b', 1, 0, 25, 0, 0, 0, 'a84228f1450a8d22ce6d9324a51528713579f4f93bc1e5769b873895da713668', 1345162982, 1345162982),
(9, 'Fethi TRABELSI', 'Fethi TRABELSI', 'fethi.trabelsi@gnet.tn', 'e2b8e017b71e53c91462bb2ae87511eb', 1, 0, 25, 0, 0, 0, '646d852bb1ae8da450d56174ec7dc43764388807b84eaad162a88d80155f4b3d', 1345163014, 1345163014),
(10, 'Mahjoub BANNENI', 'Mahjoub BANNENI', 'mahjoub.benneni@gnet.tn', 'adcb5e94fc8bdc1d9cb6096bec5329ab', 1, 0, 25, 0, 0, 0, 'cdd91705bc6046f9153f309919335baa894c9a5f031b34089939f042c37fcf65', 1345163111, 1345163111),
(11, 'Elyes LAHOUAR', 'Elyes LAHOUAR', 'ilyes.lahouar@gnet.tn', '8f0bc72b12d0a0b0179438778bc80dd7', 1, 0, 25, 0, 0, 0, 'b2b1e721a67b7e23202e2423696b5ea700f1fc7c9d78a3a15bc688118159956e', 1345163145, 1345163145),
(12, 'Anis FOURATI', 'Anis FOURATI', 'anis.fourati@targa-consult.com ', '2762be000d7f84bd47c934bbd0cf36e6', 1, 0, 25, 0, 0, 0, '4e14263cd633750df82336c0ac57c978cdde0c1d07bf212c5fc8d26648c75a6d', 1345163273, 1345163273),
(13, 'Sadok GANNOUNI', 'Sadok GANNOUNI', 'sadok.gannouni@gnet.tn', '16ab3ce7398108a6982dc1becc6dd7b6', 1, 0, 70, 0, 0, 0, 'cd8d2bf5fbbb88bdbcad1b9bc8a3633a44e90cffcdd4036638cb1c5f54b81c60', 1345163368, 1345163368),
(14, 'Mohamed BRAIKI', 'Mohamed BRAIKI', 'mohamed.braiki@gnet.tn', '51ed24ffeb5354972c105604483352f3', 1, 0, 25, 0, 0, 0, 'b17e31a0d09d87fa86940df1cfd2c3729e866c8b8ff5cb4115da6f812ec6b347', 1345163399, 1345163399),
(15, 'Hatem MILI', 'Hatem MILI', 'hatem.mili@gnet.tn', '144041ff3674fb2cf9290dcd6230e70d', 1, 0, 25, 0, 0, 0, 'c291e8bdbb3a5554f3de5d5987858e07e9511aec0e063cda456163b1dea23faa', 1345163428, 1345163428),
(16, 'Ali GTARI', 'Ali GTARI', 'ali.gtari@gnet.tn', 'fb4c4125617f8143ca60a1235eb539d5', 1, 0, 25, 0, 0, 0, 'fab9e52f840c390c1d318c86c75b7035d55be3f5991b8735631153ed8004ab74', 1345163472, 1345163472),
(17, 'Helmi ZELFANI', 'Helmi ZELFANI', 'hilmi.zelfani@gnet.tn', 'ee96e626dbf4f8462ba7170830e7dfbd', 1, 0, 70, 0, 0, 0, '293840d36bb9b38283ae6a742c678f49115511d4ae3da1eae199126329b523ce', 1345163611, 1345163611),
(18, 'Sami JELLOUL', 'Sami JELLOUL', 'sami.jelloul@gent.tn', 'ccd85b73366746f550490bdfa4198c9b', 1, 0, 25, 0, 0, 0, 'c24c1f23063042318abbb886f64aea6286833ef8e822ae3ba1d42b494c072fc7', 1345163674, 1345163674),
(19, 'Radhouane BACCOUCHE', 'Radhouane BACCOUCHE', 'radouane.baccouche@gnet.tn', 'fe67aa0b3f3b5dbc0376960a5f421e8a', 1, 0, 25, 0, 0, 0, 'b22a7cd3f4e11105bc27a367109bc23826a76809c3d7a061b678471793f623ae', 1345163698, 1345163698),
(20, 'Imen DIMASSI', 'Imen DIMASSI', 'imen.dimassi@gnet.tn', 'ba7d78897582e66e120e380a161add89', 1, 0, 70, 0, 0, 0, '30af807acdb06716d66f842c84fdb4f8a09b66f6f9bc526e3df1cbad30b538ac', 1345163796, 1345163796),
(21, 'Abdessalem AMAR', 'Abdessalem AMAR', 'abdessalem.amar@gnet.tn', 'da065bdbe63bcb6530badd1fdc755a15', 1, 0, 70, 0, 0, 0, 'f468926c4cc143fe34a2895294424f83b48ec9ef384c7c099f1bf8ad3f01d292', 1345163866, 1345163866),
(22, 'Ridha BEN AMOR', 'Ridha BEN AMOR', 'ridha.benamor@gnet.tn', '77b3b17bee558c206e027ad69d8f21ef', 1, 0, 25, 0, 0, 0, '95dce54714f3151953ad4d7490982ac8604da6c45e2344a397be2ccfe036b25a', 1345163935, 1345163935),
(23, 'Sirine KOUKI', 'Sirine KOUKI', 'sirine.kouki@gnet.tn', 'dba466b8600be416b238039489aefcba', 1, 0, 25, 0, 0, 0, '36297ceb4c3dd31d177b8f11ae3a14d52dccfd43d9ff1ff709f0c4638ffbf13d', 1345164004, 1345164004),
(24, 'Ali OUERFELLI', 'Ali OUERFELLI', 'ali.ouerfelli@gnet.tn', '934e8cdcdce98e6e3a0369903ee97ace', 1, 0, 25, 0, 0, 0, '46ff920a2102ed1ac707d277e737ae28330f412ee44673a471ec8628960dc02d', 1345164065, 1345164065),
(25, 'Wadii TRIGUI', 'Wadii TRIGUI', 'wadii.trigui@gnet.tn', 'e9d1b8c0b138a05464e73ec6314f7622', 1, 0, 25, 0, 0, 0, 'c2a6a291de702313ff052fa8a094c3a022ee38dd6e5666fd115ad6163049f60e', 1345164159, 1345164159),
(26, 'Anouar ABDELAZIZ', 'Anouar ABDELAZIZ', 'anouar.abdelaziz@gnet.tn', '4de1be13127478a13e230789c3602133', 1, 0, 25, 0, 0, 0, '262b8bc32a8de47006f3b7bfd69d9ab278bca59335eb4ee18e77017527dcc657', 1345165515, 1345165515),
(27, 'Adel BARNOUS', 'Adel BARNOUS', 'adel.barnous@gnet.tn', '6fd9c4af11896ce2b37be12d52fc6ead', 1, 0, 70, 0, 0, 0, '88bae8b68330743c490a63ca88cd32fcc09712da74a617340ed2645012fc1589', 1345165601, 1345165601),
(28, 'Hamdi ASSESS', 'Hamdi ASSESS', 'hamdi.assess@gnet.tn', '31fa4925ad23586f14c8d848b7a66ba5', 1, 0, 25, 0, 0, 0, '85f8028f2b9a3c75102764c01a18a988d6890e8332a5ee44a685da74c7ffb487', 1345165647, 1345165647),
(29, 'Ahlam HARIR', 'Ahlam HARIR', 'aharir@temenos.com', '1c64f2cab3db3591b9c68f9c36a77184', 1, 0, 70, 0, 0, 0, 'c92b743572e0c0dee48738ae61fc1e4e9b83e3bac9ce324695eb91402a555ed2', 1345165861, 1345165861),
(30, 'Slim DHOUIB', 'Slim DHOUIB', 'slim.dhouib@gnet.tn', 'f14b2e05e14cfdc263d8df292a64a07f', 1, 0, 70, 0, 0, 0, 'ea786e51b135c8cbd0ebecd319afd4c780e321d0a82f1d96cfebbc2fc0340510', 1345166002, 1345166002),
(31, 'Monia GUELMAMI', 'Monia GUELMAMI', 'monia.guelmami@gnet.tn', '3caba4761600329aae8427f71a8eaeb0', 1, 0, 70, 0, 0, 0, '38df7df6fbb76e9865d21ff9c2963cb5aca912209a9826625ac7cf519d87813f', 1345166113, 1345166113),
(32, 'Imed KOUKI', 'Imed KOUKI', 'Imed.kouki@gnet.tn', '830996c55bbc82797d118b67dbae1eb8', 1, 0, 90, 0, 0, 0, 'ffbcdc2f08ec0214e05f9abbcce789c1fcf978be951f1ef63ef6118d0c316404', 1345166156, 1345166156),
(33, 'Khalid BENESRIGHE', 'Khalid BENESRIGHE', 'kbenesrighe@temenos.com', 'c0c2fd50434fea314317463160030248', 1, 0, 70, 0, 0, 0, '15e8e863b287bfeb887085f7e4ac54c0d8f43d273ba115ef32614fe27a98209a', 1345166405, 1345166405),
(34, 'Youssef KOUN', 'Youssef KOUN', 'ykoun@temenos.com', '95b85dab519a9b067ad015f2886c9644', 1, 0, 90, 0, 0, 0, '6b96a776ea1c9e8ee700e2af530bd03308c9d4c582a8f583e923307f3eb48607', 1345166522, 1345166522),
(35, 'Adlen KAMOUN', 'Adlen KAMOUN', 'adlen.kamoun@targa-consult.com', '5a42c78043cb8e390de4c2cccd2b01ff', 1, 0, 70, 0, 0, 0, 'c4b03bfefa9fd450ae087e5b256b5bbe6853345a94b32f444c2bca2748cac84d', 1345166596, 1345166596),
(36, 'Fadhel MAINA', 'Fadhel MAINA', 'fadhel.maina@targa-consult.com', 'a468bd3485fd00edc040d22850a3eece', 1, 0, 70, 0, 0, 0, '34b5157e2d04aede8b287151f3e8b0aecbad8bac5ea3afb52e1dbba49a29110f', 1345166655, 1345166655);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
