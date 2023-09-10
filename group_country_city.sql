-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 10, 2023 at 01:02 PM
-- Server version: 8.0.34-0ubuntu0.20.04.1
-- PHP Version: 7.2.34-43+ubuntu20.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `group_country_city`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_users`
--

CREATE TABLE `api_users` (
  `id` int NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `access_token` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `api_users`
--

INSERT INTO `api_users` (`id`, `username`, `password`, `access_token`, `created_at`, `expires_at`) VALUES
(1, 'admin@gcc.com', '$2y$10$BQDfEYwWD3zrWqh.B/pD0Ot9Ftdov3NJGbwuYWjmzpuFxkVFFXLQO', 'xDhiYeCP5JUM4PWGaHqCb4yKVeAZY30TIDk3GtY', '2023-09-09 03:50:08', '2023-09-11 00:14:58'),
(2, 'client_user@gcc.com', '$2y$10$lmPn08XKOklm4MObp01I4.LCZTwr0.AGCmWbtGgntJpGQEX5RCvEO', 'ds0ZG5MZIaV3Vj8XykYSAlO0jJmyrIy1m4ifsuF', '2023-09-09 03:50:08', '2023-09-11 00:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `city_json`
--

CREATE TABLE `city_json` (
  `id` int NOT NULL,
  `city_with_country` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `city_json`
--

INSERT INTO `city_json` (`id`, `city_with_country`) VALUES
INSERT INTO `city_json` (`id`, `city_with_country`) VALUES
(3, '[{\"city\": \"Tokyo\", \"country\": \"Japan\"}, {\"city\": \"Jakarta\", \"country\": \"Japan\"}, {\"city\": \"Delhi\", \"country\": \"Japan\"}, {\"city\": \"Tokyo\", \"country\": \"India\"}, {\"city\": \"Jakarta\", \"country\": \"India\"}, {\"city\": \"Delhi\", \"country\": \"India\"}, {\"city\": \"Tokyo\", \"country\": \"USA\"}, {\"city\": \"Jakarta\", \"country\": \"USA\"}, {\"city\": \"Delhi\", \"country\": \"USA\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `capital_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `population` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `languages` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `region`, `capital_city`, `population`, `languages`, `created_at`, `updated_at`) VALUES
(1, 'Nepal', 'Asia', 'Kathmandu', '29136808', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(2, 'Kiribati', 'Oceania', 'South Tarawa', '119446', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(3, 'Turkmenistan', 'Asia', 'Ashgabat', '6031187', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(4, 'New Zealand', 'Oceania', 'Wellington', '5084300', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(5, 'Vatican City', 'Europe', 'Vatican City', '451', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(6, 'Portugal', 'Europe', 'Lisbon', '10305564', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(7, 'Ivory Coast', 'Africa', 'Yamoussoukro', '26378275', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(8, 'Egypt', 'Africa', 'Cairo', '102334403', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(9, 'Haiti', 'Americas', 'Port-au-Prince', '11402533', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(10, 'Azerbaijan', 'Asia', 'Baku', '10110116', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(11, 'Laos', 'Asia', 'Vientiane', '7275556', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(12, 'Togo', 'Africa', 'Lomé', '8278737', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(13, 'Caribbean Netherlands', 'Americas', 'Kralendijk', '25987', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(14, 'American Samoa', 'Oceania', 'Pago Pago', '55197', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(15, 'Saint Vincent and the Grenadines', 'Americas', 'Kingstown', '110947', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(16, 'Montenegro', 'Europe', 'Podgorica', '621718', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(17, 'South Georgia', 'Antarctic', 'King Edward Point', '30', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(18, 'Bulgaria', 'Europe', 'Sofia', '6927288', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(19, 'Saint Pierre and Miquelon', 'Americas', 'Saint-Pierre', '6069', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(20, 'Tunisia', 'Africa', 'Tunis', '11818618', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(21, 'Åland Islands', 'Europe', 'Mariehamn', '29458', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(22, 'Spain', 'Europe', 'Madrid', '47351567', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(23, 'Gabon', 'Africa', 'Libreville', '2225728', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(24, 'Cyprus', 'Europe', 'Nicosia', '1207361', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(25, 'Antigua and Barbuda', 'Americas', 'Saint John\'s', '97928', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(26, 'Cape Verde', 'Africa', 'Praia', '555988', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(27, 'Slovenia', 'Europe', 'Ljubljana', '2100126', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(28, 'Tokelau', 'Oceania', 'Fakaofo', '1411', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(29, 'Mauritius', 'Africa', 'Port Louis', '1265740', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(30, 'Grenada', 'Americas', 'St. George\'s', '112519', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(31, 'Guadeloupe', 'Americas', 'Basse-Terre', '400132', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(32, 'Montserrat', 'Americas', 'Plymouth', '4922', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(33, 'Micronesia', 'Oceania', 'Palikir', '115021', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(34, 'United Arab Emirates', 'Asia', 'Abu Dhabi', '9890400', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(35, 'Bermuda', 'Americas', 'Hamilton', '63903', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(36, 'Belarus', 'Europe', 'Minsk', '9398861', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(37, 'Peru', 'Americas', 'Lima', '32971846', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(38, 'South Sudan', 'Africa', 'Juba', '11193729', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(39, 'Vanuatu', 'Oceania', 'Port Vila', '307150', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(40, 'Kenya', 'Africa', 'Nairobi', '53771300', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(41, 'Pitcairn Islands', 'Oceania', 'Adamstown', '56', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(42, 'Indonesia', 'Asia', 'Jakarta', '273523621', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(43, 'Mozambique', 'Africa', 'Maputo', '31255435', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(44, 'Faroe Islands', 'Europe', 'Tórshavn', '48865', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(45, 'Madagascar', 'Africa', 'Antananarivo', '27691019', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(46, 'Panama', 'Americas', 'Panama City', '4314768', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(47, 'San Marino', 'Europe', 'City of San Marino', '33938', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(48, 'Heard Island and McDonald Islands', 'Antarctic', '', '0', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(49, 'Bosnia and Herzegovina', 'Europe', 'Sarajevo', '3280815', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(50, 'Barbados', 'Americas', 'Bridgetown', '287371', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(51, 'Ireland', 'Europe', 'Dublin', '4994724', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(52, 'Gambia', 'Africa', 'Banjul', '2416664', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(53, 'Armenia', 'Asia', 'Yerevan', '2963234', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(54, 'Lesotho', 'Africa', 'Maseru', '2142252', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(55, 'United Kingdom', 'Europe', 'London', '67215293', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(56, 'Hong Kong', 'Asia', 'City of Victoria', '7500700', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(57, 'Somalia', 'Africa', 'Mogadishu', '15893219', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(58, 'Colombia', 'Americas', 'Bogotá', '50882884', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(59, 'Moldova', 'Europe', 'Chișinău', '2617820', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(60, 'Brunei', 'Asia', 'Bandar Seri Begawan', '437483', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(61, 'Australia', 'Oceania', 'Canberra', '25687041', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(62, 'Saint Kitts and Nevis', 'Americas', 'Basseterre', '53192', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(63, 'Greece', 'Europe', 'Athens', '10715549', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(64, 'Kosovo', 'Europe', 'Pristina', '1775378', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(65, 'Yemen', 'Asia', 'Sana\'a', '29825968', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(66, 'Cameroon', 'Africa', 'Yaoundé', '26545864', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(67, 'Serbia', 'Europe', 'Belgrade', '6908224', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(68, 'Djibouti', 'Africa', 'Djibouti', '988002', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(69, 'South Korea', 'Asia', 'Seoul', '51780579', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(70, 'Burundi', 'Africa', 'Gitega', '11890781', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(71, 'Republic of the Congo', 'Africa', 'Brazzaville', '5657000', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(72, 'Uzbekistan', 'Asia', 'Tashkent', '34232050', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(73, 'Comoros', 'Africa', 'Moroni', '869595', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(74, 'Japan', 'Asia', 'Tokyo', '125836021', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(75, 'Sint Maarten', 'Americas', 'Philipsburg', '40812', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(76, 'Saint Lucia', 'Americas', 'Castries', '183629', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(77, 'North Macedonia', 'Europe', 'Skopje', '2077132', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(78, 'Denmark', 'Europe', 'Copenhagen', '5831404', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(79, 'Albania', 'Europe', 'Tirana', '2837743', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(80, 'Chile', 'Americas', 'Santiago', '19116209', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(81, 'Tonga', 'Oceania', 'Nuku\'alofa', '105697', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(82, 'Palestine', 'Asia', 'Ramallah', '4803269', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(83, 'United States', 'Americas', 'Washington, D.C.', '329484123', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(84, 'Singapore', 'Asia', 'Singapore', '5685807', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(85, 'Belize', 'Americas', 'Belmopan', '397621', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(86, 'DR Congo', 'Africa', 'Kinshasa', '108407721', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(87, 'Eritrea', 'Africa', 'Asmara', '5352000', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(88, 'Mexico', 'Americas', 'Mexico City', '128932753', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(89, 'Saint Martin', 'Americas', 'Marigot', '38659', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(90, 'Papua New Guinea', 'Oceania', 'Port Moresby', '8947027', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(91, 'Philippines', 'Asia', 'Manila', '109581085', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(92, 'Burkina Faso', 'Africa', 'Ouagadougou', '20903278', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(93, 'Puerto Rico', 'Americas', 'San Juan', '3194034', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(94, 'Czechia', 'Europe', 'Prague', '10698896', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(95, 'Cambodia', 'Asia', 'Phnom Penh', '16718971', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(96, 'Zambia', 'Africa', 'Lusaka', '18383956', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(97, 'Algeria', 'Africa', 'Algiers', '44700000', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(98, 'China', 'Asia', 'Beijing', '1402112000', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(99, 'India', 'Asia', 'New Delhi', '1380004385', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(100, 'Svalbard and Jan Mayen', 'Europe', 'Longyearbyen', '2562', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(101, 'Nigeria', 'Africa', 'Abuja', '206139587', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(102, 'Angola', 'Africa', 'Luanda', '32866268', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(103, 'Mayotte', 'Africa', 'Mamoudzou', '226915', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(104, 'Paraguay', 'Americas', 'Asunción', '7132530', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(105, 'Afghanistan', 'Asia', 'Kabul', '40218234', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(106, 'Marshall Islands', 'Oceania', 'Majuro', '59194', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(107, 'Guyana', 'Americas', 'Georgetown', '786559', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(108, 'Croatia', 'Europe', 'Zagreb', '4047200', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(109, 'North Korea', 'Asia', 'Pyongyang', '25778815', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(110, 'New Caledonia', 'Oceania', 'Nouméa', '271960', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(111, 'British Indian Ocean Territory', 'Africa', 'Diego Garcia', '3000', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(112, 'French Polynesia', 'Oceania', 'Papeetē', '280904', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(113, 'Niger', 'Africa', 'Niamey', '24206636', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(114, 'Guatemala', 'Americas', 'Guatemala City', '16858333', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(115, 'Niue', 'Oceania', 'Alofi', '1470', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(116, 'Eswatini', 'Africa', 'Mbabane', '1160164', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(117, 'Honduras', 'Americas', 'Tegucigalpa', '9904608', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(118, 'Saint Helena, Ascension and Tristan da Cunha', 'Africa', 'Jamestown', '53192', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(119, 'Iceland', 'Europe', 'Reykjavik', '366425', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(120, 'Jordan', 'Asia', 'Amman', '10203140', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(121, 'France', 'Europe', 'Paris', '67391582', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(122, 'Qatar', 'Asia', 'Doha', '2881060', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(123, 'Vietnam', 'Asia', 'Hanoi', '97338583', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(124, 'Kuwait', 'Asia', 'Kuwait City', '4270563', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(125, 'Senegal', 'Africa', 'Dakar', '16743930', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(126, 'Oman', 'Asia', 'Muscat', '5106622', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(127, 'Aruba', 'Americas', 'Oranjestad', '106766', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(128, 'Botswana', 'Africa', 'Gaborone', '2351625', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(129, 'Uganda', 'Africa', 'Kampala', '45741000', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(130, 'United States Minor Outlying Islands', 'Americas', 'Washington DC', '300', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(131, 'Slovakia', 'Europe', 'Bratislava', '5458827', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(132, 'Lithuania', 'Europe', 'Vilnius', '2794700', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(133, 'Northern Mariana Islands', 'Oceania', 'Saipan', '57557', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(134, 'Falkland Islands', 'Americas', 'Stanley', '2563', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(135, 'Chad', 'Africa', 'N\'Djamena', '16425859', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(136, 'Pakistan', 'Asia', 'Islamabad', '220892331', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(137, 'Timor-Leste', 'Asia', 'Dili', '1318442', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(138, 'Turkey', 'Asia', 'Ankara', '84339067', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(139, 'Samoa', 'Oceania', 'Apia', '198410', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(140, 'Sierra Leone', 'Africa', 'Freetown', '7976985', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(141, 'Jamaica', 'Americas', 'Kingston', '2961161', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(142, 'Taiwan', 'Asia', 'Taipei', '23503349', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(143, 'Turks and Caicos Islands', 'Americas', 'Cockburn Town', '38718', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(144, 'Anguilla', 'Americas', 'The Valley', '13452', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(145, 'Sudan', 'Africa', 'Khartoum', '43849269', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(146, 'Poland', 'Europe', 'Warsaw', '37950802', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(147, 'Iraq', 'Asia', 'Baghdad', '40222503', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(148, 'Kyrgyzstan', 'Asia', 'Bishkek', '6591600', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(149, 'Brazil', 'Americas', 'Brasília', '212559409', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(150, 'Fiji', 'Oceania', 'Suva', '896444', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(151, 'Ukraine', 'Europe', 'Kyiv', '44134693', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(152, 'Bahrain', 'Asia', 'Manama', '1701583', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(153, 'Georgia', 'Asia', 'Tbilisi', '3714000', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(154, 'Guinea-Bissau', 'Africa', 'Bissau', '1967998', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(155, 'Estonia', 'Europe', 'Tallinn', '1331057', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(156, 'Libya', 'Africa', 'Tripoli', '6871287', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(157, 'Netherlands', 'Europe', 'Amsterdam', '16655799', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(158, 'Ghana', 'Africa', 'Accra', '31072945', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(159, 'Uruguay', 'Americas', 'Montevideo', '3473727', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(160, 'Bhutan', 'Asia', 'Thimphu', '771612', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(161, 'Seychelles', 'Africa', 'Victoria', '98462', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(162, 'El Salvador', 'Americas', 'San Salvador', '6486201', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(163, 'Maldives', 'Asia', 'Malé', '540542', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(164, 'Liberia', 'Africa', 'Monrovia', '5057677', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(165, 'Andorra', 'Europe', 'Andorra la Vella', '77265', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(166, 'Nicaragua', 'Americas', 'Managua', '6624554', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(167, 'Mongolia', 'Asia', 'Ulan Bator', '3278292', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(168, 'Equatorial Guinea', 'Africa', 'Malabo', '1402985', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(169, 'Liechtenstein', 'Europe', 'Vaduz', '38137', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(170, 'Monaco', 'Europe', 'Monaco', '39244', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(171, 'Mali', 'Africa', 'Bamako', '20250834', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(172, 'British Virgin Islands', 'Americas', 'Road Town', '30237', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(173, 'Guernsey', 'Europe', 'St. Peter Port', '62999', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(174, 'Costa Rica', 'Americas', 'San José', '5094114', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(175, 'Cuba', 'Americas', 'Havana', '11326616', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(176, 'Hungary', 'Europe', 'Budapest', '9749763', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(177, 'Saint Barthélemy', 'Americas', 'Gustavia', '4255', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(178, 'Austria', 'Europe', 'Vienna', '8917205', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(179, 'Ethiopia', 'Africa', 'Addis Ababa', '114963583', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(180, 'Israel', 'Asia', 'Jerusalem', '9216900', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(181, 'Malaysia', 'Asia', 'Kuala Lumpur', '32365998', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(182, 'Italy', 'Europe', 'Rome', '59554023', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(183, 'Jersey', 'Europe', 'Saint Helier', '100800', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(184, 'Tajikistan', 'Asia', 'Dushanbe', '9537642', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(185, 'Central African Republic', 'Africa', 'Bangui', '4829764', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(186, 'Martinique', 'Americas', 'Fort-de-France', '378243', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(187, 'Namibia', 'Africa', 'Windhoek', '2540916', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(188, 'Norfolk Island', 'Oceania', 'Kingston', '2302', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(189, 'Germany', 'Europe', 'Berlin', '83240525', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(190, 'Saudi Arabia', 'Asia', 'Riyadh', '34813867', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(191, 'Western Sahara', 'Africa', 'El Aaiún', '510713', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(192, 'Nauru', 'Oceania', 'Yaren', '10834', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(193, 'Trinidad and Tobago', 'Americas', 'Port of Spain', '1399491', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(194, 'Macau', 'Asia', '', '649342', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(195, 'Palau', 'Oceania', 'Ngerulmud', '18092', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(196, 'Zimbabwe', 'Africa', 'Harare', '14862927', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(197, 'Dominican Republic', 'Americas', 'Santo Domingo', '10847904', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(198, 'Argentina', 'Americas', 'Buenos Aires', '45376763', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(199, 'French Southern and Antarctic Lands', 'Antarctic', 'Port-aux-Français', '400', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(200, 'Mauritania', 'Africa', 'Nouakchott', '4649660', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(201, 'Réunion', 'Africa', 'Saint-Denis', '840974', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(202, 'Tuvalu', 'Oceania', 'Funafuti', '11792', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(203, 'Bahamas', 'Americas', 'Nassau', '393248', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(204, 'Bolivia', 'Americas', 'Sucre', '11673029', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(205, 'Cocos (Keeling) Islands', 'Oceania', 'West Island', '544', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(206, 'Iran', 'Asia', 'Tehran', '83992953', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(207, 'Suriname', 'Americas', 'Paramaribo', '586634', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(208, 'Sweden', 'Europe', 'Stockholm', '10353442', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(209, 'São Tomé and Príncipe', 'Africa', 'São Tomé', '219161', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(210, 'Finland', 'Europe', 'Helsinki', '5530719', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(211, 'Latvia', 'Europe', 'Riga', '1901548', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(212, 'Sri Lanka', 'Asia', 'Sri Jayawardenepura Kotte', '21919000', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(213, 'Wallis and Futuna', 'Oceania', 'Mata-Utu', '11750', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(214, 'Curaçao', 'Americas', 'Willemstad', '155014', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(215, 'Morocco', 'Africa', 'Rabat', '36910558', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(216, 'Antarctica', 'Antarctic', '', '1000', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(217, 'South Africa', 'Africa', 'Pretoria', '59308690', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(218, 'Thailand', 'Asia', 'Bangkok', '69799978', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(219, 'Malta', 'Europe', 'Valletta', '525285', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(220, 'Tanzania', 'Africa', 'Dodoma', '59734213', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(221, 'Belgium', 'Europe', 'Brussels', '11555997', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(222, 'Guam', 'Oceania', 'Hagåtña', '168783', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(223, 'Christmas Island', 'Oceania', 'Flying Fish Cove', '2072', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(224, 'French Guiana', 'Americas', 'Cayenne', '254541', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(225, 'Myanmar', 'Asia', 'Naypyidaw', '54409794', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(226, 'Gibraltar', 'Europe', 'Gibraltar', '33691', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(227, 'Isle of Man', 'Europe', 'Douglas', '85032', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(228, 'Solomon Islands', 'Oceania', 'Honiara', '686878', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(229, 'Canada', 'Americas', 'Ottawa', '38005238', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(230, 'Syria', 'Asia', 'Damascus', '17500657', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(231, 'Venezuela', 'Americas', 'Caracas', '28435943', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(232, 'Lebanon', 'Asia', 'Beirut', '6825442', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(233, 'Norway', 'Europe', 'Oslo', '5379475', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(234, 'Cayman Islands', 'Americas', 'George Town', '65720', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(235, 'Rwanda', 'Africa', 'Kigali', '12952209', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(236, 'Ecuador', 'Americas', 'Quito', '17643060', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(237, 'Russia', 'Europe', 'Moscow', '144104080', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(238, 'Bouvet Island', 'Antarctic', '', '0', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(239, 'Benin', 'Africa', 'Porto-Novo', '12123198', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(240, 'Guinea', 'Africa', 'Conakry', '13132792', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(241, 'Romania', 'Europe', 'Bucharest', '19286123', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(242, 'Greenland', 'Americas', 'Nuuk', '56367', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(243, 'Switzerland', 'Europe', 'Bern', '8654622', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(244, 'Kazakhstan', 'Asia', 'Nur-Sultan', '18754440', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(245, 'Luxembourg', 'Europe', 'Luxembourg', '632275', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(246, 'United States Virgin Islands', 'Americas', 'Charlotte Amalie', '106290', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(247, 'Bangladesh', 'Asia', 'Dhaka', '164689383', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(248, 'Malawi', 'Africa', 'Lilongwe', '19129955', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(249, 'Dominica', 'Americas', 'Roseau', '71991', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40'),
(250, 'Cook Islands', 'Oceania', 'Avarua', '18100', NULL, '2023-09-08 21:27:40', '2023-09-08 21:27:40');

-- --------------------------------------------------------

--
-- Table structure for table `group_data`
--

CREATE TABLE `group_data` (
  `id` int NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `group_data`
--

INSERT INTO `group_data` (`id`, `group_name`, `group_data`, `created_at`) VALUES
(1, 'test1', '[\"Albania\", \"Accra\"]', '2023-09-09 07:49:39'),
(2, 'test2', '[\"Albania\", \"Accra\"]', '2023-09-09 07:49:39'),
(3, 'test3', '[\"Albania\", \"Accra\"]', '2023-09-09 07:49:39'),
(4, 'Countries starting with A', '[\"Albania\", \"Antarctica\", \"Adamstown\", \"Algiers\", \"Cockburn Town\", \"Austria\"]', '2023-09-09 14:22:01'),
(5, 'Indian cities', '[\"New Delhi\", \"India\"]', '2023-09-09 14:29:27'),
(6, 'Indian cities', '[\"New Delhi\", \"India\"]', '2023-09-09 14:29:27'),
(7, 'Capital cities', '[\"Abu Dhabi\", \"Dhaka\", \"Kuwait City\", \"Yerevan\"]', '2023-09-09 14:50:39'),
(8, 'Capital cities', '[\"Abu Dhabi\", \"Dhaka\", \"Kuwait City\", \"Yerevan\"]', '2023-09-09 14:50:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Abhishek', 'abhishek1234@gmail.com', '$2y$10$HbF3bY22/PsPqKGW4vkOmuNWoFX2jkKDppgtXhRmqX/2BdntIqUZS', 'qN7g1XSdM2iKpT9UfZyuCXPCv0iN6jzjxrjWuUExCL5ujfMN6eALYWTpNrwr', '2023-09-08 06:46:23', '2023-09-08 06:46:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_users`
--
ALTER TABLE `api_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city_json`
--
ALTER TABLE `city_json`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_data`
--
ALTER TABLE `group_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_users`
--
ALTER TABLE `api_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `city_json`
--
ALTER TABLE `city_json`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `group_data`
--
ALTER TABLE `group_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;