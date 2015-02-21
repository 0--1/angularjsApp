-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2015 at 01:48 AM
-- Server version: 5.6.17-debug-log
-- PHP Version: 5.6.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `emda`
--
CREATE DATABASE IF NOT EXISTS `emda` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `emda`;

-- --------------------------------------------------------

--
-- Table structure for table `access_type`
--

DROP TABLE IF EXISTS `access_type`;
CREATE TABLE IF NOT EXISTS `access_type` (
`access_type_id` tinyint(3) unsigned NOT NULL,
  `title` varchar(16) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_info`
--

DROP TABLE IF EXISTS `auth_info`;
CREATE TABLE IF NOT EXISTS `auth_info` (
`user_id` int(10) unsigned NOT NULL,
  `hash` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bed_type`
--

DROP TABLE IF EXISTS `bed_type`;
CREATE TABLE IF NOT EXISTS `bed_type` (
`bed_type_id` tinyint(3) unsigned NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `casualty_type`
--

DROP TABLE IF EXISTS `casualty_type`;
CREATE TABLE IF NOT EXISTS `casualty_type` (
`casualty_type_id` tinyint(3) unsigned NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `emergency`
--

DROP TABLE IF EXISTS `emergency`;
CREATE TABLE IF NOT EXISTS `emergency` (
`emergency_id` int(10) unsigned NOT NULL,
  `user_id` mediumint(10) unsigned NOT NULL,
  `title` varchar(48) COLLATE utf8_unicode_ci NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_incident`
--

DROP TABLE IF EXISTS `emergency_incident`;
CREATE TABLE IF NOT EXISTS `emergency_incident` (
  `emergency_id` int(10) unsigned NOT NULL,
  `incident_id` smallint(5) unsigned NOT NULL,
  `diameter` smallint(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
CREATE TABLE IF NOT EXISTS `facility` (
`facility_id` int(10) unsigned NOT NULL,
  `name` varchar(48) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `facility_bed`
--

DROP TABLE IF EXISTS `facility_bed`;
CREATE TABLE IF NOT EXISTS `facility_bed` (
  `facility_id` int(10) unsigned NOT NULL,
  `bed_type_id` tinyint(3) unsigned NOT NULL,
  `capacity` smallint(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facility_vehicle`
--

DROP TABLE IF EXISTS `facility_vehicle`;
CREATE TABLE IF NOT EXISTS `facility_vehicle` (
  `facility_id` int(10) unsigned NOT NULL,
  `vehicle_type_id` tinyint(3) unsigned NOT NULL,
  `size` smallint(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `function`
--

DROP TABLE IF EXISTS `function`;
CREATE TABLE IF NOT EXISTS `function` (
`function_id` tinyint(3) unsigned NOT NULL,
  `function_type_id` tinyint(3) unsigned NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `function_parameter`
--

DROP TABLE IF EXISTS `function_parameter`;
CREATE TABLE IF NOT EXISTS `function_parameter` (
  `function_id` tinyint(3) unsigned NOT NULL,
  `parameter_id` smallint(5) unsigned NOT NULL,
  `value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `function_type`
--

DROP TABLE IF EXISTS `function_type`;
CREATE TABLE IF NOT EXISTS `function_type` (
`function_type_id` tinyint(3) unsigned NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `function_type`
--

INSERT INTO `function_type` (`function_type_id`, `title`) VALUES
(1, 'service'),
(2, 'risk'),
(3, 'survival'),
(4, 'reward');

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

DROP TABLE IF EXISTS `incident`;
CREATE TABLE IF NOT EXISTS `incident` (
`incident_id` int(10) unsigned NOT NULL,
  `title` varchar(48) COLLATE utf8_unicode_ci NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `casualties` smallint(5) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

DROP TABLE IF EXISTS `parameter`;
CREATE TABLE IF NOT EXISTS `parameter` (
`parameter_id` smallint(5) unsigned NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scenario`
--

DROP TABLE IF EXISTS `scenario`;
CREATE TABLE IF NOT EXISTS `scenario` (
`scenario_id` int(10) unsigned NOT NULL,
  `emergency_id` int(10) unsigned NOT NULL,
  `scenario_type_id` tinyint(3) unsigned NOT NULL,
  `base_scenario_id` int(10) unsigned NOT NULL,
  `user_id` mediumint(10) unsigned NOT NULL,
  `title` varchar(48) COLLATE utf8_unicode_ci NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scenario_casualty`
--

DROP TABLE IF EXISTS `scenario_casualty`;
CREATE TABLE IF NOT EXISTS `scenario_casualty` (
  `scenario_id` int(10) unsigned NOT NULL,
  `casualty_type_id` tinyint(3) unsigned NOT NULL,
  `risk_function_id` tinyint(3) unsigned NOT NULL,
  `service_function_id` tinyint(3) unsigned NOT NULL,
  `casualty_size` smallint(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scenario_facility`
--

DROP TABLE IF EXISTS `scenario_facility`;
CREATE TABLE IF NOT EXISTS `scenario_facility` (
  `scenario_id` int(10) unsigned NOT NULL,
  `facility_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scenario_facility_bed`
--

DROP TABLE IF EXISTS `scenario_facility_bed`;
CREATE TABLE IF NOT EXISTS `scenario_facility_bed` (
  `scenario_id` int(10) unsigned NOT NULL,
  `facility_id` int(10) unsigned NOT NULL,
  `bed_type_id` tinyint(3) unsigned NOT NULL,
  `capacity` smallint(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scenario_facility_vehicle`
--

DROP TABLE IF EXISTS `scenario_facility_vehicle`;
CREATE TABLE IF NOT EXISTS `scenario_facility_vehicle` (
  `scenario_id` int(10) unsigned NOT NULL,
  `facility_id` int(10) unsigned NOT NULL,
  `vehicle_type_id` tinyint(3) unsigned NOT NULL,
  `size` tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scenario_type`
--

DROP TABLE IF EXISTS `scenario_type`;
CREATE TABLE IF NOT EXISTS `scenario_type` (
`scenario_type_id` tinyint(3) unsigned NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `scenario_type`
--

INSERT INTO `scenario_type` (`scenario_type_id`, `title`) VALUES
(1, 'Simulation'),
(2, 'Optimization');

-- --------------------------------------------------------

--
-- Table structure for table `scenario_user_access`
--

DROP TABLE IF EXISTS `scenario_user_access`;
CREATE TABLE IF NOT EXISTS `scenario_user_access` (
  `scenario_id` int(10) unsigned NOT NULL,
  `access_owner_id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `access_type_id` tinyint(3) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
`user_id` mediumint(8) unsigned NOT NULL,
  `user_type_id` tinyint(3) unsigned NOT NULL,
  `firstname` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `middlename` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `delete_timestamp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE IF NOT EXISTS `user_type` (
`user_type_id` tinyint(3) unsigned NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type`
--

DROP TABLE IF EXISTS `vehicle_type`;
CREATE TABLE IF NOT EXISTS `vehicle_type` (
`vehicle_type_id` tinyint(3) unsigned NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `capacity` tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_type`
--
ALTER TABLE `access_type`
 ADD PRIMARY KEY (`access_type_id`);

--
-- Indexes for table `auth_info`
--
ALTER TABLE `auth_info`
 ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `bed_type`
--
ALTER TABLE `bed_type`
 ADD PRIMARY KEY (`bed_type_id`);

--
-- Indexes for table `casualty_type`
--
ALTER TABLE `casualty_type`
 ADD PRIMARY KEY (`casualty_type_id`);

--
-- Indexes for table `emergency`
--
ALTER TABLE `emergency`
 ADD PRIMARY KEY (`emergency_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `emergency_incident`
--
ALTER TABLE `emergency_incident`
 ADD PRIMARY KEY (`emergency_id`,`incident_id`), ADD KEY `scenario_id` (`emergency_id`), ADD KEY `disaster_id` (`incident_id`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
 ADD PRIMARY KEY (`facility_id`);

--
-- Indexes for table `facility_bed`
--
ALTER TABLE `facility_bed`
 ADD PRIMARY KEY (`facility_id`,`bed_type_id`), ADD KEY `bed_type_id` (`bed_type_id`);

--
-- Indexes for table `facility_vehicle`
--
ALTER TABLE `facility_vehicle`
 ADD PRIMARY KEY (`facility_id`,`vehicle_type_id`), ADD KEY `vehicle_type_id` (`vehicle_type_id`);

--
-- Indexes for table `function`
--
ALTER TABLE `function`
 ADD PRIMARY KEY (`function_id`), ADD KEY `function_type_id` (`function_type_id`);

--
-- Indexes for table `function_parameter`
--
ALTER TABLE `function_parameter`
 ADD PRIMARY KEY (`function_id`,`parameter_id`), ADD KEY `parameter_id` (`parameter_id`);

--
-- Indexes for table `function_type`
--
ALTER TABLE `function_type`
 ADD PRIMARY KEY (`function_type_id`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
 ADD PRIMARY KEY (`incident_id`);

--
-- Indexes for table `parameter`
--
ALTER TABLE `parameter`
 ADD PRIMARY KEY (`parameter_id`);

--
-- Indexes for table `scenario`
--
ALTER TABLE `scenario`
 ADD PRIMARY KEY (`scenario_id`), ADD KEY `project_id` (`emergency_id`), ADD KEY `scenario_type_id` (`scenario_type_id`), ADD KEY `base_scenario_id` (`base_scenario_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `scenario_casualty`
--
ALTER TABLE `scenario_casualty`
 ADD PRIMARY KEY (`scenario_id`,`casualty_type_id`), ADD KEY `casualty_type_id` (`casualty_type_id`), ADD KEY `risk_function_id` (`risk_function_id`), ADD KEY `service_function_id` (`service_function_id`);

--
-- Indexes for table `scenario_facility`
--
ALTER TABLE `scenario_facility`
 ADD PRIMARY KEY (`scenario_id`,`facility_id`), ADD KEY `facility_id` (`facility_id`);

--
-- Indexes for table `scenario_facility_bed`
--
ALTER TABLE `scenario_facility_bed`
 ADD PRIMARY KEY (`scenario_id`,`facility_id`,`bed_type_id`), ADD KEY `facility_id` (`facility_id`), ADD KEY `bed_type_id` (`bed_type_id`);

--
-- Indexes for table `scenario_facility_vehicle`
--
ALTER TABLE `scenario_facility_vehicle`
 ADD PRIMARY KEY (`scenario_id`,`facility_id`,`vehicle_type_id`), ADD KEY `facility_id` (`facility_id`), ADD KEY `vehicle_type_id` (`vehicle_type_id`);

--
-- Indexes for table `scenario_type`
--
ALTER TABLE `scenario_type`
 ADD PRIMARY KEY (`scenario_type_id`);

--
-- Indexes for table `scenario_user_access`
--
ALTER TABLE `scenario_user_access`
 ADD PRIMARY KEY (`scenario_id`,`user_id`), ADD KEY `scenario_id` (`scenario_id`), ADD KEY `owner_id` (`access_owner_id`), ADD KEY `user_id` (`user_id`), ADD KEY `access_type_id` (`access_type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`), ADD KEY `user_type_id` (`user_type_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
 ADD PRIMARY KEY (`user_type_id`);

--
-- Indexes for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
 ADD PRIMARY KEY (`vehicle_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_type`
--
ALTER TABLE `access_type`
MODIFY `access_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_info`
--
ALTER TABLE `auth_info`
MODIFY `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bed_type`
--
ALTER TABLE `bed_type`
MODIFY `bed_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `casualty_type`
--
ALTER TABLE `casualty_type`
MODIFY `casualty_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emergency`
--
ALTER TABLE `emergency`
MODIFY `emergency_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
MODIFY `facility_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `function`
--
ALTER TABLE `function`
MODIFY `function_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `function_type`
--
ALTER TABLE `function_type`
MODIFY `function_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
MODIFY `incident_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `parameter`
--
ALTER TABLE `parameter`
MODIFY `parameter_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `scenario`
--
ALTER TABLE `scenario`
MODIFY `scenario_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `scenario_type`
--
ALTER TABLE `scenario_type`
MODIFY `scenario_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
MODIFY `user_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
MODIFY `vehicle_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `emergency`
--
ALTER TABLE `emergency`
ADD CONSTRAINT `emergency_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `facility_bed`
--
ALTER TABLE `facility_bed`
ADD CONSTRAINT `facility_bed_ibfk_1` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`),
ADD CONSTRAINT `facility_bed_ibfk_2` FOREIGN KEY (`bed_type_id`) REFERENCES `bed_type` (`bed_type_id`);

--
-- Constraints for table `facility_vehicle`
--
ALTER TABLE `facility_vehicle`
ADD CONSTRAINT `facility_vehicle_ibfk_1` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`),
ADD CONSTRAINT `facility_vehicle_ibfk_2` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_type` (`vehicle_type_id`);

--
-- Constraints for table `function`
--
ALTER TABLE `function`
ADD CONSTRAINT `function_ibfk_1` FOREIGN KEY (`function_type_id`) REFERENCES `function_type` (`function_type_id`);

--
-- Constraints for table `function_parameter`
--
ALTER TABLE `function_parameter`
ADD CONSTRAINT `function_parameter_ibfk_1` FOREIGN KEY (`function_id`) REFERENCES `function` (`function_id`),
ADD CONSTRAINT `function_parameter_ibfk_2` FOREIGN KEY (`parameter_id`) REFERENCES `parameter` (`parameter_id`);

--
-- Constraints for table `scenario`
--
ALTER TABLE `scenario`
ADD CONSTRAINT `scenario_ibfk_2` FOREIGN KEY (`scenario_type_id`) REFERENCES `scenario_type` (`scenario_type_id`),
ADD CONSTRAINT `scenario_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
ADD CONSTRAINT `scenario_ibfk_4` FOREIGN KEY (`base_scenario_id`) REFERENCES `scenario` (`scenario_id`),
ADD CONSTRAINT `scenario_ibfk_5` FOREIGN KEY (`emergency_id`) REFERENCES `emergency` (`emergency_id`);

--
-- Constraints for table `scenario_casualty`
--
ALTER TABLE `scenario_casualty`
ADD CONSTRAINT `scenario_casualty_ibfk_1` FOREIGN KEY (`scenario_id`) REFERENCES `scenario` (`scenario_id`),
ADD CONSTRAINT `scenario_casualty_ibfk_2` FOREIGN KEY (`casualty_type_id`) REFERENCES `casualty_type` (`casualty_type_id`),
ADD CONSTRAINT `scenario_casualty_ibfk_3` FOREIGN KEY (`risk_function_id`) REFERENCES `function` (`function_id`),
ADD CONSTRAINT `scenario_casualty_ibfk_4` FOREIGN KEY (`service_function_id`) REFERENCES `function` (`function_id`);

--
-- Constraints for table `scenario_facility`
--
ALTER TABLE `scenario_facility`
ADD CONSTRAINT `scenario_facility_ibfk_1` FOREIGN KEY (`scenario_id`) REFERENCES `scenario` (`scenario_id`),
ADD CONSTRAINT `scenario_facility_ibfk_2` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`);

--
-- Constraints for table `scenario_facility_bed`
--
ALTER TABLE `scenario_facility_bed`
ADD CONSTRAINT `scenario_facility_bed_ibfk_1` FOREIGN KEY (`scenario_id`) REFERENCES `scenario` (`scenario_id`),
ADD CONSTRAINT `scenario_facility_bed_ibfk_2` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`),
ADD CONSTRAINT `scenario_facility_bed_ibfk_3` FOREIGN KEY (`bed_type_id`) REFERENCES `bed_type` (`bed_type_id`);

--
-- Constraints for table `scenario_facility_vehicle`
--
ALTER TABLE `scenario_facility_vehicle`
ADD CONSTRAINT `scenario_facility_vehicle_ibfk_1` FOREIGN KEY (`scenario_id`) REFERENCES `scenario` (`scenario_id`),
ADD CONSTRAINT `scenario_facility_vehicle_ibfk_2` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`),
ADD CONSTRAINT `scenario_facility_vehicle_ibfk_3` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_type` (`vehicle_type_id`);

--
-- Constraints for table `scenario_user_access`
--
ALTER TABLE `scenario_user_access`
ADD CONSTRAINT `scenario_user_access_ibfk_1` FOREIGN KEY (`scenario_id`) REFERENCES `scenario` (`scenario_id`),
ADD CONSTRAINT `scenario_user_access_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
ADD CONSTRAINT `scenario_user_access_ibfk_4` FOREIGN KEY (`access_type_id`) REFERENCES `access_type` (`access_type_id`),
ADD CONSTRAINT `scenario_user_access_ibfk_5` FOREIGN KEY (`access_owner_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`user_type_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
