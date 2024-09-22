-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2024 at 03:33 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `feutordb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `username`, `password`) VALUES
(1, 'feuradmin', 'feutor24');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `reviewID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `sessionID` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `sessionID` int(11) NOT NULL,
  `tutorID` int(11) DEFAULT NULL,
  `studentID` int(11) DEFAULT NULL,
  `sessionDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `duration` decimal(5,2) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `teachingMode` varchar(50) DEFAULT NULL,
  `need` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `paymentStatus` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`sessionID`, `tutorID`, `studentID`, `sessionDate`, `startTime`, `endTime`, `duration`, `subject`, `teachingMode`, `need`, `status`, `paymentStatus`, `created_at`) VALUES
(71, 11, NULL, '2024-03-20', '08:26:00', '00:00:09', '1.00', NULL, 'Online', 'jdsldjsada', 'Pending', NULL, '2024-03-12 11:46:12'),
(72, 13, NULL, '2024-03-22', '07:27:00', '00:00:08', '1.00', ' Chemistry', 'School', 'i love chemistry', 'Pending', NULL, '2024-03-12 11:46:12'),
(73, 12, NULL, '2024-03-12', '09:28:00', '00:00:10', '1.00', 'Mathematics', 'School', 'math is so fucker', 'Pending', NULL, '2024-03-12 11:46:12'),
(74, 11, NULL, '2024-03-30', '03:20:00', '00:00:04', '1.00', 'Programming', 'School', 'lucifer', 'Pending', NULL, '2024-03-12 11:46:12'),
(75, 11, NULL, '2024-03-19', '02:34:00', '00:00:04', '2.00', 'Programming', 'Online', 'low', 'Pending', NULL, '2024-03-12 11:46:12'),
(76, NULL, NULL, '2024-03-15', '04:36:00', '00:00:05', '1.00', 'Programming', 'Online', 'jey', 'Pending', NULL, '2024-03-12 11:46:12'),
(77, 11, NULL, '2024-03-27', '02:42:00', '00:00:05', '3.00', 'Programming', 'School', 'cutie lang', 'Pending', NULL, '2024-03-12 11:46:12'),
(79, 11, NULL, '2024-03-05', '04:45:00', '00:00:05', '1.00', 'Programming', 'Online', '', 'Pending', NULL, '2024-03-12 11:46:12'),
(81, 11, NULL, '2024-03-26', '03:47:00', '00:00:05', '2.00', 'Programming', 'Online', 'lolza', 'Pending', NULL, '2024-03-12 11:46:12'),
(82, 11, NULL, '2024-03-29', '02:17:00', '00:00:05', '3.00', 'Programming', 'Online', 'LOPAQ', 'Pending', NULL, '2024-03-12 11:46:12'),
(83, 11, 3, '2024-03-21', '03:22:00', '00:00:06', '3.00', 'Programming', 'Online', 'I am struggling with understanding calculus concepts, particularly related to derivatives and integration. I need tutoring to help me grasp these topics better and improve my performance in calculus class', 'Declined', NULL, '2024-03-12 11:46:12'),
(84, 12, 3, '2024-03-13', '03:26:00', '00:00:06', '3.00', ' Physics', 'Online', 'ily lucifer', 'Pending', NULL, '2024-03-12 11:46:12'),
(85, 11, 3, '2024-03-20', '04:54:00', '00:00:06', '2.00', 'Programming', 'School', 'momi oni pasama sa toro fam please', 'Waiting for Payment', NULL, '2024-03-12 11:46:12'),
(86, 11, 5, '2024-03-16', '05:38:00', '00:00:07', '2.00', 'Programming', 'School', 'I am struggling with understanding calculus concepts, particularly related to derivatives and integration. I need tutoring to help me grasp these topics better and improve my performance in calculus class', 'Cancelled', NULL, '2024-03-12 11:46:12'),
(87, 12, 5, '2024-03-10', '16:43:00', '00:00:17', '1.00', ' Physics', 'School', 'therapy ', 'Pending', NULL, '2024-03-12 11:46:12'),
(88, 11, 5, '2024-03-13', '20:18:00', '00:00:21', '1.00', 'Programming', 'School', 'hi momi oni ', 'Approved', 'Paid', '2024-03-12 11:46:12'),
(89, 12, 5, '2024-03-13', '20:30:00', '00:00:22', '2.00', 'Mathematics', NULL, 'Lucifer HIIIIII', 'Pending', NULL, '2024-03-12 11:46:12'),
(90, 11, 5, '2024-03-19', '21:36:00', '00:00:23', '2.00', 'Programming', 'Online', 'I am struggling with understanding calculus concepts, particularly related to derivatives and integration. I need tutoring to help me grasp these topics better and improve my performance in calculus class', 'Pending', NULL, '2024-03-12 11:46:12'),
(91, 11, 5, '2024-03-26', '20:46:00', '00:00:22', '2.00', 'Programming', 'Online', 'hilow pu', 'Declined', NULL, '2024-03-12 11:46:54'),
(92, 11, 12, '2024-03-30', '17:45:00', '00:00:18', '1.00', 'Programming', 'Online', 'Lorem ipsum dolor sit ametra porttitor sit amet ac ipsum.', 'Approved', 'Paid', '2024-03-21 06:46:29'),
(93, 12, 12, '2024-03-09', '16:47:00', '00:00:18', '2.00', ' Physics', 'School', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at tortor hendrerit, tristique libero eget, fringilla lorem. Etiam maximus sem sit amet aliquam laoreet. Sed semper eget odio in venenatis. Donec sit amet blandit nulla. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer quis efficitur odio. Pellentesque eros elit, scelerisque quis mattis at, rhoncus ac ipsum. Vestibulum ut risus pharetra, suscipit tortor quis, cursus sem. Cras elit turpis, sollicitudin ut consectetur eu, fringilla eget neque. Curabitur at justo ex. Donec lorem tellus, feugiat non eros id, mollis tincidunt ligula. Donec sit amet tellus non augue ullamcorper iaculis at ut ante. Mauris convallis luctus magna, et accumsan dui pharetra quis. Curabitur eget nisl luctus orci accumsan accumsan quis quis justo. Ut sit amet felis in elit pharetra porttitor sit amet ac ipsum.', 'Pending', NULL, '2024-03-21 06:47:50'),
(94, 11, 12, '2024-03-31', '22:04:00', '00:00:23', '1.00', 'Programming', 'School', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at tortor hendrerit, tristique libero eget, fringilla lorem. Etiam maximus sem sit amet aliquam laoreet. ', 'Waiting for Payment', NULL, '2024-03-21 07:05:22'),
(95, 11, 12, '2024-03-22', '19:06:00', '00:00:22', '3.00', 'Programming', 'Online', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at tortor hendrerit, tristique libero eget, fringilla lorem. Etiam maximus sem sit amet aliquam laoreet. ', 'Finished', 'Paid', '2024-03-21 07:06:21');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `degreeProgram` varchar(225) NOT NULL,
  `year` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `firstname`, `lastname`, `degreeProgram`, `year`, `email`, `password`, `created_at`) VALUES
(1, 'REIZSA', 'MARTINEZ', '', '', 'reizsakaryllmartinez1230@gmail.com', '$2y$10$qeKNVUUrbJmRqjxEZhGK1Obw12efBkeh7iFgO75rJ9nnFRJR4N0j.', '2024-02-27 16:34:25'),
(2, 'kendall', 'jenner', '', '', 'kendalljenner@gmail.com', '$2y$10$qCHTE2o0qWrPsSn5nOmj3uU/VPqZTvwmIB9eWsjAQJdXZuFzvtsVm', '2024-02-27 16:37:24'),
(3, 'Laylani', 'Pula', 'BS in Business Administration', '2nd Year', 'lhyred@gmail.com', '$2y$10$X0QCm6byZnYe0ne2kfc1SeSGFhhjGQ1DTOmrrcanUCXZZ23BA9r9K', '2024-02-27 16:54:16'),
(4, 'leng', 'leng', '', '', 'leng@gmail.com', '$2y$10$.j5E0Tb7bMqsXotdV3eCkOg.DjPohsDV02lEIsFeOovEoUssh29dm', '2024-03-06 13:56:02'),
(5, 'Ethan', 'Billones', 'BS in Information Technology', '2nd Year', 'ethan@gmail.com', '$2y$10$.iqbPHYY.PxxA59TlhidsecBkyleC.ZQz456Q4KM.JGYpXfM7Bnc.', '2024-03-10 02:29:40'),
(6, 'Rebecca', 'Strauss', 'BSIT', '1', 'rebeccastrauss@gmail.com', '$2y$10$bs2xqDfe99oqaT7FbOtjxObr5n3DHQgR4ImE4liXsZMXfAa8IkoNe', '2024-03-12 22:29:51'),
(7, 'Trevor', 'Tutaan', 'BSIT', '2nd Year', 'trevor@gmail.com', '$2y$10$qykD/bm3swvmzgC6r3SbauPt0a0t6l5SDFPCPjWPVl3lRCLDwNB6.', '2024-03-21 10:41:43'),
(8, 'Bella', 'Hadid', 'BSIT', '1st Year', 'bella@gmail.com', '$2y$10$MaLBwBF0P5gk1D3lWISDuOozIIMKvPJjQAZD7Ccsv1XoSGil3EBda', '2024-03-21 10:43:45'),
(9, 'Kris', 'Jenner', 'BS in Information Technology', '1st Year', 'kris@gmail.com', '$2y$10$5nBxHuERjVR4T6nmbZgj8u3gOfZV2k9MxkQXjPLKsmqrSgfxiLJmm', '2024-03-21 10:45:12'),
(10, 'Harvey', 'del Castillo', 'BS in Information Technology', '3rd Year', 'harvey@gmail.com', '$2y$10$i2yuzEB4y7iMFCro0BsQKeXTw1icEsrr1LJUvG1jmMrQmvcRp29wi', '2024-03-21 13:51:44'),
(11, 'Kourtney', 'Kardashian ', 'BS n Business Administration', '1st Year', 'kourtney@gmail.com', '$2y$10$ZqPY79EqeSgYZYlhniXwAuLDArzkW29wFOdD24I9apeW3ez1rFhhe', '2024-03-21 14:11:15'),
(12, 'Gigi', 'Hadid', 'High School', '1st Year', 'gigi@gmail.com', '$2y$10$X598YcqByN0o6YjGdOuMiOZihWbBiCV9EVIqZ24sBqXxLJlQ0Ygri', '2024-03-21 14:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `semester` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`, `category`, `semester`) VALUES
(9, 'Programming', 'College', '1st semester'),
(15, 'Mathematics', 'High School', '1st semester'),
(16, 'Physics', 'High School', '2nd semester'),
(17, 'Biology', 'High School', '1st semester'),
(18, 'Chemistry', 'High School', '2nd semester'),
(19, 'History', 'Senior High School', '1st semester'),
(20, 'Geography', 'Senior High School', '2nd semester'),
(21, 'Literature', 'Senior High School', '1st semester'),
(22, 'Economics', 'Senior High School', '2nd semester'),
(23, 'Computer Science', 'College', '1st semester'),
(24, 'Statistics', 'College', '2nd semester');

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `tutorID` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `degreeProgram` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `gdriveLink` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `approvalStatus` enum('Pending','Approved','Declined') NOT NULL DEFAULT 'Pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `profilePicture` varchar(255) DEFAULT NULL,
  `subjectExpertise` varchar(255) DEFAULT NULL,
  `availableDaysTime` varchar(255) DEFAULT NULL,
  `teachingMode` varchar(50) DEFAULT NULL,
  `ratePerHour` decimal(10,0) DEFAULT NULL,
  `bio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`tutorID`, `firstName`, `lastName`, `email`, `degreeProgram`, `year`, `gdriveLink`, `password`, `approvalStatus`, `created_at`, `profilePicture`, `subjectExpertise`, `availableDaysTime`, `teachingMode`, `ratePerHour`, `bio`) VALUES
(7, 'mico', 'mer', 'mico@gmail.com', 'BSIT', '4', 'https://drive.google.com/drive/u/0/', '$2y$10$ut8.SOQ/qmzIlR3e9GZDuuao2GVLloVFwQE4VSVk.naa9FnOSnIte', 'Pending', '2024-03-02 23:08:17', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Monica', 'Geller', 'missreirei@gmail.com', 'BSIT', '1', 'https://drive.google.com/drive/u/0/', '$2y$10$zT6kxug9Fpg/OI315Sf4M.IW8moSwSj61MkIEZEO6kcyvHMQkTlcu', 'Pending', '2024-03-02 23:16:40', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'aika', 'men', 'aika@gmail.com', 'High School', '10', 'https://drive.google.com/drive/u/0/', '$2y$10$Kn6uZW259Xws29VJZTqaMezi7fpTsHUsIF/bJSKkwML1H8dOgocH6', 'Declined', '2024-03-02 23:21:22', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'ysa', 'jenner', 'ysajenner@gmail.com', 'Senior High School', 'Grade 9', 'https://drive.google.com/drive/u/0/', '$2y$10$G1OhZ/VUqNUiMsD/f1w5C.buHaN3e4WPo0ZFm0PF.qt2cfhzFQDF.', 'Pending', '2024-03-06 14:01:57', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Toni', 'Flower', 'torofam@gmail.com', 'BS in Business Administration', '1st Year', 'https://drive.google.com/drive/u/0/', '$2y$10$qto/AfzXOtTgXK0eEDJAT.iWzUJe4PelGAL7ugvNXyU.1d7LyZeny', 'Approved', '2024-03-06 14:02:38', 'img/ef4c953c77e6fdf6df93b9591e2b3333.png', 'Programming', 'Tuesday: 3:00pm - 5:00pm', 'Online & School', '200', 'With over 5 years of tutoring experience and a Bachelor\'s degree in Mathematics from XYZ University, I have a passion for numbers and a knack for breaking down complex mathematical concepts into bite-sized, digestible pieces.\r\n\r\nI believe that every student is unique, and I tailor my teaching approach to suit your individual learning style and pace. Whether you\'re struggling with algebra, calculus, or geometry, I\'m here to provide personalized guidance and support every step of the way.'),
(12, 'Lucifer', 'Morning Star', 'john.doe@example.com', 'BS in Information Technology', '2nd Year', 'https://drive.google.com/1234567890', '$2y$10$6HZtQp25EQFdzR9xwrMOS.Cs59AJ.G2r9.pRjbYlfuhFnmHqSzE0q', 'Approved', '2024-03-06 22:02:43', 'img/1_D6YSoRx6GUPSpP4gDBtXwA.jpeg', 'Mathematics, Physics', 'Monday: 11:00am - 3:00pm', 'Online & School', '25', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pulvinar lorem nunc, euismod interdum mi sodales vel. Vivamus vitae sodales libero. Duis in urna eros. Donec sed leo non neque ullamcorper bibendum. Nam id vehicula ipsum. Sed non ligula commodo, tempus ipsum eu, dapibus nisi. Duis at mauris mauris. Pellentesque vel lectus vitae mi ullamcorper vestibulum vel eu lorem. Ut quis eros at tellus viverra fermentum. Sed ut diam at tortor ultrices vestibulum vel et lectus. Integer id eros auctor, finibus quam in, commodo diam. Nam non nulla magna. Morbi ultricies enim sit amet ante interdum, non eleifend nibh elementum. Nullam quis tellus non nulla vehicula egestas eu sed magna.'),
(13, 'Jamie', 'Dornan', 'jane.smith@example.com', 'High School', '12th Grade', 'https://drive.google.com/0987654321', '$2y$10$4AqFT64Yqo1BWVXpSXXfxuuRts4k3CEYmc9.Nj8I1rdHkFwhwAWAa', 'Approved', '2024-03-06 22:10:55', 'img/chris.png', 'Biology, Chemistry', 'Tue - 9:00am - 1:00pm', 'School', '20', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pulvinar lorem nunc, euismod interdum mi sodales vel. Vivamus vitae sodales libero. Duis in urna eros. Donec sed leo non neque ullamcorper bibendum. Nam id vehicula ipsum. Sed non ligula commodo, tempus ipsum eu, dapibus nisi. Duis at mauris mauris. Pellentesque vel lectus vitae mi ullamcorper vestibulum vel eu lorem. Ut quis eros at tellus viverra fermentum. Sed ut diam at tortor ultrices vestibulum vel et lectus. Integer id eros auctor, finibus quam in, commodo diam. Nam non nulla magna. Morbi ultricies enim sit amet ante interdum, non eleifend nibh elementum. Nullam quis tellus non nulla vehicula egestas eu sed magna.'),
(14, 'Chris', 'Evans', 'michael.johnson@example.com', 'Senior High School', '11th Grade', 'https://drive.google.com/5678901234', '$2y$10$j2nyVbFKg7jsNlYapvFSi.4wz0tDl9JnGxhj2RLyRbD6YMQhZfdT2', 'Approved', '2024-03-06 22:10:55', 'img/jamie.png', 'History, Geography', 'Wed - 10:00am - 2:00pm', 'Online', '23', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pulvinar lorem nunc, euismod interdum mi sodales vel. Vivamus vitae sodales libero. Duis in urna eros. Donec sed leo non neque ullamcorper bibendum. Nam id vehicula ipsum. Sed non ligula commodo, tempus ipsum eu, dapibus nisi. Duis at mauris mauris. Pellentesque vel lectus vitae mi ullamcorper vestibulum vel eu lorem. Ut quis eros at tellus viverra fermentum. Sed ut diam at tortor ultrices vestibulum vel et lectus. Integer id eros auctor, finibus quam in, commodo diam. Nam non nulla magna. Morbi ultricies enim sit amet ante interdum, non eleifend nibh elementum. Nullam quis tellus non nulla vehicula egestas eu sed magna.'),
(15, 'Chloe', 'Decker', 'emily.williams@example.com', 'BS in Business Administration', '3rd Year', 'https://drive.google.com/3456789012', '$2y$10$2o1C9G1McQ/yyekgkf48ceJ2yzWVjN7oZyKicJdI4YjBKKzG9dS9K', 'Approved', '2024-03-06 22:10:55', 'img/chloe.png', 'Literature, Economics', 'Thu - 8:00am - 12:00pm', 'Online', '18', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pulvinar lorem nunc, euismod interdum mi sodales vel. Vivamus vitae sodales libero. Duis in urna eros. Donec sed leo non neque ullamcorper bibendum. Nam id vehicula ipsum. Sed non ligula commodo, tempus ipsum eu, dapibus nisi. Duis at mauris mauris. Pellentesque vel lectus vitae mi ullamcorper vestibulum vel eu lorem. Ut quis eros at tellus viverra fermentum. Sed ut diam at tortor ultrices vestibulum vel et lectus. Integer id eros auctor, finibus quam in, commodo diam. Nam non nulla magna. Morbi ultricies enim sit amet ante interdum, non eleifend nibh elementum. Nullam quis tellus non nulla veh.'),
(16, 'Harvey', 'del Castillo', 'harvey@gmail.com', 'BS in Information Technology', '3rd Year', 'https://drive.google.com/drive/u/0/', '$2y$10$4c/yh6l.YAhcFCMAW6Wx5eihXOY2a9wVqr5zhv57mXXVUWq897csi', 'Approved', '2024-03-21 10:59:36', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewID`),
  ADD KEY `studentID` (`studentID`),
  ADD KEY `sessionID` (`sessionID`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`sessionID`),
  ADD KEY `studentID` (`studentID`),
  ADD KEY `fk_tutorID` (`tutorID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`tutorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `sessionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tutor`
--
ALTER TABLE `tutor`
  MODIFY `tutorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`sessionID`) REFERENCES `session` (`sessionID`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `fk_tutorID` FOREIGN KEY (`tutorID`) REFERENCES `tutor` (`tutorID`),
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
