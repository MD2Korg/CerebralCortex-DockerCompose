-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 15, 2017 at 12:00 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `cerebralcortex`
--
CREATE DATABASE IF NOT EXISTS `cerebralcortex` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cerebralcortex`;

-- --------------------------------------------------------

--
-- Table structure for table `kafka_offsets`
--

DROP TABLE IF EXISTS `kafka_offsets`;
CREATE TABLE `kafka_offsets` (
  `id` int(5) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `topic_partition` varchar(15) NOT NULL,
  `offset_start` varchar(20) NOT NULL,
  `offset_until` varchar(20) NOT NULL,
  `offset_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stream`
--

DROP TABLE IF EXISTS `stream`;
CREATE TABLE `stream` (
  `identifier` varchar(36) NOT NULL,
  `owner` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `data_descriptor` json NOT NULL,
  `execution_context` json NOT NULL,
  `annotations` json NOT NULL,
  `type` varchar(45) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `tmp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `identifier` varchar(36) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(100) NOT NULL,
  `token` text NOT NULL,
  `token_issued` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token_expiry` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(36) NOT NULL,
  `metadata` json NOT NULL,
  `tmp` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`identifier`, `username`, `password`, `token`, `token_issued`, `token_expiry`, `type`, `metadata`, `tmp`) VALUES
('d41b83dc-a22e-11e7-abc4-cec278b6b50a', 'string', '473287f8298dba7163a897908958f7c0eae733e25d2e027992ea2edc9bed2fa8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsInR5cGUiOiJhY2Nlc3MiLCJ1c2VyX2NsYWltcyI6e30sImlhdCI6MTUwNDExNjY2MCwibmJmIjoxNTA0MTE2NjYwLCJleHAiOjE1MDQxMTcwNjAsImp0aSI6Ijk4ZDcyNjc1LWZhN2QtNDE3NS1hYWRlLWFkNTdiNTBjMmRhYyIsImlkZW50aXR5Ijoic3RyaW5nIn0.JlkE2YFeGbQxzxp3ikPhuh90xbonL2B-hZyCqevLe0w', '2017-08-30 13:11:00', '2017-08-30 13:17:40', 'md2k', '{}', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kafka_offsets`
--
ALTER TABLE `kafka_offsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_topic` (`topic`,`topic_partition`),
  ADD KEY `topic` (`topic`);

--
-- Indexes for table `stream`
--
ALTER TABLE `stream`
  ADD PRIMARY KEY (`tmp`),
  ADD KEY `UUID` (`identifier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`tmp`),
  ADD KEY `UUID` (`identifier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kafka_offsets`
--
ALTER TABLE `kafka_offsets`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stream`
--
ALTER TABLE `stream`
  MODIFY `tmp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `tmp` int(3) NOT NULL AUTO_INCREMENT;COMMIT;
