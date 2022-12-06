-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 06, 2022 at 05:22 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ummrn`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id_announcement` int(10) NOT NULL,
  `id_cop` int(10) NOT NULL,
  `id_researcher` int(10) NOT NULL,
  `announcement` text NOT NULL,
  `attachment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cfps`
--

CREATE TABLE `cfps` (
  `id_cfp` int(10) NOT NULL,
  `id_project` int(10) NOT NULL,
  `criterion` text NOT NULL,
  `funding` float NOT NULL,
  `quota` int(20) NOT NULL,
  `deadline` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cfps`
--

INSERT INTO `cfps` (`id_cfp`, `id_project`, `criterion`, `funding`, `quota`, `deadline`) VALUES
(1, 3, '1. Experienced in Web Programming <br />\n2. Mobile programming is also considered <br />\n3. Willing to cooperate with other researchers <br />\n4. Willing to be supervised/contacted anytime when needed. <br />\n5. Having a strong motivation to complete in the appointed time.', 2000000, 3, '2020-11-30'),
(2, 4, '1. New proposals submitted by students must be their own. <br />\r\n2. The proposal submitted has never been submitted anywhere. <br />\r\n3. Own form of work that has not been reviewed by other parties. <br />\r\n4. Willing to continue writing project proposals properly with selected researchers. <br />\r\n5. Submit a new proposal with up to 3 team members.\r\n', 100000, 3, '2023-03-31');

-- --------------------------------------------------------

--
-- Table structure for table `cops`
--

CREATE TABLE `cops` (
  `id_cop` int(10) NOT NULL,
  `id_researcher` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cops`
--

INSERT INTO `cops` (`id_cop`, `id_researcher`, `name`, `description`) VALUES
(1, 1, 'Knowledge Management', 'Forum Group Discussion about Knowledge Management and its application.'),
(2, 2, 'Software Engineering', 'Forum Group Discussion about Software Engineering and its cycles.');

-- --------------------------------------------------------

--
-- Table structure for table `cv`
--

CREATE TABLE `cv` (
  `id_cv` int(10) NOT NULL,
  `id_researcher` int(10) NOT NULL,
  `education` text NOT NULL,
  `skill` text NOT NULL,
  `teaching` text NOT NULL,
  `organization` text NOT NULL,
  `awards` text NOT NULL,
  `topics` text NOT NULL,
  `publications` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cv`
--

INSERT INTO `cv` (`id_cv`, `id_researcher`, `education`, `skill`, `teaching`, `organization`, `awards`, `topics`, `publications`) VALUES
(1, 1, '2011-2013 Master in Informatics (M.Kom) - Modeling and prototyping the Knowledge Management System on the higher education environment <br />\r\n2005-2009 Bachelor in Informatics (S.Kom) - Designing a clustering (High Availability) server on the intranet', '1. Database Administrator <br />\r\n2. Web programming<br />\r\n3. Linux', '1. Database Design <br/>\r\n2. Software Engineering<br/>\r\n3. Information System<br/>\r\n4. Software Project Management', '-', '-', '1. Information System <br />\r\n2. Knowledge Management<br />\r\n3. e-Government<br />\r\n4. Reengineering (BRP & SR)<br />\r\n5. Project Management', '[1] I. Nuryasin, Y. Prayudi, and T. Dirgahayu, “Prototype of Knowledge Management System for the Higher Education Institution in Indonesia,” Semin. Nas. Apl. Tenologi Inf., pp. 6–12, 2013. <br/>\r\n[2] I. Nuryasin, “Model Communities of Practice (CoP) Pada Kelas Paralel di Jurusan Teknik Informatika, Universitas Muhammadmiyah Malang,” Semin. Nas. Teknol. dan Rekayasa, vol. 2, pp. v78–v82, 2016. <br/>\r\n[3] I. Nuryasin, “Prototype of Personal Knowledge Management on Higher Education,” INFORMATIKA, vol. 1, 2018. Professional Membership - Association for Information Systems – Indonesia Chapter (AISINDO)');

-- --------------------------------------------------------

--
-- Table structure for table `joinresearch`
--

CREATE TABLE `joinresearch` (
  `id_joinresearch` int(10) NOT NULL,
  `id_project` int(10) NOT NULL,
  `id_student` int(10) NOT NULL,
  `motivation` text NOT NULL,
  `status` enum('Waiting for Approval','Accepted','Declined','') NOT NULL DEFAULT 'Waiting for Approval'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `joinresearch`
--

INSERT INTO `joinresearch` (`id_joinresearch`, `id_project`, `id_student`, `motivation`, `status`) VALUES
(1, 3, 1, 'Ingin mendalami KM', 'Waiting for Approval'),
(2, 3, 3, 'I want to be an expert in KM.', 'Waiting for Approval'),
(4, 3, 4, '- ', 'Waiting for Approval');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id_member` int(10) NOT NULL,
  `id_cop` int(10) NOT NULL,
  `id_researcher` int(10) NOT NULL,
  `id_student` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id_member`, `id_cop`, `id_researcher`, `id_student`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id_project` int(10) NOT NULL,
  `id_researcher` int(10) NOT NULL,
  `title` text NOT NULL,
  `published_year` int(50) NOT NULL,
  `description` text NOT NULL,
  `attachment` varchar(50) NOT NULL,
  `status` enum('Open','Active','Completed','') NOT NULL DEFAULT 'Open'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id_project`, `id_researcher`, `title`, `published_year`, `description`, `attachment`, `status`) VALUES
(1, 1, 'Modeling Knowledge Management in Higher Education', 2013, 'This project aimed to propose a model of KM implementation in Higher Education Institution.', 'https://bit.ly/sdfao3452dg', 'Completed'),
(2, 2, 'Generating Protein Composition Using DEXTROID Algorithm', 2017, 'Generating RNA Combination by coloring protein code using DEXTROID Algorithm.', 'https://bit.ly/Kt68w49jsd', 'Active'),
(3, 1, 'Model of Communities of Practice in Paralel Class ', 2020, 'Developing a model and prototype of CoP to achieve comprehensive learning in paralel class.', '-', 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `id_project_member` int(10) NOT NULL,
  `id_project` int(10) NOT NULL,
  `id_researcher` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `researchers`
--

CREATE TABLE `researchers` (
  `id_researcher` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `interest` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `usr` varchar(25) NOT NULL,
  `psw` varchar(50) NOT NULL,
  `photo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `researchers`
--

INSERT INTO `researchers` (`id_researcher`, `name`, `interest`, `phone`, `email`, `usr`, `psw`, `photo`) VALUES
(1, 'Ilyas Nuryasin', 'Knowledge Management', '081553114556', 'ilyas@umm.ac.id', 'ilyas', '3ea4a8e4d7a95ace878f907ab8b72d1b', 'ilyas.jpg'),
(2, 'Roni Kateman', 'Information Retrieval', '085639532235', 'roni@umm.ac.id', 'roni', 'd78b154c99fe7f06ebc02ebd63d1c87c', 'roni.jpg'),
(3, 'Robert Himada', 'Ontology', '08532645237', 'himada@umm.ac.id', 'himada', 'afb4aadc1d36ed26a9083873d76a2feb', 'himada.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id_student` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `nim` varchar(25) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `usr` varchar(25) NOT NULL,
  `psw` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `bidang_minat` varchar(50) NOT NULL,
  `skill` varchar(50) NOT NULL,
  `portofolio` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id_student`, `name`, `nim`, `phone`, `email`, `usr`, `psw`, `description`, `bidang_minat`, `skill`, `portofolio`, `foto`) VALUES
(1, 'Andi Sukirman', '20207239423423', '081642364723', 'sukirman@student.umm.ac.id', 'andi', 'ce0e5bf55e4f71749eade7a8b95c4e46', '', '', '', '', ''),
(3, 'Tatang Sumantri', '2019384534239', '089234234824', 'tatang@student.umm.ac.id', 'tatang', 'd060186e5e6b83b4622443175089328a', '', '', '', '', ''),
(4, 'Bla', '12', '08324786', 'bella@gmail.com', 'Bella', '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `submit_proposal`
--

CREATE TABLE `submit_proposal` (
  `id_submit_proposal` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tahun` int(11) NOT NULL,
  `dokumen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submit_proposal`
--

INSERT INTO `submit_proposal` (`id_submit_proposal`, `judul`, `tahun`, `dokumen`) VALUES
(1, 'Berburu Domba', 2000, 'Ini nanti file');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id_announcement`);

--
-- Indexes for table `cfps`
--
ALTER TABLE `cfps`
  ADD PRIMARY KEY (`id_cfp`);

--
-- Indexes for table `cops`
--
ALTER TABLE `cops`
  ADD PRIMARY KEY (`id_cop`);

--
-- Indexes for table `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`id_cv`);

--
-- Indexes for table `joinresearch`
--
ALTER TABLE `joinresearch`
  ADD PRIMARY KEY (`id_joinresearch`),
  ADD UNIQUE KEY `id_student` (`id_student`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id_project`);

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`id_project_member`);

--
-- Indexes for table `researchers`
--
ALTER TABLE `researchers`
  ADD PRIMARY KEY (`id_researcher`),
  ADD UNIQUE KEY `usr` (`usr`),
  ADD KEY `id_researcher` (`id_researcher`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id_student`),
  ADD UNIQUE KEY `usr` (`usr`);

--
-- Indexes for table `submit_proposal`
--
ALTER TABLE `submit_proposal`
  ADD PRIMARY KEY (`id_submit_proposal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id_announcement` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfps`
--
ALTER TABLE `cfps`
  MODIFY `id_cfp` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cops`
--
ALTER TABLE `cops`
  MODIFY `id_cop` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cv`
--
ALTER TABLE `cv`
  MODIFY `id_cv` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `joinresearch`
--
ALTER TABLE `joinresearch`
  MODIFY `id_joinresearch` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id_member` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id_project` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id_project_member` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `researchers`
--
ALTER TABLE `researchers`
  MODIFY `id_researcher` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id_student` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `submit_proposal`
--
ALTER TABLE `submit_proposal`
  MODIFY `id_submit_proposal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
