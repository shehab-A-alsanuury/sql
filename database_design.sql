-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 17, 2024 at 09:25 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database design`
--

-- --------------------------------------------------------

--
-- Table structure for table `courseassignments`
--

DROP TABLE IF EXISTS `courseassignments`;
CREATE TABLE IF NOT EXISTS `courseassignments` (
  `assignment_id` int NOT NULL AUTO_INCREMENT,
  `instructor_id` int NOT NULL,
  `course_id` int NOT NULL,
  `semester` enum('Spring','Summer','Fall','Winter') NOT NULL,
  `year` year NOT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `instructor_id` (`instructor_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `courseassignments`
--

INSERT INTO `courseassignments` (`assignment_id`, `instructor_id`, `course_id`, `semester`, `year`) VALUES
(1, 1, 1, 'Fall', '2023'),
(2, 2, 2, 'Spring', '2023'),
(3, 3, 3, 'Fall', '2023'),
(4, 4, 4, 'Spring', '2023'),
(5, 5, 5, 'Fall', '2023');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `credits` tinyint NOT NULL,
  `department` varchar(100) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_code` (`course_code`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_code`, `credits`, `department`) VALUES
(1, 'Introduction to Computer Science', 'CS101', 3, 'Computer Science'),
(2, 'Biology 101', 'BIO101', 4, 'Biology'),
(3, 'Calculus I', 'MATH101', 3, 'Mathematics'),
(4, 'Physics I', 'PHYS101', 4, 'Physics'),
(5, 'Chemistry 101', 'CHEM101', 4, 'Chemistry');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
CREATE TABLE IF NOT EXISTS `enrollments` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `grade` char(2) DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `student_id`, `course_id`, `grade`) VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'B'),
(3, 2, 2, 'A'),
(4, 2, 3, 'B'),
(5, 3, 3, 'C'),
(6, 3, 4, 'A'),
(7, 4, 1, 'B'),
(8, 4, 5, 'A'),
(9, 5, 2, 'C'),
(10, 5, 3, 'B'),
(11, 6, 4, 'A'),
(12, 6, 5, 'B'),
(13, 7, 1, 'B'),
(14, 7, 4, 'A'),
(15, 8, 2, 'A'),
(16, 8, 5, 'C'),
(17, 9, 1, 'A'),
(18, 9, 3, 'B'),
(19, 10, 2, 'B'),
(20, 10, 4, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
CREATE TABLE IF NOT EXISTS `instructors` (
  `instructor_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `hire_date` date NOT NULL,
  `department` varchar(100) NOT NULL,
  PRIMARY KEY (`instructor_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`instructor_id`, `first_name`, `last_name`, `email`, `hire_date`, `department`) VALUES
(1, 'Dr. Alice', 'Green', 'alice.green@example.com', '2015-01-10', 'Computer Science'),
(2, 'Dr. Brian', 'Black', 'brian.black@example.com', '2018-03-12', 'Biology'),
(3, 'Dr. Carol', 'White', 'carol.white@example.com', '2016-06-15', 'Mathematics'),
(4, 'Dr. Daniel', 'Blue', 'daniel.blue@example.com', '2017-09-20', 'Physics'),
(5, 'Dr. Eva', 'Red', 'eva.red@example.com', '2019-11-25', 'Chemistry');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `major` varchar(100) NOT NULL,
  `enrollment_year` year NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `email`, `date_of_birth`, `gender`, `major`, `enrollment_year`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2000-01-15', 'Male', 'Computer Science', '2022'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2001-02-20', 'Female', 'Biology', '2021'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '1999-03-10', 'Male', 'Mathematics', '2022'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '2002-04-05', 'Female', 'Physics', '2023'),
(5, 'Sarah', 'Williams', 'sarah.williams@example.com', '2000-05-25', 'Female', 'Chemistry', '2022'),
(6, 'David', 'Brown', 'david.brown@example.com', '1998-06-30', 'Male', 'Engineering', '2021'),
(7, 'Jessica', 'Jones', 'jessica.jones@example.com', '2001-07-15', 'Female', 'History', '2022'),
(8, 'Daniel', 'Garcia', 'daniel.garcia@example.com', '1999-08-20', 'Male', 'Business', '2023'),
(9, 'Ashley', 'Martinez', 'ashley.martinez@example.com', '2002-09-25', 'Female', 'Art', '2021'),
(10, 'Matthew', 'Hernandez', 'matthew.hernandez@example.com', '2000-10-10', 'Male', 'Philosophy', '2022');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
