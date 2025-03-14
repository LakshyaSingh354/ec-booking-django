-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 17, 2025 at 05:01 PM
-- Server version: 8.0.35
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advertsneak_epitome`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_author`
--

CREATE TABLE `accounts_author` (
  `id` bigint NOT NULL,
  `author_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `author_slug` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_general_ci,
  `designation` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `user_profile_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_author`
--

INSERT INTO `accounts_author` (`id`, `author_name`, `author_slug`, `content`, `designation`, `is_approved`, `created_at`, `modified_at`, `user_id`, `user_profile_id`) VALUES
(1, 'Dharmendra Yadav', 'dkyadav', '<p>Hello, I am Dharmendra Yadav and I am a Python Django Web Developer, Web Designer, Search Engine Optimizer. I love all the things to do with Python and write about it.</p>', 'Sr. Web DeveloperD', 1, '2023-10-17 07:11:57.713345', '2023-12-02 05:21:23.943394', 1, 1),
(3, 'Sagar Bhatiya', 'sagar-bhatiya', '<p>With over 25 years of experience, we have crafted thousands of Strategic discovery process that enables us to peelback thousands which enable us to understand.</p>', 'CEO Founder', 0, '2023-12-02 05:23:02.812829', '2023-12-02 06:48:03.067582', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_emailsetting`
--

CREATE TABLE `accounts_emailsetting` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `enqmail` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_emailsetting`
--

INSERT INTO `accounts_emailsetting` (`id`, `name`, `enqmail`) VALUES
(1, 'Sagar Bhatia', 'dharmendra.pjsoft@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_emailsmtp`
--

CREATE TABLE `accounts_emailsmtp` (
  `id` bigint NOT NULL,
  `EMAIL_HOST` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `EMAIL_PORT` int NOT NULL,
  `EMAIL_HOST_USER` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `EMAIL_HOST_PASSWORD` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `EMAIL_USE_TLS` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_emailsmtp`
--

INSERT INTO `accounts_emailsmtp` (`id`, `EMAIL_HOST`, `EMAIL_PORT`, `EMAIL_HOST_USER`, `EMAIL_HOST_PASSWORD`, `EMAIL_USE_TLS`) VALUES
(2, 'smtp.gmail.com', 587, 'rinkudy46@gmail.com', 'hghfjbgpelshtlqn', 1);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user`
--

CREATE TABLE `accounts_user` (
  `id` bigint NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `role` smallint UNSIGNED DEFAULT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superadmin` tinyint(1) NOT NULL
) ;

--
-- Dumping data for table `accounts_user`
--

INSERT INTO `accounts_user` (`id`, `password`, `first_name`, `last_name`, `username`, `email`, `phone_number`, `role`, `date_joined`, `last_login`, `created_date`, `modified_date`, `is_admin`, `is_staff`, `is_active`, `is_superadmin`) VALUES
(1, 'pbkdf2_sha256$320000$fNVS2p2PcvVB6kRofbZVU6$eW+xR8/0NE2eMNYehzEoSTqkFuaobDDKYeotflfLGVQ=', 'Dharmendra', 'Yadav', 'dkyadav', 'dharmendrayadav076@gmail.com', '9452428546', 1, '2023-10-17 05:03:34.862243', '2025-02-17 10:26:49.345945', '2023-10-17 05:03:34.862243', '2023-11-24 06:36:10.289306', 1, 1, 1, 1),
(2, 'pbkdf2_sha256$320000$HNy3VJukTdF4q7fm1vD4eo$lrZ6Upek6OXokL2ch2oqEyvJA+gdjLfKzc2uT3Sc5qI=', 'Sagar', 'Bhatia', 'sagarbhatia', 'saggy22108906@gmail.com', '79775 15433', 1, '2023-12-01 04:36:43.378199', '2023-12-01 04:36:43.378199', '2023-12-01 04:36:43.378199', '2023-12-01 04:37:52.633477', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_userprofile`
--

CREATE TABLE `accounts_userprofile` (
  `id` bigint NOT NULL,
  `profile_picture` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `state` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `pin_code` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_userprofile`
--

INSERT INTO `accounts_userprofile` (`id`, `profile_picture`, `address`, `country`, `state`, `city`, `pin_code`, `created_at`, `modified_at`, `user_id`) VALUES
(1, 'users/profile_pictures/dharmendra-yadav-python-web-developer.jpg', 'Kathawatiya Prithavipur Jaunpur', 'India', 'UP', 'Jaunpur', '222203', '2023-10-17 05:04:23.636921', '2025-02-17 10:26:49.348796', 1),
(2, 'users/profile_pictures/team__2.png', '', '', '', '', '', '2023-12-01 04:36:43.528866', '2023-12-01 05:56:22.744628', 2);

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL,
  `email` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` char(32) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `email_address_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add user profile', 7, 'add_userprofile'),
(26, 'Can change user profile', 7, 'change_userprofile'),
(27, 'Can delete user profile', 7, 'delete_userprofile'),
(28, 'Can view user profile', 7, 'view_userprofile'),
(29, 'Can add author', 8, 'add_author'),
(30, 'Can change author', 8, 'change_author'),
(31, 'Can delete author', 8, 'delete_author'),
(32, 'Can view author', 8, 'view_author'),
(33, 'Can add banner', 9, 'add_banner'),
(34, 'Can change banner', 9, 'change_banner'),
(35, 'Can delete banner', 9, 'delete_banner'),
(36, 'Can view banner', 9, 'view_banner'),
(37, 'Can add client', 10, 'add_client'),
(38, 'Can change client', 10, 'change_client'),
(39, 'Can delete client', 10, 'delete_client'),
(40, 'Can view client', 10, 'view_client'),
(41, 'Can add company_overview', 11, 'add_company_overview'),
(42, 'Can change company_overview', 11, 'change_company_overview'),
(43, 'Can delete company_overview', 11, 'delete_company_overview'),
(44, 'Can view company_overview', 11, 'view_company_overview'),
(45, 'Can add know_us', 12, 'add_know_us'),
(46, 'Can change know_us', 12, 'change_know_us'),
(47, 'Can delete know_us', 12, 'delete_know_us'),
(48, 'Can view know_us', 12, 'view_know_us'),
(49, 'Can add Service', 13, 'add_services'),
(50, 'Can change Service', 13, 'change_services'),
(51, 'Can delete Service', 13, 'delete_services'),
(52, 'Can view Service', 13, 'view_services'),
(53, 'Can add team', 14, 'add_team'),
(54, 'Can change team', 14, 'change_team'),
(55, 'Can delete team', 14, 'delete_team'),
(56, 'Can view team', 14, 'view_team'),
(57, 'Can add testimonial', 15, 'add_testimonial'),
(58, 'Can change testimonial', 15, 'change_testimonial'),
(59, 'Can delete testimonial', 15, 'delete_testimonial'),
(60, 'Can view testimonial', 15, 'view_testimonial'),
(61, 'Can add service_detail', 16, 'add_service_detail'),
(62, 'Can change service_detail', 16, 'change_service_detail'),
(63, 'Can delete service_detail', 16, 'delete_service_detail'),
(64, 'Can view service_detail', 16, 'view_service_detail'),
(65, 'Can add brochure', 17, 'add_brochure'),
(66, 'Can change brochure', 17, 'change_brochure'),
(67, 'Can delete brochure', 17, 'delete_brochure'),
(68, 'Can view brochure', 17, 'view_brochure'),
(69, 'Can add category', 18, 'add_category'),
(70, 'Can change category', 18, 'change_category'),
(71, 'Can delete category', 18, 'delete_category'),
(72, 'Can view category', 18, 'view_category'),
(73, 'Can add post', 19, 'add_post'),
(74, 'Can change post', 19, 'change_post'),
(75, 'Can delete post', 19, 'delete_post'),
(76, 'Can view post', 19, 'view_post'),
(77, 'Can add blog comment', 20, 'add_blogcomment'),
(78, 'Can change blog comment', 20, 'change_blogcomment'),
(79, 'Can delete blog comment', 20, 'delete_blogcomment'),
(80, 'Can view blog comment', 20, 'view_blogcomment'),
(81, 'Can add City', 21, 'add_city'),
(82, 'Can change City', 21, 'change_city'),
(83, 'Can delete City', 21, 'delete_city'),
(84, 'Can view City', 21, 'view_city'),
(85, 'Can add Company', 22, 'add_company'),
(86, 'Can change Company', 22, 'change_company'),
(87, 'Can delete Company', 22, 'delete_company'),
(88, 'Can view Company', 22, 'view_company'),
(89, 'Can add Country', 23, 'add_country'),
(90, 'Can change Country', 23, 'change_country'),
(91, 'Can delete Country', 23, 'delete_country'),
(92, 'Can view Country', 23, 'view_country'),
(93, 'Can add education', 24, 'add_education'),
(94, 'Can change education', 24, 'change_education'),
(95, 'Can delete education', 24, 'delete_education'),
(96, 'Can view education', 24, 'view_education'),
(97, 'Can add experience', 25, 'add_experience'),
(98, 'Can change experience', 25, 'change_experience'),
(99, 'Can delete experience', 25, 'delete_experience'),
(100, 'Can view experience', 25, 'view_experience'),
(101, 'Can add Job Category', 26, 'add_job_category'),
(102, 'Can change Job Category', 26, 'change_job_category'),
(103, 'Can delete Job Category', 26, 'delete_job_category'),
(104, 'Can view Job Category', 26, 'view_job_category'),
(105, 'Can add job_type', 27, 'add_job_type'),
(106, 'Can change job_type', 27, 'change_job_type'),
(107, 'Can delete job_type', 27, 'delete_job_type'),
(108, 'Can view job_type', 27, 'view_job_type'),
(109, 'Can add sector', 28, 'add_sector'),
(110, 'Can change sector', 28, 'change_sector'),
(111, 'Can delete sector', 28, 'delete_sector'),
(112, 'Can view sector', 28, 'view_sector'),
(113, 'Can add work_mode', 29, 'add_work_mode'),
(114, 'Can change work_mode', 29, 'change_work_mode'),
(115, 'Can delete work_mode', 29, 'delete_work_mode'),
(116, 'Can view work_mode', 29, 'view_work_mode'),
(117, 'Can add state', 30, 'add_state'),
(118, 'Can change state', 30, 'change_state'),
(119, 'Can delete state', 30, 'delete_state'),
(120, 'Can view state', 30, 'view_state'),
(121, 'Can add skill', 31, 'add_skill'),
(122, 'Can change skill', 31, 'change_skill'),
(123, 'Can delete skill', 31, 'delete_skill'),
(124, 'Can view skill', 31, 'view_skill'),
(125, 'Can add job_role', 32, 'add_job_role'),
(126, 'Can change job_role', 32, 'change_job_role'),
(127, 'Can delete job_role', 32, 'delete_job_role'),
(128, 'Can view job_role', 32, 'view_job_role'),
(129, 'Can add job', 33, 'add_job'),
(130, 'Can change job', 33, 'change_job'),
(131, 'Can delete job', 33, 'delete_job'),
(132, 'Can view job', 33, 'view_job'),
(133, 'Can add applicant', 34, 'add_applicant'),
(134, 'Can change applicant', 34, 'change_applicant'),
(135, 'Can delete applicant', 34, 'delete_applicant'),
(136, 'Can view applicant', 34, 'view_applicant'),
(137, 'Can add position', 35, 'add_position'),
(138, 'Can change position', 35, 'change_position'),
(139, 'Can delete position', 35, 'delete_position'),
(140, 'Can view position', 35, 'view_position'),
(141, 'Can add general', 36, 'add_general'),
(142, 'Can change general', 36, 'change_general'),
(143, 'Can delete general', 36, 'delete_general'),
(144, 'Can view general', 36, 'view_general'),
(145, 'Can add about', 37, 'add_about'),
(146, 'Can change about', 37, 'change_about'),
(147, 'Can delete about', 37, 'delete_about'),
(148, 'Can view about', 37, 'view_about'),
(149, 'Can add what_specialty', 38, 'add_what_specialty'),
(150, 'Can change what_specialty', 38, 'change_what_specialty'),
(151, 'Can delete what_specialty', 38, 'delete_what_specialty'),
(152, 'Can view what_specialty', 38, 'view_what_specialty'),
(153, 'Can add Contact', 39, 'add_contact'),
(154, 'Can change Contact', 39, 'change_contact'),
(155, 'Can delete Contact', 39, 'delete_contact'),
(156, 'Can view Contact', 39, 'view_contact'),
(157, 'Can add feedback', 40, 'add_feedback'),
(158, 'Can change feedback', 40, 'change_feedback'),
(159, 'Can delete feedback', 40, 'delete_feedback'),
(160, 'Can view feedback', 40, 'view_feedback'),
(161, 'Can add enquiry', 41, 'add_sevices_enquiry'),
(162, 'Can change enquiry', 41, 'change_sevices_enquiry'),
(163, 'Can delete enquiry', 41, 'delete_sevices_enquiry'),
(164, 'Can view enquiry', 41, 'view_sevices_enquiry'),
(165, 'Can add enquiry', 42, 'add_services_enquiry'),
(166, 'Can change enquiry', 42, 'change_services_enquiry'),
(167, 'Can delete enquiry', 42, 'delete_services_enquiry'),
(168, 'Can view enquiry', 42, 'view_services_enquiry'),
(169, 'Can add Home Page', 43, 'add_home'),
(170, 'Can change Home Page', 43, 'change_home'),
(171, 'Can delete Home Page', 43, 'delete_home'),
(172, 'Can view Home Page', 43, 'view_home'),
(173, 'Can add Page Banner', 44, 'add_bg_banner'),
(174, 'Can change Page Banner', 44, 'change_bg_banner'),
(175, 'Can delete Page Banner', 44, 'delete_bg_banner'),
(176, 'Can view Page Banner', 44, 'view_bg_banner'),
(177, 'Can add Counter', 45, 'add_counter'),
(178, 'Can change Counter', 45, 'change_counter'),
(179, 'Can delete Counter', 45, 'delete_counter'),
(180, 'Can view Counter', 45, 'view_counter'),
(181, 'Can add email setting', 46, 'add_emailsetting'),
(182, 'Can change email setting', 46, 'change_emailsetting'),
(183, 'Can delete email setting', 46, 'delete_emailsetting'),
(184, 'Can view email setting', 46, 'view_emailsetting'),
(185, 'Can add email smtp', 47, 'add_emailsmtp'),
(186, 'Can change email smtp', 47, 'change_emailsmtp'),
(187, 'Can delete email smtp', 47, 'delete_emailsmtp'),
(188, 'Can view email smtp', 47, 'view_emailsmtp');

-- --------------------------------------------------------

--
-- Table structure for table `blog_blogcomment`
--

CREATE TABLE `blog_blogcomment` (
  `sno` int NOT NULL,
  `comment` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `post_id` int NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `sno` int NOT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `category_image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_category`
--

INSERT INTO `blog_category` (`sno`, `category_name`, `slug`, `description`, `category_image`, `created_on`, `updated_on`, `status`) VALUES
(1, 'Django', 'django', '', '', '2023-10-19 04:58:35.000000', '2023-10-19 04:58:44.610170', 1),
(2, 'Python', 'python', '', '', '2023-10-19 04:58:46.000000', '2023-10-19 04:58:54.353299', 1),
(3, 'PHP', 'php', '', '', '2023-10-19 04:58:56.000000', '2023-10-19 04:59:15.377315', 1),
(7, 'Sales', 'sales', 'Sales', '', '2023-12-04 06:49:44.000000', '2023-12-04 06:49:52.361439', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `sno` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title_tag` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_general_ci,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `author_id` bigint NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_post`
--

INSERT INTO `blog_post` (`sno`, `title`, `slug`, `title_tag`, `content`, `image`, `is_featured`, `created_on`, `updated_on`, `status`, `author_id`, `category_id`) VALUES
(1, 'Meet AutoManage, the best AI management tools One', 'meet-automanage-the-best-ai-management-tools-one', 'Meet AutoManage, the best AI management tools', '<p>Everything you need to start building area atching presence for your business</p>', 'blog/2023/12/04/blog-post3.jpg', 0, '2023-10-19 04:59:20.000000', '2023-10-19 05:00:19.143295', 1, 3, 2),
(3, 'Meet AutoManage, the best AI management tools Three', 'meet-automanage-the-best-ai-management-tools-three', 'Meet AutoManage, the best AI management tools', '<p>Everything you need to start building area atching presence for your business.</p>', 'blog/2023/12/04/blog-post2.jpg', 0, '2023-10-19 05:01:45.000000', '2023-10-19 05:02:34.842432', 1, 3, 3),
(4, 'Why Should Business Payroll Outsourcing', 'why-should-business-payroll-outsourcing', 'Why Should Business Payroll Outsourcing', '<p>When an unknown printer took ar galley offer type year anddey scrambled make type aewer specimen book bethas survived not only five when annery unknown printer.eed a little help from our friends from time to time. Although we offer the one-stop convenience.</p>\r\n\r\n<p>Embed a little help from our friends from time to time. Although we offer the one-stop convenience of annery integrated range of legal, financial services under one roof, there are occasions when our clients areaneed specia- list advice beyond the scope of our own expertise.</p>\r\n\r\n<p>&ldquo; urabitur varius eros rutrum consequat Mauris aewa sollicitudin enim condimentum luctus enim justo non molestie nisl &rdquo;</p>\r\n\r\n<h4>Speed Optimized</h4>\r\n\r\n<p>When an unknown printer took a galley of type and scrambled it to make a type specimen bookhas a not only five centuries, but also the leap into electronic typesetting, remaining essentially unchan galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<h3>Conduct Replied Off Whether Arrived Adapted</h3>\r\n\r\n<p>When an unknown printer took a galley type remaining essentially unchan galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<ul>\r\n	<li><img alt=\"\" src=\"http://127.0.0.1:8000/blog/meet-automanage-the-best-ai-management-tools-two/assets/img/icons/check_icon.svg\" />Commercial Property Insurance</li>\r\n	<li><img alt=\"\" src=\"http://127.0.0.1:8000/blog/meet-automanage-the-best-ai-management-tools-two/assets/img/icons/check_icon.svg\" />Budget Friendly Theme</li>\r\n	<li><img alt=\"\" src=\"http://127.0.0.1:8000/blog/meet-automanage-the-best-ai-management-tools-two/assets/img/icons/check_icon.svg\" />Happy Customers</li>\r\n</ul>\r\n\r\n<p>When an unknown printer took a galley of type and scrambled it to make a type specimen bookhas a not only five centuries, but also the leap into electronic typesetting, remaining essentially unchan galley of type and scrambled it to make a type specimen book.</p>', 'blog/2023/12/04/blog-post1.jpg', 0, '2023-10-19 06:14:54.000000', '2023-10-19 06:16:25.608619', 1, 3, 2),
(6, 'Alternative Career Options for Sales Professionals', 'alternative-career-options-for-sales-professionals', 'Alternative Career Options for Sales Professionals', '<p>Are you a Sales Professional considering a career change? The high-pressure targets, the constant need for networking, and the relentless pursuit of meeting quotas can lead to burnout, prompting many sales professionals to seek alternate career options.</p>\r\n\r\n<p>Sales Professionals often possess a unique set of skills that are highly transferable and valued across various industries.</p>\r\n\r\n<p>In this article, we delve into the diverse and rewarding alternate career options for Sales Professionals, offering a fresh perspective on how your sales expertise can open new doors to exciting opportunities.</p>\r\n\r\n<h2>Alternative Career Options for Sales Professionals &ndash; Overview</h2>\r\n\r\n<p>Here&rsquo;s an overview of alternative career options for Sales Professionals with insights into transition time, starting salaries, and potential for remote work:</p>\r\n\r\n<table id=\"tablepress-133\">\r\n	<thead>\r\n		<tr>\r\n			<th>S.No.</th>\r\n			<th>Career Options</th>\r\n			<th>Transition Time</th>\r\n			<th>Avg Starting Salary Per Annum (INR)</th>\r\n			<th>Potential for Remote Work</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>1</td>\r\n			<td>Digital Marketing Specialist</td>\r\n			<td>6-12 months</td>\r\n			<td>4-8 Lakhs</td>\r\n			<td>High</td>\r\n		</tr>\r\n		<tr>\r\n			<td>2</td>\r\n			<td>Business Analyst</td>\r\n			<td>6-12 months</td>\r\n			<td>5-9 Lakhs</td>\r\n			<td>Moderate</td>\r\n		</tr>\r\n		<tr>\r\n			<td>3</td>\r\n			<td>Data Scientist</td>\r\n			<td>1-2 years</td>\r\n			<td>6-10 Lakhs</td>\r\n			<td>Very High</td>\r\n		</tr>\r\n		<tr>\r\n			<td>4</td>\r\n			<td>Business Development Manager</td>\r\n			<td>1-2 years</td>\r\n			<td>6-12 Lakhs</td>\r\n			<td>Moderate</td>\r\n		</tr>\r\n		<tr>\r\n			<td>5</td>\r\n			<td>Project Manager</td>\r\n			<td>1-2 years</td>\r\n			<td>7-15 Lakhs</td>\r\n			<td>Moderate</td>\r\n		</tr>\r\n		<tr>\r\n			<td>6</td>\r\n			<td>Market Research Analyst</td>\r\n			<td>6-12 months</td>\r\n			<td>4-8 Lakhs</td>\r\n			<td>Moderate</td>\r\n		</tr>\r\n		<tr>\r\n			<td>7</td>\r\n			<td>Key Account Manager</td>\r\n			<td>1-2 years</td>\r\n			<td>7-15 Lakhs</td>\r\n			<td>Moderate</td>\r\n		</tr>\r\n		<tr>\r\n			<td>8</td>\r\n			<td>Client Relationship Manager</td>\r\n			<td>6-12 months</td>\r\n			<td>5-10 Lakhs</td>\r\n			<td>Moderate</td>\r\n		</tr>\r\n		<tr>\r\n			<td>9</td>\r\n			<td>Public Relations Manager</td>\r\n			<td>1-2 years</td>\r\n			<td>6-12 Lakhs</td>\r\n			<td>High</td>\r\n		</tr>\r\n		<tr>\r\n			<td>10</td>\r\n			<td>Corporate Trainer</td>\r\n			<td>6-12 months</td>\r\n			<td>4-8 Lakhs</td>\r\n			<td>High</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Career Change Options for Sales Professionals &ndash; Let&rsquo;s Find the Alternatives</h2>\r\n\r\n<p>Below is the list of career change options or alternative employment for Sales professionals:</p>\r\n\r\n<p>A Digital Marketing Specialist focuses on creating and managing marketing campaigns in the digital space, leveraging online platforms to promote products or services.</p>\r\n\r\n<p>This role is a great fit for Sales professionals due to their strong understanding of people management, communication skills, and ability to strategize effectively.</p>', 'blog/2023/12/04/blog-post5.jpg', 0, '2023-12-04 06:45:00.000000', '2023-12-04 06:49:02.394086', 1, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(133, '2023-10-17 05:04:10.728931', '1', 'dharmendrayadav076@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Role\"]}}]', 6, 1),
(134, '2023-10-17 05:04:23.657402', '1', 'Dharmendra', 1, '[{\"added\": {}}]', 7, 1),
(135, '2023-10-17 06:35:47.398257', '1', 'India', 1, '[{\"added\": {}}]', 23, 1),
(136, '2023-10-17 06:35:54.872833', '2', 'Pakistan', 1, '[{\"added\": {}}]', 23, 1),
(137, '2023-10-17 06:36:01.222268', '3', 'United States', 1, '[{\"added\": {}}]', 23, 1),
(138, '2023-10-17 06:36:09.186260', '4', 'Panama', 1, '[{\"added\": {}}]', 23, 1),
(139, '2023-10-17 06:36:36.536359', '4', 'Panama', 3, '', 23, 1),
(140, '2023-10-17 06:36:36.619410', '3', 'United States', 3, '', 23, 1),
(141, '2023-10-17 06:36:36.743344', '2', 'Pakistan', 3, '', 23, 1),
(142, '2023-10-17 06:36:36.817357', '1', 'India', 3, '', 23, 1),
(143, '2023-10-17 06:40:08.831669', '5', 'India', 1, '[{\"added\": {}}]', 23, 1),
(144, '2023-10-17 06:40:15.220874', '6', 'Pakistan', 1, '[{\"added\": {}}]', 23, 1),
(145, '2023-10-17 06:40:22.921321', '7', 'United States', 1, '[{\"added\": {}}]', 23, 1),
(146, '2023-10-17 06:40:32.955502', '8', 'Russia', 1, '[{\"added\": {}}]', 23, 1),
(147, '2023-10-17 06:41:38.325254', '1', 'Uttar Pradesh', 1, '[{\"added\": {}}]', 30, 1),
(148, '2023-10-17 06:41:53.610832', '2', 'Maharashtra', 1, '[{\"added\": {}}]', 30, 1),
(149, '2023-10-17 06:42:25.195517', '3', 'Punjab', 1, '[{\"added\": {}}]', 30, 1),
(150, '2023-10-17 06:42:32.894099', '4', 'Telangana', 1, '[{\"added\": {}}]', 30, 1),
(151, '2023-10-17 06:42:50.672765', '5', 'Andhra Pradesh', 1, '[{\"added\": {}}]', 30, 1),
(152, '2023-10-17 06:42:58.749227', '6', 'Tamil Nadu', 1, '[{\"added\": {}}]', 30, 1),
(153, '2023-10-17 06:43:14.503533', '1', 'Jaunpur', 1, '[{\"added\": {}}]', 21, 1),
(154, '2023-10-17 06:43:24.838481', '2', 'Lucknow', 1, '[{\"added\": {}}]', 21, 1),
(155, '2023-10-17 06:43:36.414987', '3', 'Varanasi', 1, '[{\"added\": {}}]', 21, 1),
(156, '2023-10-17 06:43:44.991268', '4', 'Mumbai', 1, '[{\"added\": {}}]', 21, 1),
(157, '2023-10-17 06:43:54.418381', '5', 'Thane', 1, '[{\"added\": {}}]', 21, 1),
(158, '2023-10-17 06:44:01.493791', '6', 'Navi Mumbai', 1, '[{\"added\": {}}]', 21, 1),
(159, '2023-10-17 06:44:13.670589', '7', 'Palghar', 1, '[{\"added\": {}}]', 21, 1),
(160, '2023-10-17 06:44:41.871250', '1', 'IT', 1, '[{\"added\": {}}]', 28, 1),
(161, '2023-10-17 06:45:13.166443', '2', 'Software', 1, '[{\"added\": {}}]', 28, 1),
(162, '2023-10-17 06:45:33.839880', '3', 'Web Development', 1, '[{\"added\": {}}]', 28, 1),
(163, '2023-10-17 06:45:49.235615', '4', 'Tech', 1, '[{\"added\": {}}]', 28, 1),
(164, '2023-10-17 06:46:48.861442', '1', 'Remote', 1, '[{\"added\": {}}]', 29, 1),
(165, '2023-10-17 06:47:06.809569', '2', 'Onsite', 1, '[{\"added\": {}}]', 29, 1),
(166, '2023-10-17 06:47:15.924877', '3', 'Hybrid', 1, '[{\"added\": {}}]', 29, 1),
(167, '2023-10-17 06:47:41.298676', '1', 'Full Stack Developer', 1, '[{\"added\": {}}]', 32, 1),
(168, '2023-10-17 06:48:04.190205', '2', 'Web Designer', 1, '[{\"added\": {}}]', 32, 1),
(169, '2023-10-17 06:48:23.927139', '3', 'Backend Developer', 1, '[{\"added\": {}}]', 32, 1),
(170, '2023-10-17 06:48:38.186351', '1', 'Full time', 1, '[{\"added\": {}}]', 27, 1),
(171, '2023-10-17 06:48:46.043798', '2', 'Part Time', 1, '[{\"added\": {}}]', 27, 1),
(172, '2023-10-17 06:49:27.634098', '1', 'Devops', 1, '[{\"added\": {}}]', 26, 1),
(173, '2023-10-17 06:50:20.997494', '2', 'Python Developer', 1, '[{\"added\": {}}]', 26, 1),
(174, '2023-10-17 06:50:39.427625', '1', 'Less than a year', 1, '[{\"added\": {}}]', 25, 1),
(175, '2023-10-17 06:50:48.220662', '1', 'Less than a year', 3, '', 25, 1),
(176, '2023-10-17 06:50:55.463234', '2', 'Fresher', 1, '[{\"added\": {}}]', 25, 1),
(177, '2023-10-17 06:50:58.778676', '3', 'Less than a year', 1, '[{\"added\": {}}]', 25, 1),
(178, '2023-10-17 06:51:13.095317', '4', '1 - 2 Years', 1, '[{\"added\": {}}]', 25, 1),
(179, '2023-10-17 06:51:20.092666', '5', '2 - 4 Year', 1, '[{\"added\": {}}]', 25, 1),
(180, '2023-10-17 06:51:53.953358', '1', 'Bachelor Degree', 1, '[{\"added\": {}}]', 24, 1),
(181, '2023-10-17 06:52:11.225828', '2', '10th Pass', 1, '[{\"added\": {}}]', 24, 1),
(182, '2023-10-17 06:52:22.043177', '3', 'Any Graduate', 1, '[{\"added\": {}}]', 24, 1),
(183, '2023-10-17 06:53:10.046789', '1', 'Php', 1, '[{\"added\": {}}]', 31, 1),
(184, '2023-10-17 06:53:17.345398', '2', 'HTML', 1, '[{\"added\": {}}]', 31, 1),
(185, '2023-10-17 06:53:24.640897', '3', 'Javascript', 1, '[{\"added\": {}}]', 31, 1),
(186, '2023-10-17 06:53:32.611105', '4', 'SQL', 1, '[{\"added\": {}}]', 31, 1),
(187, '2023-10-17 06:53:43.373063', '5', 'Git', 1, '[{\"added\": {}}]', 31, 1),
(188, '2023-10-17 06:56:59.297177', '1', 'AdvertSneak Technologies', 1, '[{\"added\": {}}]', 22, 1),
(189, '2023-10-17 06:57:56.212319', '1', 'AdvertSneak Technologies', 2, '[{\"changed\": {\"fields\": [\"Company logo\"]}}]', 22, 1),
(190, '2023-10-17 07:00:43.565845', '1', 'Sr. Full Stack Developer', 1, '[{\"added\": {}}]', 33, 1),
(191, '2023-10-17 07:02:01.916452', '1', 'Fullstack', 1, '[{\"added\": {}}]', 35, 1),
(192, '2023-10-17 07:02:44.837587', '2', 'Graphics Designer', 1, '[{\"added\": {}}]', 35, 1),
(193, '2023-10-17 07:11:57.722853', '1', 'Dharmendra Yadav', 1, '[{\"added\": {}}]', 8, 1),
(194, '2023-10-17 07:12:03.250320', '1', 'Dharmendra Yadav', 2, '[{\"changed\": {\"fields\": [\"Is approved\"]}}]', 8, 1),
(195, '2023-10-17 14:07:52.509169', '1', 'Sr. Full Stack Developer', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 33, 1),
(196, '2023-10-18 01:24:39.120934', '1', 'Sr. Full Stack Developer', 3, '', 33, 1),
(197, '2023-10-18 03:25:42.083799', '2', 'Sr. Full Stack Developer', 1, '[{\"added\": {}}]', 33, 1),
(198, '2023-10-18 04:00:48.293524', '3', 'Fullstack', 1, '[{\"added\": {}}]', 35, 1),
(199, '2023-10-18 04:00:57.743797', '4', 'Graphics Designer', 1, '[{\"added\": {}}]', 35, 1),
(200, '2023-10-18 04:15:21.900126', '2', 'Sr. Full Stack Developer', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 33, 1),
(201, '2023-10-18 05:09:19.896421', '6', 'Dharmendra', 2, '[{\"changed\": {\"fields\": [\"Skills\"]}}]', 34, 1),
(202, '2023-10-18 08:45:26.534899', '10', 'Deepak Sharma.... Sr. Full Stack Developer', 2, '[{\"changed\": {\"fields\": [\"Skills\"]}}]', 34, 1),
(203, '2023-10-18 10:12:56.223306', '2', 'Python Developer', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 26, 1),
(204, '2023-10-18 10:13:07.478586', '1', 'Devops', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 26, 1),
(205, '2023-10-18 10:18:28.613974', '4', 'Tech', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 28, 1),
(206, '2023-10-18 10:18:47.491142', '3', 'Web Development', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 28, 1),
(207, '2023-10-18 10:18:57.351689', '2', 'Software', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 28, 1),
(208, '2023-10-18 10:19:07.067257', '1', 'IT', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 28, 1),
(209, '2023-10-18 10:19:33.091093', '2', 'Part Time', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 27, 1),
(210, '2023-10-18 10:19:51.090610', '1', 'Full time', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 27, 1),
(211, '2023-10-18 14:15:54.282745', '2', 'Sr. Full Stack Developer', 2, '[]', 33, 1),
(212, '2023-10-18 17:51:24.033204', '2', 'Sr. Full Stack Developer', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 33, 1),
(213, '2023-10-19 04:31:17.340058', '1', 'Banner 1', 1, '[{\"added\": {}}]', 9, 1),
(214, '2023-10-19 04:32:59.535966', '1', 'Banner 1', 2, '[{\"changed\": {\"fields\": [\"Img two\", \"Img three\", \"Bshape 1\", \"Bshape 2\"]}}]', 9, 1),
(215, '2023-10-19 04:34:27.652214', '1', 'Brand 1', 1, '[{\"added\": {}}]', 10, 1),
(216, '2023-10-19 04:34:41.017357', '2', 'Brand 2', 1, '[{\"added\": {}}]', 10, 1),
(217, '2023-10-19 04:34:54.415662', '3', 'Brand 3', 1, '[{\"added\": {}}]', 10, 1),
(218, '2023-10-19 04:35:07.438907', '4', 'Brand 4', 1, '[{\"added\": {}}]', 10, 1),
(219, '2023-10-19 04:35:18.804205', '5', 'Brand 5', 1, '[{\"added\": {}}]', 10, 1),
(220, '2023-10-19 04:35:41.349949', '6', 'Brand 6', 1, '[{\"added\": {}}]', 10, 1),
(221, '2023-10-19 04:38:24.720203', '1', 'Business Audit', 1, '[{\"added\": {}}]', 13, 1),
(222, '2023-10-19 04:39:30.086008', '2', 'Tax Advisory', 1, '[{\"added\": {}}]', 13, 1),
(223, '2023-10-19 04:40:36.988207', '3', 'Business Consulting', 1, '[{\"added\": {}}]', 13, 1),
(224, '2023-10-19 04:42:59.189477', '4', 'Finance Planning', 1, '[{\"added\": {}}]', 13, 1),
(225, '2023-10-19 04:45:59.059892', '1', 'My First Testimonial', 1, '[{\"added\": {}}]', 15, 1),
(226, '2023-10-19 04:47:39.525901', '2', 'My Second Testimonial', 1, '[{\"added\": {}}]', 15, 1),
(227, '2023-10-19 04:50:24.125225', '1', 'Brooklyn Simmons', 1, '[{\"added\": {}}]', 14, 1),
(228, '2023-10-19 04:51:32.732261', '2', 'Jenny Wilson', 1, '[{\"added\": {}}]', 14, 1),
(229, '2023-10-19 04:53:09.228750', '3', 'Ronald Richards', 1, '[{\"added\": {}}]', 14, 1),
(230, '2023-10-19 04:55:09.356027', '4', 'Marvin McKinney', 1, '[{\"added\": {}}]', 14, 1),
(231, '2023-10-19 04:58:03.406369', '1', 'Dharmendra', 2, '[{\"changed\": {\"fields\": [\"Profile picture\"]}}]', 7, 1),
(232, '2023-10-19 04:58:44.639610', '1', 'Django', 1, '[{\"added\": {}}]', 18, 1),
(233, '2023-10-19 04:58:54.377254', '2', 'Python', 1, '[{\"added\": {}}]', 18, 1),
(234, '2023-10-19 04:59:15.400231', '3', 'PHP', 1, '[{\"added\": {}}]', 18, 1),
(235, '2023-10-19 05:00:19.189422', '1', 'Meet AutoManage, the best AI management tools One', 1, '[{\"added\": {}}]', 19, 1),
(236, '2023-10-19 05:01:26.785296', '2', 'Meet AutoManage, the best AI management tools Two', 1, '[{\"added\": {}}]', 19, 1),
(237, '2023-10-19 05:02:34.871282', '3', 'Meet AutoManage, the best AI management tools Three', 1, '[{\"added\": {}}]', 19, 1),
(238, '2023-10-19 05:38:02.611792', '1', 'Make Better Products Make Products Better.... Business Audit', 1, '[{\"added\": {}}]', 16, 1),
(239, '2023-10-19 05:52:31.748161', '4', 'Finance Planning', 2, '[{\"changed\": {\"fields\": [\"Services thumb\"]}}]', 13, 1),
(240, '2023-10-19 05:52:31.788368', '4', 'Finance Planning', 2, '[{\"changed\": {\"fields\": [\"Services thumb\"]}}]', 13, 1),
(241, '2023-10-19 05:52:43.422064', '3', 'Business Consulting', 2, '[{\"changed\": {\"fields\": [\"Services thumb\"]}}]', 13, 1),
(242, '2023-10-19 05:52:53.814164', '2', 'Tax Advisory', 2, '[{\"changed\": {\"fields\": [\"Services thumb\"]}}]', 13, 1),
(243, '2023-10-19 05:53:06.539110', '1', 'Business Audit', 2, '[{\"changed\": {\"fields\": [\"Services thumb\"]}}]', 13, 1),
(244, '2023-10-19 06:16:25.633731', '4', 'Why Should Business Payroll Outsourcing', 1, '[{\"added\": {}}]', 19, 1),
(245, '2023-10-20 06:38:32.170480', '8', 'Mohali', 1, '[{\"added\": {}}]', 21, 1),
(246, '2023-10-20 06:42:07.434911', '2', 'Intelligent Outsourcing', 1, '[{\"added\": {}}]', 22, 1),
(247, '2023-10-20 06:43:28.059042', '6', 'Python', 1, '[{\"added\": {}}]', 31, 1),
(248, '2023-10-20 06:44:31.149505', '3', 'Python/Django Developer', 1, '[{\"added\": {}}]', 33, 1),
(249, '2023-10-20 06:46:55.165911', '3', 'Python/Django Developer', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 33, 1),
(250, '2023-10-20 11:21:28.708762', '1', 'Dharmendra Yadav', 2, '[{\"changed\": {\"fields\": [\"Content\", \"Designation\"]}}]', 8, 1),
(251, '2023-10-20 11:23:41.018035', '4', 'Why Should Business Payroll Outsourcing', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 19, 1),
(252, '2023-10-21 04:05:43.427188', '1', 'Make Better Products Make Products Better.... Finance Planning', 2, '[{\"changed\": {\"fields\": [\"Services\"]}}]', 16, 1),
(253, '2023-10-21 04:11:36.617770', '1', 'Make Better Products Make Products Better.... Finance Planning', 2, '[{\"changed\": {\"fields\": [\"Services img\", \"Description\", \"Services1 content\", \"Services2 content\", \"Title two\", \"Title two content\", \"Info one\", \"Img one\", \"Img two\", \"Info two\"]}}]', 16, 1),
(254, '2023-10-21 04:19:50.482226', '1', 'Make Better Products Make Products Better 2.... Finance Planning', 2, '[{\"changed\": {\"fields\": [\"Main title\"]}}]', 16, 1),
(255, '2023-10-21 04:34:49.832423', '1', 'Make Better Products Make Products Better 2.... Finance Planning', 2, '[{\"changed\": {\"fields\": [\"Services img\"]}}]', 16, 1),
(256, '2023-10-21 04:37:56.812215', '1', 'Make Better Products Make Products Better 2.... Finance Planning', 2, '[{\"changed\": {\"fields\": [\"Services img\"]}}]', 16, 1),
(257, '2023-10-21 04:38:36.333676', '1', 'Make Better Products Make Products Better 2.... Finance Planning', 2, '[{\"changed\": {\"fields\": [\"Services img\"]}}]', 16, 1),
(258, '2023-10-21 04:45:29.066547', '1', 'Make Better Products Make Products Better 2.... Finance Planning', 2, '[{\"changed\": {\"fields\": [\"Services1 flaticon\"]}}]', 16, 1),
(259, '2023-10-21 04:50:44.272776', '1', 'Make Better Products Make Products Better 2.... Finance Planning', 2, '[{\"changed\": {\"fields\": [\"Services2 flaticon\"]}}]', 16, 1),
(260, '2023-10-21 06:17:24.757652', '1', 'AdvertSneak Technologies', 1, '[{\"added\": {}}]', 36, 1),
(261, '2023-10-21 07:38:20.814412', '1', 'AdvertSneak Technologies', 2, '[{\"changed\": {\"fields\": [\"Address\"]}}]', 36, 1),
(262, '2023-10-21 07:58:03.166749', '1', 'AdvertSneak Technologies', 2, '[{\"changed\": {\"fields\": [\"Phone no2\"]}}]', 36, 1),
(263, '2023-10-21 08:03:56.315108', '1', 'AdvertSneak Technologies', 2, '[{\"changed\": {\"fields\": [\"Meta description\"]}}]', 36, 1),
(264, '2023-10-21 08:08:45.777150', '1', 'AdvertSneak Technologies', 2, '[{\"changed\": {\"fields\": [\"Meta description\"]}}]', 36, 1),
(265, '2023-10-21 09:33:02.527813', '1', 'GET TO KNOW US', 1, '[{\"added\": {}}]', 12, 1),
(266, '2023-10-21 09:34:49.948173', '1', 'COMPANY OVERVIEW', 1, '[{\"added\": {}}]', 11, 1),
(267, '2023-10-21 10:33:44.545076', '1', 'About Us', 1, '[{\"added\": {}}]', 37, 1),
(268, '2023-10-21 10:36:57.377269', '1', 'WHAT SPECIALTY', 1, '[{\"added\": {}}]', 38, 1),
(269, '2023-10-23 06:05:15.743472', '1', 'Contact Us', 1, '[{\"added\": {}}]', 39, 1),
(270, '2023-10-23 08:41:53.617649', '1', 'AdvertSneak Technologies', 2, '[{\"changed\": {\"fields\": [\"Phone no1\"]}}]', 36, 1),
(271, '2023-10-23 09:09:13.602978', '1', 'About Us', 2, '[{\"changed\": {\"fields\": [\"Bg banner\"]}}]', 37, 1),
(272, '2023-10-23 09:36:49.019461', '1', 'Home', 1, '[{\"added\": {}}]', 43, 1),
(273, '2023-10-23 09:37:13.139404', '1', 'Home', 2, '[{\"changed\": {\"fields\": [\"Meta title\", \"Meta description\", \"Meta keywords\"]}}]', 43, 1),
(274, '2023-10-23 09:38:50.486017', '1', 'Home', 2, '[{\"changed\": {\"fields\": [\"Section1 subtitle\", \"Section5 subtitle\", \"Team subtitle\", \"Blog subtitle\"]}}]', 43, 1),
(275, '2023-10-23 10:00:27.682988', '1', 'Home', 2, '[{\"changed\": {\"fields\": [\"Blog subtitle\", \"Blog title\"]}}]', 43, 1),
(276, '2023-10-23 10:17:50.146831', '1', 'homecounter', 1, '[{\"added\": {}}]', 45, 1),
(277, '2023-10-23 10:24:25.356379', '1', 'homecounter', 2, '[{\"changed\": {\"fields\": [\"Data count2\"]}}]', 45, 1),
(278, '2023-10-23 10:28:07.536672', '1', 'All Page Banner', 1, '[{\"added\": {}}]', 44, 1),
(279, '2023-10-23 15:39:03.864715', '47', 'Dharmendra Singh.... Python/Django Developer', 3, '', 34, 1),
(280, '2023-10-23 15:39:03.958119', '46', 'Dharmendra Singh.... Python/Django Developer', 3, '', 34, 1),
(281, '2023-10-23 15:39:03.977785', '45', 'Dharmendra Singh.... Python/Django Developer', 3, '', 34, 1),
(282, '2023-10-23 15:39:04.029397', '44', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(283, '2023-10-23 15:39:04.049652', '43', 'Rinku Yadav.... Python/Django Developer', 3, '', 34, 1),
(284, '2023-10-23 15:39:04.069637', '42', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(285, '2023-10-23 15:39:04.121850', '41', 'Dharmendra Yadav S.... Python/Django Developer', 3, '', 34, 1),
(286, '2023-10-23 15:39:04.224088', '40', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(287, '2023-10-23 15:39:04.245102', '39', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(288, '2023-10-23 15:39:04.265112', '38', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(289, '2023-10-23 15:39:04.316901', '37', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(290, '2023-10-23 15:39:04.367562', '36', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(291, '2023-10-23 15:39:04.388862', '35', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(292, '2023-10-23 15:39:04.419025', '34', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(293, '2023-10-23 15:39:04.471048', '33', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(294, '2023-10-23 15:39:04.491427', '32', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(295, '2023-10-23 15:39:04.512478', '31', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(296, '2023-10-23 15:39:04.532871', '30', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(297, '2023-10-23 15:39:04.553499', '29', 'Dharmendra Yadav S.... Python/Django Developer', 3, '', 34, 1),
(298, '2023-10-23 15:39:04.573751', '28', 'Dharmendra Yadav S.... Python/Django Developer', 3, '', 34, 1),
(299, '2023-10-23 15:39:04.594909', '27', 'Jitendara TY.... Python/Django Developer', 3, '', 34, 1),
(300, '2023-10-23 15:39:04.615489', '26', 'Jitendara TY.... Python/Django Developer', 3, '', 34, 1),
(301, '2023-10-23 15:39:04.667402', '25', 'Jitendara TY.... Python/Django Developer', 3, '', 34, 1),
(302, '2023-10-23 15:39:05.047397', '24', 'Deepak Yadav.... Sr. Full Stack Developer', 3, '', 34, 1),
(303, '2023-10-23 15:39:05.088423', '23', 'Deepak Yadav.... Sr. Full Stack Developer', 3, '', 34, 1),
(304, '2023-10-23 15:39:05.139538', '22', 'Deepak Yadav.... Sr. Full Stack Developer', 3, '', 34, 1),
(305, '2023-10-23 15:39:05.191561', '21', 'Deepak Yadav.... Sr. Full Stack Developer', 3, '', 34, 1),
(306, '2023-10-23 15:39:05.242750', '20', 'Deepak Yadav.... Sr. Full Stack Developer', 3, '', 34, 1),
(307, '2023-10-23 15:39:05.262799', '19', 'Deepak Yadav.... Sr. Full Stack Developer', 3, '', 34, 1),
(308, '2023-10-23 15:39:05.283827', '18', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(309, '2023-10-23 15:39:05.302873', '17', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(310, '2023-10-23 15:39:05.324889', '16', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(311, '2023-10-23 15:39:05.343894', '15', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(312, '2023-10-23 15:39:05.364909', '14', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(313, '2023-10-23 15:39:05.384921', '13', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(314, '2023-10-23 15:39:05.406456', '12', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(315, '2023-10-23 15:39:05.448402', '11', 'Sandeep Singh.... Sr. Full Stack Developer', 3, '', 34, 1),
(316, '2023-10-23 15:39:05.467374', '10', 'Deepak Sharma.... Sr. Full Stack Developer', 3, '', 34, 1),
(317, '2023-10-23 15:39:05.507526', '9', 'Ramu Kaka.... Sr. Full Stack Developer', 3, '', 34, 1),
(318, '2023-10-23 15:39:05.703224', '8', 'Deepak Singh09.... Sr. Full Stack Developer', 3, '', 34, 1),
(319, '2023-10-23 15:39:05.745283', '7', 'Ravi Singh09.... Sr. Full Stack Developer', 3, '', 34, 1),
(320, '2023-10-23 15:39:05.766096', '6', 'Dharmendra dharmendrayadav076@gmail.com.... Sr. Full Stack Developer', 3, '', 34, 1),
(321, '2023-10-23 15:39:05.807899', '5', 'Ravi Yadav.... Sr. Full Stack Developer', 3, '', 34, 1),
(322, '2023-10-23 15:39:05.847948', '4', 'Jitendara Yadav.... Sr. Full Stack Developer', 3, '', 34, 1),
(323, '2023-10-24 06:39:49.529705', '62', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(324, '2023-10-24 06:39:49.586540', '61', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(325, '2023-10-24 06:39:49.604809', '60', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(326, '2023-10-24 06:39:49.666914', '59', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(327, '2023-10-24 06:39:49.689963', '58', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(328, '2023-10-24 06:39:49.717979', '57', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(329, '2023-10-24 06:39:49.761008', '56', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(330, '2023-10-24 06:39:49.788865', '55', 'Jitendar Yadav.... Python/Django Developer', 3, '', 34, 1),
(331, '2023-10-24 06:39:49.812161', '54', 'Deepak Sharma.... Python/Django Developer', 3, '', 34, 1),
(332, '2023-10-24 06:39:49.840763', '53', 'Dharmendra dharmendrayadav076@gmail.com.... Python/Django Developer', 3, '', 34, 1),
(333, '2023-10-24 06:39:49.894852', '52', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(334, '2023-10-24 06:39:49.923349', '51', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(335, '2023-10-24 06:39:49.967373', '50', 'Dharmendra Yadav.... Python/Django Developer', 3, '', 34, 1),
(336, '2023-10-24 06:39:49.995519', '49', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(337, '2023-10-24 06:39:50.017263', '48', 'Jitendara Yadav.... Python/Django Developer', 3, '', 34, 1),
(338, '2023-11-24 05:31:01.442760', '1', 'dharmendrayadav076@gmail.com', 2, '[]', 6, 1),
(339, '2023-11-24 06:32:43.061196', '3', 'darpankario@gmail.com', 2, '[{\"changed\": {\"fields\": [\"City\"]}}]', 42, 1),
(340, '2023-11-24 06:35:48.729164', '1', 'Dharmendra', 2, '[{\"changed\": {\"fields\": [\"Address\", \"Country\", \"State\", \"City\", \"Pin code\"]}}]', 7, 1),
(341, '2023-11-24 06:37:52.147152', '2', 'darpankario@gmail.com', 1, '[{\"added\": {}}]', 40, 1),
(342, '2023-11-24 09:28:51.489503', '2', 'Make Better Products Make Products Better.... Business Consulting', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 16, 1),
(343, '2023-11-25 03:56:22.848978', '72', 'Dharmendra dharmendrayadav076@gmail.com.... Python/Django Developer', 2, '[{\"changed\": {\"fields\": [\"Skills\"]}}]', 34, 1),
(344, '2023-11-25 04:07:59.293421', '72', 'Dharmendra Yadav.... Python/Django Developer', 2, '[{\"changed\": {\"fields\": [\"Last name\"]}}]', 34, 1),
(345, '2023-11-25 06:46:02.169545', '8', 'Russia', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 23, 1),
(346, '2023-11-25 06:46:16.521555', '7', 'United States', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 23, 1),
(347, '2023-11-25 06:46:26.155343', '6', 'Pakistan', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 23, 1),
(348, '2023-11-25 06:46:36.699232', '5', 'India', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 23, 1),
(349, '2023-11-25 06:47:29.716413', '6', 'Tamil Nadu', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 30, 1),
(350, '2023-11-25 06:47:46.666797', '5', 'Andhra Pradesh', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 30, 1),
(351, '2023-11-25 06:47:56.251587', '4', 'Telangana', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 30, 1),
(352, '2023-11-25 06:48:05.806671', '3', 'Punjab', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 30, 1),
(353, '2023-11-25 06:48:22.348690', '2', 'Maharashtra', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 30, 1),
(354, '2023-11-25 06:48:38.934991', '1', 'Uttar Pradesh', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 30, 1),
(355, '2023-11-25 06:49:12.564973', '7', 'Palghar', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 21, 1),
(356, '2023-11-25 06:49:27.463662', '6', 'Navi Mumbai', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 21, 1),
(357, '2023-11-25 06:49:36.983125', '5', 'Thane', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 21, 1),
(358, '2023-11-25 06:49:46.526951', '4', 'Mumbai', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 21, 1),
(359, '2023-11-25 06:49:59.023825', '3', 'Varanasi', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 21, 1),
(360, '2023-11-25 06:50:10.539747', '2', 'Lucknow', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 21, 1),
(361, '2023-11-25 06:50:21.728065', '1', 'Jaunpur', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 21, 1),
(362, '2023-11-25 09:20:44.696039', '4', 'Graphics Designer', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 35, 1),
(363, '2023-11-25 09:21:00.807637', '3', 'Fullstack', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 35, 1),
(364, '2023-11-25 10:58:38.798103', '6', 'Web3 Developer', 3, '', 33, 1),
(365, '2023-11-25 11:06:09.498082', '7', 'Web3 Developer', 3, '', 33, 1),
(366, '2023-11-25 11:07:34.193204', '8', 'Web3 Developer', 1, '[{\"added\": {}}]', 33, 1),
(367, '2023-11-25 11:11:07.291582', '8', 'Web3 Developer', 3, '', 33, 1),
(368, '2023-11-25 11:12:12.950145', '9', 'Web3 Developer', 1, '[{\"added\": {}}]', 33, 1),
(369, '2023-11-25 11:13:36.556287', '9', 'Web3 Developer', 3, '', 33, 1),
(370, '2023-11-25 11:14:35.332789', '10', 'Web3 Developer', 1, '[{\"added\": {}}]', 33, 1),
(371, '2023-11-25 11:14:51.979564', '10', 'Web3 Developer', 3, '', 33, 1),
(372, '2023-11-25 13:06:14.665879', '11', 'Web3 Developer', 3, '', 33, 1),
(373, '2023-11-25 13:07:36.549617', '12', 'Web3 Developer', 1, '[{\"added\": {}}]', 33, 1),
(374, '2023-11-25 13:08:33.992804', '12', 'Web3 Developer', 3, '', 33, 1),
(375, '2023-11-25 13:09:35.427696', '13', 'Web3 Developer', 1, '[{\"added\": {}}]', 33, 1),
(376, '2023-11-25 13:29:23.100705', '13', 'Web3 Developer', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 33, 1),
(377, '2023-11-25 13:53:46.614056', '13', 'Web3 Developer', 3, '', 33, 1),
(378, '2023-11-25 13:53:57.609847', '5', 'Web Developer Node JS', 2, '[]', 33, 1),
(379, '2023-11-29 06:38:52.338893', '1', 'About Us', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 37, 1),
(380, '2023-12-01 04:36:43.529866', '2', '', 1, '[{\"added\": {}}]', 6, 1),
(381, '2023-12-01 04:37:52.675505', '2', 'saggy22108906@gmail.com', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Phone number\", \"Role\", \"Is admin\", \"Is staff\", \"Is active\", \"Is superadmin\"]}}]', 6, 1),
(382, '2023-12-01 04:40:40.283879', '1', 'AdvertSneak Consulting', 2, '[{\"changed\": {\"fields\": [\"Website name\"]}}]', 36, 1),
(383, '2023-12-01 04:52:31.522850', '1', 'Epitome Consultancy', 2, '[{\"changed\": {\"fields\": [\"Website name\", \"Meta title\"]}}]', 36, 1),
(384, '2023-12-01 05:56:22.772243', '2', 'Sagar', 2, '[{\"changed\": {\"fields\": [\"Profile picture\"]}}]', 7, 1),
(385, '2023-12-01 09:39:34.808765', '1', 'Receiving Email', 1, '[{\"added\": {}}]', 46, 1),
(386, '2023-12-01 10:18:25.253223', '1', 'Receiving Email', 2, '[{\"changed\": {\"fields\": [\"Enqmail\"]}}]', 46, 1),
(387, '2023-12-01 10:18:44.351968', '1', 'Receiving Email', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 46, 1),
(388, '2023-12-01 10:19:04.796009', '1', 'Receiving Email', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 46, 1),
(389, '2023-12-01 10:19:16.462385', '1', 'Receiving Email', 2, '[]', 46, 1),
(390, '2023-12-02 05:26:10.524812', '6', 'Shoes', 3, '', 18, 1),
(391, '2023-12-02 07:08:57.540084', '1', 'smtp.gmail.com', 1, '[{\"added\": {}}]', 47, 1),
(392, '2023-12-02 07:09:12.954644', '1', 'smtp.gmail.com', 2, '[]', 47, 1),
(393, '2023-12-02 08:08:45.230079', '1', 'smtp.gmail.com', 3, '', 47, 1),
(394, '2023-12-02 09:58:07.956053', '2', 'smtp.gmail.com', 1, '[{\"added\": {}}]', 47, 1),
(395, '2023-12-02 09:58:35.741827', '1', 'Receiving Email', 2, '[{\"changed\": {\"fields\": [\"Enqmail\"]}}]', 46, 1),
(396, '2023-12-04 05:09:44.655000', '1', 'Banner 1', 2, '[{\"changed\": {\"fields\": [\"Main img\"]}}]', 9, 1),
(397, '2023-12-04 05:15:26.531151', '1', 'GET TO KNOW US', 2, '[{\"changed\": {\"fields\": [\"Mask img\"]}}]', 12, 1),
(398, '2023-12-04 05:25:40.381158', '1', 'COMPANY OVERVIEW 4', 2, '[{\"changed\": {\"fields\": [\"Mask img\"]}}]', 11, 1),
(399, '2023-12-04 05:38:50.675705', '1', 'Home', 2, '[{\"changed\": {\"fields\": [\"Testimonial img\"]}}]', 43, 1),
(400, '2023-12-04 05:51:33.650939', '6', 'Ronald Richards', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 14, 1),
(401, '2023-12-04 05:53:28.155861', '4', 'Marvin McKinney', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 14, 1),
(402, '2023-12-04 05:54:02.192615', '2', 'Jenny Wilson', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 14, 1),
(403, '2023-12-04 05:54:30.304307', '2', 'Jenny Wilson', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 14, 1),
(404, '2023-12-04 05:54:40.564589', '1', 'Brooklyn Simmons', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 14, 1),
(405, '2023-12-04 06:13:22.949130', '1', 'All Page Banner 45', 2, '[{\"changed\": {\"fields\": [\"Bg banner\"]}}]', 44, 1),
(406, '2023-12-04 06:21:42.754791', '1', 'About Us', 2, '[{\"changed\": {\"fields\": [\"About img\"]}}]', 37, 1),
(407, '2023-12-04 06:24:22.191802', '1', 'About Us', 2, '[{\"changed\": {\"fields\": [\"Section4 img\"]}}]', 37, 1),
(408, '2023-12-04 06:28:57.904578', '1', 'WHAT SPECIALTY', 2, '[{\"changed\": {\"fields\": [\"Img three\"]}}]', 38, 1),
(409, '2023-12-04 06:33:44.225292', '4', 'Why Should Business Payroll Outsourcing', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 19, 1),
(410, '2023-12-04 06:40:30.806824', '3', 'Meet AutoManage, the best AI management tools Three', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 19, 1),
(411, '2023-12-04 06:42:45.250727', '1', 'Meet AutoManage, the best AI management tools One', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 19, 1),
(412, '2023-12-04 06:49:02.472217', '6', 'Alternative Career Options for Sales Professionals', 1, '[{\"added\": {}}]', 19, 1),
(413, '2023-12-04 06:49:52.399413', '7', 'Sales', 1, '[{\"added\": {}}]', 18, 1),
(414, '2023-12-04 06:50:01.968004', '6', 'Alternative Career Options for Sales Professionals', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 19, 1),
(415, '2023-12-04 06:50:10.796021', '4', 'Why Should Business Payroll Outsourcing', 2, '[{\"changed\": {\"fields\": [\"Author\"]}}]', 19, 1),
(416, '2023-12-04 06:50:16.972931', '3', 'Meet AutoManage, the best AI management tools Three', 2, '[{\"changed\": {\"fields\": [\"Author\"]}}]', 19, 1),
(417, '2023-12-04 06:50:24.175592', '1', 'Meet AutoManage, the best AI management tools One', 2, '[{\"changed\": {\"fields\": [\"Author\"]}}]', 19, 1),
(418, '2023-12-09 09:41:58.473274', '2', 'smtp.gmail.com', 2, '[]', 47, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'accounts', 'author'),
(46, 'accounts', 'emailsetting'),
(47, 'accounts', 'emailsmtp'),
(6, 'accounts', 'user'),
(7, 'accounts', 'userprofile'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(20, 'blog', 'blogcomment'),
(18, 'blog', 'category'),
(19, 'blog', 'post'),
(4, 'contenttypes', 'contenttype'),
(34, 'jobsapp', 'applicant'),
(21, 'jobsapp', 'city'),
(22, 'jobsapp', 'company'),
(23, 'jobsapp', 'country'),
(24, 'jobsapp', 'education'),
(25, 'jobsapp', 'experience'),
(33, 'jobsapp', 'job'),
(26, 'jobsapp', 'job_category'),
(32, 'jobsapp', 'job_role'),
(27, 'jobsapp', 'job_type'),
(35, 'jobsapp', 'position'),
(28, 'jobsapp', 'sector'),
(31, 'jobsapp', 'skill'),
(30, 'jobsapp', 'state'),
(29, 'jobsapp', 'work_mode'),
(37, 'myapp', 'about'),
(9, 'myapp', 'banner'),
(44, 'myapp', 'bg_banner'),
(17, 'myapp', 'brochure'),
(10, 'myapp', 'client'),
(11, 'myapp', 'company_overview'),
(39, 'myapp', 'contact'),
(45, 'myapp', 'counter'),
(40, 'myapp', 'feedback'),
(36, 'myapp', 'general'),
(43, 'myapp', 'home'),
(12, 'myapp', 'know_us'),
(13, 'myapp', 'services'),
(42, 'myapp', 'services_enquiry'),
(16, 'myapp', 'service_detail'),
(41, 'myapp', 'sevices_enquiry'),
(14, 'myapp', 'team'),
(15, 'myapp', 'testimonial'),
(38, 'myapp', 'what_specialty'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'accounts', '0001_initial', '2023-10-17 04:42:23.987795'),
(2, 'contenttypes', '0001_initial', '2023-10-17 04:42:25.032032'),
(3, 'admin', '0001_initial', '2023-10-17 04:42:28.437358'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-10-17 04:42:28.526380'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-17 04:42:28.621442'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-10-17 04:42:29.740536'),
(7, 'auth', '0001_initial', '2023-10-17 04:42:37.859580'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-10-17 04:42:39.925574'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-10-17 04:42:39.960314'),
(10, 'auth', '0004_alter_user_username_opts', '2023-10-17 04:42:39.994436'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-10-17 04:42:40.116072'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-10-17 04:42:40.205664'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-10-17 04:42:40.257710'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-10-17 04:42:40.372813'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-10-17 04:42:40.506658'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-10-17 04:42:40.705195'),
(17, 'auth', '0011_update_proxy_permissions', '2023-10-17 04:42:40.770810'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-10-17 04:42:40.844817'),
(19, 'blog', '0001_initial', '2023-10-17 04:42:50.211303'),
(20, 'jobsapp', '0001_initial', '2023-10-17 04:43:44.294742'),
(21, 'myapp', '0001_initial', '2023-10-17 04:43:53.129955'),
(22, 'sessions', '0001_initial', '2023-10-17 04:43:54.061091'),
(23, 'jobsapp', '0002_job_experience', '2023-10-17 04:53:37.397369'),
(24, 'jobsapp', '0002_remove_applicant_applicant_skills_and_more', '2023-10-17 06:25:07.903688'),
(25, 'jobsapp', '0002_alter_position_name', '2023-10-17 06:30:30.843265'),
(26, 'jobsapp', '0002_alter_country_country_name_alter_state_state_name', '2023-10-17 06:39:05.141473'),
(27, 'jobsapp', '0002_alter_applicant_job_name_alter_applicant_job_url', '2023-10-17 08:26:46.215992'),
(28, 'jobsapp', '0002_remove_applicant_skills_applicant_skills', '2023-10-18 08:44:23.339318'),
(29, 'jobsapp', '0003_job_category_slug', '2023-10-18 10:12:13.422142'),
(30, 'jobsapp', '0004_city_slug_company_slug_country_slug_education_slug_and_more', '2023-10-18 10:16:43.181997'),
(31, 'jobsapp', '0002_alter_job_job_type', '2023-10-20 08:49:19.717233'),
(32, 'myapp', '0002_general', '2023-10-21 06:09:57.283432'),
(33, 'myapp', '0003_general_footer_logo', '2023-10-21 06:13:51.187867'),
(34, 'myapp', '0004_about_what_specialty', '2023-10-21 10:26:54.133803'),
(35, 'myapp', '0002_feedback', '2023-10-23 06:21:40.891903'),
(36, 'myapp', '0003_sevices_enquiry', '2023-10-23 07:24:33.210836'),
(37, 'myapp', '0002_about_bg_banner', '2023-10-23 09:08:13.003897'),
(38, 'myapp', '0003_home', '2023-10-23 09:32:35.933958'),
(39, 'myapp', '0004_remove_home_bg_banner', '2023-10-23 09:34:59.847273'),
(40, 'myapp', '0005_alter_home_blog_description_alter_home_blog_subtitle_and_more', '2023-10-23 09:59:29.117362'),
(41, 'myapp', '0006_bg_banner_counter', '2023-10-23 10:16:18.029583'),
(42, 'myapp', '0007_counter_data_count3_alter_counter_data_count2', '2023-10-23 10:23:59.556168'),
(43, 'jobsapp', '0002_alter_applicant_resume', '2023-10-23 15:56:40.546579'),
(44, 'myapp', '0008_alter_contact_options', '2023-10-23 15:56:40.598235'),
(45, 'myapp', '0009_alter_service_detail_services1_name_and_more', '2023-11-24 09:12:48.024130'),
(46, 'accounts', '0002_emailsetting', '2023-12-01 09:37:04.146665'),
(47, 'accounts', '0003_emailsmtp', '2023-12-02 07:05:46.442917');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5jir7zwj15edxqym4qe846eprmlx9yk4', '.eJxVjDsOwjAQBe_iGlnJ2vGHkj5nsHbXNg4gR4qTCnF3EikFtG9m3lsE3NYStpaWMEVxFb24_G6E_Ez1APGB9T5Lnuu6TCQPRZ60yXGO6XU73b-Dgq3stSI3EIA2kNUAKgEbbTxyH7Vl63JmsruhODlvjAVHrDvoMmWPSNmKzxfTeDgQ:1tjxuY:BlY9tsPHmxBsHh61cjuDrek6SdJ06EO01EzRqzDAobc', '2025-03-03 09:59:34.446282'),
('6vniairodfq458cf0e0lijqw98gkm7i2', '.eJxVjDsOwjAQBe_iGlnJ2vGHkj5nsHbXNg4gR4qTCnF3EikFtG9m3lsE3NYStpaWMEVxFb24_G6E_Ez1APGB9T5Lnuu6TCQPRZ60yXGO6XU73b-Dgq3stSI3EIA2kNUAKgEbbTxyH7Vl63JmsruhODlvjAVHrDvoMmWPSNmKzxfTeDgQ:1tBApk:eD4L2gR4RKkFVDLB0JjjQDocLHTiGtgls1Ij5YjonNI', '2024-11-27 10:42:48.317745'),
('cjw85cjcf9a8u8jxvsbrwvpx2dxnx8ny', '.eJxVjDsOwjAQBe_iGlnJ2vGHkj5nsHbXNg4gR4qTCnF3EikFtG9m3lsE3NYStpaWMEVxFb24_G6E_Ez1APGB9T5Lnuu6TCQPRZ60yXGO6XU73b-Dgq3stSI3EIA2kNUAKgEbbTxyH7Vl63JmsruhODlvjAVHrDvoMmWPSNmKzxfTeDgQ:1r6On3:NmMRf5TnSAjVnGLy55-NAIBPo7wLFYRKdrTECu3dydA', '2023-12-08 05:31:45.716421'),
('kpx6legwrvl6fm4fnxsilpullvylij4t', '.eJxVjDsOwjAQBe_iGlnJ2vGHkj5nsHbXNg4gR4qTCnF3EikFtG9m3lsE3NYStpaWMEVxFb24_G6E_Ez1APGB9T5Lnuu6TCQPRZ60yXGO6XU73b-Dgq3stSI3EIA2kNUAKgEbbTxyH7Vl63JmsruhODlvjAVHrDvoMmWPSNmKzxfTeDgQ:1rA15C:MCaG-wek_HgwwzThodoCJ61UEo-mt1LJB1gaNywSwnw', '2023-12-18 05:01:26.070879'),
('qgsi395k27zu4ehibjijdjvmxjgs5hic', '.eJxVjDsOwjAQBe_iGlnJ2vGHkj5nsHbXNg4gR4qTCnF3EikFtG9m3lsE3NYStpaWMEVxFb24_G6E_Ez1APGB9T5Lnuu6TCQPRZ60yXGO6XU73b-Dgq3stSI3EIA2kNUAKgEbbTxyH7Vl63JmsruhODlvjAVHrDvoMmWPSNmKzxfTeDgQ:1r90Zx:MezeSu_vJAq2oZkedIz8mJOZ_ijwL_a3LgiZyGryfZQ', '2023-12-15 10:17:01.137917'),
('s4vx10gxuukot8yc48hzc7dwci9m1uyd', '.eJxVjDsOwjAQBe_iGlnJ2vGHkj5nsHbXNg4gR4qTCnF3EikFtG9m3lsE3NYStpaWMEVxFb24_G6E_Ez1APGB9T5Lnuu6TCQPRZ60yXGO6XU73b-Dgq3stSI3EIA2kNUAKgEbbTxyH7Vl63JmsruhODlvjAVHrDvoMmWPSNmKzxfTeDgQ:1tjyKv:41ITHGRokDMDxmwZNzhMJS-mNR_xlQDBB69NGH5OncQ', '2025-03-03 10:26:49.350039'),
('sxmx2l7ai0jp66xxxa8m6j2fvyqbayhz', '.eJxVjDsOwjAQBe_iGlnJ2vGHkj5nsHbXNg4gR4qTCnF3EikFtG9m3lsE3NYStpaWMEVxFb24_G6E_Ez1APGB9T5Lnuu6TCQPRZ60yXGO6XU73b-Dgq3stSI3EIA2kNUAKgEbbTxyH7Vl63JmsruhODlvjAVHrDvoMmWPSNmKzxfTeDgQ:1r6mBe:u3tg6AEabZMtM5Y7mfgCPdlhQUhSnGVXQnJQigL3aZI', '2023-12-09 06:30:42.409468'),
('v00wap0t9lb153x5arkc69vfv1pcycrf', '.eJxVjDsOwjAQBe_iGlnJ2vGHkj5nsHbXNg4gR4qTCnF3EikFtG9m3lsE3NYStpaWMEVxFb24_G6E_Ez1APGB9T5Lnuu6TCQPRZ60yXGO6XU73b-Dgq3stSI3EIA2kNUAKgEbbTxyH7Vl63JmsruhODlvjAVHrDvoMmWPSNmKzxfTeDgQ:1qvB4k:57cy541Up8kFniMFyJSFpNYlHDb9QBpKOd2DC0AasAU', '2023-11-07 06:39:38.413162');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_applicant`
--

CREATE TABLE `jobsapp_applicant` (
  `id` bigint NOT NULL,
  `job_id` bigint NOT NULL,
  `job_name` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `job_url` varchar(700) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `applicant_phone` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `applicant_position_id` bigint DEFAULT NULL,
  `qualification` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `employee_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `working_experience_id` bigint DEFAULT NULL,
  `applicant_country` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `applicant_state` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `applicant_city` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `applicant_address` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `cover_letter` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `resume` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `applicant_location` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `current_ctc` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `is_relocated` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_company_designation` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `last_company_name` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `last_ctc` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `skills` longtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_applicant`
--

INSERT INTO `jobsapp_applicant` (`id`, `job_id`, `job_name`, `job_url`, `first_name`, `last_name`, `email`, `gender`, `applicant_phone`, `applicant_position_id`, `qualification`, `employee_type`, `working_experience_id`, `applicant_country`, `applicant_state`, `applicant_city`, `applicant_address`, `cover_letter`, `resume`, `applicant_location`, `current_ctc`, `is_relocated`, `last_company_designation`, `last_company_name`, `last_ctc`, `user_id`, `updated_on`, `created_on`, `status`, `skills`) VALUES
(63, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Jitendara', 'Yadav', 'darpankario@gmail.com', 'male', '08879450470', 3, 'B.Tech in Computer Science', 'fresher', 2, 'India', 'Maharashtra', 'Mumbai', '23, Ganesh Society, Hanuman Nagar, Ghatkopar', 'Hello this is a test mail', 'doc/wordpress_website_Development_Tutorials.docx', 'Mumbai', '', 'no', '', '', '', 1, '2023-10-24 06:53:07.310751', '2023-10-24 12:23:07.195299', 0, 'HTML, CSS, JavaScript, Python'),
(64, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Jitendara', 'Yadav', 'darpankario@gmail.com', 'male', '08879450470', 3, 'B.Tech in Computer Science', 'fresher', 2, 'India', 'Maharashtra', 'Mumbai', '23, Ganesh Society, Hanuman Nagar, Ghatkopar', 'Hello this a test mail', 'doc/wordpress_website_Development_Tutorials_DYWiAQS.docx', 'Mumbai', '', 'no', '', '', '', 1, '2023-10-24 08:17:06.232001', '2023-10-24 13:47:06.035861', 0, 'HTML, CSS, JavaScript, Python, Php'),
(65, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Dharmendra', 'Yadav', 'darpankario@gmail.com', 'male', '08879450470', 3, 'B.Tech in Computer Science', 'fresher', 2, 'India', 'Maharashtra', 'Mumbai', '23, Ganesh Society, Hanuman Nagar, Ghatkopar', 'Hello This is test mail', 'doc/wordpress_website_Development_Tutorials_chWAvnA.docx', 'Mumbai', '', 'yes', '', '', '', 1, '2023-10-26 04:41:57.635120', '2023-10-26 10:11:57.349529', 0, 'HTML, CSS, JavaScript'),
(67, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Dharmendra', 'Yadav', 'darpankario@gmail.com', 'male', '08879450470', 3, 'B.Tech in Computer Science', 'experienced', 4, 'India', 'Maharashtra', 'Mumbai', '23, Ganesh Society, Hanuman Nagar, Ghatkopar', 'dd', 'doc/wordpress_website_Development_Tutorials_pWwfCum.docx', 'Mumbai', '240000', 'no', 'Deve', 'MYWEBCODE', '300000', 1, '2023-10-27 05:26:57.321608', '2023-10-27 10:56:57.304597', 0, 'ddd, hhj'),
(68, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Jitendara', 'Yadav', 'darpankario@gmail.com', 'male', '08879450470', 3, 'B.Tech in Computer Science', 'experienced', 4, 'India', 'Maharashtra', 'Mumbai', '23, Ganesh Society, Hanuman Nagar, Ghatkopar', 'dff', 'doc/wordpress_website_Development_Tutorials_xx3ABg7.docx', 'Mumbai', '240000', 'no', 'dev', 'MYWEBCODE', '300000', 1, '2023-10-27 05:30:15.307311', '2023-10-27 11:00:15.293301', 0, 'ddd'),
(69, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Jitendara', 'Yadav', 'darpankario@gmail.com', 'male', '08879450470', 3, 'B.Tech in Computer Science', 'fresher', 2, 'India', 'Maharashtra', 'Mumbai', '23, Ganesh Society, Hanuman Nagar, Ghatkopar', 'xx', 'doc/wordpress_website_Development_Tutorials_aLVJ7oq.docx', 'Mumbai', '', 'yes', '', '', '', 1, '2023-10-27 05:35:07.407540', '2023-10-27 11:05:07.115313', 0, 'xxx'),
(70, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Dharmendra', 'Yadav', 'darpankario@gmail.com', 'male', '08879450470', 3, 'B.Tech in Computer Science', 'fresher', 2, 'India', 'Maharashtra', 'Mumbai', '23, Ganesh Society, Hanuman Nagar, Ghatkopar', 'fgd', 'doc/wordpress_website_Development_Tutorials_ZDROvlh.docx', 'Mumbai', '', 'no', '', '', '', 1, '2023-10-27 05:42:15.227762', '2023-10-27 11:12:15.197741', 0, 'html'),
(71, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Jitendara', 'Yadav', 'darpankario@gmail.com', 'male', '08879450470', 3, 'B.Tech in Computer Science', 'experienced', 4, 'India', 'Maharashtra', 'Mumbai', '23, Ganesh Society, Hanuman Nagar, Ghatkopar', 'Cdjdk', 'doc/wordpress_website_Development_Tutorials_U1oVfi2.docx', 'Mumbai', '340000', 'no', 'Sr. Web Developer', '', '300000', 1, '2023-10-27 05:45:54.293350', '2023-10-27 11:15:54.279342', 0, 'html, css, javascript'),
(72, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Dharmendra', 'Yadav', 'dharmendrayadav076@gmail.com', 'male', '+919452428546', 4, 'B.Tech in Computer Science', 'experienced', 5, 'India', 'UP', 'Jaunpur', 'Kathawatiya Prithavipur Jaunpur', '', 'doc/wordpress_website_Development_Tutorials_kXph0A8.docx', 'Mumbai', '', 'yes', 'Sr. Web Developer', '', '', 1, '2023-11-25 04:07:59.259388', '2023-10-27 11:43:01.000000', 0, 'PHP, HTML5, CSS3, Python, JavaScript'),
(73, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Jitendara', 'Yadav', 'darpankario@gmail.com', 'male', '08879450470', 3, 'B.Tech in Computer Science', 'fresher', 2, 'India', 'Maharashtra', 'Mumbai', '23, Ganesh Society, Hanuman Nagar, Ghatkopar', 'Hello Sir', 'doc/wordpress_website_Development_Tutorials_8wvo7lF.docx', 'Mumbai', '', 'no', '', '', '', 1, '2023-10-27 07:04:19.395626', '2023-10-27 12:34:18.604549', 0, 'Html, css, JavaScript'),
(74, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Dharmendra', 'Yadav', 'darpankario@gmail.com', 'male', '08879450470', 3, 'B.Tech in Computer Science', 'fresher', 2, 'India', 'Maharashtra', 'Mumbai', '23, Ganesh Society, Hanuman Nagar, Ghatkopar', 'ffh', 'doc/wordpress_website_Development_Tutorials_IgZcog0.docx', 'Mumbai', '', 'yes', '', '', '', 1, '2023-10-27 07:21:31.330483', '2023-10-27 12:51:31.315473', 0, 'dhtml'),
(75, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Jitendara', 'Yadav', 'darpankario@gmail.com', 'male', '08879450470', 3, 'B.Tech in Computer Science', 'fresher', 3, 'India', 'Maharashtra', 'Mumbai', '23, Ganesh Society, Hanuman Nagar, Ghatkopar', 'Hello this is test mail', 'doc/wordpress_website_Development_Tutorials_OqLlmj5.docx', 'Mumbai', '', 'no', '', '', '', 1, '2023-10-27 07:28:19.483444', '2023-10-27 12:58:19.472436', 0, 'HTML'),
(76, 3, 'Python/Django Developer', 'pythondjango-developer-3', 'Dharmendra', 'dharmendrayadav076@gmail.com', 'dharmendrayadav076@gmail.com', 'male', '+919452428546', 3, 'B.Tech in Computer Science', 'fresher', 2, 'India', 'UP', 'Jaunpur', 'Kathawatiya Prithavipur Jaunpur', 'Hello Mini', 'doc/wordpress_website_Development_Tutorials_6XzFvBo.docx', 'Mumbai', '', 'yes', '', '', '', 0, '2023-12-01 10:15:16.419658', '2023-12-01 15:45:16.325562', 0, 'html, css');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_city`
--

CREATE TABLE `jobsapp_city` (
  `id` bigint NOT NULL,
  `city_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `state_id` bigint NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_city`
--

INSERT INTO `jobsapp_city` (`id`, `city_name`, `photo`, `created_on`, `updated_on`, `status`, `state_id`, `slug`) VALUES
(1, 'Jaunpur', '', '2023-10-17 06:43:06.000000', '2023-11-25 06:50:21.691045', 1, 1, 'jaunpur'),
(2, 'Lucknow', '', '2023-10-17 06:43:15.000000', '2023-11-25 06:50:10.523737', 1, 1, 'lucknow'),
(3, 'Varanasi', '', '2023-10-17 06:43:26.000000', '2023-11-25 06:49:58.983815', 1, 1, 'varanasi'),
(4, 'Mumbai', '', '2023-10-17 06:43:38.000000', '2023-11-25 06:49:46.503938', 1, 2, 'mumbai'),
(5, 'Thane', '', '2023-10-17 06:43:46.000000', '2023-11-25 06:49:36.967010', 1, 2, 'thane'),
(6, 'Navi Mumbai', '', '2023-10-17 06:43:55.000000', '2023-11-25 06:49:27.428700', 1, 2, 'navi-mumbai'),
(7, 'Palghar', '', '2023-10-17 06:44:03.000000', '2023-11-25 06:49:12.524852', 1, 2, 'palghar'),
(9, 'Bhadohi', '', '2023-11-27 09:36:35.178848', '2023-11-27 09:44:05.371296', 1, 1, 'bhadohi');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_company`
--

CREATE TABLE `jobsapp_company` (
  `id` bigint NOT NULL,
  `company_name` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `company_logo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `website_url` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `city_id` bigint DEFAULT NULL,
  `country_id` bigint DEFAULT NULL,
  `state_id` bigint DEFAULT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_company`
--

INSERT INTO `jobsapp_company` (`id`, `company_name`, `company_logo`, `email`, `phone`, `website_url`, `address`, `created_on`, `updated_on`, `status`, `city_id`, `country_id`, `state_id`, `slug`) VALUES
(1, 'AdvertSneak Technologies', 'company/2023/10/17/logo.png', 'info@advertsneak.com', '+917977515433', 'https://www.advertsneak.com', 'Veena Nagar, Mulund (w), Mumbai, Maharashtra', '2023-10-17 06:55:25.000000', '2023-10-17 06:57:56.186372', 1, 4, 5, 2, NULL),
(2, 'Intelligent Outsourcing Inc', 'company/2023/10/20/Mohali.jpg', 'info@intelligentoutsourcing.co.uk', '(+44) 1892280127', 'https://intelligentoutsourcing.co.uk/', 'Unit B12 Pine Grove Enterprise Centre Pine Grove', '2023-10-20 06:35:54.000000', '2023-11-28 08:12:08.585459', 1, 6, 5, 3, 'intelligent-outsourcing-inc');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_company_sector`
--

CREATE TABLE `jobsapp_company_sector` (
  `id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `sector_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_company_sector`
--

INSERT INTO `jobsapp_company_sector` (`id`, `company_id`, `sector_id`) VALUES
(1, 1, 1),
(2, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_country`
--

CREATE TABLE `jobsapp_country` (
  `id` bigint NOT NULL,
  `country_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `country_pic` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_country`
--

INSERT INTO `jobsapp_country` (`id`, `country_name`, `country_pic`, `created_on`, `updated_on`, `status`, `slug`) VALUES
(5, 'India', '', '2023-10-17 06:40:04.000000', '2023-11-25 06:46:36.679222', 1, 'india'),
(6, 'Pakistan', '', '2023-10-17 06:40:10.000000', '2023-11-25 06:46:26.153341', 1, 'pakistan'),
(9, 'United States', '', '2023-11-27 05:56:50.321660', '2023-11-27 05:56:50.399178', 1, 'united-states'),
(10, 'Russia', '', '2023-11-27 05:58:05.826493', '2023-11-27 06:36:27.018040', 1, 'russia');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_education`
--

CREATE TABLE `jobsapp_education` (
  `id` bigint NOT NULL,
  `education_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_education`
--

INSERT INTO `jobsapp_education` (`id`, `education_name`, `slug`) VALUES
(1, 'Bachelor Degree', NULL),
(2, '10th Pass', NULL),
(3, 'Any Graduate', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_experience`
--

CREATE TABLE `jobsapp_experience` (
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_experience`
--

INSERT INTO `jobsapp_experience` (`id`, `name`, `slug`) VALUES
(2, 'Fresher', NULL),
(3, 'Less than a year', NULL),
(4, '1 - 2 Years', NULL),
(5, '2 - 4 Year', NULL),
(7, '5 - 6 Years', '5-6-years');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_job`
--

CREATE TABLE `jobsapp_job` (
  `id` bigint NOT NULL,
  `job_title` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_uuid` char(32) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci,
  `company_description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `job_location` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `salary` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `website_url` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `last_date` datetime(6) NOT NULL,
  `filled` tinyint(1) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `Job_role_id` bigint DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `country_id` bigint DEFAULT NULL,
  `education_id` bigint DEFAULT NULL,
  `job_category_id` bigint NOT NULL,
  `job_type_id` bigint DEFAULT NULL,
  `sector_id` bigint DEFAULT NULL,
  `state_id` bigint DEFAULT NULL,
  `work_mode_id` bigint NOT NULL,
  `experience_id` bigint DEFAULT NULL,
  `number_of_job` int UNSIGNED DEFAULT NULL
) ;

--
-- Dumping data for table `jobsapp_job`
--

INSERT INTO `jobsapp_job` (`id`, `job_title`, `slug`, `job_uuid`, `description`, `company_description`, `job_location`, `salary`, `website_url`, `last_date`, `filled`, `created_on`, `updated_on`, `status`, `Job_role_id`, `city_id`, `company_id`, `country_id`, `education_id`, `job_category_id`, `job_type_id`, `sector_id`, `state_id`, `work_mode_id`, `experience_id`, `number_of_job`) VALUES
(2, 'Sr. Full Stack Developer', 'sr-full-stack-developer-2', 'ef32703c8d9c4cbba4f836ae957d87e6', '<p>Web Developer Analyst Events will be responsible for executing a comprehensive employee engagement program and performing related duties in line with the overall objectives of the department and the organization. The Analyst be responsible for executing activities related to event management, maintain employee relations, and conduct research and analysis.</p>', 'We provide niche services and solutions to the global Construction industry. We engage with clients to augment capabilities at multiple, critical service delivery stages ranging from test fitting, space planning, construction documentation, energy efficiency studies to 3D visualizations. Our domain', 'Veena Nagar, Mulund (w), Mumbai, Maharashtra', '₹4,00,000 - ₹10,00,000 a year', 'https://www.advertsneak.com', '2023-11-10 03:25:35.000000', 0, '2023-10-18 03:23:32.000000', '2023-10-18 17:51:24.018674', 1, 1, 4, 1, 5, 1, 1, 1, 1, 2, 1, 4, 5),
(3, 'Python/Django Developer', 'pythondjango-developer-3', 'c6b3c4b1fb5b4c26b702c4920803ecfb', '<p>We are looking for a Python Web Developer to develop and manage web application in Django. The candidate will develop all of the server-side logic, ensuring high performance and responsiveness to requests from the front-end.</p>\r\n\r\n<p>You will also be responsible for integrating the front-end elements built by your co-workers into the application; therefore, a basic understanding of front-end technologies is necessary as well.</p>\r\n\r\n<h3><strong>Responsibilities :</strong></h3>\r\n\r\n<p>- Design and implementation of low-latency, high-availability, and performance applications</p>\r\n\r\n<p>- Research and develop scripts</p>\r\n\r\n<p>- Writing reusable, testable, and efficient code</p>\r\n\r\n<p>- Integration of user-facing elements developed by front-end developers with server side logic</p>\r\n\r\n<p>- Implementation of security and data protection</p>\r\n\r\n<p>- Integration of data storage solutions</p>\r\n\r\n<p>Required Candidate profile</p>\r\n\r\n<h3><strong>Skills and Qualifications :</strong></h3>\r\n\r\n<p>- Expert in Python, with knowledge of at least one Python web framework such as Django, Flask, etc.</p>\r\n\r\n<p>- Familiarity with some ORM (Object Relational Mapper) libraries</p>\r\n\r\n<p>- Able to integrate multiple data sources and databases into one system</p>\r\n\r\n<p>- Understanding of the threading limitations of Python, and multi-process architecture</p>\r\n\r\n<p>- Good understanding of server-side templating languages (such as Jinja 2, Mako, etc )</p>\r\n\r\n<p>- Basic understanding of front-end technologies, such as JavaScript, HTML5, and CSS3</p>\r\n\r\n<p>- Understanding of accessibility and security compliance</p>\r\n\r\n<p>- Knowledge of user authentication and authorization between multiple systems, servers, and environments</p>\r\n\r\n<p>- Understanding of fundamental design principles behind a scalable application</p>\r\n\r\n<p>- Familiarity with event-driven programming in Python</p>\r\n\r\n<p>- Understanding of the differences between multiple delivery platforms, such as mobile vs desktop, and optimizing output to match the specific platform</p>\r\n\r\n<p>- Able to create database schemas that represent and support business processes</p>\r\n\r\n<p>- Strong unit test and debugging skills</p>\r\n\r\n<p>- Proficient understanding of GIT</p>\r\n\r\n<p><strong>Note:</strong> Only for candidates interested to work from office</p>', 'Expert in Python, with knowledge of at least one Python web framework such as Django, Flask, etc.', 'Mohali', '₹30,000.00 - ₹150,000.00 per month', 'https://www.advertsneak.com/', '2023-11-18 06:44:06.000000', 0, '2023-10-20 06:29:28.000000', '2023-10-20 06:46:55.143229', 1, 1, 5, 1, 5, 1, 2, 2, 3, 2, 2, 5, 5),
(4, 'Web Developer React', 'web-developer-react-none', '74479cfdd6d04123a6d1dfe5e1a11ce5', '<p>Web Developer React</p>', 'Web Developer React', 'Mohali', '₹4,00,000 - ₹10,00,000 a year', 'https://www.advertsneak.com', '2023-11-23 00:00:00.000000', 0, '2023-11-25 09:28:43.775719', '2023-11-25 09:28:43.831404', 1, 1, 3, 1, 5, 1, 1, 1, 2, 1, 1, 4, 12),
(5, 'Web Developer Node JS', 'web-developer-node-js-e44eadfe-41c0-4b00-ac02-5b7220dad39b', 'e44eadfe41c04b00ac025b7220dad39b', '<p>Web Developer Node JS</p>', 'Web Developer Node JS', 'Veena Nagar, Mulund (w), Mumbai, Maharashtra', '₹30,000.00 - ₹150,000.00 per month', 'https://www.advertsneak.com', '2023-12-14 00:00:00.000000', 0, '2023-11-25 10:51:21.000000', '2023-11-25 13:53:57.472683', 1, 1, 5, 1, 5, 1, 1, 1, 1, 2, 1, 3, 12),
(15, 'Software Developer Python', 'software-developer-python-de0740eb-c145-4bbc-91b3-dcd4f7a47ba6', 'de0740ebc1454bbc91b3dcd4f7a47ba6', '<p>Web Developer Analyst Events will be responsible for executing a comprehensive employee engagement program and performing related duties in line with the overall objectives of the department and the organization. The Analyst be responsible for executing activities related to event management, maintain employee relations, and conduct research and analysis.</p>', 'We provide niche services and solutions to the global Construction industry. We engage with clients to augment capabilities at multiple, critical service delivery stages ranging from test fitting, space planning, construction documentation, energy efficiency studies to 3D visualizations. Our domain', 'Veena Nagar, Mulund (w), Mumbai, Maharashtra', '₹4,00,000 - ₹10,00,000 a year', 'https://www.advertsneak.com', '2023-11-10 00:00:00.000000', 0, '2023-11-25 14:11:17.877066', '2023-11-25 14:16:18.481590', 1, 1, 4, 1, 5, 1, 1, 1, 1, 2, 1, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_job_category`
--

CREATE TABLE `jobsapp_job_category` (
  `id` bigint NOT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `sector_id` bigint NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_job_category`
--

INSERT INTO `jobsapp_job_category` (`id`, `category_name`, `created_on`, `updated_on`, `status`, `sector_id`, `slug`) VALUES
(1, 'Devops', '2023-10-17 06:49:08.000000', '2023-10-18 10:13:07.444544', 1, 1, 'devops'),
(2, 'Python Developer', '2023-10-17 06:50:06.000000', '2023-10-18 10:12:56.221304', 1, 2, 'python-developer');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_job_role`
--

CREATE TABLE `jobsapp_job_role` (
  `id` bigint NOT NULL,
  `role_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `sector_id` bigint NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_job_role`
--

INSERT INTO `jobsapp_job_role` (`id`, `role_name`, `created_on`, `updated_on`, `status`, `sector_id`, `slug`) VALUES
(1, 'Full Stack Developer', '2023-10-17 06:47:27.000000', '2023-10-17 06:47:41.251084', 1, 2, NULL),
(2, 'Web Designer', '2023-10-17 06:47:42.000000', '2023-10-17 06:48:04.167191', 1, 3, NULL),
(3, 'Backend Developer', '2023-10-17 06:48:06.000000', '2023-10-17 06:48:23.884942', 1, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_job_skills_required`
--

CREATE TABLE `jobsapp_job_skills_required` (
  `id` bigint NOT NULL,
  `job_id` bigint NOT NULL,
  `skill_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_job_skills_required`
--

INSERT INTO `jobsapp_job_skills_required` (`id`, `job_id`, `skill_id`) VALUES
(6, 2, 1),
(7, 2, 2),
(8, 2, 3),
(9, 2, 4),
(10, 2, 5),
(11, 3, 2),
(12, 3, 3),
(13, 3, 4),
(14, 3, 5),
(15, 3, 6),
(16, 4, 2),
(17, 4, 3),
(18, 5, 1),
(19, 5, 2),
(20, 5, 3),
(21, 5, 4),
(44, 15, 1),
(45, 15, 2),
(46, 15, 3),
(47, 15, 4),
(48, 15, 5);

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_job_type`
--

CREATE TABLE `jobsapp_job_type` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_job_type`
--

INSERT INTO `jobsapp_job_type` (`id`, `name`, `created_on`, `updated_on`, `status`, `slug`) VALUES
(1, 'Full time', '2023-10-17 06:48:34.000000', '2023-10-18 10:19:51.063245', 1, 'full-time'),
(2, 'Part Time', '2023-10-17 06:48:39.000000', '2023-10-18 10:19:33.065498', 1, 'part-time');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_position`
--

CREATE TABLE `jobsapp_position` (
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `job_id` bigint NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_position`
--

INSERT INTO `jobsapp_position` (`id`, `name`, `job_id`, `slug`) VALUES
(3, 'Fullstack', 2, 'fullstack'),
(4, 'Graphics Designer', 2, 'graphics-designer'),
(5, 'DevOPS', 3, 'devops'),
(6, 'Backend Developer', 3, 'backend-developer');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_sector`
--

CREATE TABLE `jobsapp_sector` (
  `id` bigint NOT NULL,
  `sector_name` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_sector`
--

INSERT INTO `jobsapp_sector` (`id`, `sector_name`, `created_on`, `updated_on`, `status`, `slug`) VALUES
(1, 'IT', '2023-10-17 06:44:37.000000', '2023-10-18 10:19:07.049572', 1, 'it'),
(2, 'Software', '2023-10-17 06:45:06.000000', '2023-10-18 10:18:57.328106', 1, 'software'),
(3, 'Web Development', '2023-10-17 06:45:15.000000', '2023-10-18 10:18:47.441100', 1, 'web-development'),
(4, 'Tech', '2023-10-17 06:45:37.000000', '2023-10-18 10:18:28.592946', 1, 'tech');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_skill`
--

CREATE TABLE `jobsapp_skill` (
  `id` bigint NOT NULL,
  `skill_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `job_category_id` bigint NOT NULL,
  `sector_id` bigint NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_skill`
--

INSERT INTO `jobsapp_skill` (`id`, `skill_name`, `job_category_id`, `sector_id`, `slug`) VALUES
(1, 'Php', 1, 1, NULL),
(2, 'HTML', 1, 1, NULL),
(3, 'Javascript', 1, 1, NULL),
(4, 'SQL', 1, 1, NULL),
(5, 'Git', 1, 1, NULL),
(6, 'Python', 2, 1, 'python');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_state`
--

CREATE TABLE `jobsapp_state` (
  `id` bigint NOT NULL,
  `state_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `country_id` bigint NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_state`
--

INSERT INTO `jobsapp_state` (`id`, `state_name`, `created_on`, `updated_on`, `status`, `country_id`, `slug`) VALUES
(1, 'Uttar Pradesh', '2023-10-17 06:41:32.000000', '2023-11-25 06:48:38.860388', 1, 5, 'uttar-pradesh'),
(2, 'Maharashtra', '2023-10-17 06:41:40.000000', '2023-11-25 06:48:22.337491', 1, 5, 'maharashtra'),
(3, 'Punjab', '2023-10-17 06:41:55.000000', '2023-11-25 06:48:05.789001', 1, 5, 'punjab'),
(4, 'Telangana', '2023-10-17 06:42:26.000000', '2023-11-25 06:47:56.155759', 1, 5, 'telangana'),
(5, 'Andhra Pradesh', '2023-10-17 06:42:34.000000', '2023-11-25 06:47:46.533805', 1, 5, 'andhra-pradesh'),
(6, 'Tamil Nadu', '2023-10-17 06:42:52.000000', '2023-11-27 09:02:37.147788', 1, 5, 'tamil-nadu');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapp_work_mode`
--

CREATE TABLE `jobsapp_work_mode` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `slug` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobsapp_work_mode`
--

INSERT INTO `jobsapp_work_mode` (`id`, `name`, `photo`, `created_on`, `updated_on`, `status`, `slug`) VALUES
(1, 'Remote', '', '2023-10-17 06:46:45.000000', '2023-10-17 06:46:48.811136', 1, NULL),
(2, 'Onsite', '', '2023-10-17 06:46:50.000000', '2023-10-17 06:47:06.782530', 1, NULL),
(3, 'Hybrid', '', '2023-10-17 06:47:08.000000', '2023-10-17 06:47:15.901385', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_about`
--

CREATE TABLE `myapp_about` (
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `heading_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `main_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `about_img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `inner_about` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `inner_about_3` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services1_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `services1_thumb` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services1_flaticon` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services1_content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `services2_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `services2_thumb` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services2_flaticon` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services2_content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `button_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `button_link` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `ceo_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `section3_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `section3_heading` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `section3_content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `section4_img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `meta_title` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `meta_description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `bg_banner` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_about`
--

INSERT INTO `myapp_about` (`id`, `name`, `heading_name`, `main_title`, `about_img`, `inner_about`, `inner_about_3`, `services1_name`, `services1_thumb`, `services1_flaticon`, `services1_content`, `services2_name`, `services2_thumb`, `services2_flaticon`, `services2_content`, `button_name`, `button_link`, `ceo_name`, `designation`, `section3_title`, `section3_heading`, `section3_content`, `section4_img`, `meta_title`, `meta_description`, `meta_keywords`, `description`, `created_on`, `updated_on`, `status`, `bg_banner`) VALUES
(1, 'About Us', 'GET TO KNOW MORE', 'We Have More Than 20+ Years Of Practical Finance Industries', 'about/2023/12/04/inner_about_img034.jpg', 'about/2023/10/21/inner_about_img04.jpg', 'about/2023/10/21/about_author.png', 'Business Growth', '', 'flaticon-business-presentation', 'Finance helps you to convert into a strategic asset get.', 'Finance Investment', '', 'flaticon-investment', 'Finance helps you to convert into a strategic asset get.', 'Our Services', '', 'Mark Stranger', 'CEO, Gerow Finance', 'SKILLED TEAM MEMBERS', 'Meet Our Dedicated Team', 'Ever find yourself staring at your computer screen a good consulting slogan to come to mind? Oftentimes.', 'about/2023/12/04/h3_testimonial_img56.jpg', 'About Us Page', 'About Us', 'About Us', '<p>With over 25 years of experience, we have crafted thousands of Strategic discovery process that enables us to peelback thousands which enable us to understand.</p>', '2023-10-21 10:29:43.000000', '2023-12-04 06:24:22.128873', 1, 'photos/banner/breadcrumb_bg_OQNV6lr.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_banner`
--

CREATE TABLE `myapp_banner` (
  `id` bigint NOT NULL,
  `banner_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `main_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `main_img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `img_two` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `img_three` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bshape_1` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bshape_2` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_banner`
--

INSERT INTO `myapp_banner` (`id`, `banner_name`, `main_title`, `description`, `main_img`, `img_two`, `img_three`, `bshape_1`, `bshape_2`, `created_on`, `updated_on`, `status`) VALUES
(1, 'Banner 1', 'Need Business Consultation Today', 'Agilos helps you to convert your data into a strategic asset and get top-notch business insights.', 'banner/2023/12/04/job-consultancy-01.jpg', 'banner/2023/10/19/h3_banner_img02.jpg', 'banner/2023/10/19/h3_banner_img03.jpg', 'banner/2023/10/19/h3_banner_shape01.png', 'banner/2023/10/19/h3_banner_shape02.png', '2023-10-19 04:28:33.000000', '2023-12-04 05:09:44.632839', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_bg_banner`
--

CREATE TABLE `myapp_bg_banner` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bg_banner` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_bg_banner`
--

INSERT INTO `myapp_bg_banner` (`id`, `name`, `bg_banner`, `title`, `created_on`, `updated_on`, `status`) VALUES
(1, 'All Page Banner 45', 'photos/banner/page_bg_banner.jpg', 'Banner For Pages', '2023-10-23 10:27:11.000000', '2023-12-04 06:13:22.867059', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_brochure`
--

CREATE TABLE `myapp_brochure` (
  `id` bigint NOT NULL,
  `brochure_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `brochure_file_link` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `services_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `myapp_client`
--

CREATE TABLE `myapp_client` (
  `id` bigint NOT NULL,
  `client_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `client_Logo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `client_website` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_client`
--

INSERT INTO `myapp_client` (`id`, `client_name`, `client_Logo`, `client_website`, `created_on`, `updated_on`, `status`) VALUES
(1, 'Brand 1', 'photos/clients/brand_img01.png', 'https://www.advertsneak.com/', '2023-10-19 04:34:05.000000', '2023-10-19 04:34:27.559966', 1),
(2, 'Brand 2', 'photos/clients/brand_img02.png', '', '2023-10-19 04:34:29.000000', '2023-10-19 04:34:40.986326', 1),
(3, 'Brand 3', 'photos/clients/brand_img03.png', '', '2023-10-19 04:34:42.000000', '2023-10-19 04:34:54.392641', 1),
(4, 'Brand 4', 'photos/clients/brand_img04.png', '', '2023-10-19 04:34:56.000000', '2023-10-19 04:35:07.391609', 1),
(5, 'Brand 5', 'photos/clients/brand_img05.png', '', '2023-10-19 04:35:08.000000', '2023-10-19 04:35:18.780041', 1),
(6, 'Brand 6', 'photos/clients/brand_img03_tNjH32f.png', 'https://www.advertsneak.com/', '2023-10-19 04:35:28.000000', '2023-11-30 04:54:48.978668', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_company_overview`
--

CREATE TABLE `myapp_company_overview` (
  `id` bigint NOT NULL,
  `heading_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `main_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `mask_img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `img_two` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bshape_1` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bshape_2` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services1_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `progressbar_1` int NOT NULL,
  `services2_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `progressbar_2` int NOT NULL,
  `services3_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `progressbar_3` int NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_company_overview`
--

INSERT INTO `myapp_company_overview` (`id`, `heading_name`, `main_title`, `description`, `mask_img`, `img_two`, `bshape_1`, `bshape_2`, `services1_name`, `progressbar_1`, `services2_name`, `progressbar_2`, `services3_name`, `progressbar_3`, `created_on`, `updated_on`, `status`) VALUES
(1, 'COMPANY OVERVIEW 4', 'We Prepare An Effective Strategy For Companies', '<p>Morem ipsum dolor sit amet, consectetur adipiscing elita florai psum dolor sit amet, consecteture.</p>', 'home/2023/12/04/2h3_overview_img01.jpg', 'home/2023/10/21/h3_overview_img02.jpg', 'home/2023/10/21/h3_overview_shape01.png', 'home/2023/10/21/h3_overview_shape02.png', 'Business Growth', 85, 'Investment', 76, 'Investment', 90, '2023-10-21 09:33:40.000000', '2023-12-04 05:25:40.345246', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_contact`
--

CREATE TABLE `myapp_contact` (
  `id` bigint NOT NULL,
  `page_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `meta_title` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `meta_description` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `meta_keywords` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `bg_banner` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `get_in_touch_title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_no1` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_no2` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email1` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email2` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `address2` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_contact`
--

INSERT INTO `myapp_contact` (`id`, `page_name`, `meta_title`, `meta_description`, `meta_keywords`, `bg_banner`, `get_in_touch_title`, `phone_no1`, `phone_no2`, `email1`, `email2`, `address1`, `address2`, `created_on`, `updated_on`, `status`) VALUES
(1, 'Contact Us', '', '', '', 'photos/banner/breadcrumb_bg.jpg', 'Get in touch with us', '+91-7977515433', '917977515433', 'info@advertsneak.com', '', 'Veena Nagar, Mulund (w), Mumbai, Maharashtra', '', '2023-10-23 06:02:04.000000', '2023-11-30 10:59:22.530425', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_counter`
--

CREATE TABLE `myapp_counter` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `counter_item1` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `data_count1` int NOT NULL,
  `counter_item2` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `counter_item3` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `data_count2` int NOT NULL,
  `counter_item4` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `data_count4` int NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `data_count3` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_counter`
--

INSERT INTO `myapp_counter` (`id`, `name`, `counter_item1`, `data_count1`, `counter_item2`, `counter_item3`, `data_count2`, `counter_item4`, `data_count4`, `created_on`, `updated_on`, `status`, `data_count3`) VALUES
(1, 'homecounter', 'Success Rate', 95, 'Complete Projects', 'Satisfied Clients', 55, 'Trade In The World', 15, '2023-10-23 10:17:18.000000', '2023-11-30 09:39:05.320630', 1, 25);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_feedback`
--

CREATE TABLE `myapp_feedback` (
  `id` bigint NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(18) COLLATE utf8mb4_general_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `create_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_feedback`
--

INSERT INTO `myapp_feedback` (`id`, `full_name`, `subject`, `email`, `phone`, `message`, `create_date`) VALUES
(1, 'Dharmendra Kumar', 'Terminal Web Hosting', 'advertsneak45@gmail.com', '09452428546', 'Veena Nagar, Mulund (w), Mumbai, Maharashtra', '2023-10-23 12:12:07.560375'),
(2, 'Dharmendra Yadav', 'Test Mail', 'darpankario@gmail.com', '+919452428546', 'Hello Dharmendra', '2023-11-24 12:07:29.000000'),
(3, 'Dharmendra Yadav', 'Test Mail', 'dharmendrayadav076@gmail.com', '09452428546', 'Request Free Consultation', '2023-12-01 15:40:56.994290'),
(4, 'Dharmendra Yadav', 'Test Mail', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-02 15:28:51.449271'),
(5, 'Dharmendra Yadav', 'Test Mail', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-02 15:29:32.372770'),
(6, 'Dharmendra Yadav', 'Test Mail', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-02 15:31:18.303598'),
(7, 'Dharmendra Yadav', 'Test Mail', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-02 15:34:54.453808'),
(8, 'Dharmendra Yadav', 'Test Mail', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-02 15:35:54.356143'),
(9, 'Dharmendra Yadav', 'Test Mail', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-02 15:36:13.367571'),
(10, 'Dharmendra Yadav', 'Test Mail', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-02 15:37:08.790229'),
(11, 'Dharmendra Yadav', '', 'dharmendrayadav076@gmail.com', '09452428546', 'hello', '2023-12-09 16:28:37.344121'),
(12, 'Dharmendra Yadav', '', 'dharmendrayadav076@gmail.com', '09452428546', 'hello', '2023-12-09 16:29:22.834420'),
(13, 'Dharmendra Yadav', '', 'dharmendrayadav076@gmail.com', '09452428546', 'hello', '2023-12-09 16:46:11.446289'),
(14, 'Dharmendra Yadav', '', 'dharmendrayadav076@gmail.com', '09452428546', 'hello', '2023-12-09 16:46:51.712868'),
(15, 'Dharmendra Yadav', '', 'dharmendrayadav076@gmail.com', '09452428546', 'hello', '2023-12-09 16:47:16.517567'),
(16, 'Dharmendra Yadav', '', 'dharmendrayadav076@gmail.com', '09452428546', 'hello', '2023-12-09 16:51:30.936606'),
(17, 'Dharmendra Yadav', 'Test Mail', 'dharmendrayadav076@gmail.com', '09452428546', 'Veena Nagar, Mulund (w), Mumbai, Maharashtra', '2023-12-09 17:09:07.760377'),
(18, 'Dharmendra Yadav', 'Test Mail', 'dharmendrayadav076@gmail.com', '09452428546', 'ffg', '2023-12-09 17:30:19.690792'),
(19, 'Dharmendra Yadav', 'Terminal Web Hosting', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-09 17:32:37.811531'),
(20, 'Dharmendra Yadav', 'Terminal Web Hosting', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-09 17:33:09.638055'),
(21, 'Dharmendra Yadav', 'Terminal Web Hosting', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-09 17:33:27.792773'),
(22, 'Dharmendra Yadav', 'Terminal Web Hosting', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-09 17:34:10.765710'),
(23, 'Dharmendra Yadav', 'Terminal Web Hosting', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-09 17:36:45.259433'),
(24, 'Dharmendra Yadav', 'Terminal Web Hosting', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-09 17:36:58.894589'),
(25, 'Dharmendra Yadav', 'Terminal Web Hosting', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-09 17:37:12.855024'),
(26, 'Dharmendra Yadav', 'Terminal Web Hosting', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-09 17:40:10.680151'),
(27, 'Dharmendra Yadav', 'Terminal Web Hosting', 'dharmendrayadav076@gmail.com', '09452428546', 'Our Office Address', '2023-12-09 17:43:50.904606'),
(28, 'Eric Jones', 'Turn Surf-Surf-Surf into Talk Talk Talk', 'ericjonesmyemail@gmail.com', '555-555-1212', 'Dear epitomeconsultancy.com Administrator! my name’s Eric and I just ran across your website at epitomeconsultancy.com...\r\n\r\nI found it after a quick search, so your SEO’s working out…\r\n\r\nContent looks pretty good…\r\n\r\nOne thing’s missing though…\r\n\r\nA QUICK, EASY way to connect with you NOW.\r\n\r\nBecause studies show that a web lead like me will only hang out a few seconds – 7 out of 10 disappear almost instantly, Surf Surf Surf… then gone forever.\r\n\r\nI have the solution:\r\n\r\nWeb Visitors Into Leads is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  You’ll know immediately they’re interested and you can call them directly to TALK with them - literally while they’re still on the web looking at your site.\r\n\r\nCLICK HERE https://blazeleadgeneration.com to try out a Live Demo with Web Visitors Into Leads now to see exactly how it works and even give it a try… it could be huge for your business.\r\n\r\nPlus, now that you’ve got that phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation pronto… which is so powerful, because connecting with someone within the first 5 minutes is 100 times more effective than waiting 30 minutes or more later.\r\n\r\nThe new text messaging feature lets you follow up regularly with new offers, content links, even just follow up notes to build a relationship.\r\n\r\nEverything I’ve just described is extremely simple to implement, cost-effective, and profitable.\r\n \r\nCLICK HERE https://blazeleadgeneration.com to discover what Web Visitors Into Leads can do for your business, potentially converting up to 100X more eyeballs into leads today!\r\n\r\nEric\r\nPS: Web Visitors Into Leads offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE https://blazeleadgeneration.com to try Web Visitors Into Leads now.\r\n\r\nIf you\'d like to unsubscribe click here https://blazeleadgeneration.com/unsubscribe.aspx?d=epitomeconsultancy.com', '2024-11-14 07:06:47.785805'),
(29, 'Moshe Laidler', 'To the epitomeconsultancy.com Administrator.', 'moshe.laidler@gmail.com', '6644317321', 'Hello! If your business accepted Visa or Mastercard between 2004 and 2019, you may be eligible to claim thousands of dollars in compensation owed to you from a recent $5.53 billion class action settlement for Visa/ Mastercard charging you excess fee\'s. Note: You MUST be a USA based business to be eligible. This is your last chance to file your claim. Visit https://visasettlementclaims.org now to start your claim before it ends soon.', '2024-11-15 12:00:11.335156'),
(30, 'Tedcom', 'Hello  i am write about     price', 'axobajigufo34@gmail.com', '89731938662', 'হাই, আমি আপনার মূল্য জানতে চেয়েছিলাম.', '2024-11-16 16:56:52.308977'),
(31, 'Oscarcom', 'Aloha  i am wrote about your the prices', 'ebojajuje04@gmail.com', '89454735182', 'Hola, quería saber tu precio..', '2024-11-16 18:31:22.381405'),
(32, 'RoOresk', 'Hello', 'emilyjonesg89@gmail.com', '83632433729', 'Can I ask a quick question about your site? https://google.com/?Oresk \r\n \r\n \r\nRoOresk', '2024-11-16 20:54:56.321472'),
(33, 'Crawford', 'quick question', 'lilia.ginn@gmail.com', '7815852441', 'Hi, this is a friendly reminder that this is the last chance for USA based businesses to file their claim to receive compensation from the Visa/Mastercard $5.5 Billion Dollar settlement. You could potentially receive tens of thousands, hundreds of thousands or even millions in compensation based on your usage. https://visasettlementclaim.org', '2024-11-17 04:34:57.471999'),
(34, 'Annacom', 'Hi    wrote about your   prices', 'somasesokiyo31@gmail.com', '88372856284', 'Hi, I wanted to know your price.', '2024-11-17 04:53:28.327641'),
(35, 'Conycom', 'Hallo, i am wrote about your the price', 'ibucezevuda439@gmail.com', '89388522851', 'Hæ, ég vildi vita verð þitt.', '2024-11-20 04:06:57.513730'),
(36, 'Robertcom', 'Hi  i am writing about   the price for reseller', 'ixutikob077@gmail.com', '83521811197', 'Ola, quería saber o seu prezo.', '2024-11-23 23:45:12.564940'),
(37, 'Arthurcom', 'Hi, i am wrote about your the price for reseller', 'ibucezevuda439@gmail.com', '82471275333', 'Ola, quería saber o seu prezo.', '2024-11-24 01:33:11.155202'),
(38, 'Eric Jones', 'Strike when the iron’s hot', 'ericjonesmyemail@gmail.com', '555-555-1212', 'Dear epitomeconsultancy.com Administrator! I just found your site, quick question…\r\n\r\nMy name’s Eric, I found epitomeconsultancy.com after doing a quick search – you showed up near the top of the rankings, so whatever you’re doing for SEO, looks like it’s working well.\r\n\r\nSo here’s my question – what happens AFTER someone lands on your site?  Anything?\r\n\r\nResearch tells us at least 70% of the people who find your site, after a quick once-over, they disappear… forever.\r\n\r\nThat means that all the work and effort you put into getting them to show up, goes down the tubes.\r\n\r\nWhy would you want all that good work – and the great site you’ve built – go to waste?\r\n\r\nBecause the odds are they’ll just skip over calling or even grabbing their phone, leaving you high and dry.\r\n\r\nBut here’s a thought… what if you could make it super-simple for someone to raise their hand, say, okay, let’s talk without requiring them to even pull their cell phone from their pocket?\r\n  \r\nYou can – thanks to revolutionary new software that can literally make that first call happen NOW.\r\n\r\nWeb Visitors Into Leads is a software widget that sits on your site, ready and waiting to capture any visitor’s Name, Email address and Phone Number.  It lets you know IMMEDIATELY – so that you can talk to that lead while they’re still there at your site.\r\n  \r\nYou know, strike when the iron’s hot!\r\n\r\nCLICK HERE https://blazeleadgeneration.com to try out a Live Demo with Web Visitors Into Leads now to see exactly how it works.\r\n\r\nWhen targeting leads, you HAVE to act fast – the difference between contacting someone within 5 minutes versus 30 minutes later is huge – like 100 times better!\r\n\r\nThat’s why you should check out our new SMS Text With Lead feature as well… once you’ve captured the phone number of the website visitor, you can automatically kick off a text message (SMS) conversation with them. \r\n \r\nImagine how powerful this could be – even if they don’t take you up on your offer immediately, you can stay in touch with them using text messages to make new offers, provide links to great content, and build your credibility.\r\n\r\nJust this alone could be a game changer to make your website even more effective.\r\n\r\nStrike when  the iron’s hot!\r\n\r\nCLICK HERE https://blazeleadgeneration.com to learn more about everything Web Visitors Into Leads can do for your business – you’ll be amazed.\r\n\r\nThanks and keep up the great work!\r\n\r\nEric\r\nPS: Web Visitors Into Leads offers a FREE 14 days trial – you could be converting up to 100x more leads immediately!   \r\nIt even includes International Long Distance Calling. \r\nStop wasting money chasing eyeballs that don’t turn into paying customers. \r\nCLICK HERE https://blazeleadgeneration.com to try Web Visitors Into Leads now.\r\n\r\nIf you\'d like to unsubscribe click here https://blazeleadgeneration.com/unsubscribe.aspx?d=epitomeconsultancy.com', '2024-11-24 04:49:16.152523'),
(39, 'Janecom', 'Hi, i wrote about your   prices', 'duqotayowud23@gmail.com', '85957922117', 'Xin chào, tôi muốn biết giá của bạn.', '2024-11-25 12:41:47.075755'),
(40, 'Phil Stewart', 'inquiring', 'noreplyhere@aol.com', '342-123-4456', 'Get the exposure your business deserves. We send your message to millions of website contact forms, bypassing the noise of traditional ads. Flat rate pricing, no extra fees. Start today.\r\n\r\n If you’re interested in learning more about how this works, reach out to me using the contact info below.\r\n\r\nRegards,\r\nCarson Alvarez\r\nEmail: Carson.Alvarez@morebiz.my\r\nWebsite: http://jg3c5y.form-submission-masters.ink\r\nSkype: marketingwithcontactforms', '2024-11-25 22:03:50.870276'),
(41, 'Shelli Casiano', 'need to know', 'casiano.shelli13@outlook.com', '329332658', 'Hi, this is a friendly reminder it\'s your last chance to file your claim for the ERC / Employee Retention Tax Credit. This is money set aside that\'s owed to you by the US Government, which reimburses you up to $32,200 per W2 you kept on payroll during the pandemic. This is your last chance to claim your money: https://claim-erc.net', '2024-11-26 22:01:04.801505'),
(42, 'Tedcom', 'Hello    write about your   price for reseller', 'axobajigufo34@gmail.com', '89172938385', 'Zdravo, htio sam znati vašu cijenu.', '2024-12-02 23:49:11.645033'),
(43, 'Islacom', 'Hi    writing about   the prices', 'yawiviseya67@gmail.com', '86114772752', 'Sawubona, bengifuna ukwazi intengo yakho.', '2024-12-03 16:16:13.929300'),
(44, 'Tedcom', 'Hello    write about     price for reseller', 'axobajigufo34@gmail.com', '82649242812', 'Hæ, ég vildi vita verð þitt.', '2024-12-04 08:07:51.606738'),
(45, 'Johncom', 'Hallo  i am wrote about     prices', 'somasesokiyo31@gmail.com', '81736376954', 'Hæ, ég vildi vita verð þitt.', '2024-12-04 08:48:34.307157'),
(46, 'Anthonycob', 'Реальный отзыв о автошколе', 'info@avtoshkola-s.ru', '88512974645', 'Выражаю огромную благодарность за доступное разъяснение ПДД инструктору Ткаченко Сергею Дмитриевичу!!! Сидишь дома читаешь - каша в голове. Приходишь в класс, так все доступно, понятно объяснит, разъяснит, все с юмором, на позитиве, что в голове все укладывается по полочкам, все на своих местах))) Администратор Кристина такая позитивная, отзывчивая девушка. Можно обратиться по любому вопросу, всегда поможет, расскажет, сориентирует. И, наконец, инструктор Андрей - позитивчик, ответит на любой вопрос, на понятном тебе языке) В целом, конечно очень положительное впечатление от учебного процесса. Я очень доволен!)))) \r\n<a href=\"https://www.autoschool163.ru/\">Лучшая онлайн автошкола</a>', '2024-12-05 08:30:58.466001'),
(47, 'Evelyn Hardee', 'Hello epitomeconsultancy.com Admin!', 'hardee.evelyn@gmail.com', '6342710487', 'Simplify Payments for Your Clients\r\nAre you losing potential clients due to high upfront costs? We provide flexible financing solutions through Client Financing (International) and Credee (Tier1 International), designed to make your services more accessible.\r\n\r\n������ Benefits:\r\n\r\nEasier client approvals\r\nIncreased conversions\r\nHassle-free setup\r\nStart today:\r\n\r\nInternational: https://info.clientfinancing.com?fpr=kristi86\r\nTier1 International: https://kristi-ventures.credee.net/\r\n������ Contact Kristi: KristiReed.Funding@gmail.com', '2024-12-05 13:22:05.433478'),
(48, 'Conycom', 'Hallo, i writing about     price', 'ibucezevuda439@gmail.com', '83351551637', 'Hi, ego volo scire vestri pretium.', '2024-12-09 13:11:44.091482'),
(49, 'Maryjo Ringler', 'looking for clarification', 'ringler.maryjo87@gmail.com', '785071570', 'Want to get your message in front of millions of potential customers? Our service can help. By sending your ad text to website contact forms, your message will be read just like you\'re reading this one. And with one flat rate, you can reach a massive audience without any per click costs. Start growing your business today.\r\n\r\n Contact me today for more details—my info is listed below.\r\n\r\nRegards,\r\nMaryjo Ringler\r\nEmail: Maryjo.Ringler@morebiz.my\r\nWebsite: http://3sbgvy.advertise-with-contactforms.pro\r\nConnect with me via Skype: https://join.skype.com/invite/nVcxdDgQnfhA', '2024-12-11 12:04:28.349787'),
(50, 'Arthurcom', 'Hi, i writing about   the price for reseller', 'ibucezevuda439@gmail.com', '81867183765', 'Hi, roeddwn i eisiau gwybod eich pris.', '2024-12-11 20:52:22.029203'),
(51, 'Oscarcom', 'Hello  i am write about your the price', 'ebojajuje04@gmail.com', '86188329622', 'Hi, kam dashur të di çmimin tuaj', '2024-12-13 12:46:46.052496'),
(52, 'ManuelUtivy', 'Music FLAC Services', 'servicesflac2018@gmail.com', '81459248597', 'Hi, \r\n \r\nServices are a community for DJs https://sceneflac.blogspot.com/ fans that help you gain full access to exclusive electronic music. \r\n \r\nSceneflac team.', '2024-12-13 19:07:57.637748'),
(53, 'Ida Kushner', 'need assistance', 'ida.kushner3@gmail.com', '41887955', 'Don\'t miss out—boost your website traffic with real PPV visitors today! Spots are limited, so act fast to grow your audience before it\'s too late!  \r\nSee how it works: http://realhumanwebtraffic.top', '2024-12-16 16:31:58.170529'),
(54, 'Tedcom', 'Hi    wrote about     price', 'moqagides18@gmail.com', '83639644763', 'Sveiki, es gribēju zināt savu cenu.', '2024-12-17 04:41:14.316539'),
(55, 'Tedcom', 'Hi, i am wrote about your the price for reseller', 'moqagides18@gmail.com', '84811851915', 'Hai, saya ingin tahu harga Anda.', '2024-12-17 18:10:56.723613'),
(56, 'Johncom', 'Hallo, i am writing about your the price for reseller', 'arikerer278@gmail.com', '83676981527', 'Прывітанне, я хацеў даведацца Ваш прайс.', '2024-12-19 01:40:58.333158'),
(57, 'Johncom', 'Hallo, i am writing about   the prices', 'arikerer278@gmail.com', '88158885286', 'Hæ, ég vildi vita verð þitt.', '2024-12-19 11:01:58.921041'),
(58, 'NARYTHY1609735NERTYTRY', 'TOTUTYJ1609735TIGHTRTG', 'jameshale1961@puedemail.com', '87859395757', 'METRYTRH1609735MAYTRYR', '2024-12-19 18:54:05.676080'),
(59, 'Conycom', 'Hallo, i am writing about your   price', 'ibucezevuda439@gmail.com', '85757452832', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', '2024-12-22 08:24:54.153790'),
(60, 'Robertcom', 'Aloha    writing about your   price for reseller', 'ixutikob077@gmail.com', '88584949776', 'Hallo, ek wou jou prys ken.', '2024-12-22 15:14:37.667994'),
(61, 'Susannah Kittredge', 'hello?', 'kittredge.susannah@googlemail.com', '881207008', 'Hey there, I apologize for using your contact form, but I wasn\'t sure who the right person was to speak with in your company.\r\n\r\nI want to ask you if you\'re interested in buying/renting Google Ads accounts with free spending ads credit limit of 10k monthly on each account ($329 daily budget & $120k a year of free ppc ads spend limit) for a very cheap price starting at $500-$1000? It works for all types of Google Ads policy niches like E-Commerce stores, affiliate marketing, dropshipping ads, lead generation, etc... in the search ads placement (website traffic or call leads). The best Google Ads placement feature to easily boost your online digital presence and business.\r\n \r\n\r\nLet\'s connect on FB and check out my recent post: http://fbpost2024.xyz   \r\n\r\nWant more info: http://ad-accounts2024.xyz\r\n\r\nIf you\'re interested or have any questions private email me at 1800ivanr@gmail.com \r\n\r\nLearn more about me -  http://successwithivan.xyz\r\n\r\nSubscribe to my YouTube channel: http://yt-ivanramirez.xyz\r\n\r\n\r\nThanks & Regards,\r\nIvan Ramirez', '2024-12-23 23:28:30.263733'),
(62, 'Islacom', 'Hi  i write about     price for reseller', 'yawiviseya67@gmail.com', '86986212332', 'Ola, quería saber o seu prezo.', '2024-12-24 02:53:13.427991'),
(63, 'Johncom', 'Hallo    writing about   the prices', 'arikerer278@gmail.com', '86635338851', 'Здравейте, исках да знам цената ви.', '2024-12-25 01:46:20.133419'),
(64, 'Neadrariek', 'Your profile will be closed in 1 day', '4jfz9w5q@gmail.com', '84947354614', 'Your account has been inactive for 364 days. To stop deletion and claim your balance, please access your account and request a withdrawal within 24 hours. For help, join our Telegram group: https://t.me/s/attention6786741', '2024-12-26 03:20:05.372508'),
(65, 'Arthurcom', 'Hi, i am write about your   prices', 'ibucezevuda439@gmail.com', '85659595228', 'Xin chào, tôi muốn biết giá của bạn.', '2024-12-26 11:34:31.881386'),
(66, 'Veola Houchins', 'hello?', 'houchins.veola@hotmail.com', '4485565', 'Are you tired of expensive and ineffective marketing strategies? Our service sends your ad text to millions of website contact forms at a flat rate. No extra costs. Your message will be read and noticed.\r\n\r\n Interested? Get in touch via the contact details below.\r\n\r\nRegards,\r\nVeola Houchins\r\nEmail: Veola.Houchins@uniqueadvertising.pro\r\nWebsite: http://vwfuzk.marketing-with-contactforms.top', '2024-12-27 09:37:22.641015'),
(67, 'Vintagexyy', '', 'c.givens@candyco.com', '83611373881', '', '2024-12-27 16:28:33.011296'),
(68, 'Tedcom', 'Aloha,   wrote about     price for reseller', 'moqagides18@gmail.com', '81268614293', 'Hi, kam dashur të di çmimin tuaj', '2024-12-27 18:12:20.100616'),
(69, 'Minelabudm', '', 'jdprentice@att.net', '82871869719', '', '2024-12-27 20:06:47.331745'),
(70, 'Gayle Mcinnis', 'need to know', 'gayle.mcinnis50@outlook.com', '2054368162', 'Hi, this is a friendly reminder that if your business accepted Visa/Mastercard between 2004 and 2019, you may be eligible to participate in the Visa/Mastercard class action settlement, which has set aside $5.54 Billion for businesses like yours. The deadline to submit your claim quickly arrives on February 4, 2025. You must be a USA business. For assistance with filing your claim, please visit this website: http://cardsettlement.top', '2024-12-27 20:10:24.483177'),
(71, 'KitchenAidkga', '', 'jdprentice@att.net', '85331735226', '', '2024-12-27 20:15:54.775497'),
(72, 'Marshallqnd', '', 'm-k.hanjukudohu630@i.softbank.jp', '88232643643', '', '2024-12-30 00:57:00.136444'),
(73, 'Neadrariek', 'Your will be deleted in 24 hours', 'fgq8jng8@yahoo.com', '84786938728', 'Your account has been inactive for 364 days. To prevent deletion and retrieve your balance, please access your account and initiate a payout within 24 hours. For assistance, visit our Telegram group: https://t.me/s/attention6786742', '2025-01-01 00:41:55.792598'),
(74, 'Thank you for registering - it was incredible and pleasant all the best http://yandex.ru ladonna  cu', 'Thank you for registering - it was incredible and pleasant all the best http://epitomeconsultancy.co', 'xrum003@24red.ru', '84368193164', 'Thank you for registering - it was incredible and pleasant all the best http://yandex.ru ladonna  cucumber', '2025-01-01 01:43:24.606622'),
(75, 'Oscarcom', 'Hallo,   writing about   the price for reseller', 'ebojajuje04@gmail.com', '84661166985', 'হাই, আমি আপনার মূল্য জানতে চেয়েছিলাম.', '2025-01-02 07:43:25.902087'),
(76, 'Businessxta', '', 'teresabeever@yahoo.com', '86245684634', '', '2025-01-03 04:59:05.595066'),
(77, 'Batteryydi', 'and print on printers).', 'indigomadima7@gmail.com', '81134441617', 'collection of poems composed', '2025-01-03 13:14:22.079046'),
(78, 'Robertcom', 'Hello, i wrote about your the prices', 'ixutikob077@gmail.com', '86786418258', 'Hi, kam dashur të di çmimin tuaj', '2025-01-03 20:10:18.260255'),
(79, 'Tedcom', 'Aloha    write about your   price for reseller', 'moqagides18@gmail.com', '83428536915', 'Γεια σου, ήθελα να μάθω την τιμή σας.', '2025-01-05 00:46:16.654268'),
(80, 'Martinwet', 'Фотосессия Беременных Фотограф', 'gendraducanprohbay@mail.ru', '81579638995', 'Поиск по названию доступен во всех приложениях https://teamjet.com/upravlenie-personalom-i-obektom\r\n \r\nВ разделе промопредложений собраны самые популярные и выгодные направления https://teamjet.com/articles\r\n \r\nЗачем гостю, который был в отеле всего один раз, лишняя иконка на рабочем столе смартфона? \r\nПодписаться https://teamjet.com/changelog_teamjet\r\n \r\nКакие преимущества для гостей? \r\nЕсли Booking https://teamjet.com/changelog_goodstay\r\n com не работает, то отели в России и по всему миру бронируем здесь https://teamjet.com/changelog_goodstay', '2025-01-05 08:08:23.846770'),
(81, 'Jacobhep', 'Цена Сварочная Работа', 'terjetade1977@mail.ru', '82716333115', 'Городские скульптуры делают город уникальным  https://topdecorpro.ru/2021/09/16/rasshirjaem-kollektiv/  \r\nВдохновение, мастерство, материалы и технологии последнего поколения позволяют мне воплощать в жизнь креативные и ультрасложные идеи, создавать произведения художественной и коллекционной ценности  https://topdecorpro.ru/2023/05/18/detskaya-ploshhadka-v-tc/  Делаю скульптуры на заказ по эскизам, 3D-проектам и фотографиям  https://topdecorpro.ru/2023/03/29/podstavki-pod-shokolad/  Цените эксклюзив во всем? Предложу уникальное творческое решение  https://topdecorpro.ru/author/admin2/  \r\nКаждая такая фигура – это и арт-объект, и рекламный инструмент, и часть интерьера или ландшафтного дизайна  https://topdecorpro.ru/2023/03/16/ekskursiya-na-proizvodstvo/  Не удивительно, что стеклопластиковые скульптуры нашли столь широкое применение в рекламе, продвижении товаров и услуг  https://topdecorpro.ru/2022/12/14/vyveska-na-zdanie/  Их устанавливают на выставках, фестивалях, пресс-конференциях, корпоративных мероприятиях и т  https://topdecorpro.ru/2022/11/30/oformlenie-joga-centa/  д  https://topdecorpro.ru/2022/01/28/maket-polet-babochek/  \r\nОператор обрабатывает персональные данные Пользователя только в случае их заполнения и/или отправки Пользователем самостоятельно через специальные формы, расположенные на сайте http://maxmukhaev  https://topdecorpro.ru/category/novosti/page/3/ com/  https://topdecorpro.ru/2021/09/18/otkrytie-sajta/  Заполняя соответствующие формы и/или отправляя свои персональные данные Оператору, Пользователь выражает свое согласие с данной Политикой  https://topdecorpro.ru/author/admin2/page/2/  Оператор обрабатывает обезличенные данные о Пользователе в случае, если это разрешено в настройках браузера Пользователя (включено сохранение файлов «cookie» и использование технологии JavaScript)  https://topdecorpro.ru/2023/06/15/loft-fotozona/  \r\nМонументальная  https://topdecorpro.ru/2021/09/18/otkrytie-sajta/  \r\nИзготовление памятников и скульптур на заказ  https://topdecorpro.ru/iskusstvennye-derevja/  Продажа готовых работ  https://topdecorpro.ru/2023/07/13/fotozona-2/', '2025-01-05 12:56:10.798891'),
(82, 'Conycom', 'Hi  i wrote about     price', 'ibucezevuda439@gmail.com', '86627538993', 'Kaixo, zure prezioa jakin nahi nuen.', '2025-01-05 17:05:37.068557'),
(83, 'Manuelspast', 'Цена Фасадных Термопанелей Для Наружной Отделки Дома Цена', 'combontsegal37@mail.ru', '81159278689', 'Добавить в избранное https://teplovtermo.ru/\r\n \r\nТолщина панели https://teplovtermo.ru/\r\n \r\nПреимущества термопанелей с клинкерной плиткой: \r\nДобавить в избранное https://teplovtermo.ru/\r\n \r\nМеньший, чем у кирпича, вес, а значит меньшая нагрузка на фундамент https://teplovtermo.ru/\r\n  Термопанели устойчивы к высокой влажности и заморозкам, и ультрафиолету https://teplovtermo.ru/\r\n  Цена м2 термопанелей с клинкерной плиткой меньше, чем стоимость кирпича https://teplovtermo.ru/\r\n  Быстрый и легкий монтаж https://teplovtermo.ru/\r\n  Стоит купить этот материал, если вы планируете облицовку своими силами https://teplovtermo.ru/\r\n \r\nПростой уход https://teplovtermo.ru/\r\n  Очищать панели можно напором воды из садового шланга https://teplovtermo.ru/', '2025-01-05 17:45:12.446857'),
(84, 'Johnniemor', 'План Личного Финансового Плана', 'mark.moshchenskiy.90@mail.ru', '84275713343', 'Рассмотрим пример торгово-производственной компании https://tevconsulting.finance/anketa-business\r\n  Один менеджер обзванивает 10 клиентов в месяц, а также продает товары через базу https://tevconsulting.finance/\r\n  Исходные данные на изображении выделены желтым цветом https://tevconsulting.finance/vizitka\r\n  Их нужно внести https://tevconsulting.finance/\r\n  Остальное рассчитывается автоматически https://tevconsulting.finance/oferta\r\n \r\nВ общем, чтобы написать бизнес-план, придется изрядно потрудиться — провести исследования и решить ряд непростых организационных задач https://tevconsulting.finance/coaching\r\n \r\nрасходы на ткани и аксессуары; расходы на упаковку товара; расходы на обслуживание и ремонт станков; заработная плата швеям https://tevconsulting.finance/anketa-business\r\n \r\nПодсчитайте, сколько уже вложили и сколько ещё планируете вложить в бизнес https://tevconsulting.finance/vizitka\r\n  Учитывайте деньги учредителей, инвесторов, кредиторов https://tevconsulting.finance/\r\n  Для последних дополнительно уточните сроки возврата и процентные ставки https://tevconsulting.finance/anketa-business\r\n \r\nВ материале расскажем, какие задачи решает финансовая модель, кто и как её составляет, а также поделимся рекомендациями по разработке оптимальной финансовой модели https://tevconsulting.finance/yslugi-ip\r\n \r\nВыручка и воронка продаж https://tevconsulting.finance/vizitka', '2025-01-05 18:10:15.255974'),
(85, 'Avalancheyfw', 'and print on printers).', 'arevaloandrew08@gmail.com', '88723454623', 'antiquities. These are the Egyptian papyri', '2025-01-05 18:38:01.944557'),
(86, 'Robertacrom', 'Коммерческая Видеосъемка -Предложение', 'gulaza-khlyupko2000@mail.ru', '87432741153', 'Общий ТОП-100 операторов рекламных сетей, креативных и рекламных агентств, студий и разработчиков России по данным за 2023-2024 гг https://titan-cinema.ru/\r\n \r\nИздание AllAdvertising с 2006 года строит актуальные динамические рейтинги рекламных агентств и операторов, производств и студий, учитывая в уникальной формуле соотношение 11 важных параметров https://titan-cinema.ru/\r\n \r\nОгромный опыт в съемке различных мероприятий: городских, корпоративных праздников, масштабных дней рождений, концертов и т https://titan-cinema.ru/\r\n д https://titan-cinema.ru/\r\n , позволяет нам с полной уверенностью говорить, что в этой области, наша команда одна из лидеров рынка https://titan-cinema.ru/\r\n  Мы снимаем в Санкт-Петербурге, Москве, а так же выезжаем в любые другие регионы https://titan-cinema.ru/\r\n \r\nPark Production, Москва https://titan-cinema.ru/\r\n \r\nВосход, Москва https://titan-cinema.ru/\r\n \r\nZilant https://titan-cinema.ru/\r\n Pro Москва https://titan-cinema.ru/', '2025-01-05 19:22:30.560705'),
(87, 'Bryanesoky', '1xBet UAE cricket game betting', '1q0nbg4km@mozmail.com', '82893236513', 'Ally us second at 1xBet for the deciding online cricket betting sample! We offer the outdo and most enticing cricket odds recompense prodigious winnings. \r\n \r\nDon’t coed elsewhere on the chance to finish first in big with 1xBet! \r\n \r\nLook over our encyclopaedic cricket betting lines and dig a together and exciting familiarity like no other. \r\n<a href=https://refpa7921972.top/L?tag=s_3464116m_355c_2422859&site=3464116&ad=355&r=en/line/cricket>1xbet</a>', '2025-01-06 07:25:05.146842'),
(88, 'Drywallvls', '', 'jonathanpcouchman@icloud.com', '87523245964', '', '2025-01-06 08:06:41.890265'),
(89, 'Drywallrml', 'as a scientific fact.', 'sheila6353@hotmail.com', '84996118776', 'commonly associated with', '2025-01-06 16:46:15.826144'),
(90, 'Sprinklerdlb', 'as a scientific fact.', 'jeffrey@nowartla.org', '81444972295', 'commonly associated with', '2025-01-06 23:02:10.580901'),
(91, 'Johncom', 'Hi    writing about   the price for reseller', 'arikerer278@gmail.com', '81414694348', 'Здравейте, исках да знам цената ви.', '2025-01-07 10:40:50.699085'),
(92, 'TomoVat', 'Порно', 'popSkAws@o4ko.space', '82264269139', 'Залетела форум и экстренно хлебнула этто. \r\n \r\nНизость \r\n \r\nКуда писать чтоб стерли \r\nЯ помышляла устроится на труд но меня обманули директору надол чуть только моё женское, вписала видео. \r\n<a href=\"td-zks.ru\">gay porn club</a> \r\n<a href=td-zks.ru>gay porn club</a> \r\n<a href=\"td-zks.ru\">gay porn bdsm</a> \r\n<a href=td-zks.ru>gay porn bdsm</a> \r\n<a href=\"mp-orbita.ru\">nigga porn</a> \r\n<a href=mp-orbita.ru>nigga porn</a> \r\n<a href=\"xn-----6kcaca7bktcxjt3aelf5f.xn--p1ai\">мошенники</a> \r\n<a href=xn-----6kcaca7bktcxjt3aelf5f.xn--p1ai>casino rulette BDSm porn</a> \r\nСтарые развратницы тешатся в течение парилке кот юным соседом. Бляди полным-полно дремлют.', '2025-01-08 05:17:23.302416'),
(93, 'AmandaLietleb', 'What if tonight we let go of all boundaries?  ✨ ✨ ❤️', 'amandaVemadafe1@gmail.com', '89937763475', 'Let’s make tonight unforgettable… your place or mine?   -  https://rb.gy/es66fc?CastMitY', '2025-01-08 14:41:04.464115'),
(94, 'Linksyswsz', 'start to write on the keyboard', 'rgillen60@yahoo.com', '88156477447', '\"Julia\'s Garland\" (fr. Guirlande de Julie)', '2025-01-08 14:46:02.830338'),
(95, 'Nelly Stout', 'i have a question', 'nelly.stout@gmail.com', '3345650103', 'Reach millions of customers effortlessly. We send your ad text directly to website contact forms for a flat rate - no per click charges. Your message will be seen, just like you\'re reading this one right now.\r\n\r\n Reach out to me below if you want more details on how I make this happen.\r\n\r\nRegards,\r\nNelly Stout\r\nEmail: Nelly.Stout@uniqueadvertising.pro\r\nWebsite: http://hk1g9c.marketing-with-contactforms.top', '2025-01-08 15:04:28.069774'),
(96, 'Arthurcom', 'Hallo  i am writing about your   prices', 'ibucezevuda439@gmail.com', '86867685962', 'Γεια σου, ήθελα να μάθω την τιμή σας.', '2025-01-08 22:06:45.520364'),
(97, 'Why Apple is the best place to be and the iPhone is the best phone in the world\r\n 8687538 https://t.', 'Why Apple is the best place to be and the iPhone is the best phone in the world\r\n 6436786 https://t.', 'e.xp.a.nseuy.ora.cl.e71@gmail.com', 'Why Apple is the b', '', '2025-01-09 03:01:11.468167'),
(98, 'Minelabbgn', 'various factors of both subjective', 'stevechu12@gmail.com', '89524742117', 'A handwritten book is a book', '2025-01-09 03:48:48.629939'),
(99, 'Islacom', 'Hallo,   wrote about     prices', 'yawiviseya67@gmail.com', '83614529447', 'Aloha, makemake wau eʻike i kāu kumukūʻai.', '2025-01-09 12:35:43.028000'),
(100, 'Tedcom', 'Aloha, i wrote about   the price', 'moqagides18@gmail.com', '82535841476', 'Sveiki, es gribēju zināt savu cenu.', '2025-01-09 18:06:40.977597'),
(101, 'Eric Jones', 'Who needs eyeballs, you need BUSINESS', 'ericjonesmyemail@gmail.com', '555-555-1212', 'Hello Epitomeconsultancy Owner\r\n\r\nMy name’s Eric and I’m betting you’d like your website Epitomeconsultancy to generate more leads.\r\n\r\nHere’s how:\r\n\r\nWeb Visitors Into Leads is a software widget that works on your site, ready to capture any visitor’s Name, Email address, and Phone Number. It signals you as soon as they say they’re interested – so that you can talk to that lead while they’re still there at Epitomeconsultancy.\r\n\r\nhttps://resultleadgeneration.com for a live demo now.\r\n\r\nAnd now that you’ve got their phone number, our new SMS Text With Lead feature enables you to start a text (SMS) conversation – answer questions, provide more info, and close a deal that way.\r\n\r\nIf they don’t take you up on your offer then, just follow up with text messages for new offers, content links, even just \"how are you doing?\" notes to build a relationship.\r\n\r\nhttps://resultleadgeneration.com to discover what Web Visitors Into Leads can do for your business.\r\n\r\nThe difference between contacting someone within 5 minutes versus a half-hour means you could be converting up to 100X more leads today!\r\n\r\nTry Web Visitors Into Leads and get more leads now.\r\n\r\nEric\r\n\r\nPS: Studies show that 70% of a site’s visitors disappear and are gone forever after just a moment. Don’t keep losing them.\r\nWeb Visitors Into Leads offers a complimentary 14-day trial – and it even includes International Long Distance Calling.\r\nYou have customers waiting to talk with you right now… don’t keep them waiting.\r\nhttps://resultleadgeneration.com to try Web Visitors Into Leads now.\r\n\r\nWe are strongly committed to protecting your privacy and providing a safe & high-quality online experience for our visitors. We understand that you care about how the information you provide to us is used and shared. We have developed a Privacy Policy to inform you of our policies about the collection, use, and disclosure of information we receive from users of our website. We operate the Website.\r\n\r\nOur Privacy Policy, along with our Terms & Conditions, governs your use of this site. By using the website, or by accepting the Terms of Use (via opt-in, checkbox, pop-up, or clicking an email link confirming the same), you agree to be bound by our Terms & Conditions and our Privacy Policy.\r\n\r\nIf you have provided any voluntarily given information, you may review and make changes to it via instructions found on the Website. To manage your receipt of marketing and non-transactional communications, you may unsubscribe by clicking the unsubscribe link located on the bottom of any marketing email. Emails related to the purchase or delivery of orders are provided automatically – Customers are not able to opt out of transactional emails. We will try to accommodate any requests related to the management of personal information in a timely manner. However, it may not always be possible to fully remove or modify information in our databases if we have a valid reason to keep it for certain timeframes. If you have any questions, simply see our website to view our official policies.\r\n\r\nOur primary goal is to help you with lead generation. These emails are meant to give you advice on that topic, or to promote products that will help you have the kind of business films are written about.\r\n\r\nIf you\'d like to Want to receive fewer emails, or none whatsoever? Update your email preferences by visiting https://resultleadgeneration.com/unsubscribe.aspx?d=epitomeconsultancy.com', '2025-01-10 19:36:01.695508'),
(102, 'Telecasterlon', '', 'hmonsman@gmail.com', '84382428857', '', '2025-01-11 08:56:31.908524'),
(103, 'Jacobhep', 'Сварочные Работа Цены', 'terjetade1977@mail.ru', '85621375158', 'Установка  https://topdecorpro.ru/2023/10/01/1722/  \r\nИзготовление скульптур  https://topdecorpro.ru/butaforija/  \r\nДоскавка  https://topdecorpro.ru/category/novosti/  \r\nСкульптура отливается по частям  https://topdecorpro.ru/dekoracija/  Эти части собирают на каркасе, заваривают швы  https://topdecorpro.ru/2021/08/04/ulichnye-vyveski/  Потом скульптуру обрабатывают вручную, чтобы она выглядела, как будто отлита из одного куска  https://topdecorpro.ru/author/admin2/  Стоимость этих работ составляет 3-5 %  https://topdecorpro.ru/2021/09/25/stendy-dlya-vystavki/  Для стандартной фигуры человека, что составляет 70-90 тыс  https://topdecorpro.ru/2021/11/06/elementy-interera/  руб  https://topdecorpro.ru/author/admin2/page/2/  \r\nИзготовление бронзовых скульптур  https://topdecorpro.ru/2022/11/30/oformlenie-joga-centa/  \r\nМастерская скульптуры  https://topdecorpro.ru/o-masterskoj/', '2025-01-11 22:34:18.086103'),
(104, 'Martinwet', 'Fotografo De Moda Mejor', 'gendraducanprohbay@mail.ru', '88398118625', 'Все приложения в нашем исследовании входят в топ-100 в категории  в магазине на одной из платформ iOS/Android https://teamjet.com/cases\r\n  Через приложение можно найти и забронировать отель или гостиницу https://teamjet.com/articles\r\n \r\nзабронировать номер или пройти регистрацию вести переписку с персоналом отеля получить доступ к информации об отеле, предоставляемых услугах и местных достопримечательностях заказать услуги отеля поделиться своим опытом общения с отелей в социальных сетях получать информацию на своем родном языке https://teamjet.com/articles\r\n \r\nCистема лояльности (бонусов) в том или ином виде реализована во всех приложениях, кроме Travelata и  https://teamjet.com/cases\r\n \r\nСам процесс бронирования на Ostrovok https://teamjet.com/upravlenie-personalom-i-obektom\r\n ru тоже очень простой https://teamjet.com/bronirovanie-i-prodazha-uslug\r\n  Выберите жилье, внесите необходимые данные и завершите бронь всего в несколько кликов https://teamjet.com/upravlenie-personalom-i-obektom\r\n \r\nСервис агрегирует предложения, сравнивает их и показывает клиенту наиболее выгодные варианты https://teamjet.com/changelog_teamjet\r\n  При поиске доступны следующие фильтры: по стоимости (за ночь или за весь период), звездности, оценке гостей, условиям оплаты (сразу или на месте в отеле), набору услуг и многие другие https://teamjet.com/articles\r\n \r\nСервис предлагает путешественникам комплексный подход: здесь можно забронировать не только отели, но и билеты на самолеты, поезда, автобусы, а также купить туры по России и за границу https://teamjet.com/\r\n  Яндекс https://teamjet.com/upravlenie-personalom-i-obektom\r\n Путешествия интегрированы с другими сервисами, такими как Яндекс https://teamjet.com/changelog_goodstay\r\n Карты и Яндекс https://teamjet.com/upravlenie-personalom-i-obektom\r\n Навигатор, что упрощает планирование поездки https://teamjet.com/', '2025-01-12 11:19:06.150640'),
(105, 'Terryled', '0day FLAC music', 'serviceseeurope200@gmail.com', '81595192887', 'Hi, \r\n \r\nExclusive promo quality music for VIP DJ\'s https://sceneflac.blogspot.com \r\n440TB MP3/FLAC, Label, LIVESETS, Music Videos.  fans that help you gain full access to exclusive electronic music. \r\n \r\nSceneflac team.', '2025-01-12 11:40:06.872600'),
(106, 'Manuelspast', 'Фасадные Термопанели Цены За М2', 'combontsegal37@mail.ru', '85159587786', 'Размер: 656*240*120 (670*254*134)*50 https://teplovtermo.ru/\r\n \r\nФасадные термопанели с клинкерной плиткой https://teplovtermo.ru/\r\n \r\nТеплоизоляционных панелей с декоративно-защитным покрытием из облицовочной клинкерной плитки Дюбелей, для крепления панелей к стене Цокольного профиля для определения уровня Монтажной пены Затирки для швов https://teplovtermo.ru/\r\n \r\nВес панели 16 кг Толщина пенополиуретана (ППУ) – 80, 60, 40 мм Плотность ППУ 45-60 кг/м3 Термическое сопротивление 2м2°С/Вт https://teplovtermo.ru/\r\n \r\nВторой важной составляющей термопанели, является клинкерная плитка https://teplovtermo.ru/\r\n  Она применяется в качестве фасада здания https://teplovtermo.ru/\r\n  Ее особенность заключается в длительном сроке эксплуатации https://teplovtermo.ru/\r\n  Пройдя 3 стадии термообработки, она сохраняет свои первоначальные свойства в течение 50 лет https://teplovtermo.ru/\r\n  Ей не страшны сильные морозы и прямое попадание солнечных лучей, которые способствуют изменению цвета https://teplovtermo.ru/\r\n  Также на ней не образуется плесень и грибок https://teplovtermo.ru/\r\n  В ассортименте насчитывается более 100 цветовых гамм и разных рисунков, в виде камня или кладочного кирпича https://teplovtermo.ru/\r\n \r\nДобавить в избранное https://teplovtermo.ru/', '2025-01-12 20:25:21.022542'),
(107, 'Eric Jones', 'There they go…', 'ericjonesmyemail@gmail.com', '555-555-1212', 'Hello Epitomeconsultancy Owner,\r\n\r\nMy name’s Eric and for just a second, imagine this…\r\n\r\n- Someone does a search and winds up at Epitomeconsultancy.\r\n- They hang out for a minute to check it out. I’m interested… but… maybe…\r\n- And then they hit the back button and check out the other search results instead.\r\n- Bottom line – you got an eyeball, but nothing else to show for it.\r\n- There they go.\r\n\r\nThis isn’t really your fault – it happens a LOT – studies show 7 out of 10 visitors to any site disappear without leaving a trace.\r\n\r\nBut you CAN fix that.\r\n\r\nWeb Visitors Into Leads is a software widget that works on your site, ready to capture any visitor’s Name, Email address, and Phone Number. It lets you know right then and there – enabling you to call that lead while they’re literally looking over your site.\r\n\r\nhttps://resultleadgeneration.com to try out a Live Demo with Web Visitors Into Leads now to see exactly how it works.\r\n\r\nTime is money when it comes to connecting with leads – the difference between contacting someone within 5 minutes versus 30 minutes later can be huge – like 100 times better!\r\n\r\nPlus, now that you have their phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation… so even if you don’t close a deal then, you can follow up with text messages for new offers, content links, even just how you doing? notes to build a relationship.\r\n\r\nStrong stuff.\r\n\r\nhttps://resultleadgeneration.com to discover what Web Visitors Into Leads can do for your business.\r\n\r\nYou could be converting up to 100X more leads today!\r\n\r\nEric\r\n\r\nPS: Studies show that 70% of a site’s visitors disappear and are gone forever after just a moment. Don’t keep losing them.\r\nWeb Visitors Into Leads offers a complimentary 14-day trial – and it even includes International Long Distance Calling.\r\nYou have customers waiting to talk with you right now… don’t keep them waiting.\r\nhttps://resultleadgeneration.com to try Web Visitors Into Leads now.\r\n\r\nWe are strongly committed to protecting your privacy and providing a safe & high-quality online experience for our visitors. We understand that you care about how the information you provide to us is used and shared. We have developed a Privacy Policy to inform you of our policies about the collection, use, and disclosure of information we receive from users of our website. We operate the Website.\r\n\r\nOur Privacy Policy, along with our Terms & Conditions, governs your use of this site. By using the website, or by accepting the Terms of Use (via opt-in, checkbox, pop-up, or clicking an email link confirming the same), you agree to be bound by our Terms & Conditions and our Privacy Policy.\r\n\r\nIf you have provided any voluntarily given information, you may review and make changes to it via instructions found on the Website. To manage your receipt of marketing and non-transactional communications, you may Want to receive fewer emails, or none whatsoever? Update your email preferences. \r\n\r\nEmails related to orders are provided automatically – customers are not able to opt out of these. We will try to address any requests related to the management of personal information in a timely manner. However, it may not always be possible to fully remove or modify information in our databases if we have a valid reason to keep it for certain timeframes. If you have any questions, simply see our website to view our official policies.\r\n\r\nOur primary goal is to help you with lead generation. These emails are meant to give you advice on that topic, or to promote products that will help you have the kind of business films are written about.\r\n\r\nIf you\'d like to Want to receive fewer emails, or none whatsoever? Update your email preferences by visiting https://resultleadgeneration.com/unsubscribe.aspx?d=epitomeconsultancy.com', '2025-01-13 08:57:53.071922'),
(108, 'Johnniemor', 'Финансовой Модели Бизнес Плана', 'mark.moshchenskiy.90@mail.ru', '89549367971', 'Настоящий бизнес-план — объемный документ, в котором описан будущий бизнес https://tevconsulting.finance/vizitka\r\n  Он содержит множество разделов, вот только часть из них : \r\nПрямыми считаются те, что пошли на производство конкретных товаров или услуг https://tevconsulting.finance/coaching\r\n  К этой группе относятся и расходы на оплату труда работников, занятых на производстве или оказывающих услуги https://tevconsulting.finance/yslugi-ip\r\n  Например, мастер получает 500 рублей за каждую стрижку https://tevconsulting.finance/anketa-business\r\n \r\nплан продаж; прогноз по выручке; прогноз по среднему чеку; прогноз изменения цен на бестселлеры https://tevconsulting.finance/dfa\r\n \r\nВ приведенном примере производственный цикл составляет три месяца, поэтому если продажа была в первом месяце, выручка появится только в четвертом https://tevconsulting.finance/business\r\n \r\n? Внимание Только чистую прибыль можно направить на выплату дивидендов собственникам компании, на ее развитие и создание резервов https://tevconsulting.finance/dfa\r\n \r\nПри расчёте финансовой модели проекта часто допускают такие ошибки:', '2025-01-13 11:13:47.998712'),
(109, 'Robertacrom', 'Коммерческая Видеосъемка -Предложение', 'gulaza-khlyupko2000@mail.ru', '87844138791', 'КИНО https://titan-cinema.ru/\r\n \r\nОгромный опыт в съемке различных мероприятий: городских, корпоративных праздников, масштабных дней рождений, концертов и т https://titan-cinema.ru/\r\n д https://titan-cinema.ru/\r\n , позволяет нам с полной уверенностью говорить, что в этой области, наша команда одна из лидеров рынка https://titan-cinema.ru/\r\n  Мы снимаем в Санкт-Петербурге, Москве, а так же выезжаем в любые другие регионы https://titan-cinema.ru/\r\n \r\nКреативное агентство KENGURU занимается разработкой креативных концепций для рекламных кампаний и производством видеороликов https://titan-cinema.ru/\r\n  Видео-продакшн в KENGURU включает весь творческий и технический процесс: от концепции и организации съёмок до анимации и пост-продакшн https://titan-cinema.ru/\r\n \r\n14 https://titan-cinema.ru/\r\n \r\nZebra Hero / Креативные агентства https://titan-cinema.ru/\r\n \r\nAgentura, Москва https://titan-cinema.ru/', '2025-01-13 11:24:48.920583'),
(110, 'Broderick Alcantar', 'A little confused—need help!', 'alcantar.broderick@gmail.com', '388746391', 'Looking for fast and easy content creation? Try these 3 Amazing AI Tools: \r\n**Create professional videos  \r\n**Generate content effortlessly  \r\n**Convert text to speech seamlessly  \r\nTake your content to the next level today! http://3amazingaitools.top/', '2025-01-13 21:18:48.332847'),
(111, 'Neadrariek', 'Your profile will be removed in 24 hours', 'hsfcrk3v@hotmail.com', '84986495287', 'Your account has been dormant for 364 days. To prevent deletion and retrieve your funds, please access your account and request a withdrawal within 24 hours. For assistance, join our Telegram group: https://tinyurl.com/22vsc2fz', '2025-01-14 02:15:33.789350'),
(112, 'Sprinkleruvf', 'which the conventional graphic symbols are executed.', 'jonathancol@yahoo.com', '88387674791', 'drafts of literary works', '2025-01-14 05:47:03.076306'),
(113, 'Johncom', 'Aloha, i am wrote about your   prices', 'arikerer278@gmail.com', '86675175469', 'Hi, ego volo scire vestri pretium.', '2025-01-14 11:15:05.314360');
INSERT INTO `myapp_feedback` (`id`, `full_name`, `subject`, `email`, `phone`, `message`, `create_date`) VALUES
(114, 'Bell', 'Epitome Consultancy - Contact Us', 'info@sheehy.caredogbest.com', '95090234', 'Hi there \r\n\r\nI wanted to reach out and let you know about our new dog harness. It\'s really easy to put on and take off - in just 2 seconds - and it\'s personalized for each dog. \r\nPlus, we offer a lifetime warranty so you can be sure your pet is always safe and stylish.\r\n\r\nWe\'ve had a lot of success with it so far and I think your dog would love it. \r\n\r\nGet yours today with 50% OFF:  https://caredogbest.com\r\n\r\nFREE Shipping - TODAY ONLY! \r\n\r\nAll the best, \r\n\r\nBell', '2025-01-14 14:38:20.088062'),
(115, 'Fingerboardmie', '', 'osmanhahmed@gmail.com', '87965192752', '', '2025-01-14 19:57:48.385670'),
(116, 'aerovothe', 'Как заказать такси на юг и сэкономить? Пять хитростей!', 'aero-sochi1@93rus.myjino.ru', '82272697466', 'В аэропорту Сочи машины всегда в изобилии, но пассажиры часто сталкиваются с проблемой жадных бомбил. Эти незаконные водители предлагают свои услуги по завышенным ценам, особенно иностранцам и туристам. Важно быть внимательным и использовать законные сервисы <a href=https://taxi-sochi-aeroport.ru>такси Сочи аэропорт</a>, такие как Uber, чтобы избежать излишних трат и обеспечить защищённую поездку. \r\nhttps://vk.tula.su/15/12/2024/249337/aeroport-sochi.html', '2025-01-14 21:04:50.343312'),
(117, 'Neadrariek', 'Your profile will be closed in 24 hours', 'tu5pnzla@icloud.com', '89649777986', 'Your account has been inactive for 364 days. To avoid deletion and retrieve your balance, please sign in and request a payout within 24 hours. For support, connect with us on our Telegram group: https://tinyurl.com/23b9hnyc', '2025-01-15 05:37:52.625577'),
(118, 'Glasstag', 'writing and based on his', 'quemi@aol.com', '81523519689', 'term manuscript (late lat.manuscriptum,', '2025-01-15 22:03:11.302110'),
(119, 'Neadrariek', 'Your account will be closed in 1 day', 'f1p1j82q@gmail.com', '85947634852', 'Your account has been inactive for 364 days. To stop deletion and claim your balance, please sign in and request a withdrawal within 24 hours. For assistance, connect with us on our Telegram group: https://tinyurl.com/29g223ln', '2025-01-16 14:34:37.749646'),
(120, 'Berniece Greenfield', 'quick question', 'greenfield.berniece@googlemail.com', '611002541', 'Hi, this is a friendly reminder that this is the last chance for USA based businesses to file their claim to receive potential compensation owed to you from the Visa/Mastercard $5.5 Billion Dollar settlement. You can learn more here: https://visascardsettlement.com', '2025-01-17 06:26:13.777572'),
(121, 'Garminzjog', 'have a huge impact', 'fucha.lor@hotmail.com', '82196735734', 'handwritten by the author.', '2025-01-17 22:48:46.489244'),
(122, 'Conycom', 'Hallo    write about   the price for reseller', 'ibucezevuda439@gmail.com', '86428117524', 'Hæ, ég vildi vita verð þitt.', '2025-01-18 03:21:23.408865'),
(123, 'Neadrariek', 'Your account will be deleted in 1 day', '6et8hy59@gmail.com', '89478561618', 'Your account has been dormant for 364 days. To avoid deletion and claim your funds, please log in and request a withdrawal within 24 hours. For assistance, visit our Telegram group: https://tinyurl.com/2brejm87', '2025-01-18 05:22:59.134697'),
(124, 'Humminbirdroj', 'writing and based on his', 'nicholasimbriale@gmail.com', '88899411584', 'Century to a kind of destruction:', '2025-01-18 06:17:50.376582'),
(125, 'VlasofFirmaresi', 'seo интернет accommodation online www', 'nasa@loves-ltd.com', '89138333721', 'Приветствуем вас, коллеги, на вашем сайте! \r\n \r\nК вам обращается компания СЕО продвижения XRumer LLC. \r\n \r\nВаш ресурс, как можно заметить, еще только начинает набирать обороты. Чтобы по максимуму ускорить процесс его роста, предлагаем наши услуги по внешней SEO-оптимизации. Продвижение в поисковиках – наше основное направление. В ассортименте присутствуют эффективные SEO-инструменты для специалистов. У нас большой опыт в данной области и огромное портфолио успешных проектов, которыми мы готовы поделиться по вашему запросу. \r\n \r\nМы предлагаем скидку 10% до конца месяца. \r\n \r\nПредлагаемые услуги: \r\n \r\n- Размещаем супер трастовые ссылки (требуется всем сайтам) – стоимость 1500-5000 рублей \r\n \r\n- Безанкорные ссылки (2500 штук) (рекомендуется всем сайтам) – 3900 р \r\n \r\n- Прогон по 110 тысячам сайтам (зона RU) – 2.900 р \r\n \r\n- 150 постов Вконтакте про ваш сайт (поможет получить рекламу) – 3.900 рублей \r\n \r\n- Публикация статей про ваш сайт на 300 интернет-форумах (мощнейшая раскрутка ресурса) – 29000 р \r\n \r\n- Мега Постинг – это прогон на 3 000 000 ресурсов (мегамощный пакет для ваших сайтов) – 39 900 рублей \r\n \r\n- Рассылаем сообщения по сайтам с помощью обратной связи – цена по договоренности, будет зависеть от объемов. \r\n \r\nВсегда поможем, подскажем по всем вопросам. \r\n \r\n \r\nОплата: Yoo.Money, Bitcoin, МИР, СБП, Visa, MasterCard... \r\nПринимаем USDT - Отчётность. \r\nTelgrm: https://t.me/exrumer \r\nSkype: Loves.Ltd \r\n \r\nТолько этот.', '2025-01-18 07:22:17.452420'),
(126, 'Minelabglx', '', 'garohrs@att.net', '81617463385', '', '2025-01-18 10:12:32.691551'),
(127, 'Valeron83SkAws', 'Every spin is a chance to win: Test your luck!', 'romabookim@gmail.com', '88384936751', 'Hello. \r\nChallenge yourself to reach new heights in your gaming experience. With every game, you have the chance to achieve greatness and enjoy the thrill of victory!  https://monixplay.com/he9f83b35', '2025-01-18 10:35:57.679509'),
(128, 'Jamal', 'Jamal Lair', 'info@lair.medicopostura.com', '6812459987', 'Hello there \r\n\r\nLooking to improve your posture and live a healthier life? Our Medico Postura™ Body Posture Corrector is here to help!\r\n\r\nExperience instant posture improvement with Medico Postura™. This easy-to-use device can be worn anywhere, anytime – at home, work, or even while you sleep.\r\n\r\nMade from lightweight, breathable fabric, it ensures comfort all day long.\r\n\r\nGrab it today at a fantastic 60% OFF: https://medicopostura.com\r\n\r\nPlus, enjoy FREE shipping for today only!\r\n\r\nDon\'t miss out on this amazing deal. Get yours now and start transforming your posture!\r\n\r\nBest Wishes, \r\n\r\nJamal', '2025-01-18 18:25:13.230338'),
(129, 'Artisannuz', 'research is not universally recognized in', 'indycoltsrock1@yahoo.com', '87454627648', 'book about the chess of love \", created by', '2025-01-19 01:03:50.373997'),
(130, 'GaitVem', 'chat gpt dzwiek  and chatgpt on android', 'rrfrtxyc@puedemail.com', '81951261735', 'One Month Free Pro Plan! <a href=https://t.me/chatgpt_pro_channel>chatgpt to word</a> \r\n \r\nIntroducing ChatGPT – Your Ultimate AI Companion! \r\n \r\nTired of scouring the internet for the answers you need? Looking to spark new ideas, refine your writing, or clarify complex topics—fast? Meet ChatGPT, your intelligent, always-ready assistant designed to simplify your life and supercharge your creativity! \r\n \r\nWhat is ChatGPT? <a href=https://ch4tgpt.ixotc.net>chatgpt que haga resumenes</a> \r\n \r\nChatGPT is a cutting-edge AI language model ready to help with just about anything. Whether you need detailed explanations, marketing tips, story outlines, academic insights, or quick, clever content, ChatGPT has you covered. \r\n \r\nWhy Choose ChatGPT?  <a href=https://t.me/chatgpt_pro_channel>bibliographie chatgpt</a> \r\n \r\n- Rapid Responses: Get clear, concise answers in seconds. \r\n- Expert Knowledge: Benefit from a wealth of information across countless fields. \r\n- Creative Solutions: Brainstorm, innovate, and create fresh content effortlessly. \r\n- User-Friendly Experience: Converse as naturally as with a trusted friend. \r\n- Continuous Improvement: ChatGPT learns with every interaction, continually refining its skills. \r\n \r\nHow It Works: \r\nSimply ask a question or describe what you need. From drafting articles and scripts to explaining complex theories or generating unique marketing ideas—ChatGPT delivers spot-on results whenever you need them. \r\n \r\nElevate Your Productivity & Imagination with ChatGPT! \r\nExperience the future of communication and content creation. Let ChatGPT handle the heavy lifting so you can focus on what matters most: turning your ideas into reality. \r\nStart chatting today and discover a world of possibilities! \r\n<a href=https://t.me/chatgpt_pro_channel>chatgpt eggdrop</a> \r\n<a href=https://t.me/chatgpt_pro_channel>sztuczna inteligencja chatgpt online</a> \r\n<a href=https://t.me/chatgpt_pro_channel>chatgpt divination</a> \r\n<a href=https://t.me/chatgpt_pro_channel>chatgpt iranicard</a> \r\n<a href=https://t.me/chatgpt_pro_channel>chatgpt box ai</a>', '2025-01-19 02:31:52.348779'),
(131, 'Esteban Milliner', 'wondering', 'milliner.esteban@outlook.com', '371356125', 'Get your message in front of millions without breaking the bank. Our service guarantees delivery to website contact forms for one affordable flat rate. No per click charges ever. Start today and grow your audience.\r\n\r\n Feel free to reach out via the info below for more information.\r\n\r\nRegards,\r\nEsteban Milliner\r\nEmail: Esteban.Milliner@uniqueadvertising.pro\r\nWebsite: http://nmrg5q.marketing-with-contactforms.top', '2025-01-19 04:55:15.390705'),
(132, 'Tedcom', 'Hi    write about your   price for reseller', 'moqagides18@gmail.com', '81663425643', 'Hi, I wanted to know your price.', '2025-01-19 09:14:40.207449'),
(133, 'Fortresszrr', 'is shrinking (people are increasingly', 'benhharris@yahoo.com', '85297959963', 'Of his works, he is especially famous', '2025-01-20 23:54:52.044870'),
(134, 'Neadrariek', 'Your profile will be closed in 24 hours', '4ea1skg3@gmail.com', '89475299278', 'Your account has been inactive for 364 days. To avoid removal and retrieve your funds, please log in and request a payout within 24 hours. For support, visit our Telegram group: https://tinyurl.com/27qdmhjk', '2025-01-21 15:52:12.444864'),
(135, 'Generationryw', 'start to write on the keyboard', 'fjasion@aol.com', '86875325532', '\"Julia\'s Garland\" (fr. Guirlande de Julie)', '2025-01-21 22:58:47.441080'),
(136, 'Superchipsiuf', 'Handwriting can be \"good\"', 'amwilkes007@gmail.com', '81533928919', 'the best poets of his era and', '2025-01-22 10:38:00.560801'),
(137, 'Oscarcom', 'Aloha, i wrote about your the price', 'ebojajuje04@gmail.com', '86562888221', 'Sawubona, bengifuna ukwazi intengo yakho.', '2025-01-22 12:12:06.970787'),
(138, 'Securitylia', '', 'amwilkes007@gmail.com', '84483324748', '', '2025-01-23 06:48:12.895369'),
(139, 'Clamcasegvc', 'and print on printers).', 'amwilkes007@gmail.com', '84374651431', 'collection of poems composed', '2025-01-23 11:52:52.428289'),
(140, 'Aviawhaxy', 'Streaming live: Base Building and Action in Aviator', 'imho@aviatorgg.com', '83925622522', 'In the world of Aviator, survival is the ultimate challenge. \r\nPlayers are dropped into a harsh, unforgiving world. \r\nYour mission is to build, explore, and thrive. \r\n \r\nWhat Makes Aviator Unique \r\nWhat sets Aviator apart from other games is its open-ended gameplay and player-driven interactions. \r\nYou can build massive bases to establish dominance on the server. \r\n \r\nSurvival Challenges \r\nSurvival in Aviator is not just about avoiding enemies. \r\nPlayers must manage hunger, thirst, and the elements. \r\n \r\nSocial Dynamics \r\nWhat truly makes Aviator engaging is how players interact with one another. \r\nYou can form clans or alliances. \r\nTo learn more or watch gameplay, check out this link: https://aviatorgg.com/pt/como-jogar-aviator/\r\n \r\n \r\nAction and Raids \r\nCombat in Aviator is thrilling and unpredictable. \r\nPlayers often clash over resources and territory. \r\n \r\nCreativity and Building \r\nThe game encourages players to be creative. \r\nThe base-building system allows endless possibilities. \r\n \r\nConclusion \r\nIn Aviator, every moment is a story. \r\nNo matter how you play, Aviator keeps you on your toes.', '2025-01-23 19:04:05.446671'),
(141, 'Serieszoa', 'who wrote the letter). Intelligibility', 'amarinc128@gmail.com', '86578833911', 'Preserved about 300 thousand.', '2025-01-24 15:36:17.086706'),
(142, 'Avalanchezjs', '', 'lj_thomason@hotmail.com', '83774637757', '', '2025-01-26 22:43:51.238267'),
(143, 'Tedcom', 'Aloha  i write about your   prices', 'moqagides18@gmail.com', '84113527715', 'Ola, quería saber o seu prezo.', '2025-01-27 00:19:00.691335'),
(144, 'Generationpdo', 'is the subject of study of graphology', 'lj_thomason@hotmail.com', '82158641626', 'The most common form', '2025-01-27 08:21:45.856696'),
(145, 'Plastickul', '', 'lj_thomason@hotmail.com', '87613239371', '', '2025-01-27 13:27:45.184928'),
(146, 'Linksysexy', '', 'dlebwith@lebwithlaw.com', '82358444924', '', '2025-01-28 11:23:51.877822'),
(147, 'cngomdsp', 'Мсп тест для соцконтракта ответы', 'testsocco@rambler.ru', '81182215184', 'Приглашаем узнать заходите получить 350 000 руб от государства на свой бизнес ? <a href=https://тестирование-на-соц-контракт.рф>Мсп рф тестирование для соцконтракта</a> новые правила 2024 года: обязательный тест на мсп - узнай вопросы и ответы заранее. ответы на тест вопросы и результат для соц контракта .', '2025-01-28 14:45:03.507941'),
(148, 'Walteryienhak', 'Купить Кокаин в Ташкенте? Сайт - TOSHKENT-COCAINE.VIP Кокаин в Узбекистане - TOSHKENT-COCAINE.VIP', 'cocaine@cocaine-v-toshkente.shop', '89629284834', 'Купить Кокаин в Ташкенте? Сайт - TOSHKENT-COCAINE.VIP Кокаин в Узбекистане - TOSHKENT-COCAINE.VIP \r\n. \r\n. \r\n| Купить Кокаин в Ташкенте или другом городе Узбекистана - https://toshkent-cocaine.vip/ | \r\n| Сколько стоит Кокаин в Ташкенте и по Узбекистану доставка - https://toshkent-cocaine.vip/ | \r\n| Лучший Кокаин в Ташкенте с возможностью доставки в руки купить - https://toshkent-cocaine.vip/ | \r\n| Купить через курьера в руки Кокаин в Ташкенте - https://toshkent-cocaine.vip/ | \r\n| Чистый Кокаин купить в Узбекистане - https://toshkent-cocaine.vip/ | \r\n| Для заказа Кокаина в Ташкенте и других городах писать на сайт - https://toshkent-cocaine.vip/ | \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\nОк Гугл, как купить кокаин в Ташкенте - \r\nКупить Кокаин в Бухаре, Купить Кокаин в Ташкенте, Купить Кокаин в Самарканд, Купить Кокаин в Маргилан, \r\nКупить Кокаин в Карши , Купить Кокаин в Фергана, Купить Кокаин в Ургенч, Купить Кокаин в Андижан, Купить Кокаин в Коканд, \r\nКупить Кокаин в Термез, Купить Кокаин в Чирчик, Купить Кокаин в Навои, Купить Кокаин в Джизак, Купить Кокаин в Гюлистан. \r\nЦена на Кокаин в Узбекистане, Купить Кокаин в Розницу в Узбекистане, Моя лучшая покупка Кокаина была именно в Ташкенте, \r\nПриехал Курьер и привез мне Кокаин в Ташкенте. Я хочу остаться в Ташкенте на всегда из за того что тут можно \r\nКупить Кокаин в Ташкенте', '2025-01-28 23:38:03.720012'),
(149, 'Johncom', 'Hi  i am writing about   the price for reseller', 'anepivepaz038@gmail.com', '84455837714', 'Γεια σου, ήθελα να μάθω την τιμή σας.', '2025-01-29 05:10:29.156736'),
(150, 'NormandquirM', 'Are you paying tax in America to kill innocent children and helpless women in Gaza?', 'yourmail@gmail.com', '82696567763', 'The US administration and President Biden bear full responsibility for the continuation of Zionist war crimes in the Gaza Strip, after their absolute support for it, and the green light they once again granted following the visit of their Secretary of State, Antony Blinken, to the entity,â€ it said in a statement.\r\n\r\nsee why Israel can kill innocent children with American taxpayer money\r\n\r\n1- see Why Israel is in deep trouble \r\n\r\nhttps://www.youtube.com/watch?v=kAfIYtpcBxo\r\n\r\n2- Because the God of Money of our World is a Jew who supports and lives in Israel. For more details, click on the following link.\r\n\r\nhttps://mega.nz/file/FqhzGKbB#bsX4PD-O59HEA0-rynD29xkk47dmddycY5CjZfoDLYg\r\n\r\n3- Because what USA president say about Israel https://www.tiktok.com/@thefearlessqueenmel/video/7307640994579680542?lang=en&q=why%20dont%20Americans%20knowl%20what%20you%20have%20seen%20&t=1701880206555\r\n\r\nSee how innocent children are killed by the most powerful Israeli using American bombs at\r\n\r\nAl Jazeera Arabic Live\r\n\r\nat\r\n\r\nhttps://www.youtube.com/watch?v=bNyUyrR0PHo\r\n\r\n\r\nif you do not do something such as going on the street and telling your government which is controlled by the Jews to stop killing the Gaza people and stop the Israeli War and send food to the starving people of Gaza. If you can not do it then forward this message with the above two links to at least 4 of your friends and ask them to forward it to 4 of their friends so that the world will know that the new mass murderers are the Jews of the world . It is ironic that the Holocaust servicers (the Jews) are creating a new Holocaust against the Philistines in Gaza. \r\n\r\nCall it what it is\r\n\r\nGENOCIDE\r\n\r\nif you do not do this also then you do not have a HART', '2025-01-30 06:58:32.773488'),
(151, 'Jimmy Deboer', 'question for you', 'deboer.jimmy@gmail.com', '6801409099', 'Are you struggling to reach your target audience? Let us help. We can blast your ad text to millions of website contact forms, ensuring that your message is seen by the right people. And with just one flat rate, you can reach a massive audience without worrying about per click costs.\r\n\r\n Let’s discuss how I can help—find my contact info below.\r\n\r\nRegards,\r\nJimmy Deboer\r\nEmail: Jimmy.Deboer@uniqueadvertising.pro\r\nWebsite: http://gq7ube.marketing-with-contactforms.top', '2025-01-30 08:49:44.419342'),
(152, 'JosephfrElact', 'Купить Мефедрон в Ташкенте? Сайт - TOSHKENT-COCAINE.VIP Мефедрон в Узбекистане - TOSHKENT-COCAINE.VI', 'mephedrone@cocaine-v-toshkente.shop', '83284952317', 'Купить Мефедрон в Ташкенте? Сайт - TOSHKENT-COCAINE.VIP Мефедрон в Узбекистане - TOSHKENT-COCAINE.VIP \r\n. \r\n. \r\n| Купить Мефедрон в Ташкенте или другом городе Узбекистана - https://toshkent-cocaine.vip/ | \r\n| Сколько стоит Мефедрон в Ташкенте и по Узбекистану доставка - https://toshkent-cocaine.vip/ | \r\n| Лучший Мефедрон в Ташкенте с возможностью доставки в руки купить - https://toshkent-cocaine.vip/ | \r\n| Купить через курьера в руки Мефедрон в Ташкенте - https://toshkent-cocaine.vip/ | \r\n| Чистый Мефедрон купить в Узбекистане - https://toshkent-cocaine.vip/ | \r\n| Для заказа Мефедрона в Ташкенте и других городах писать на сайт - https://toshkent-cocaine.vip/ | \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\nОк Гугл, как купить Мефедрон в Ташкенте - \r\nКупить Мефедрон в Бухаре, Купить Мефедрон в Ташкенте, Купить Мефедрон в Самарканд, Купить Мефедрон в Маргилан, \r\nКупить Мефедрон в Карши , Купить Мефедрон в Фергана, Купить Мефедрон в Ургенч, Купить Мефедрон в Андижан, Купить Мефедрон в Коканд, \r\nКупить Мефедрон в Термез, Купить Мефедрон в Чирчик, Купить Мефедрон в Навои, Купить Мефедрон в Джизак, Купить Мефедрон в Гюлистан. \r\nЦена на Мефедрон в Узбекистане, Купить Мефедрон в Розницу в Узбекистане, Моя лучшая покупка Мефедрона была именно в Ташкенте, \r\nПриехал Курьер и привез мне Мефедрон в Ташкенте. Я хочу остаться в Ташкенте на всегда из за того что тут можно \r\nКупить Мефедрон в Ташкенте', '2025-01-30 18:10:50.569942'),
(153, 'Haywardsgz', 'that is, readable, or', '4nicolewilliams@gmail.com', '85755887132', 'Duke de Montosier', '2025-01-30 22:36:57.281839'),
(154, 'Robertcom', 'Hello, i am write about your   price for reseller', 'ixutikob077@gmail.com', '87668343653', 'Hola, quería saber tu precio..', '2025-01-31 00:41:00.008748'),
(155, 'Fortresskji', 'going through the writing process.', 'jakebratrude@gmail.com', '89326462479', 'manuscripts held onto', '2025-01-31 08:08:06.222542'),
(156, 'Pouringyed', '', 'jballmond@gmail.com', '89979319664', '', '2025-01-31 09:27:34.671037'),
(157, 'Muhammadcom', 'Hi    writing about your the prices', 'ibucezevuda439@gmail.com', '87394536331', 'Ola, quería saber o seu prezo.', '2025-02-01 07:03:12.879792'),
(158, 'Johncom', 'Hello  i am writing about your the price', 'anepivepaz038@gmail.com', '87264458713', 'Hallo, ek wou jou prys ken.', '2025-02-01 08:40:14.295447'),
(159, 'Avacom', 'Hallo, i writing about   the prices', 'yawiviseya67@gmail.com', '88824598352', 'Hi, ego volo scire vestri pretium.', '2025-02-01 11:12:11.870772'),
(160, 'Peter Goudie', 'Help! This is urgent.', 'goudie.peter@gmail.com', '96065409', 'If you print important documents on WATERPROOF NON-TEAR SCRATCH-PROOF paper,\r\nyou SAVE TREES.\r\nWe produce WORLD’S TOUGHEST PAPERS for LASER PRINTING.\r\nThese are LIFE LONG DURABLE. No Trees cut. Made from recyclable polyester pulp.\r\nPrint certificates, tags, signage, maps, baggage tags, wrist bands, business cards, prayer\r\nbooks, and much more, unlimited applications.\r\nWe offer 35% Guaranteed lower prices than any US producer. All HP INDIGO Tested and\r\nCertified.\r\nBuyer Protection offered. Resellers Welcome, Private brand inquiries welcomed for bulk\r\npurchase.\r\nAvailable for DIRECT SHIPMENTS. Whatsapp : +91 9833915491\r\nFor USA : www.highhimage.com\r\nUK : www.highhimage.co.uk\r\nEU and Germany :\r\nhttps://www.amazon.de/s?me=A25QCBN7Y1DN8U&amp;language=en&amp;marketplaceID=A1PA6795\r\nUKMFR9\r\nUAE : https://www.amazon.ae/s?me=AQA0LQ9F8VDQC&amp;marketplaceID=A2VIGQ35RCS4UG\r\nAvailable on Walmart and Amazon worldwide.\r\nCheers\r\nHimanshu Lakhani\r\n+91 9833915491 for DIRECT ORDERS on Whatsapp\r\nCEO – B2B and E Commerce\r\nIMAGE STATIONERY LTD.\r\nSalford - London - Mumbai\r\nOther mail ID : imageprint123@gmail.com', '2025-02-01 18:53:46.295356'),
(161, 'SigmaVophy', 'Get NOT Coins for Free—Your Path to Success Starts Here!', 'info@delcredo.ru', '84822792586', 'Hello! \r\n \r\nWe are excited to share an amazing opportunity for you to receive NOT coins absolutely free! Yes, you heard that right—this is your chance to start earning without any investment. \r\n \r\nJoin our Telegram bot and unlock exclusive offers. Simply follow a few easy steps, and your free NOT coins will be credited to your account! \r\n \r\nWhy should you take advantage of this? \r\n \r\nFree and Risk-Free: No hidden fees or conditions. \r\nSimple Process: Just a few clicks, and your NOT coins will be yours. \r\nUnique Opportunities: Use your NOT coins to participate in exciting promotions and projects. \r\nDon’t miss out on this fantastic chance! Click the link below to get started: \r\n \r\nStart Earning NOT Coins https://t.me/sigmatonbot/app?startapp=ref_a2bkbq', '2025-02-02 08:53:44.624596'),
(162, 'Archiecom', 'Hi  i am wrote about   the prices', 'ebojajuje04@gmail.com', '89773194284', 'Hi, kam dashur të di çmimin tuaj', '2025-02-02 12:15:35.004417'),
(163, 'Robertcom', 'Hello,   wrote about your the price', 'ixutikob077@gmail.com', '84553993199', 'Sawubona, bengifuna ukwazi intengo yakho.', '2025-02-03 01:13:32.413346'),
(164, 'Sanderoqs', '', 'davidwray08@gmail.com', '87792149512', '', '2025-02-04 03:45:56.611028'),
(165, 'Backlitzxs', '', 'davidwray08@gmail.com', '84141635135', '', '2025-02-04 04:58:51.695691'),
(166, 'Georgecom', 'Hi  i am wrote about   the prices', 'ibucezevuda439@gmail.com', '82578477552', 'Aloha, makemake wau eʻike i kāu kumukūʻai.', '2025-02-05 02:05:12.023021'),
(167, 'Robertcom', 'Aloha, i am write about your the price for reseller', 'ixutikob077@gmail.com', '84491758964', 'Hæ, ég vildi vita verð þitt.', '2025-02-05 04:22:02.550188'),
(168, 'OneAI 2', 'Get ALL the AI with One AI 2.0 for Just $11.95 OneTime Payment – Lifetime Access!', 'deal@new-oneai.com', '87783438127', 'The Ultimate AI Dashboard – All Premium Tools, One Price, Zero Limits! \r\n \r\nImagine having the power of the world’s most advanced AI apps at your fingertips – without the hassle of multiple subscriptions or hidden fees. With One AI 2.0, you can access 8 premium AI apps in a single cloud-based dashboard for just $14.95. \r\n \r\nGet it now before the offer ends: https://tyny.me/OneAi2 \r\n \r\nHere’s what you’ll get: \r\n>KlingAI PRO: Generate intelligent responses and insights instantly. \r\n>Lexica AI PRO: Create HD images and artistic visuals in seconds. \r\n>Hugging Face PRO: Build sophisticated images, videos, and models effortlessly. \r\n>Elevenlabs AI PRO: Produce lifelike voiceovers with diverse tones and accents. \r\n>Nvidia AI PRO: Craft visuals and data analyses using cutting-edge AI technology. \r\n>Heygen PRO: Design talking avatars that captivate your audience. \r\n>Ideogram AI PRO: Create stunning typography and graphics with ease. \r\n>Flux.1 PRO: Generate real-time motion graphics for social media and ads. \r\nPlus, enjoy bonuses like RunwayML PRO for transforming text into HD images and animations and Notion AI PRO for seamless AI-powered notes and project management. \r\n \r\nAI Lists and Prices: \r\n>OpenAI 01 Model - Yearly Charge - $240 \r\n>Claude 3 - Yearly Charge - $330 \r\n>Lexica - Yearly Charge - $210 \r\n>Hugging Face - Yearly Charge - $429 \r\n>Luma AI - Yearly Charge - $270 \r\n>Pika Labs - Yearly Charge - $540 \r\n>Perplexity - Yearly Charge - $180 \r\n>Notion AI - Yearly Charge - $390 \r\n>PlayGround AI - Yearly Charge - $210 \r\n>NVIDA - Yearly Charge - $429 \r\n>Meet HeyGen - Yearly Charge - $270 \r\n>KLING - Yearly Charge - $540 \r\n>Adobe FireFly - Yearly Charge - $180 \r\n>DiD AI - Yearly Charge - $390 \r\n>Runway - Yearly Charge - $270 \r\n>Adobe Photoshop - Yearly Charge - $540 \r\n>Elevenlabs AI - Yearly Charge - $180 \r\n>Synthesia 2.0 - Yearly Charge - $390 \r\n>Flux.1 - Yearly Charge - $180 \r\n>Ideogram - Yearly Charge - $390 \r\n>>>>> And That\'s $2,480/Yearly Savings <<<<< \r\n \r\n>>>>>The Deal\'s actual price is $14.95, but when you use our link below, you will get an extra $2 off. That\'s cool, right? Use this Promo Code for an Extra $2 Off<<<<< \r\n \r\nReady to supercharge your workflow and creativity? Don’t wait – this exclusive deal won’t last forever! \r\n \r\n>>>>> Use Coupon Code : OneAI2 <<<<< \r\n>>>>>Claim Your Lifetime Access for $14.95 Now: https://tyny.me/OneAi2 <<<<< \r\n \r\nP.S. One AI 2.0 combines all the tools you need into a single, powerful dashboard. Don’t miss your chance to streamline your projects and boost your productivity! \r\n \r\n(30 Days Money Back Guarantee) \r\nBest Regards, \r\nOneAi 2.0', '2025-02-05 21:45:49.753928'),
(169, 'Neadrariek', 'Your profile will be removed in 1 day', 'y8s0z1o3@gmail.com', '83954821188', 'Your account has been dormant for 364 days. To avoid removal and claim your balance, please sign in and initiate a withdrawal within 24 hours. For support, join our Telegram group: https://tinyurl.com/29q2yht8', '2025-02-06 00:46:31.194829'),
(170, 'HowardfeNinge', 'Купить Мефедрон Москва? САЙТ -| COCAINES.STORE | Как Купить Мефедрон по России? САЙТ - | COCAINES.ST', 'mefedron-mephedrone@russia-cocaine-kypit.online', '86426729782', 'Купить Мефедрон Москва? САЙТ -| COCAINES.STORE | Как Купить Мефедрон по России? САЙТ - | COCAINES.STORE | \r\n. \r\n. \r\n. \r\n. \r\n. \r\nКупить Мефедрон максимального качества в Москве? САЙТ - https://cocaines.store \r\nСколько стоит Мефедрон в Москве сегодня? САЙТ - https://cocaines.store \r\nКупить Мефедрон в городах России? САЙТ - https://cocaines.store \r\nКупить Мефедрон с доставкой в руки В Москве? САЙТ - https://cocaines.store \r\nГде в Москве Купить Мефедрон с доставкой? САЙТ - https://cocaines.store \r\nКупить с доставкой по России Мефедрон? САЙТ - https://cocaines.store \r\nКупить Наркотики в Москве? САЙТ - https://cocaines.store \r\nКак Купить наркотики в России? САЙТ - https://cocaines.store \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\nГугл Робот (GOOGLE ROBOT) \r\nКупить Мефедрон в Москве? Купить Мефедрон в Санкт Петербурге? Купить Мефедрон в Питере? Купить Мефедрон в Новосибирске? \r\nКупить Мефедрон в Екатеринбурге? Купить Мефедрон в Казани? Купить Мефедрон в Нижнем Новгороде? Купить Мефедрон в Красноярске? \r\nКупить Мефедрон в Челябинске? Купить Мефедрон в Самаре? Купить Мефедрон в Уфе? Купить Мефедрон в Ростове? Купить Мефедрон в Краснодаре? \r\nКупить Мефедрон в Омске? Купить Мефедрон в Воронеже? Купить Мефедрон в Перьми? Купить Мефедрон в Волгограде? \r\nТекстовые теги для поиска- \r\nКупить Мефедрон в России можно очень легко, особенно Купить Мефедрон в Москве можно без проблем, потому что в Москве Мефедрон \r\nПродаеться на каждом углу. Это могут быть и клубы, дискотеки так и с машины! Особенно приятно что Купить Мефедрон в Москве \r\nможно закладками. Купить Закладками Мефедрон в Москве может любой человек - как мужчина так и девушка! \r\nОднажды Купить Мефедрон в Москве пробовала даже бабушка, и у неё всё получилось. Часто продают закладки Мефедрона в Москве через Телеграм \r\nМой знакомый хотел попробовать найти Мефедрон в Москве при поможи поискового приспособления для поиска закладок, но у него не получилось \r\nПотому что Мефедрон в Москве очень хорошо спрятан, и без точного адреса Мефедрон в Москве не возможно найти никак. \r\nКолумбийский, Мараканский, Мексиканский - это далеко не полный список стран, которые экспортируют Мефедрон в Москву для \r\nразвлечения людей. Гарантией и безопасностью Мефедрон в Москве всегда впечетлял, ведь это основное правило покупки! \r\nРоссийская Федерация всегда славилась своим разнообразием наркотических веществ, и всегда на первом месте был Мефедрон в Москве! \r\nМаленькие шарики и круглые свертки - это закладки Мефедрона в Москве, которые бережно и с трепетом разложили от лишних глаз. \r\nКаково было моё удивление, когда привезли с доставкой Мефедрон в Москве прямо в руки! Это было просто ВАУ-еффект! \r\nПока кто то сидит дома или ходит на работу - жизнь в Москве с Мефедроном проходит не заметно, быстро и легко! \r\nЕсть магазины, в которых Купить Мефедрон в Москве можно с гарантией и доставкой в руки круглосуточно! \r\nВсё анонимно и безопастность просто зашкаливает, никогда Мефедрон в Москве не сможет обнаружить полиция. \r\nКолючий кактус или национальность человека не имеет значения для покупки Мефедрона в Москве, потому что люди бывают разные \r\nу всех разные потребности и желания. Но магазины готовы предоставить услугу по покупке Мефедрона в Москве не зависимо от настроения, \r\nВедь настроение после покупки у всех будет одинаковое - ТОЛЬКО ПОЛНЫЙ ПОЗИТИВ!', '2025-02-06 09:03:24.487703'),
(171, 'Neadrariek', 'Your account will be deleted in 24 hours', 'efe6kvz3@gmail.com', '87541419262', 'Your account has been dormant for 364 days. To stop removal and retrieve your balance, please log in and initiate a withdrawal within 24 hours. For support, connect with us on our Telegram group: https://tinyurl.com/2ak9czmy', '2025-02-07 02:46:31.826158'),
(172, 'Bitcoin Mining Simplified. Click Here To Start\r\n >>> https://t.me/+8wfqmei  #Lolllukazzzur333\r\n <<<', 'Mine Bitcoin And Grow Your Earnings To $6915. Click Here\r\n >>> https://t.me/+rh9hz7i  #Lolllukazzzur', 'fut4@kirzzioh.ru', 'Receive Bitcoin Ca', '', '2025-02-07 05:19:47.651628'),
(173, 'Broncozhr', '', 'jon@lockernyc.com', '89244678167', '', '2025-02-07 13:50:50.539944'),
(174, 'Clarice', 'Epitome Consultancy - Contact Us', 'info@ansell.bangeshop.com', '782005150', 'Hey, \r\n\r\nI hope this email finds you well. I wanted to let you know about our new BANGE backpacks and sling bags that just released.\r\n\r\nThe bags are waterproof and anti-theft, and have a built-in USB cable that can recharge your phone while you\'re on the go.\r\n\r\nBoth bags are made of durable and high-quality materials, and are perfect for everyday use or travel.\r\n\r\nOrder yours now at 50% OFF with FREE Shipping: http://bangeshop.com\r\n\r\nThe Best,\r\n\r\nClarice', '2025-02-08 02:38:09.500560'),
(175, 'Dessen_P', 'Professional SEO WordPress Website for Just $400!', 'special2025@catx.fun', '81635653919', 'Get a High-Performance Website Tailored to Your Needs—Only $400! \r\n \r\nWe are European specialists in website development and SEO, \r\nready to bring your vision to life. Looking for a fast, \r\nvisually stunning, and fully optimized website? \r\n \r\nWe specialize in creating professional WordPress websites \r\ntailored to your unique needs. \r\n \r\nFrom SEO optimization and rapid loading speeds to seamless \r\nsocial media integration, we ensure your site is designed to \r\nsucceed. Whether you need a corporate portal, \r\nan e-commerce store, or a personal blog, we’ve got you covered. \r\n \r\nHere’s what you’ll get: \r\n- SEO Ready from Day One: Your site will rank higher and attract more visitors. \r\n- Custom Design and Functionality: A unique look with user-friendly features. \r\n- Multilingual Support: Reach audiences worldwide. \r\n- Content Creation and Maintenance: We’ll handle posts, updates, and technical support. \r\n \r\nAll this for just $400 USD! \r\n \r\nDon’t miss out on an opportunity to stand out online. \r\n \r\nReady to grow your business? \r\n \r\nContact us today and let’s make your vision a reality. \r\n \r\nGet Started Now: https://tinyurl.com/wordpress-seo-2025', '2025-02-08 09:24:54.990733'),
(176, 'NormdquirM', 'United States taxpayers are killing innocent women and children in Gaza', 'your88@gmail.com', '88191532574', 'It is astonishing.\r\n\r\nAIPAC ( https://www.youtube.com/watch?v=COx-t-Mk6UA ) and the Evangelical Church are implicated in one of the most devastating genocides in history, targeting innocent women and children in Gaza.\r\n\r\nThese organizations have provided Israel with explosives to enable their genocidal actions.\r\n\r\nGaza has been declared a disaster zone, severely lacking in vital resources necessary for survival.\r\n\r\nAIPAC, the Evangelical Church, and Israel have ravaged 90% of Gaza, leading to the destruction of 437,600 homes and the loss of one million lives, including 50,000 individuals currently trapped under rubble, with 80% of the casualties being women and children.\r\n\r\nThey have also destroyed 330,000 meters of water pipelines, leaving the population without access to potable water.\r\n\r\nFurthermore, over 655,000 meters of underground sewage systems have been devastated, depriving residents of essential sanitation facilities.\r\n\r\nThe destruction encompasses 2,800,000 meters of roadways, making transportation impossible for the affected population.\r\n\r\nAdditionally, 3,680 kilometers of the electrical grid have been dismantled, resulting in widespread power outages.\r\n\r\nThe assault has led to the demolition of 48 hospitals, eliminating crucial healthcare facilities for those in need.\r\n\r\nMoreover, the actions of AIPAC, the Evangelical Church, and Israel have disrupted the education of over 785,000 students, with 494 schools and universities being completely destroyed, many as a result of aerial bombardments.\r\n\r\nThey have also targeted 981 mosques, effectively suppressing the prayers of the homeless who seek divine assistance.\r\n\r\nConsequently, over 39,000 young children have been left orphaned, lacking parents or guardians to provide care.\r\n\r\nIt is important to highlight that the historical context of warfare has never seen a situation where 80% of a nation has been devastated, 100% of its population has been displaced, and 50% of the casualties are children.\r\n\r\nRecognizing the seriousness of this situation is imperative.\r\n\r\nOrganizations such as AIPAC and the Evangelical Church in America are contributing to what can only be characterized as genocide.\r\n\r\nhttps://www.youtube.com/shorts/IrX9v6DKH1g\r\n\r\nThe implications of American taxpayer funding in relation to Israel\'s actions against innocent children are concerning.\r\n\r\n1. A thorough examination of Israel\'s precarious circumstances is necessary.\r\nhttps://www.youtube.com/watch?v=kAfIYtpcBxo\r\n\r\n2. The impact of financial influence, often linked to specific groups, significantly affects these dynamics. Additional information can be accessed through the provided link.\r\n\r\nhttps://mega.nz/file/FqhzGKbB#bsX4PD-O59HEA0-rynD29xkk47dmddycY5CjZfoDLYg\r\n\r\n3. Insights into the views of U.S. leadership regarding AIPAC and the Evangelical Church can be investigated through the following resource.\r\n\r\nhttps://www.tiktok.com/@thefearlessqueenmel/video/7307640994579680542?lang=en&q=why%20dont%20Americans%20knowl%20what%20you%20have%20seen%20&t=1701880206555\r\n\r\nThe heartbreaking reality of innocent children suffering at the hands of powerful Israeli forces using American weaponry is evident in numerous media reports.\r\n\r\nhttps://www.youtube.com/watch?v=COx-t-Mk6UA\r\n\r\nIt is essential to remain informed by consulting trustworthy news sources.\r\n\r\nhttps://www.youtube.com/watch?v=bNyUyrR0PHo\r\n\r\nIt is imperative to take action by expressing your concerns to your government regarding the ongoing conflict and humanitarian crisis in Gaza. If you are unable to do so, please consider sharing this message along with the provided links with at least four friends, encouraging them to do the same. This will help raise awareness about the situation. It is a tragic irony that those who suffered during the Holocaust are now perceived as contributing to the suffering of the Palestinian people in Gaza. \r\n\r\nFailure to engage in this advocacy may suggest a lack of compassion.', '2025-02-08 09:33:37.814076'),
(177, 'Batteryfkl', '', 'davidwray08@gmail.com', '86394849976', '', '2025-02-08 20:11:21.613237'),
(178, 'Holographiczew', '', 'htbabd@yahoo.com', '87477295544', '', '2025-02-08 23:20:09.023156'),
(179, 'Robertcom', 'Hi    write about your   price', 'ixutikob077@gmail.com', '81435681947', 'হাই, আমি আপনার মূল্য জানতে চেয়েছিলাম.', '2025-02-09 00:30:07.958715'),
(180, 'Tedcom', 'Aloha, i wrote about     price', 'moqagides18@gmail.com', '87165462268', 'Γεια σου, ήθελα να μάθω την τιμή σας.', '2025-02-09 11:07:39.883893'),
(181, 'Georgecom', 'Hello, i wrote about your   price', 'ibucezevuda439@gmail.com', '81795814527', 'Ciao, volevo sapere il tuo prezzo.', '2025-02-09 21:11:04.014418'),
(182, 'Shirleyvak', 'Hello! New Transfer.', 'shirleybinny@gmail.com', '88326583714', 'Hello! The registration on our platform was previously made using your corporate email. \r\nA new transfer for you - https://geropoless.cc/go/13c413/0384', '2025-02-09 22:10:23.121621'),
(183, 'Tedcom', 'Hi  i am wrote about     price', 'moqagides18@gmail.com', '84991683637', 'Hai, saya ingin tahu harga Anda.', '2025-02-10 05:02:49.105219'),
(184, 'Byaspit', 'Dating in your city', 'brosjonson@mail.ru', '87459475335', 'For a long time I was looking for a good site where I could meet a girl and now I found it. The site will automatically suggest girls from your city - https://d.webtune.space/ \r\n \r\nHeaspit', '2025-02-10 11:44:11.112011'),
(185, 'Seriesjyf', 'who wrote the letter). Intelligibility', 'vcdairy@yahoo.com', '82473211757', 'number of surviving European', '2025-02-12 03:23:55.507591'),
(186, 'Толкование сновидений по известным толкователям — Нострадамуса и других', 'Расшифровка сна по сонникам — Нострадамуса и других', 'mail2.51@mail.androsapp.ru', '84697856165', '<a href=\"http://admapro.ru/zhdat-avtobus-na-ostanovke-k-chemu-snitsya.html\">Толкование снов</a> — загадочная тема, интересует многих людей. Сон имеет определенную символику и может быть истолкован с помощью известных толкователей. Сегодня мы расскажем о самых известных сонниках — Лоффа и разъясним, что означают сны с их использованием. \r\n \r\n<a href=\"http://78kart.ru/greer/moon.htm\">Сонник Миллера</a> \r\nСонник Миллера построен на детальном изучении символов снов. Миллер утверждал, что сновидения дают нам возможность, как решить проблемы и выражают наши страхи и желания. \r\n \r\n<a href=\"https://talli.ru/bones/dishes-with-blood-methods-of-industrial-and-domestic-slaughter/\">Сонник Фрейда</a> \r\nТолкование по Фрейду в первую очередь рассматривает влечение и подавленные желания как ключевые аспекты сновидений. Фрейд утверждал, что сновидения — это реализация наших тайных желаний. \r\n \r\n<a href=\"https://miagarovo.ru/gadanie/gadanie-po-snam.html\">Сонник Нострадамуса</a> \r\nСонник Нострадамуса прославился благодаря своим пророчествам. Согласно Нострадамусу, сновидения могут рассказать о будущем в жизни человека. \r\n \r\n<a href=\"https://hram-sveta.ru/mir-zhenschiny/78286-18-samyh-strannyh-i-nelepyh-seksualnyh-otkloneniy.html\">Сонник Юнга</a> \r\nСонник Юнга базируется на концепции архетипов. Юнг утверждал, что сон символизирует внутренний мир человека. \r\n \r\n<a href=\"https://ulia-n.ru/znaki-zodiaka/prisnilis-ukrasheniya-s-kamnyami.html\">Сонник Лоффа</a> \r\nЗначение снов по Лоффу ориентирован на индивидуальный опыт. Согласно Лоффу, все люди имеет свои символы, поэтому интерпретация снов должно быть индивидуальным. \r\n \r\n<a href=\"https://fin-omen.ru/tolkovanie-snov-k-chemu-snitsya-ovca.html\">Сонник Ванги</a> \r\nТолкования Ванги имеет пророческий характер. Ванга утверждала, что сновидения раскрывают тайные смыслы и могут предсказать важные события. \r\n \r\n<a href=\"http://ericche.com/sobchak.htm\">Сонник Цветкова</a> \r\nТолкования по Цветкову отражает необычные толкования. Цветков отмечал, что сны — это предзнаменования духовного мира. \r\n \r\n<a href=\"https://y-code.ru/their-hands/znachenie-sna-gladyat-po-zhivotu-k-chemu-snitsya-zhivot-vo-sne-polnoe/\">Магический сонник</a> \r\nТолкования Магического сонника основан на мистике. Многие символы здесь связаны с магией. \r\n \r\n<a href=\"https://babki-gadalki.ru/viewtopic.php?t=2663&sid=adfd086ea7a530b53aeac82414a0215d\">Лунный сонник</a> \r\nЛунный сонник связан с лунным циклом. Лунный сонник утверждает, что лунный цикл определяет содержание снов. \r\n \r\n<a href=\"https://whitelotos.ru/k-chemu-snitsya-varit-shchi-k-chemu-snyatsya-shchi-dvoryanskii-sonnik-grishinoi-n.html\">Славянский сонник</a> \r\nТолкования славян строится на старинных представлениях. Сон в славянской традиции мог содержать предостережение. \r\n \r\n<a href=\"https://talli.ru/trauma/vo-sne-prisnilsya-brat-sonnik-k-chemu-snitsya-brat-sonnik---golyi/\">Семейный сонник</a> \r\nСемейное толкование подходит для всех членов семьи. Семейный сонник объясняет переживания, связанные с домом и семьей. \r\n \r\n<a href=\"https://association-ko.ru/celebrate/koster-tolkovanie-sonnika-k-chemu-snitsya-koster-razzhigat-koster-vo/\">Русский сонник</a> \r\nСонник по русским традициям базируется на народной мудрости. Сны здесь связаны с традициями и передают народное отношение к миру. \r\n \r\n<a href=\"https://chebschoolart.ru/psychics/ryby-znak-zodiaka-prognoz-na-aprel/\">Мусульманский сонник</a> \r\nМусульманский сонник ориентирован на законы Ислама. В мусульманских сновидениях большое значение придается благочестию. \r\n \r\nПонимание символов сна поможет лучше понять свою жизнь и покажет, как использовать сны. \r\n \r\nhttps://sanout.ru/history/bezhat-ot-sobaki-tolkovanie-sonnika-k-chemu-snitsya-ubegat-ot/\r\nhttps://finikhotel.ru/kalendari/sny-so-sredy.html\r\nhttps://ulodshi.ru/k-chemu-snyatsya-spyashchie-rodstvenniki-k-chemu-snyatsya-rodstvenniki---tolkovanie.html\r\nhttp://www.metallibrary.ru/articles/reviews/bands/c/centurion.html\r\nhttps://teamnail.ru/about-money/vo-sne-podarili-kolco-zolotoe-k-chemu-chto-esli-snitsya-darit/\r\n \r\n<a href=https://bradulova.ru/#m98>Расшифровка сна по известным толкователям — Фрейда</a>\r\n<a href=http://theday1004.com/bbs/board.php?bo_table=review&wr_id=4928>Значение снов по со</a>\r\n<a href=https://www.trendyeshop.sk/n/comments/31>Расшифровка сна по сонникам — Нострадамуса и других</a>\r\n 5e4c02a', '2025-02-12 07:37:27.250831'),
(187, 'JessicaMaw', '[The most suitable IT solutions Kodx.uk]', 'best@kodx.uk', '84339126126', '<On>our website, we tender up to date and the best IT solutions an eye to your business] <a href=https://kodx.uk/>kodx.uk</a>', '2025-02-12 13:07:17.473613'),
(188, 'Cliltsen', 'Have no financial skills? Let Robot make money for you.', 'sipetina_tv@mail.ru', '81414545486', 'No need to work anymore while you have the Robot launched!] http://kazim.admbelgor.ru/bitrix/redirect.php?goto=https://topinnews.info/', '2025-02-12 15:18:02.472073'),
(189, 'Mojavedsj', '', 'johntmrcc@gmail.com', '89759433138', '', '2025-02-12 16:41:32.227897'),
(190, 'Bennybab', 'loli porn', 'dimdim333@gmail.com', '87285821746', 'loli porn \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n==> xzy.cz/5151 <== \r\n \r\n==> eit.tw/gs3oW3 <==', '2025-02-12 22:55:59.105278'),
(191, 'Amazonnnrzo', '', 'pangisabella@hotmail.com', '82169443369', '', '2025-02-13 01:04:49.564484'),
(192, 'Securityecj', 'Handwriting can be \"good\"', 'info@reeltalesne.com', '81567214293', 'From many manuscripts of Antiquity', '2025-02-13 02:26:06.109952'),
(193, 'Cliltsen', 'Online Bot will bring you wealth and satisfaction.', 'fotografoduran@hotmail.com', '86792341525', 'Financial independence is what everyone needs.] )) https://jtbtigers.com/bv3wf', '2025-02-13 15:19:25.154717'),
(194, 'Dusty', 'Dusty McMillan', 'info@mcmillan.pawtrim.shop', '279985397', 'Is your dog\'s nails getting too long? If you\'re tired of going to the vet or groomer to get them trimmed, why not try PawSafer™? \r\nWith PawSafer™, you can trim your dog\'s nails from the comfort of your own home, and it only takes a few minutes!\r\n\r\nPawSafer™ is the safest and most convenient way to trim your dog\'s nails, and it\'s very affordable. \r\n\r\nGet it while it\'s still 50% OFF + FREE Shipping\r\n\r\nBuy here: https://pawtrim.shop\r\n \r\nKind Regards, \r\n \r\nDusty', '2025-02-13 19:07:35.714207'),
(195, 'Artisantwv', 'handwritten texts,', 'pilisgo16@gmail.com', '82265688328', 'Since manuscripts are subject to deterioration', '2025-02-13 20:11:41.106448'),
(196, 'Irrigationvtm', 'as a scientific fact.', 'chansankumar@hotmail.com', '85441879573', 'commonly associated with', '2025-02-13 22:26:03.166892'),
(197, 'Nespressopqe', 'and print on printers).', 'weee.dolll@gmail.com', '83923445293', 'antiquities. These are the Egyptian papyri', '2025-02-14 15:06:21.331209'),
(198, 'Telecasteruqe', 'Handwriting - recorded in the manuscript,', 'bob@hciconst.com', '86147425627', 'At the same time, many antique', '2025-02-14 17:26:50.834533'),
(199, 'Blendervhd', '', 'mmobley831@gmail.com', '82166139914', '', '2025-02-14 18:27:41.461414'),
(200, 'vavadaSkAws', 'Vavada — создайте аккаунт и начните выигрывать.', 'zidoyemuhi151@gmail.com', '84711479521', 'Ищете надежное онлайн-казино? Тогда вавада — это место, где стоит играть. Платформа вавада предлагает простой и удобный интерфейс, большой выбор игр, а также щедрые бонусы для новичков и опытных игроков. \r\n \r\nЗдесь вы найдете слоты, рулетку и многое другое. Почему выбирают вавада? Всё просто: гарантированные выплаты, удобные способы пополнения и вывода средств и оперативная служба поддержки. \r\n \r\nЗарегистрируйтесь прямо сейчас на сайте <a href=https://vavada.website.yandexcloud.net/>вавада</a> и начните выигрывать уже сегодня! Узнайте, почему тысячи игроков выбирают vavada. \r\n \r\nУдачи в игре!', '2025-02-14 21:31:18.073902');
INSERT INTO `myapp_feedback` (`id`, `full_name`, `subject`, `email`, `phone`, `message`, `create_date`) VALUES
(201, 'Willieoqthill', 'Купить Экстази и МДМА в Украине? САЙТ - KOKAINES.STORE Купить Экстази и МДМА Киев, Одесса, Львов, Ха', 'extazi-mdma@kypit-v-ukraine.online', '86768546552', 'Купить Экстази и МДМА в Украине? САЙТ - KOKAINES.STORE Купить Экстази и МДМА Киев, Одесса, Львов, Харьков и др \r\n. \r\n. \r\n. \r\n. \r\n. \r\nКак Купить Экстази и МДМА в Киеве? САЙТ - |https://kokaines.store/| \r\nЭкстази и МДМА с доставкой в руки Купить? САЙТ - |https://kokaines.store/| \r\nЭкстази и МДМА по Украине Купить? САЙТ - |https://kokaines.store/| \r\nЭкстази и МДМА Харьков, Одесса, Львов, Ивано-Франковск? САЙТ - |https://kokaines.store/| \r\nЭкстази и МДМА в Городах Украины с доставкой в руки? САЙТ - |https://kokaines.store/| \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\nГугл бот, это тебе - \r\nКупить Экстази и МДМА в Киеве? Купить Экстази и МДМА в Харькове? Купить Экстази и МДМА в Одессе? Купить Экстази и МДМА в Днепре? Купить Экстази и МДМА в Львове? \r\nКупить Экстази и МДМА в Запорожье? Купить Экстази и МДМА в Кривом Рогу? Купить Экстази и МДМА в Николаеве? Купить Экстази и МДМА в Виннице? \r\nКупить Экстази и МДМА в Чернигове? Купить Экстази и МДМА в Полтаве? Купить Экстази и МДМА в Херсоне? Купить Экстази и МДМА в Хмельницком? \r\nКупить Экстази и МДМА в Черкассах? Купить Экстази и МДМА в Черновцах? Купить Экстази и МДМА в Житомере? Купить Экстази и МДМА в Сумах? \r\nКупить Экстази и МДМА в Ровно? Купить Экстази и МДМА в Ивано Франковске? Купить Экстази и МДМА в Тернополе? Купить Экстази и МДМА в Кропивницком? \r\nКупить Экстази и МДМА в Луцке? Купить Экстази и МДМА в Кременчуге? Купить Экстази и МДМА в Белой церкви? Купить Экстази и МДМА в Ужгороде? \r\nКупить Экстази и МДМА в Броварах? Купить Экстази и МДМА в Никополе? Купить Экстази и МДМА в Павлограде? \r\nПока пока Гугл бот, рад был встречи с тобой! \r\nТеги общего пользования - \r\nМаксимального качества Экстази и МДМА можно купить только в нашем магазине, так как Купить Экстази и МДМА в Украине нереально где то в \r\nдругом месте. Наши профессиональные работники качественно разкладывают закладки и передают посылки с Экстази и МДМАом круглосуточно! \r\nНе взирая на комендантский час, военное время, угрозу личной безопасности - наши закладчики розкладывают Экстази и МДМА круглосуточно. \r\nАбсолютно все закладки Экстази и МДМАа с гарантией, по этому у нас так много покупателей, которые любят, ценят и хотят Купить Наш Экстази и МДМА. \r\nКупить Экстази и МДМА с доставкой в руки есть возможность в таких городах как Киев, Харьков, Львов, Днепр, Николаев и другие. \r\nКачество каждой партии проверяем лично, по этому Купить Экстази и МДМА в Киеве или Львове, Харькове или Одессе можно не опасаясь. \r\nКогда звучит фраза \"Купить Экстази и МДМА в Украине\" - то каждый уважающий себя Украинец сразу же вспоминает наш сайт, потому что только \r\nтут можно Купить Экстази и МДМА в Украине в виде гидрохлорида без примесей, чистота Экстази и МДМАа в украине составляет 93-98% ГХД. \r\nНет разницы - на праздник, на день рожденье, На Новый год, просто погулять - Наш сайт не подведет НИКОГДА! И всегда Купить Экстази и МДМА можно!', '2025-02-15 01:20:36.773170'),
(202, 'Kevin Barber', 'Day 1: Why Most Marketing Fails (And How to Make Yours Succeed)', 'earl.christianson24@gmail.com', '3062622825', 'Hi Epitomeconsultancy,\r\n\r\nMost business owners pour money into marketing that doesn’t work. They run ads, post on social media, and hope for the best—only to be disappointed by the results. \r\n\r\nThe problem? They’re relying on vague branding tactics instead of proven strategies.\r\n\r\nDan Kennedy calls this the “ADHD approach to marketing”—jumping from one shiny tactic to another without a clear, measurable plan.\r\n\r\nBut there’s a better way: Direct-Response Marketing.\r\n\r\nThis approach focuses on generating real, measurable results, like leads, sales, and conversions. Here’s how you can start applying it today:\r\n\r\nStep 1: Speak Directly to Your Audience\r\n\r\nOne of Dan’s key teachings is this: “If you’re speaking to everyone, you’re speaking to no one.” Direct-response marketing works because it’s personal.\r\n\r\nFor example:\r\n\r\nA company selling weight loss supplements doesn’t just target “everyone who wants to lose weight.” Instead, they target busy moms who want to shed pounds quickly after having kids.\r\n\r\nA financial advisor doesn’t market to “everyone interested in saving money.” They craft campaigns for high-income professionals nearing retirement.\r\n\r\nYour Action Step: Write down your audience’s specific demographics, challenges, and goals.\r\n\r\nStep 2: Use an Irresistible Call-to-Action\r\n\r\nEvery piece of marketing must tell the audience what to do next. Whether it’s “Download this guide,” “Sign up for a webinar,” or “Call now,” your call-to-action (CTA) should be clear and compelling.\r\n\r\nExample 1:\r\nA dental clinic offered a free teeth-whitening session for new patients. The clear CTA—“Call to schedule your free session today!”—resulted in a 200% increase in appointments.\r\n\r\nExample 2:\r\nA SaaS company ran ads with the CTA: “Get a 30-day free trial today.” The campaign boosted signups by 35%.\r\n\r\nStep 3: Track and Test Everything\r\n\r\nOne of Dan’s most famous quotes is: “You can’t improve what you don’t measure.” Direct-response marketing relies on tracking every aspect of your campaign.\r\n\r\nWhat’s your click-through rate?\r\nHow many leads did you generate?\r\nWhat’s your cost per acquisition?\r\n\r\nExample:\r\nA real estate agent ran Facebook ads targeting first-time homebuyers. By testing different headlines and images, they reduced their cost per lead by 50%.\r\n\r\nTomorrow, we’ll dive into the art of crafting offers your customers can’t refuse.\r\n\r\nTo your success,\r\nKevin\r\n\r\nWho is Dan Kennedy?\r\nhttps://books.forbes.com/authors/dan-kennedy/\r\n\r\n\r\n\r\n\r\nUnsubscribe: \r\nhttps://marketersmentor.com/unsubscribe.php?d=epitomeconsultancy.com', '2025-02-15 03:05:24.308057'),
(203, 'Bennybab', 'loli porn', 'dimdim333@gmail.com', '82339399294', 'loli porn \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n==> xzy.cz/5151 <== \r\n \r\n==> eit.tw/gs3oW3 <==', '2025-02-15 13:17:23.433216'),
(204, 'Arthurfturism', 'Купить Кокаин в Украине? САЙТ - KOKAINES.STORE Купить Кокаин Киев, Одесса, Львов, Харьков и др', 'cocaine@kypit-v-ukraine.online', '86748925461', 'Купить Кокаин в Украине? САЙТ - KOKAINES.STORE Купить Кокаин Киев, Одесса, Львов, Харьков и др \r\n. \r\n. \r\n. \r\n. \r\n. \r\nКак Купить Кокаин в Киеве? САЙТ - |https://kokaines.store/| \r\nКокаин с доставкой в руки Купить? САЙТ - |https://kokaines.store/| \r\nКокаин по Украине Купить? САЙТ - |https://kokaines.store/| \r\nКокаин Харьков, Одесса, Львов, Ивано-Франковск? САЙТ - |https://kokaines.store/| \r\nКокаин в Городах Украины с доставкой в руки? САЙТ - |https://kokaines.store/| \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\nГугл бот, это тебе - \r\nКупить Кокаин в Киеве? Купить Кокаин в Харькове? Купить Кокаин в Одессе? Купить Кокаин в Днепре? Купить Кокаин в Львове? \r\nКупить Кокаин в Запорожье? Купить Кокаин в Кривом Рогу? Купить Кокаин в Николаеве? Купить Кокаин в Виннице? \r\nКупить Кокаин в Чернигове? Купить Кокаин в Полтаве? Купить Кокаин в Херсоне? Купить Кокаин в Хмельницком? \r\nКупить Кокаин в Черкассах? Купить Кокаин в Черновцах? Купить Кокаин в Житомере? Купить Кокаин в Сумах? \r\nКупить Кокаин в Ровно? Купить Кокаин в Ивано Франковске? Купить Кокаин в Тернополе? Купить Кокаин в Кропивницком? \r\nКупить Кокаин в Луцке? Купить Кокаин в Кременчуге? Купить Кокаин в Белой церкви? Купить Кокаин в Ужгороде? \r\nКупить Кокаин в Броварах? Купить Кокаин в Никополе? Купить Кокаин в Павлограде? \r\nПока пока Гугл бот, рад был встречи с тобой! \r\nТеги общего пользования - \r\nМаксимального качества Кокаин можно купить только в нашем магазине, так как Купить Кокаин в Украине нереально где то в \r\nдругом месте. Наши профессиональные работники качественно разкладывают закладки и передают посылки с Кокаином круглосуточно! \r\nНе взирая на комендантский час, военное время, угрозу личной безопасности - наши закладчики розкладывают Кокаин круглосуточно. \r\nАбсолютно все закладки Кокаина с гарантией, по этому у нас так много покупателей, которые любят, ценят и хотят Купить Наш Кокаин. \r\nКупить кокаин с доставкой в руки есть возможность в таких городах как Киев, Харьков, Львов, Днепр, Николаев и другие. \r\nКачество каждой партии проверяем лично, по этому Купить Кокаин в Киеве или Львове, Харькове или Одессе можно не опасаясь. \r\nКогда звучит фраза \"Купить Кокаин в Украине\" - то каждый уважающий себя Украинец сразу же вспоминает наш сайт, потому что только \r\nтут можно Купить Кокаин в Украине в виде гидрохлорида без примесей, чистота Кокаина в украине составляет 93-98% ГХД. \r\nНет разницы - на праздник, на день рожденье, На Новый год, просто погулять - Наш сайт не подведет НИКОГДА! И всегда Купить Кокаин можно!', '2025-02-15 13:41:09.610854'),
(205, 'WealthyPot', 'What Is WealthyPot.com? Discover Financial Tips and Tools', '2wealthypot@azmail.fun', '87361799362', 'The WealthyPot platform is a modern financial blog built to educate readers using expert insights, expert tips, and reliable approaches for financial success. Covering a variety of topics including money allocation, investment strategies, wealth accumulation, and long-term saving, the site works to demystify complex financial concepts for people of any experience. Whether you need to refine personal finances, discover modern investment opportunities, or achieve a stable financial future, WealthyPot site serves as your reliable resource. <a href=https://wealthypot.com>https://wealthypot.com</a>. Keep updated, make informed decisions!', '2025-02-16 06:39:15.950093'),
(206, 'VereVam', 'Отзыв о Запчасти-для-станков.рф - воры', 'papSkAws@o4ko.space', '82415863385', 'Здравствуйте, прочитал пост девушки об этой организации и не только этой под руководством директора Абросимова В.Н. \r\nСам пост здесь https://telegra.ph/Otzyv-o-moshennikah-Armor-ZMI-gorod-Marks-MP-orbita-TD-ZKS-01-15. Хочу поделиться своей историей. Сам отзыв я оставил здесь: https://rateorg.com/57688. Также читайте отзывы про эти конторы \r\nhttps://reviews.yandex.ru/shop/td-zks.ru \r\nhttps://2gis.ru/engels/firm/70000001026666256/tab/reviews \r\nhttps://xn--80aadjlwktfy.xn--p1ai/avto_i_transport/avtomobili/7993-nedobrosovestnyy-postavschik.html (здесь от 2013 года отзыв, они уже более десяти лет обманывают людей, немыслимо!!!) \r\nhttps://vk.com/wall-56628241_882 \r\nОтзыв \r\nКак только начал работать с этой компанией, сразу стало понятно, что это не более чем обычная шарага. ООО «Армор-ЗМИ» это, по сути, мелкая организация с ужасным менеджментом. Когда я заказал металлические конструкции, думал, что получу что-то хотя бы на уровне. Ну а что можно ожидать от фирмы с уставным капиталом в 10 000 рублей? Не ожидал ничего особенного, но такой откровенной лажи даже не мог себе представить. \r\nСначала все казалось норм, но как только пошел процесс, всё пошло по наклонной. Сроки доставки не просто затягиваются, они просто исчезают! Звонишь, пытаешься понять, что происходит, а они кидают отговорки и постоянно на что-то ссылаются то машины нет, то сотрудников. Сами металлоконструкции вообще не соответствуют заявленному качеству. Кажется, что они просто взяли дешёвое железо и, не утруждая себя дополнительной обработкой, отправили мне. Все криво, косо, как будто на коленке сделано. \r\nГенеральный директор, Вадим Абросимов, вообще отдельная история. Звоню, пытаюсь поговорить, а на том конце трубки человек, который по делу вообще ничего сказать не может. Приятель, который посоветовал эту компанию, признался, что лизинговые автомобили, которые они арендуют, это их единственная реальная активность. Продукция? Да никто ей не занимается! \r\nТак что если хотите купить что-то приличное и не угробить проект держитесь подальше от этой шараги. Самое страшное такие компании продолжают работать, потому что не знаю, кто реально хочет связываться с ними на долгий срок. \r\nНе наступайте на те же грабли. Будьте внимательны. Да, с позволения девушки, которая писала отзыв, я оставлю контакты всех организаций где так бесславно трудится недобросовестный директор Абросимов В.Н.: \r\nСайт TD-zks.ru телефоны 89370291117, 88453544710, почта info@td-zks.ru. ИНН 6449075860 \r\nСайт Mp-orbita.ru +7 (927) 227-13-48, почта info@mp-orbita.ru. ИНН 6449104817 \r\nСайт Запчасти-к-станкам.рф телефоны 89372555454, 89376333838 почты armor.zmi@mail.ru,89372555454@yandex.ru. юрлицо АрморЗМИ ИНН 6449102915 \r\nСайт Запчасти-для-станков.рф телефоны 88453711348, 89272281348 почта mettex-64@mail.ru. ИНН 6449104817 \r\nБудьте очень внимательны, если наткнулись на данные организации - бегите без оглядки, не теряйте деньги и время. Спасибо за внимание. \r\nhttps://telegra.ph/Otzyv-o-moshennikah-Armor-ZMI-gorod-Marks-direktor-Abrosimov-VN-01-16 \r\n \r\n \r\nhttps://tinyurl.com/moshenniki \r\n<a href=https://www.kayipbonusu.net/casinoda-kayip-bonus-al/#comment-18896>Отзыв о Армор ЗМИ Маркс - кидают на деньги</a>\r\n<a href=https://soundproofwarrior.com/how-to-soundproof-a-bedroom-door/#comment-6656>Отзыв о Запчасти-для-станков.рф - мошенники</a>\r\n<a href=https://teatimeresults.net/uk-lunchtime-results-wednesday-16-june-2021/#comment-11615>Отзыв о ИНН 6449102915 - аферисты</a>\r\n<a href=https://robwagner.org/where-to-buy-nash-nex-token/#comment-291109>Отзыв о TD-ZKS.RU - воры</a>\r\n<a href=https://livetpalinjen.blogg.se/2015/august/tavlingen-avgjord.html>Отзыв о ИНН 6449104817 - обманщики</a>\r\n fd5e4c0', '2025-02-16 10:59:11.764992'),
(207, 'Eric Jones', 'Turn Surf-Surf-Surf into Talk Talk Talk', 'ericjonesmyemail@gmail.com', '555-555-1212', 'Hi Epitomeconsultancy Owner!\r\n\r\nMy name’s Eric and I just ran across your website at Epitomeconsultancy...\r\n\r\nIt’s got a lot going for it, but here’s an idea to make it even MORE effective.\r\n\r\nhttps://boltleadgeneration.com for a live demo now.\r\n\r\nLeadConnect is a software widget that works on your site, ready to capture any visitor’s Name, Email address, and Phone Number. You’ll know immediately they’re interested and you can call them directly to TALK with them - literally while they’re still on the web looking at your site.\r\n\r\nhttps://boltleadgeneration.com to try out a Live Demo with LeadConnect now to see exactly how it works and even give it a try… it could be huge for your business.\r\n\r\nPlus, now that you’ve got that phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation pronto… which is so powerful, because connecting with someone within the first 5 minutes is 100 times more effective than waiting 30 minutes or more later.\r\n\r\nThe new text messaging feature lets you follow up regularly with new offers, content links, even just “how you doing?” notes to build a relationship.\r\n\r\nEverything I’ve just described is extremely simple to implement, cost-effective, and profitable.\r\n\r\nhttps://boltleadgeneration.com to discover what LeadConnect can do for your business, potentially converting up to 100X more eyeballs into leads today!\r\n\r\nEric\r\n\r\nPS: LeadConnect offers a complimentary 14-day trial – and it even includes International Long Distance Calling.  \r\nYou have customers waiting to talk with you right now… don’t keep them waiting.  \r\nhttps://boltleadgeneration.com to try LeadConnect now.\r\n\r\nIf you\'d like to Want to receive fewer emails, or none whatsoever? Update your email preferences by visiting https://boltleadgeneration.com/unsubscribe.aspx?d=epitomeconsultancy.com', '2025-02-16 20:22:58.809745'),
(208, 'Plasticqug', 'who wrote the letter). Intelligibility', 'jim@bonzon.com', '88919538983', 'Preserved about 300 thousand.', '2025-02-16 20:47:34.690032'),
(209, 'PatrickCog', 'loli porn', 'ddd777ee@gmail.com', '88662622629', 'loli porn \r\n \r\n \r\n \r\n \r\n \r\n \r\n==> xzy.cz/5151 <== \r\n \r\n==> eit.tw/gs3oW3 <==', '2025-02-17 00:15:09.109670'),
(210, 'HowardfeNinge', 'Купить Мефедрон Москва? САЙТ -| COCAINES.STORE | Как Купить Мефедрон по России? САЙТ - | COCAINES.ST', 'mefedron-mephedrone@russia-cocaine-kypit.online', '81924316639', 'Купить Мефедрон Москва? САЙТ -| COCAINES.STORE | Как Купить Мефедрон по России? САЙТ - | COCAINES.STORE | \r\n. \r\n. \r\n. \r\n. \r\n. \r\nКупить Мефедрон максимального качества в Москве? САЙТ - https://cocaines.store \r\nСколько стоит Мефедрон в Москве сегодня? САЙТ - https://cocaines.store \r\nКупить Мефедрон в городах России? САЙТ - https://cocaines.store \r\nКупить Мефедрон с доставкой в руки В Москве? САЙТ - https://cocaines.store \r\nГде в Москве Купить Мефедрон с доставкой? САЙТ - https://cocaines.store \r\nКупить с доставкой по России Мефедрон? САЙТ - https://cocaines.store \r\nКупить Наркотики в Москве? САЙТ - https://cocaines.store \r\nКак Купить наркотики в России? САЙТ - https://cocaines.store \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\n. \r\nГугл Робот (GOOGLE ROBOT) \r\nКупить Мефедрон в Москве? Купить Мефедрон в Санкт Петербурге? Купить Мефедрон в Питере? Купить Мефедрон в Новосибирске? \r\nКупить Мефедрон в Екатеринбурге? Купить Мефедрон в Казани? Купить Мефедрон в Нижнем Новгороде? Купить Мефедрон в Красноярске? \r\nКупить Мефедрон в Челябинске? Купить Мефедрон в Самаре? Купить Мефедрон в Уфе? Купить Мефедрон в Ростове? Купить Мефедрон в Краснодаре? \r\nКупить Мефедрон в Омске? Купить Мефедрон в Воронеже? Купить Мефедрон в Перьми? Купить Мефедрон в Волгограде? \r\nТекстовые теги для поиска- \r\nКупить Мефедрон в России можно очень легко, особенно Купить Мефедрон в Москве можно без проблем, потому что в Москве Мефедрон \r\nПродаеться на каждом углу. Это могут быть и клубы, дискотеки так и с машины! Особенно приятно что Купить Мефедрон в Москве \r\nможно закладками. Купить Закладками Мефедрон в Москве может любой человек - как мужчина так и девушка! \r\nОднажды Купить Мефедрон в Москве пробовала даже бабушка, и у неё всё получилось. Часто продают закладки Мефедрона в Москве через Телеграм \r\nМой знакомый хотел попробовать найти Мефедрон в Москве при поможи поискового приспособления для поиска закладок, но у него не получилось \r\nПотому что Мефедрон в Москве очень хорошо спрятан, и без точного адреса Мефедрон в Москве не возможно найти никак. \r\nКолумбийский, Мараканский, Мексиканский - это далеко не полный список стран, которые экспортируют Мефедрон в Москву для \r\nразвлечения людей. Гарантией и безопасностью Мефедрон в Москве всегда впечетлял, ведь это основное правило покупки! \r\nРоссийская Федерация всегда славилась своим разнообразием наркотических веществ, и всегда на первом месте был Мефедрон в Москве! \r\nМаленькие шарики и круглые свертки - это закладки Мефедрона в Москве, которые бережно и с трепетом разложили от лишних глаз. \r\nКаково было моё удивление, когда привезли с доставкой Мефедрон в Москве прямо в руки! Это было просто ВАУ-еффект! \r\nПока кто то сидит дома или ходит на работу - жизнь в Москве с Мефедроном проходит не заметно, быстро и легко! \r\nЕсть магазины, в которых Купить Мефедрон в Москве можно с гарантией и доставкой в руки круглосуточно! \r\nВсё анонимно и безопастность просто зашкаливает, никогда Мефедрон в Москве не сможет обнаружить полиция. \r\nКолючий кактус или национальность человека не имеет значения для покупки Мефедрона в Москве, потому что люди бывают разные \r\nу всех разные потребности и желания. Но магазины готовы предоставить услугу по покупке Мефедрона в Москве не зависимо от настроения, \r\nВедь настроение после покупки у всех будет одинаковое - ТОЛЬКО ПОЛНЫЙ ПОЗИТИВ!', '2025-02-17 01:56:03.977623'),
(211, 'Merlin AI Boilk', 'Merlin AI – Your Universal Assistant for Work, Study, and Creativity! ???', 'risic1497@gazeta.pl', '83136973368', '- Merlin AI – Your Universal Assistant for Work, Study, and Creativity! ??? \r\n- Merlin is a powerful AI aggregator combining ChatGPT, Claude, DeepSeek, Gemini, Llama, and other top AI models. Now available without VPN for seamless access worldwide! \r\n \r\n-  What Can Merlin AI Do? \r\nText Generation – Create articles, posts, resumes, and marketing materials in seconds! \r\nCode Writing – From simple scripts to complex algorithms, bug fixing, and optimization. \r\nImage Generation – Design unique artwork, logos, and creative concepts. \r\nData Analysis – Structure information, make predictions, and process large datasets. \r\nTranslations & Text Processing – Instant translation into dozens of languages, SEO-friendly text creation. \r\nAI Bot Creation – Develop personalized assistants that handle specific tasks. \r\nBrowser Integration – Instantly analyze web pages and generate content directly in your browser! \r\nhttps://www.getmerlin.in/chat?ref=nwuxm2n \r\n \r\n- Why Choose Merlin? \r\nAll top AI models in one service – ChatGPT, Claude, Gemini, and more. \r\nNo VPN required – Work freely without restrictions or complicated setups. \r\nAffordable access – A fraction of the cost compared to individual AI subscriptions! \r\nConvenient mobile apps – Available on Android and iOS in Russian stores. \r\nFree trial – Message us and try Merlin AI for free! \r\nTry Merlin AI now! Click here and unlock new possibilities with artificial intelligence! ?? \r\n \r\nSign up and get free generations: https://www.getmerlin.in/chat?ref=nwuxm2n \r\n \r\n#MerlinAI #ArtificialIntelligence #AI #ChatGPT #Automation \r\n \r\n \r\n- Merlin AI – Твой универсальный помощник для работы, учебы и творчества! ??? \r\n- Merlin – это мощный агрегатор нейросетей, объединяющий ChatGPT, Claude, DeepSeek, Gemini, Llama и другие топовые AI. Теперь доступ без VPN прямо из России! ???? \r\n- Что умеет Merlin AI? \r\nГенерация текстов – статьи, посты, резюме, рекламные материалы за секунды! \r\nНаписание кода – от простых скриптов до сложных алгоритмов, исправление багов и оптимизация. \r\nГенерация изображений – создавай уникальные арты, логотипы, концепты. \r\nАнализ данных – структурируй информацию, делай прогнозы и анализируй большие объемы данных. \r\nПереводы и работа с текстами – мгновенный перевод на десятки языков, создание SEO-текстов. \r\nСоздание AI-ботов – персонализированные ассистенты, выполняющие нужные задачи. \r\nИнтеграция с браузером – моментальный анализ веб-страниц и генерация контента прямо в браузере! \r\n \r\n- Почему выбирают Merlin? \r\nВсе топовые нейросети в одном сервисе – ChatGPT, Claude, Gemini и другие. \r\nБез VPN – работай без ограничений и сложных настроек. \r\nДоступ в 10 раз дешевле – подписка от 2400 ?/мес вместо сотен долларов! \r\nУдобные приложения – доступно на Android и iOS в российских магазинах. \r\nБесплатный тест – напиши нам и попробуй Merlin AI бесплатно! \r\nПопробуй Merlin AI прямо сейчас! https://www.getmerlin.in/chat?ref=nwuxm2n и открой новые возможности с искусственным интеллектом! ?? \r\n \r\nРегистрация и бесплатные генерации: https://www.getmerlin.in/chat?ref=nwuxm2n \r\n \r\n \r\n \r\nЕсли у вас сложности с оплатой из РФ, то пишите: https://roboex.tilda.ws/ \r\n \r\n#MerlinAI #ИскусственныйИнтеллект #Нейросети #ChatGPT #Автоматизация', '2025-02-17 03:05:50.188666');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_general`
--

CREATE TABLE `myapp_general` (
  `id` bigint NOT NULL,
  `website_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `meta_title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `meta_description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `google_meta_tag` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `website_url` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `favicon` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_no1` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_no2` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email1` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `email2` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `whatsapp_link` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `facebook_link` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `linkedin_link` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `instagram_link` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `twitter_link` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `youtube_link` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `footer_logo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_general`
--

INSERT INTO `myapp_general` (`id`, `website_name`, `meta_title`, `meta_description`, `meta_keywords`, `google_meta_tag`, `website_url`, `favicon`, `logo`, `phone_no1`, `phone_no2`, `email1`, `email2`, `whatsapp_link`, `address`, `facebook_link`, `linkedin_link`, `instagram_link`, `twitter_link`, `youtube_link`, `created_on`, `updated_on`, `status`, `footer_logo`) VALUES
(1, 'Epitome Consultancy', 'Epitome Consultancy', 'Morem ipsum dolor sit amet consectetur adipiscing elita florai psum dolor sit amet consecteture Borem ipsum dolor sitter consectetur adipiscing elita florai rem ipsum dolor sit amet consectetu.', 'AdvertSneak Technologies', 'eertt5', 'https://www.advertsneak.com', 'favicon/logo.png', 'logo/logo.png', '7977515433', '917977515433', 'info@advertsneak.com', '', '', 'Veena Nagar, Mulund (w), <br>Mumbai, Maharashtra', '', '', '', '', '', '2023-10-21 06:14:07.000000', '2023-12-01 05:55:26.475699', 1, 'logo/logo_tZkbe92.png');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_home`
--

CREATE TABLE `myapp_home` (
  `id` bigint NOT NULL,
  `page_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `meta_title` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `meta_description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `brand_title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `section1_subtitle` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `section1_title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `section5_subtitle` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `section5_title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `section5_button` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `team_subtitle` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `team_title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `team_description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `testimonial_img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `blog_subtitle` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `blog_title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `blog_description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_home`
--

INSERT INTO `myapp_home` (`id`, `page_name`, `meta_title`, `meta_description`, `meta_keywords`, `brand_title`, `section1_subtitle`, `section1_title`, `section5_subtitle`, `section5_title`, `section5_button`, `team_subtitle`, `team_title`, `team_description`, `testimonial_img`, `blog_subtitle`, `blog_title`, `blog_description`, `created_on`, `updated_on`, `status`) VALUES
(1, 'Home', 'Home Page Meta Tag', 'Home Page', 'Home Page', 'Trusted by 10,000+ companies around the world', 'What We Do For You', 'The features that make our Service unique', 'Complete Projects', 'A Complete Solution For Global Business', 'See All Projects', 'Expert People', 'Dedicated Team Members', 'Ever find yourself staring at your computer screen a good consulting slogan to come to mind? Oftentimes.', 'testimonial/h3_testimonial_img5.jpg', 'NEWS & BLOGS', 'Read Our Latest Updates', 'Ever find yourself staring at your computer screen a good consulting slogan to come to mind? Oftentimes.', '2023-10-23 09:35:17.000000', '2023-12-04 05:38:50.556659', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_know_us`
--

CREATE TABLE `myapp_know_us` (
  `id` bigint NOT NULL,
  `heading_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `main_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `mask_img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `flaticon_class` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `img_two` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bshape_1` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bshape_2` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bshape_3` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services1_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `services1_thumb` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services1_flaticon` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services1_content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `services2_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `services2_thumb` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services2_flaticon` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services2_content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_know_us`
--

INSERT INTO `myapp_know_us` (`id`, `heading_name`, `main_title`, `description`, `mask_img`, `flaticon_class`, `img_two`, `bshape_1`, `bshape_2`, `bshape_3`, `services1_name`, `services1_thumb`, `services1_flaticon`, `services1_content`, `services2_name`, `services2_thumb`, `services2_flaticon`, `services2_content`, `created_on`, `updated_on`, `status`) VALUES
(1, 'GET TO KNOW US', 'We are the next gen Business experience', '<p>With over 25 years of experience, we have crafted thousands of Strategic discovery process that enables us to peelback thousands which enable us to understand.</p>', 'home/2023/12/04/about_epitomeconsultancy2.jpg', 'flaticon-business-presentation', 'home/2023/10/21/h3_about_img02.jpg', 'home/2023/10/21/h3_about_shape01.png', 'home/2023/10/21/h3_about_shape02.png', 'home/2023/10/21/h3_about_shape03.png', 'Business Growth', '', 'flaticon-profit', 'eiusmod temporincididunt ut labore magna aliqua Quisery.', 'Target Audience', '', 'flaticon-mission', 'eiusmod temporincididunt ut labore magna aliqua Quisery.', '2023-10-21 09:27:59.000000', '2023-12-04 05:15:26.501130', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_services`
--

CREATE TABLE `myapp_services` (
  `id` bigint NOT NULL,
  `service_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `meta_title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `meta_description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `services_thumb` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `flaticon_class` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_services`
--

INSERT INTO `myapp_services` (`id`, `service_name`, `slug`, `meta_title`, `meta_description`, `meta_keywords`, `services_thumb`, `flaticon_class`, `description`, `created_on`, `updated_on`, `status`) VALUES
(1, 'Business Audit', 'business-audit', 'Business Audit', 'Business Audit', 'Business Audit', 'services/thumb/h2_services_img06.jpg', 'flaticon-investment', '<p>Morem ipsum dolor sittemet consectetur adipiscing elitflorai psum dolor.</p>', '2023-10-19 04:36:34.000000', '2023-10-19 05:53:06.527242', 1),
(2, 'Tax Advisory', 'tax-advisory', 'Tax Advisory', 'Tax Advisory', 'Tax Advisory', 'services/thumb/h2_services_img03.jpg', 'flaticon-calculator', '<p>Morem ipsum dolor sittemet consectetur adipiscing elitflorai psum dolor.</p>', '2023-10-19 04:38:47.000000', '2023-10-19 05:52:53.721626', 1),
(3, 'Business Consulting', 'business-consulting', 'Business Consulting', 'Business Consulting', 'Business Consulting', 'services/thumb/h2_services_img02.jpg', 'flaticon-layers', '<p>Morem ipsum dolor sittemet consectetur adipiscing elitflorai psum dolor.</p>', '2023-10-19 04:39:48.000000', '2023-10-19 05:52:43.374607', 1),
(4, 'Finance Planning', 'finance-planning', 'Finance Planning', 'Finance Planning', 'Finance Planning', 'services/thumb/h2_services_img01_hfjamFl.jpg', 'flaticon-inspiration', '<p>Morem ipsum dolor sittemet consectetur adipiscing elitflorai psum dolor.</p>', '2023-10-19 04:41:00.000000', '2023-10-19 05:52:31.676706', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_services_enquiry`
--

CREATE TABLE `myapp_services_enquiry` (
  `id` bigint NOT NULL,
  `services_id` bigint NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services_title` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `services_url` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `create_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_services_enquiry`
--

INSERT INTO `myapp_services_enquiry` (`id`, `services_id`, `full_name`, `services_title`, `services_url`, `email`, `phone`, `city`, `message`, `user_id`, `create_date`) VALUES
(1, 4, 'Dharmendra Yadav', 'Finance Planning', 'finance-planning', 'dharmendrayadav076@gmail.com', '09452428546', '', '\r\nFinance Consulting', 1, '2023-10-23 14:01:04.939110'),
(2, 4, 'Dharmendra Yadav', 'Finance Planning', 'finance-planning', 'dharmendrayadav076@gmail.com', '09452428546', '', 'Hello', 0, '2023-11-24 11:53:50.430688'),
(3, 4, 'Vikash Dubey', 'Finance Planning', 'finance-planning', 'darpankario@gmail.com', '08879450470', 'Varanasi', 'Finance Consulting', 0, '2023-11-24 11:54:24.000000'),
(4, 4, 'Dharmendra Yadav', 'Finance Planning', 'finance-planning', 'dharmendrayadav076@gmail.com', '09452428546', '', 'Dggh', 1, '2023-12-01 15:30:30.924294'),
(5, 4, 'Dharmendra Yadav', 'Finance Planning', 'finance-planning', 'darpankario@gmail.com', '08879450470', '', 'Raise Capital Faster', 0, '2023-12-01 15:34:19.770256'),
(6, 4, 'Dharmendra Yadav', 'Finance Planning', 'finance-planning', 'dharmendrayadav076@gmail.com', '09452428546', '', 'Quality Industrial Working\r\n', 0, '2023-12-01 15:37:10.661234'),
(7, 4, 'Dharmendra Yadav', 'Finance Planning', 'finance-planning', 'dharmendrayadav076@gmail.com', '09452428546', '', 'hello', 0, '2023-12-09 16:53:40.590873');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_service_detail`
--

CREATE TABLE `myapp_service_detail` (
  `id` bigint NOT NULL,
  `services_img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `main_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci,
  `services1_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `services1_thumb` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services1_flaticon` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services1_content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `services2_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `services2_thumb` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services2_flaticon` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `services2_content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `title_two` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title_two_content` longtext COLLATE utf8mb4_general_ci,
  `list_wrap1` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `list_wrap2` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `list_wrap3` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `list_wrap4` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title_three` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `info_one` longtext COLLATE utf8mb4_general_ci,
  `img_one` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `img_two` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `info_two` longtext COLLATE utf8mb4_general_ci,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `services_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_service_detail`
--

INSERT INTO `myapp_service_detail` (`id`, `services_img`, `main_title`, `description`, `services1_name`, `services1_thumb`, `services1_flaticon`, `services1_content`, `services2_name`, `services2_thumb`, `services2_flaticon`, `services2_content`, `title_two`, `title_two_content`, `list_wrap1`, `list_wrap2`, `list_wrap3`, `list_wrap4`, `title_three`, `info_one`, `img_one`, `img_two`, `info_two`, `created_on`, `updated_on`, `status`, `services_id`) VALUES
(1, 'banner/2023/10/21/services_details03_p7G059O.jpg', 'Make Better Products Make Products Better 2', '<p>Embed a little help from our friends from time to time. Although we offer the one-stop convenience of annery integrated range of legal, financial services under one roof, there are occasions when our clients areaneed specia- list advice beyond the scope of our own expertise. That&rsquo;s why we&rsquo;ve developed close working relationships with a number of strategic partner.</p>', 'Finance Consulting', '', 'flaticon-piggy-bank', 'eed are little help fromery fri of anery integrated', 'Finance Consulting', '', 'flaticon-calculator', 'eed are little help fromery fri of anery integrated', 'Raise Capital Faster & Negotiate On Your Own Terms', '<p>When an unknown printer took a galley offer typey anddey scrambled make a type specimen bookhas survived not only five when an unknown printer took a galley of type and scrambled it to make a type specimen</p>', '100% Better results', 'Valuable Ideas', 'Budget Friendly Theme', 'Happy Customers', 'Quality Industrial Working', '<p>When an unknown printer took a galley of type and scrambled it to make a type specimen bookhas a not only five centuries, but also the leap into electronic typesetting, remaining essentially unchan galley of type and scrambled it to make a type specimen book.</p>', 'services/services_details/sd_working_img01.jpg', 'services/services_details/sd_working_img02.jpg', '<p>When an unknown printer took a galley of type and scrambled it to make a type specimen bookhas a not only five centuries, but also the leap into electronic typesetting, remaining essentially unchan galley of type and scrambled it to make a type specimen book.</p>', '2023-10-19 05:37:46.000000', '2023-10-21 04:50:44.231602', 1, 4),
(2, '', 'Make Better Products Make Products Better', '<p>ddfg</p>', 'Finance Consulting', '', 'flaticon-inspiration', '', 'Finance Consulting', '', 'flaticon-inspiration', '', 'Make Better Products Make Products Better', '', '100% Better results', 'Valuable Ideas', 'Budget Friendly Theme', 'Happy Customers', 'Quality Industrial Working', '', '', '', '', '2023-11-24 09:20:11.000000', '2023-11-24 09:28:51.472786', 1, 3),
(3, '', 'Make Better Products Make Products Better345', '<p>eet</p>', 'Finance Consulting45', '', 'flaticon-inspiration', '', 'Finance Consulting', '', 'flaticon-inspiration', '', 'Make Better Products Make Products Better', '', '100% Better results', 'Valuable Ideas', 'Budget Friendly Theme', 'Happy Customers', 'Quality Industrial Working', '', '', '', '', '2023-11-24 09:44:50.970627', '2023-11-24 09:44:50.976626', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_team`
--

CREATE TABLE `myapp_team` (
  `id` bigint NOT NULL,
  `team_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `facebook_link` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `twitter_link` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `instagram_link` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `pinterest_link` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_team`
--

INSERT INTO `myapp_team` (`id`, `team_name`, `slug`, `designation`, `photo`, `facebook_link`, `twitter_link`, `instagram_link`, `pinterest_link`, `created_on`, `updated_on`, `status`) VALUES
(1, 'Brooklyn Simmons', 'brooklyn-simmons', 'Finance Advisor', 'teams/2023/12/04/h4_team_img04.jpg', '', '', '', '', '2023-10-19 04:49:25.000000', '2023-12-04 05:54:40.546577', 1),
(2, 'Jenny Wilson', 'jenny-wilson', 'HR', 'teams/2023/12/04/h4_team_img03.jpg', '', '', '', '', '2023-10-19 04:50:34.000000', '2023-12-04 05:54:30.286289', 1),
(4, 'Marvin McKinney', 'marvin-mckinney', 'Support Manager', 'teams/2023/12/04/h4_team_img02.jpg', '', '', '', '', '2023-10-19 04:54:07.000000', '2023-12-04 05:53:28.091652', 1),
(6, 'Ronald Richards', 'ronald-richards', 'Business Advisor', 'teams/2023/12/04/h4_team_img01.jpg', '', '', '', '', '2023-12-01 06:14:39.000000', '2023-12-04 05:51:33.631992', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_testimonial`
--

CREATE TABLE `myapp_testimonial` (
  `id` bigint NOT NULL,
  `testimonial_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `client_photo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `company_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `rating` smallint UNSIGNED NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL
) ;

--
-- Dumping data for table `myapp_testimonial`
--

INSERT INTO `myapp_testimonial` (`id`, `testimonial_title`, `content`, `full_name`, `client_photo`, `designation`, `company_name`, `rating`, `created_on`, `updated_on`, `status`) VALUES
(1, 'My First Testimonial', '<p>&ldquo; Morem ipsum dolor sit amet, consectetur adipiscing elita florai sum dolor sit amet, consecteture.Borem ipsum dolor sit amet, consectetur adipiscing elita Moremsit amet</p>', 'Mr.Robey Alexa', '', 'CEO', '\\Gerow Agency', 4, '2023-10-19 04:43:44.000000', '2023-10-19 04:45:58.962613', 1),
(2, 'My Second Testimonial', '<p>&ldquo; Morem ipsum dolor sit amet, consectetur adipiscing elita florai sum dolor sit amet, consecteture.Borem ipsum dolor sit amet, consectetur adipiscing elita Moremsit amet.</p>', 'Ms.Kdaim Rlexa', '', 'HR', 'Gerow Agency', 5, '2023-10-19 04:46:15.000000', '2023-10-19 04:47:39.473894', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_what_specialty`
--

CREATE TABLE `myapp_what_specialty` (
  `id` bigint NOT NULL,
  `heading_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `main_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `img_three` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `item1_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `item1_content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `item2_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `item2_content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `item3_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `item3_content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_what_specialty`
--

INSERT INTO `myapp_what_specialty` (`id`, `heading_name`, `main_title`, `description`, `img_three`, `item1_name`, `item1_content`, `item2_name`, `item2_content`, `item3_name`, `item3_content`, `created_on`, `updated_on`, `status`) VALUES
(1, 'WHAT SPECIALTY', 'Keep Your Business Safe & Ensure High Availability.', '<p>Ever find yourself staring at your computer s good consulting slogan to come to mind? Oftentimes.</p>', 'about/2023/12/04/inner_choose_img32.jpg', 'Interdum et malesuada fames ac ante ipsum', 'Ever find yourself staring at your computer screen a good consulting slogan to coind yourself sta your computer screen a good consulting slogan.', 'Interdum et malesuada ante ipsum', 'Ever find yourself staring at your computer screen a good consulting slogan to coind yourself sta your computer screen a good consulting slogan.', 'Ente ipsumerdum et malesuada fames', 'Ever find yourself staring at your computer screen a good consulting slogan to coind yourself sta your computer screen a good consulting slogan.', '2023-10-21 10:33:57.000000', '2023-12-04 06:28:57.884565', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_author`
--
ALTER TABLE `accounts_author`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `user_profile_id` (`user_profile_id`),
  ADD UNIQUE KEY `author_slug` (`author_slug`);

--
-- Indexes for table `accounts_emailsetting`
--
ALTER TABLE `accounts_emailsetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts_emailsmtp`
--
ALTER TABLE `accounts_emailsmtp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts_user`
--
ALTER TABLE `accounts_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `accounts_userprofile`
--
ALTER TABLE `accounts_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `blog_blogcomment`
--
ALTER TABLE `blog_blogcomment`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `blog_blogcomment_parent_id_df1e1d2a_fk_blog_blogcomment_sno` (`parent_id`),
  ADD KEY `blog_blogcomment_post_id_f2a3e760_fk_blog_post_sno` (`post_id`),
  ADD KEY `blog_blogcomment_user_id_dc3b3111_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `category_name` (`category_name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `blog_post_author_id_dd7a8485_fk_accounts_author_id` (`author_id`),
  ADD KEY `blog_post_category_id_c326dbf8_fk_blog_category_sno` (`category_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `jobsapp_applicant`
--
ALTER TABLE `jobsapp_applicant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobsapp_applicant_job_id_81cba015_fk_jobsapp_job_id` (`job_id`),
  ADD KEY `jobsapp_applicant_job_url_60aa5bb4` (`job_url`),
  ADD KEY `jobsapp_applicant_working_experience_id_3584afa1` (`working_experience_id`),
  ADD KEY `jobsapp_applicant_applicant_position_i_11f164b7_fk_jobsapp_p` (`applicant_position_id`);

--
-- Indexes for table `jobsapp_city`
--
ALTER TABLE `jobsapp_city`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `jobsapp_city_state_id_16fd143d_fk_jobsapp_state_id` (`state_id`);

--
-- Indexes for table `jobsapp_company`
--
ALTER TABLE `jobsapp_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `jobsapp_company_country_id_99e87c83_fk_jobsapp_country_id` (`country_id`),
  ADD KEY `jobsapp_company_state_id_cf0c0de5_fk_jobsapp_state_id` (`state_id`),
  ADD KEY `jobsapp_company_city_id_c0737909_fk_jobsapp_city_id` (`city_id`);

--
-- Indexes for table `jobsapp_company_sector`
--
ALTER TABLE `jobsapp_company_sector`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jobsapp_company_sector_company_id_sector_id_472d5449_uniq` (`company_id`,`sector_id`),
  ADD KEY `jobsapp_company_sector_sector_id_dbeb01ec_fk_jobsapp_sector_id` (`sector_id`);

--
-- Indexes for table `jobsapp_country`
--
ALTER TABLE `jobsapp_country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jobsapp_country_country_name_c4072878_uniq` (`country_name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `jobsapp_education`
--
ALTER TABLE `jobsapp_education`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `education_name` (`education_name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `jobsapp_experience`
--
ALTER TABLE `jobsapp_experience`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `jobsapp_job`
--
ALTER TABLE `jobsapp_job`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_uuid` (`job_uuid`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `jobsapp_job_Job_role_id_548cfdae_fk_jobsapp_job_role_id` (`Job_role_id`),
  ADD KEY `jobsapp_job_city_id_ce1f405f_fk_jobsapp_city_id` (`city_id`),
  ADD KEY `jobsapp_job_company_id_f78bd6bf_fk_jobsapp_company_id` (`company_id`),
  ADD KEY `jobsapp_job_country_id_7eb016b5_fk_jobsapp_country_id` (`country_id`),
  ADD KEY `jobsapp_job_education_id_522dcd91_fk_jobsapp_education_id` (`education_id`),
  ADD KEY `jobsapp_job_job_category_id_f873cb54_fk_jobsapp_job_category_id` (`job_category_id`),
  ADD KEY `jobsapp_job_sector_id_8e78c235_fk_jobsapp_sector_id` (`sector_id`),
  ADD KEY `jobsapp_job_state_id_af5bb07f_fk_jobsapp_state_id` (`state_id`),
  ADD KEY `jobsapp_job_work_mode_id_eb41c65d_fk_jobsapp_work_mode_id` (`work_mode_id`),
  ADD KEY `jobsapp_job_experience_id_3f9720ba_fk_jobsapp_experience_id` (`experience_id`),
  ADD KEY `jobsapp_job_job_type_id_6bade38d_fk_jobsapp_job_type_id` (`job_type_id`);

--
-- Indexes for table `jobsapp_job_category`
--
ALTER TABLE `jobsapp_job_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `jobsapp_job_category_sector_id_4e5b5ccd_fk_jobsapp_sector_id` (`sector_id`);

--
-- Indexes for table `jobsapp_job_role`
--
ALTER TABLE `jobsapp_job_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `jobsapp_job_role_sector_id_d1fbb22c_fk_jobsapp_sector_id` (`sector_id`);

--
-- Indexes for table `jobsapp_job_skills_required`
--
ALTER TABLE `jobsapp_job_skills_required`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jobsapp_job_skills_required_job_id_skill_id_5e688f12_uniq` (`job_id`,`skill_id`),
  ADD KEY `jobsapp_job_skills_r_skill_id_bb350487_fk_jobsapp_s` (`skill_id`);

--
-- Indexes for table `jobsapp_job_type`
--
ALTER TABLE `jobsapp_job_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `jobsapp_position`
--
ALTER TABLE `jobsapp_position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `jobsapp_position_job_id_5110f7d7_fk_jobsapp_job_id` (`job_id`);

--
-- Indexes for table `jobsapp_sector`
--
ALTER TABLE `jobsapp_sector`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `jobsapp_skill`
--
ALTER TABLE `jobsapp_skill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `skill_name` (`skill_name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `jobsapp_skill_job_category_id_6fb27e65_fk_jobsapp_j` (`job_category_id`),
  ADD KEY `jobsapp_skill_sector_id_c6cc166b_fk_jobsapp_sector_id` (`sector_id`);

--
-- Indexes for table `jobsapp_state`
--
ALTER TABLE `jobsapp_state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jobsapp_state_state_name_3704d1ea_uniq` (`state_name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `jobsapp_state_country_id_a98ca811_fk_jobsapp_country_id` (`country_id`);

--
-- Indexes for table `jobsapp_work_mode`
--
ALTER TABLE `jobsapp_work_mode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `myapp_about`
--
ALTER TABLE `myapp_about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_banner`
--
ALTER TABLE `myapp_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_bg_banner`
--
ALTER TABLE `myapp_bg_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_brochure`
--
ALTER TABLE `myapp_brochure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_brochure_services_id_fcfda52a_fk_myapp_services_id` (`services_id`);

--
-- Indexes for table `myapp_client`
--
ALTER TABLE `myapp_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_company_overview`
--
ALTER TABLE `myapp_company_overview`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_contact`
--
ALTER TABLE `myapp_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_counter`
--
ALTER TABLE `myapp_counter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_feedback`
--
ALTER TABLE `myapp_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_general`
--
ALTER TABLE `myapp_general`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_home`
--
ALTER TABLE `myapp_home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_know_us`
--
ALTER TABLE `myapp_know_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_services`
--
ALTER TABLE `myapp_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `myapp_services_enquiry`
--
ALTER TABLE `myapp_services_enquiry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_sevices_enquiry_services_id_aed93dcc_fk_myapp_services_id` (`services_id`),
  ADD KEY `myapp_sevices_enquiry_services_url_e6eaf3e5` (`services_url`);

--
-- Indexes for table `myapp_service_detail`
--
ALTER TABLE `myapp_service_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_id` (`services_id`);

--
-- Indexes for table `myapp_team`
--
ALTER TABLE `myapp_team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `myapp_testimonial`
--
ALTER TABLE `myapp_testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_what_specialty`
--
ALTER TABLE `myapp_what_specialty`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_author`
--
ALTER TABLE `accounts_author`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `accounts_emailsetting`
--
ALTER TABLE `accounts_emailsetting`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accounts_emailsmtp`
--
ALTER TABLE `accounts_emailsmtp`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `accounts_user`
--
ALTER TABLE `accounts_user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_userprofile`
--
ALTER TABLE `accounts_userprofile`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `blog_blogcomment`
--
ALTER TABLE `blog_blogcomment`
  MODIFY `sno` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `sno` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `sno` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `jobsapp_applicant`
--
ALTER TABLE `jobsapp_applicant`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `jobsapp_city`
--
ALTER TABLE `jobsapp_city`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobsapp_company`
--
ALTER TABLE `jobsapp_company`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobsapp_company_sector`
--
ALTER TABLE `jobsapp_company_sector`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobsapp_country`
--
ALTER TABLE `jobsapp_country`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `jobsapp_education`
--
ALTER TABLE `jobsapp_education`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobsapp_experience`
--
ALTER TABLE `jobsapp_experience`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobsapp_job`
--
ALTER TABLE `jobsapp_job`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobsapp_job_category`
--
ALTER TABLE `jobsapp_job_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobsapp_job_role`
--
ALTER TABLE `jobsapp_job_role`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobsapp_job_skills_required`
--
ALTER TABLE `jobsapp_job_skills_required`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `jobsapp_job_type`
--
ALTER TABLE `jobsapp_job_type`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobsapp_position`
--
ALTER TABLE `jobsapp_position`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobsapp_sector`
--
ALTER TABLE `jobsapp_sector`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobsapp_skill`
--
ALTER TABLE `jobsapp_skill`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jobsapp_state`
--
ALTER TABLE `jobsapp_state`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobsapp_work_mode`
--
ALTER TABLE `jobsapp_work_mode`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `myapp_about`
--
ALTER TABLE `myapp_about`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myapp_banner`
--
ALTER TABLE `myapp_banner`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myapp_bg_banner`
--
ALTER TABLE `myapp_bg_banner`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myapp_brochure`
--
ALTER TABLE `myapp_brochure`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myapp_client`
--
ALTER TABLE `myapp_client`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `myapp_company_overview`
--
ALTER TABLE `myapp_company_overview`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myapp_contact`
--
ALTER TABLE `myapp_contact`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myapp_counter`
--
ALTER TABLE `myapp_counter`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myapp_feedback`
--
ALTER TABLE `myapp_feedback`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `myapp_general`
--
ALTER TABLE `myapp_general`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myapp_home`
--
ALTER TABLE `myapp_home`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myapp_know_us`
--
ALTER TABLE `myapp_know_us`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myapp_services`
--
ALTER TABLE `myapp_services`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `myapp_services_enquiry`
--
ALTER TABLE `myapp_services_enquiry`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `myapp_service_detail`
--
ALTER TABLE `myapp_service_detail`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `myapp_team`
--
ALTER TABLE `myapp_team`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `myapp_testimonial`
--
ALTER TABLE `myapp_testimonial`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myapp_what_specialty`
--
ALTER TABLE `myapp_what_specialty`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_author`
--
ALTER TABLE `accounts_author`
  ADD CONSTRAINT `accounts_author_user_id_266b3ba5_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `accounts_author_user_profile_id_4e6614e3_fk_accounts_` FOREIGN KEY (`user_profile_id`) REFERENCES `accounts_userprofile` (`id`);

--
-- Constraints for table `accounts_userprofile`
--
ALTER TABLE `accounts_userprofile`
  ADD CONSTRAINT `accounts_userprofile_user_id_92240672_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `blog_blogcomment`
--
ALTER TABLE `blog_blogcomment`
  ADD CONSTRAINT `blog_blogcomment_parent_id_df1e1d2a_fk_blog_blogcomment_sno` FOREIGN KEY (`parent_id`) REFERENCES `blog_blogcomment` (`sno`),
  ADD CONSTRAINT `blog_blogcomment_post_id_f2a3e760_fk_blog_post_sno` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`sno`),
  ADD CONSTRAINT `blog_blogcomment_user_id_dc3b3111_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD CONSTRAINT `blog_post_author_id_dd7a8485_fk_accounts_author_id` FOREIGN KEY (`author_id`) REFERENCES `accounts_author` (`id`),
  ADD CONSTRAINT `blog_post_category_id_c326dbf8_fk_blog_category_sno` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`sno`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `jobsapp_applicant`
--
ALTER TABLE `jobsapp_applicant`
  ADD CONSTRAINT `jobsapp_applicant_applicant_position_i_11f164b7_fk_jobsapp_p` FOREIGN KEY (`applicant_position_id`) REFERENCES `jobsapp_position` (`id`),
  ADD CONSTRAINT `jobsapp_applicant_job_id_81cba015_fk_jobsapp_job_id` FOREIGN KEY (`job_id`) REFERENCES `jobsapp_job` (`id`),
  ADD CONSTRAINT `jobsapp_applicant_working_experience_i_3584afa1_fk_jobsapp_e` FOREIGN KEY (`working_experience_id`) REFERENCES `jobsapp_experience` (`id`);

--
-- Constraints for table `jobsapp_city`
--
ALTER TABLE `jobsapp_city`
  ADD CONSTRAINT `jobsapp_city_state_id_16fd143d_fk_jobsapp_state_id` FOREIGN KEY (`state_id`) REFERENCES `jobsapp_state` (`id`);

--
-- Constraints for table `jobsapp_company`
--
ALTER TABLE `jobsapp_company`
  ADD CONSTRAINT `jobsapp_company_city_id_c0737909_fk_jobsapp_city_id` FOREIGN KEY (`city_id`) REFERENCES `jobsapp_city` (`id`),
  ADD CONSTRAINT `jobsapp_company_country_id_99e87c83_fk_jobsapp_country_id` FOREIGN KEY (`country_id`) REFERENCES `jobsapp_country` (`id`),
  ADD CONSTRAINT `jobsapp_company_state_id_cf0c0de5_fk_jobsapp_state_id` FOREIGN KEY (`state_id`) REFERENCES `jobsapp_state` (`id`);

--
-- Constraints for table `jobsapp_company_sector`
--
ALTER TABLE `jobsapp_company_sector`
  ADD CONSTRAINT `jobsapp_company_sector_company_id_f60b7399_fk_jobsapp_company_id` FOREIGN KEY (`company_id`) REFERENCES `jobsapp_company` (`id`),
  ADD CONSTRAINT `jobsapp_company_sector_sector_id_dbeb01ec_fk_jobsapp_sector_id` FOREIGN KEY (`sector_id`) REFERENCES `jobsapp_sector` (`id`);

--
-- Constraints for table `jobsapp_job`
--
ALTER TABLE `jobsapp_job`
  ADD CONSTRAINT `jobsapp_job_city_id_ce1f405f_fk_jobsapp_city_id` FOREIGN KEY (`city_id`) REFERENCES `jobsapp_city` (`id`),
  ADD CONSTRAINT `jobsapp_job_company_id_f78bd6bf_fk_jobsapp_company_id` FOREIGN KEY (`company_id`) REFERENCES `jobsapp_company` (`id`),
  ADD CONSTRAINT `jobsapp_job_country_id_7eb016b5_fk_jobsapp_country_id` FOREIGN KEY (`country_id`) REFERENCES `jobsapp_country` (`id`),
  ADD CONSTRAINT `jobsapp_job_education_id_522dcd91_fk_jobsapp_education_id` FOREIGN KEY (`education_id`) REFERENCES `jobsapp_education` (`id`),
  ADD CONSTRAINT `jobsapp_job_experience_id_3f9720ba_fk_jobsapp_experience_id` FOREIGN KEY (`experience_id`) REFERENCES `jobsapp_experience` (`id`),
  ADD CONSTRAINT `jobsapp_job_job_category_id_f873cb54_fk_jobsapp_job_category_id` FOREIGN KEY (`job_category_id`) REFERENCES `jobsapp_job_category` (`id`),
  ADD CONSTRAINT `jobsapp_job_Job_role_id_548cfdae_fk_jobsapp_job_role_id` FOREIGN KEY (`Job_role_id`) REFERENCES `jobsapp_job_role` (`id`),
  ADD CONSTRAINT `jobsapp_job_job_type_id_6bade38d_fk_jobsapp_job_type_id` FOREIGN KEY (`job_type_id`) REFERENCES `jobsapp_job_type` (`id`),
  ADD CONSTRAINT `jobsapp_job_sector_id_8e78c235_fk_jobsapp_sector_id` FOREIGN KEY (`sector_id`) REFERENCES `jobsapp_sector` (`id`),
  ADD CONSTRAINT `jobsapp_job_state_id_af5bb07f_fk_jobsapp_state_id` FOREIGN KEY (`state_id`) REFERENCES `jobsapp_state` (`id`),
  ADD CONSTRAINT `jobsapp_job_work_mode_id_eb41c65d_fk_jobsapp_work_mode_id` FOREIGN KEY (`work_mode_id`) REFERENCES `jobsapp_work_mode` (`id`);

--
-- Constraints for table `jobsapp_job_category`
--
ALTER TABLE `jobsapp_job_category`
  ADD CONSTRAINT `jobsapp_job_category_sector_id_4e5b5ccd_fk_jobsapp_sector_id` FOREIGN KEY (`sector_id`) REFERENCES `jobsapp_sector` (`id`);

--
-- Constraints for table `jobsapp_job_role`
--
ALTER TABLE `jobsapp_job_role`
  ADD CONSTRAINT `jobsapp_job_role_sector_id_d1fbb22c_fk_jobsapp_sector_id` FOREIGN KEY (`sector_id`) REFERENCES `jobsapp_sector` (`id`);

--
-- Constraints for table `jobsapp_job_skills_required`
--
ALTER TABLE `jobsapp_job_skills_required`
  ADD CONSTRAINT `jobsapp_job_skills_r_skill_id_bb350487_fk_jobsapp_s` FOREIGN KEY (`skill_id`) REFERENCES `jobsapp_skill` (`id`),
  ADD CONSTRAINT `jobsapp_job_skills_required_job_id_83b117a7_fk_jobsapp_job_id` FOREIGN KEY (`job_id`) REFERENCES `jobsapp_job` (`id`);

--
-- Constraints for table `jobsapp_position`
--
ALTER TABLE `jobsapp_position`
  ADD CONSTRAINT `jobsapp_position_job_id_5110f7d7_fk_jobsapp_job_id` FOREIGN KEY (`job_id`) REFERENCES `jobsapp_job` (`id`);

--
-- Constraints for table `jobsapp_skill`
--
ALTER TABLE `jobsapp_skill`
  ADD CONSTRAINT `jobsapp_skill_job_category_id_6fb27e65_fk_jobsapp_j` FOREIGN KEY (`job_category_id`) REFERENCES `jobsapp_job_category` (`id`),
  ADD CONSTRAINT `jobsapp_skill_sector_id_c6cc166b_fk_jobsapp_sector_id` FOREIGN KEY (`sector_id`) REFERENCES `jobsapp_sector` (`id`);

--
-- Constraints for table `jobsapp_state`
--
ALTER TABLE `jobsapp_state`
  ADD CONSTRAINT `jobsapp_state_country_id_a98ca811_fk_jobsapp_country_id` FOREIGN KEY (`country_id`) REFERENCES `jobsapp_country` (`id`);

--
-- Constraints for table `myapp_brochure`
--
ALTER TABLE `myapp_brochure`
  ADD CONSTRAINT `myapp_brochure_services_id_fcfda52a_fk_myapp_services_id` FOREIGN KEY (`services_id`) REFERENCES `myapp_services` (`id`);

--
-- Constraints for table `myapp_services_enquiry`
--
ALTER TABLE `myapp_services_enquiry`
  ADD CONSTRAINT `myapp_sevices_enquiry_services_id_aed93dcc_fk_myapp_services_id` FOREIGN KEY (`services_id`) REFERENCES `myapp_services` (`id`);

--
-- Constraints for table `myapp_service_detail`
--
ALTER TABLE `myapp_service_detail`
  ADD CONSTRAINT `myapp_service_detail_services_id_de9e2902_fk_myapp_services_id` FOREIGN KEY (`services_id`) REFERENCES `myapp_services` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
