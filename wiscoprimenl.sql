-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 28, 2022 at 03:53 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wiscoprimenl`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogposts`
--

CREATE TABLE `blogposts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL DEFAULT '',
  `slug` varchar(500) DEFAULT NULL,
  `author` varchar(500) NOT NULL DEFAULT '',
  `cover` varchar(500) NOT NULL DEFAULT '',
  `thumb` varchar(500) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `qoute` text DEFAULT NULL,
  `file` varchar(500) DEFAULT NULL,
  `tags` varchar(11) NOT NULL DEFAULT '',
  `views` int(11) NOT NULL DEFAULT 0,
  `date_posted` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blogposts`
--

INSERT INTO `blogposts` (`id`, `title`, `slug`, `author`, `cover`, `thumb`, `body`, `qoute`, `file`, `tags`, `views`, `date_posted`) VALUES
(1, 'first blog smaple', '123sdwd24ref', '1', 'assets/blog/1234567890/blog-details-1.jpg', NULL, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione.', 'Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui.', '1234567890', '1,2', 100, '2021-11-26 09:36:26'),
(2, 'second blog sample', '123sdw556624ref', '1', 'assets/blog/1255668890/like-post-2.jpg', NULL, '', 'Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui.', '1255668890', '1,2', 500, '2021-11-26 09:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `postid` int(11) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_posted` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `postid`, `author`, `comment`, `date_posted`) VALUES
(1, 1, 1, 'first sample comment', '2021-11-26 09:00:29'),
(5, 1, 1, 'second sample comment', '2021-11-26 09:00:29'),
(6, 2, 7755, 'wonderful post guys keep it up', '2021-12-04 16:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `blog_replies`
--

CREATE TABLE `blog_replies` (
  `id` int(11) UNSIGNED NOT NULL,
  `commentid` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `date_posted` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_replies`
--

INSERT INTO `blog_replies` (`id`, `commentid`, `author`, `reply`, `date_posted`) VALUES
(1, 1, 1, 'first sample reply comment', '2021-11-26 09:00:29'),
(2, 5, 1, 'second reply comment ', '2021-11-26 09:00:29'),
(3, 1, 1, 'third comment	', '2021-11-26 09:00:29'),
(5, 5, 8685, 'reply to second sample from reply page', '2021-12-04 15:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `email_slug` varchar(500) DEFAULT NULL,
  `roles` int(11) DEFAULT NULL,
  `date_registered` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `username`, `password`, `email`, `email_slug`, `roles`, `date_registered`) VALUES
(1, 'Admin', '12345', 'admin@wiscoprime.com', '1234567890', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(500) DEFAULT NULL,
  `projectname` varchar(250) DEFAULT NULL,
  `clientname` varchar(500) DEFAULT NULL,
  `tags` varchar(11) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `year_comp` timestamp NULL DEFAULT NULL,
  `year_start` timestamp NULL DEFAULT NULL,
  `area` varchar(500) DEFAULT NULL,
  `architect` varchar(500) DEFAULT NULL,
  `location` varchar(500) DEFAULT NULL,
  `investor_web` varchar(500) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `details_file` varchar(500) DEFAULT NULL,
  `owner_review` varchar(500) DEFAULT NULL,
  `owner_rate` int(11) DEFAULT NULL,
  `cover` varchar(500) DEFAULT NULL,
  `thumbs` int(11) DEFAULT NULL,
  `date_posted` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `slug`, `projectname`, `clientname`, `tags`, `value`, `year_comp`, `year_start`, `area`, `architect`, `location`, `investor_web`, `summary`, `details_file`, `owner_review`, `owner_rate`, `cover`, `thumbs`, `date_posted`) VALUES
(1, '1234567890', 'Sample Villa', 'Developer Test', '3,8', '1000000', '2021-12-04 16:00:02', '2020-12-04 16:00:02', '21,000 m2', 'Developer & Test', 'Abuja Nigeria', 'http://wiscoprimenl.com/', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque lau-dantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi.', '1234567890', 'Excellent Job guys', 3, 'cover.jpg', 2, '2021-12-04 16:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'phone', '+ (234) - 8023253220'),
(2, 'address', '1234 Maitama FCT, Abuja'),
(3, 'working_hours', '08 AM - 10 PM'),
(4, 'mailto', 'wiscoprimenl@gmail.com'),
(5, 'phone', '+ (234) - 08135960958'),
(6, 'aboutus', 'Wisco-Prime Nigeria Limited was formed by Young Nigerian professionals who have various experiences and was fully registered at corporate Affairs Matter Decree No. 1 of 1990 out of a keen desire of making positive contributions to the development of our country.\n\nOur Mission is to discover, access, evaluate and develop world class growth and procedure of construction and maintenance services required in the public and private sectors.\nTo continuosly improve in our quality and open communication in the conduct of our activities to meet and conform to the desired ethical, safety and environmental standards.'),
(7, 'staffs', '250'),
(8, 'houses_built', '560');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `type` int(1) DEFAULT NULL,
  `date_posted` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `type`, `date_posted`) VALUES
(1, 'engineering', 2, '2021-12-07 19:06:13'),
(2, 'construction', 2, '2021-12-07 19:06:16'),
(3, 'buildings', 1, '2021-12-07 19:05:22'),
(4, 'interior', 1, '2021-12-07 19:05:22'),
(5, 'design', 1, '2021-12-07 19:05:22'),
(7, 'tiling', 1, '2021-12-07 19:05:22'),
(8, 'finished', 1, '2021-12-07 19:05:22'),
(9, 'ongoing', 1, '2021-12-07 19:05:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogposts`
--
ALTER TABLE `blogposts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_replies`
--
ALTER TABLE `blog_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogposts`
--
ALTER TABLE `blogposts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_replies`
--
ALTER TABLE `blog_replies`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
