-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 25, 2017 at 03:31 PM
-- Server version: 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.18-0ubuntu0.16.04.1

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
  `user_name` varchar(80) NOT NULL,
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

INSERT INTO `user` (`identifier`, `user_name`, `password`, `token`, `token_issued`, `token_expiry`, `type`, `metadata`, `tmp`) VALUES
('123', 'demo', 'demo', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2NsYWltcyI6e30sImlhdCI6MTUwMTAwNTI3MSwibmJmIjoxNTAxMDA1MjcxLCJleHAiOjE1MDEwMDU2NzEsInR5cGUiOiJhY2Nlc3MiLCJpZGVudGl0eSI6ImRlbW8iLCJmcmVzaCI6ZmFsc2UsImp0aSI6IjkyMjgyNzA5LTU5MjUtNDhjMS1iMmMzLWY3YzA1N2FmMjBhZSJ9.4iq2sb-h8-JKSbl3bzdXJdxAzYHviFLh9NBVcZFvzi8', '2017-07-25 12:54:31', '2017-07-25 13:01:11', 'md2k', '{}', 1);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `stream`
--
ALTER TABLE `stream`
  MODIFY `tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `tmp` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;
