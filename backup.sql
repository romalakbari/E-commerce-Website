-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 12:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backup`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_files`
--

CREATE TABLE `app_files` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_files`
--

INSERT INTO `app_files` (`id`, `name`, `url`, `product_id`, `type`, `created_at`, `updated_at`) VALUES
(977, '1424760350.jpg', 'files/193008746.jpg', 'f31b47f4-2fe9-498e-9774-06f1b31cd959', 'image', NULL, NULL),
(978, '1351370868.jpg', 'files/2039746005.jpg', '6c78038a-53af-4d66-9e49-1e2ce97df459', 'image', NULL, NULL),
(979, '611062934.jpg', 'files/2039746005.jpg', '560b2ca2-a2f4-4f03-901f-1507bf520870', 'image', NULL, NULL),
(980, '124925746.jpg', 'files/2039746005.jpg', '560b2ca2-a2f4-4f03-901f-1507bf520870', 'image', NULL, NULL),
(981, '2120626509.jpg', 'files/hair oil 1.jpg', 'faff77da-a840-4ea7-92f5-853218519d8a', 'image', NULL, NULL),
(982, '699503920.jpg', 'files/hair oil 2.jpg', 'faff77da-a840-4ea7-92f5-853218519d8a', 'image', NULL, NULL),
(983, '451310477.jpg', 'files/hair oil 3.jpg', 'faff77da-a840-4ea7-92f5-853218519d8a', 'image', NULL, NULL),
(984, '1857248173.jpg', 'files/hair oil 4.jpg', 'faff77da-a840-4ea7-92f5-853218519d8a', 'image', NULL, NULL),
(985, '110375060.jpg', 'files/hair oil 5.jpg', 'faff77da-a840-4ea7-92f5-853218519d8a', 'image', NULL, NULL),
(986, '1461084320.jpg', 'files/hair oil 6.jpg', 'faff77da-a840-4ea7-92f5-853218519d8a', 'image', NULL, NULL),
(987, '1753855329.jpg', 'files/hair oil 7.jpg', 'faff77da-a840-4ea7-92f5-853218519d8a', 'image', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` char(36) DEFAULT NULL,
  `show_type` enum('detail','filter') NOT NULL DEFAULT 'detail',
  `filter_type` enum('text','range') NOT NULL DEFAULT 'text',
  `min` int(11) NOT NULL DEFAULT 0,
  `max` int(11) NOT NULL DEFAULT 1000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `category_id`, `show_type`, `filter_type`, `min`, `max`, `created_at`, `updated_at`) VALUES
('03e297af-1180-424a-b826-67a1dbb7c315', 'Color', '166', 'detail', 'text', 1, 1000, '2024-10-03 06:51:08', '2024-10-03 06:51:08'),
('826779fe-9a6c-4512-8219-5b871163d9f1', 'Keyboard', '166', 'detail', 'text', 1, 1000, '2024-10-03 06:51:17', '2024-10-03 06:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` char(36) NOT NULL,
  `value` varchar(255) NOT NULL,
  `attribute_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_infos`
--

CREATE TABLE `billing_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `card_holder_name` varchar(100) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing_infos`
--

INSERT INTO `billing_infos` (`id`, `order_id`, `card_holder_name`, `address_line1`, `city`, `state`, `country`, `created_at`, `updated_at`) VALUES
(1, 36, 'asdasdas', 'sdfsdfsdfsd', 'dsfsdf', 'sdfsd', 'us', '2024-10-05 04:12:00', '2024-10-05 04:12:00'),
(2, 37, 'dsfsfsdfsdf', 'fsdfsdfsd', 'sdfsdfsdf', 'sd', 'fsdfsdf', '2024-10-05 04:14:54', '2024-10-05 04:14:54'),
(3, 38, 'sadasdasda', 'dasdas', 'dasdas', 'dasdasda', 'dasdas', '2024-10-05 06:34:48', '2024-10-05 06:34:48'),
(4, 39, 'dasdasd', 'dfsdfsdfsdf', 'sdfsdfsdfdasd', 'dfsdfsdf', 'sdfsdfsdfs', '2024-10-05 06:43:16', '2024-10-05 06:43:16');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `featured` varchar(11) DEFAULT '''false''',
  `featured_icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `banner`, `icon`, `deleted_at`, `featured`, `featured_icon`, `created_at`, `updated_at`) VALUES
(166, NULL, 'Beauty & Personal Care', NULL, 'image-02.jpg', NULL, '\'false\'', 'image-02.jpg', '2024-01-01 07:22:55', '2024-01-01 08:14:37'),
(249, '166', 'Cream', NULL, NULL, NULL, '\'false\'', NULL, '2024-10-03 04:00:28', '2024-10-03 04:00:28');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `name`, `postal_code`) VALUES
(1, 1, 'Birmingham', '35203'),
(2, 1, 'Montgomery', '36104'),
(3, 1, 'Huntsville', '35801'),
(4, 1, 'Mobile', '36601'),
(5, 2, 'Anchorage', '99501'),
(6, 2, 'Juneau', '99801'),
(7, 2, 'Fairbanks', '99701'),
(8, 3, 'Phoenix', '85001'),
(9, 3, 'Tucson', '85701'),
(10, 3, 'Mesa', '85201'),
(11, 4, 'Little Rock', '72201'),
(12, 4, 'Fort Smith', '72901'),
(13, 4, 'Fayetteville', '72701'),
(14, 5, 'Los Angeles', '90001'),
(15, 5, 'San Francisco', '94101'),
(16, 5, 'San Diego', '92101'),
(17, 6, 'Denver', '80201'),
(18, 6, 'Colorado Springs', '80901'),
(19, 6, 'Aurora', '80010'),
(20, 7, 'Hartford', '06101'),
(21, 7, 'Bridgeport', '06601'),
(22, 7, 'New Haven', '06501'),
(23, 8, 'Wilmington', '19801'),
(24, 8, 'Dover', '19901'),
(25, 8, 'Newark', '19702'),
(26, 9, 'Miami', '33101'),
(27, 9, 'Orlando', '32801'),
(28, 9, 'Tampa', '33601'),
(29, 10, 'Atlanta', '30301'),
(30, 10, 'Savannah', '31401'),
(31, 10, 'Augusta', '30901'),
(32, 11, 'Honolulu', '96801'),
(33, 11, 'Hilo', '96720'),
(34, 12, 'Boise', '83701'),
(35, 12, 'Idaho Falls', '83401'),
(36, 13, 'Chicago', '60601'),
(37, 13, 'Aurora', '60505'),
(38, 14, 'Indianapolis', '46201'),
(39, 14, 'Fort Wayne', '46801'),
(40, 15, 'Des Moines', '50301'),
(41, 15, 'Cedar Rapids', '52401'),
(42, 16, 'Topeka', '66601'),
(43, 16, 'Wichita', '67201'),
(44, 17, 'Frankfort', '40601'),
(45, 17, 'Louisville', '40201'),
(46, 18, 'New Orleans', '70112'),
(47, 18, 'Baton Rouge', '70801'),
(48, 19, 'Augusta', '04330'),
(49, 19, 'Portland', '04101'),
(50, 20, 'Annapolis', '21401'),
(51, 20, 'Baltimore', '21201'),
(52, 21, 'Boston', '02101'),
(53, 21, 'Worcester', '01601'),
(54, 22, 'Detroit', '48201'),
(55, 22, 'Grand Rapids', '49501'),
(56, 23, 'Minneapolis', '55401'),
(57, 23, 'Saint Paul', '55101'),
(58, 24, 'Jackson', '39201'),
(59, 25, 'Kansas City', '64101'),
(60, 25, 'St. Louis', '63101'),
(61, 26, 'Billings', '59101'),
(62, 27, 'Omaha', '68101'),
(63, 28, 'Las Vegas', '89101'),
(64, 29, 'Concord', '03301'),
(65, 30, 'Trenton', '08601'),
(66, 31, 'Santa Fe', '87501'),
(67, 32, 'New York City', '10001'),
(68, 32, 'Buffalo', '14201'),
(69, 33, 'Charlotte', '28201'),
(70, 34, 'Fargo', '58102'),
(71, 35, 'Columbus', '43201'),
(72, 36, 'Oklahoma City', '73101'),
(73, 37, 'Portland', '97201'),
(74, 38, 'Philadelphia', '19101'),
(75, 39, 'Providence', '02901'),
(76, 40, 'Charleston', '25301'),
(77, 41, 'Sioux Falls', '57101'),
(78, 42, 'Nashville', '37201'),
(79, 43, 'Houston', '77001'),
(80, 44, 'Salt Lake City', '84101'),
(81, 45, 'Montpelier', '05601'),
(82, 46, 'Richmond', '23218'),
(83, 47, 'Seattle', '98101'),
(84, 48, 'Charleston', '25301'),
(85, 49, 'Milwaukee', '53201'),
(86, 50, 'Cheyenne', '82001');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` char(36) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `fname`, `lname`, `email`, `phone`, `description`, `created_at`, `updated_at`) VALUES
('3cc8dab7-6ec2-4a81-af53-2dbe4562b0bd', 'Romar', 'romar', 'romarzheyan@gmail.com', '+44789647997', 'asdasdasd', '2023-12-23 02:41:06', '2023-12-23 02:41:06'),
('cd7374c0-6bca-490a-beb1-ab46b60b6cd4', 'Romar', 'romar', 'romarzheyan@gmail.com', '+44789647997', 'fsdfsdf', '2023-12-23 02:40:11', '2023-12-23 02:40:11'),
('e2aa3ca9-af2f-4d99-89e4-d5f4f07f1751', 'Romar', 'romar', 'romarzheyan@gmail.com', '+44789647997', 'dasdasda', '2023-12-23 02:33:13', '2023-12-23 02:33:13');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`) VALUES
(1, 'United States', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_03_000001_create_customer_columns', 1),
(4, '2019_05_03_000002_create_subscriptions_table', 1),
(5, '2019_05_03_000003_create_subscription_items_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2022_08_18_000001_create_categories_table', 1),
(9, '2022_08_18_100816_create_products_table', 1),
(10, '2022_08_18_101010_create_tags_table', 1),
(11, '2022_08_18_101248_create_attributes_table', 1),
(12, '2022_08_18_101325_create_product_attributes_table', 1),
(13, '2022_08_18_101403_create_attribute_values_table', 1),
(14, '2022_08_18_101445_create_customers_table', 1),
(15, '2022_08_18_101533_create_addresses_table', 1),
(16, '2022_08_18_101605_create_plans_table', 1),
(17, '2022_08_18_101644_create_collections_table', 1),
(18, '2022_08_18_105109_create_countries_table', 1),
(19, '2022_08_18_105127_create_states_table', 1),
(20, '2022_08_27_085012_create_app_files_table', 1),
(21, '2022_08_29_035208_create_product_tags_table', 1),
(22, '2022_09_03_045138_add_type_column_to_categories', 1),
(23, '2022_10_03_045616_add_team_column_to_users_table', 1),
(24, '2022_10_11_040806_create_sales_table', 1),
(25, '2022_10_11_071428_create_contacts_table', 1),
(26, '2022_10_27_111411_add_preview_attribute_to_products_table', 1),
(27, '2022_11_02_102808_add_featured_attribute_to_product_table', 1),
(28, '2022_11_06_081349_create_category_tags_table', 1),
(29, '2022_11_13_070517_add_favorites_column_to_user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(38, 36, '560b2ca2-a2f4-4f03-901f-1507bf520870', 1, 50.00, '2024-10-05 04:12:00', '2024-10-05 04:12:00'),
(39, 37, '560b2ca2-a2f4-4f03-901f-1507bf520870', 1, 50.00, '2024-10-05 04:14:54', '2024-10-05 04:14:54'),
(40, 38, '560b2ca2-a2f4-4f03-901f-1507bf520870', 1, 50.00, '2024-10-05 06:34:47', '2024-10-05 06:34:47'),
(41, 39, '560b2ca2-a2f4-4f03-901f-1507bf520870', 1, 50.00, '2024-10-05 06:43:16', '2024-10-05 06:43:16');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Pending',
  `stripe_transaction_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `total_amount`, `status`, `stripe_transaction_id`, `created_at`, `updated_at`) VALUES
(36, 23, 54.00, 'pending', 'pi_3Q6TYpDDnOyNmBQZ0wVL0mjd', '2024-10-05 04:12:00', '2024-10-05 04:12:00'),
(37, 23, 54.00, 'pending', 'pi_3Q6TbbDDnOyNmBQZ0uFeub1O', '2024-10-05 04:14:54', '2024-10-05 04:14:54'),
(38, 23, 54.00, 'pending', 'pi_3Q6Vn1DDnOyNmBQZ0VtlzDBW', '2024-10-05 06:34:47', '2024-10-05 06:34:47'),
(39, 23, 54.00, 'pending', 'pi_3Q6VvEDDnOyNmBQZ010lP4IT', '2024-10-05 06:43:16', '2024-10-05 06:43:16');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 7, '-AuthToken', 'f39986a3005218460c9438186c96e201ddb4c4cf7845d1f60225b3207f335fea', '[\"*\"]', NULL, NULL, '2024-07-10 05:35:45', '2024-07-10 05:35:45'),
(2, 'App\\Models\\User', 7, '-AuthToken', '10d52e4190a8dd143686860f884f815b713e002092764e3c50104c14b0214e9f', '[\"*\"]', NULL, NULL, '2024-07-14 07:38:34', '2024-07-14 07:38:34'),
(3, 'App\\Models\\User', 7, '-AuthToken', '2fa79dc1a931202bb3c47c59731819307c1c5f01b05940bfff9c48a168a568bb', '[\"*\"]', NULL, NULL, '2024-07-15 01:45:42', '2024-07-15 01:45:42'),
(4, 'App\\Models\\User', 7, '-AuthToken', 'a5f2aa247050aa9d42e80840355185f0767ffd232328e067782052750d2c14ea', '[\"*\"]', NULL, NULL, '2024-07-15 01:46:56', '2024-07-15 01:46:56'),
(5, 'App\\Models\\User', 7, '-AuthToken', '0e9a1dc8dc658a8c141de0083f23925ae253a314860f4c70277b6e11161da839', '[\"*\"]', NULL, NULL, '2024-07-15 01:47:01', '2024-07-15 01:47:01'),
(6, 'App\\Models\\User', 7, '-AuthToken', '75c2245a18a360006225755631c6dc4dd83294411934096ac9e212cf8d493927', '[\"*\"]', NULL, NULL, '2024-07-15 01:50:35', '2024-07-15 01:50:35'),
(7, 'App\\Models\\User', 7, '-AuthToken', '1c1bcca130b3c696afc79ed0cb631745632a8543698b7582f95639b6027a2d61', '[\"*\"]', NULL, NULL, '2024-07-15 02:36:53', '2024-07-15 02:36:53'),
(8, 'App\\Models\\User', 7, '-AuthToken', '8dfee0c8b093682ba38850ae67d8921d06c2e2fc3bb164262e4da96d824ba4eb', '[\"*\"]', NULL, NULL, '2024-07-15 02:37:05', '2024-07-15 02:37:05'),
(9, 'App\\Models\\User', 7, '-AuthToken', '0d579b75b0c1c771c3848cfd81d28306ba3c3d1089006779169fbd69a1b7e618', '[\"*\"]', NULL, NULL, '2024-07-15 02:38:00', '2024-07-15 02:38:00'),
(10, 'App\\Models\\User', 7, '-AuthToken', '28e0a5fb5dc59ae4c54dd62ea30661e77de234a9680078adbd874b27f83d0ce9', '[\"*\"]', NULL, NULL, '2024-07-15 02:47:38', '2024-07-15 02:47:38'),
(11, 'App\\Models\\User', 7, '-AuthToken', '862be9f7812b16a5bec50033404e99092cf4613cd1a1c5b6f17a36e94e924658', '[\"*\"]', NULL, NULL, '2024-07-15 02:53:43', '2024-07-15 02:53:43'),
(12, 'App\\Models\\User', 7, '-AuthToken', '449d3a99536a6a6bde712f3b60b49f91f01f727bf4f9162afbaeb57cfbf75700', '[\"*\"]', NULL, NULL, '2024-07-15 03:35:06', '2024-07-15 03:35:06'),
(13, 'App\\Models\\User', 7, '-AuthToken', 'af9be650e4a820fe0c7d4e41d0815e82ebe51401f2f45a62dac17b9c3dfc5d9b', '[\"*\"]', NULL, NULL, '2024-07-15 04:28:54', '2024-07-15 04:28:54'),
(14, 'App\\Models\\User', 7, '-AuthToken', '705089744daf4c745e569ea09bad55312d8bf0707d218f91644a3119ec1e9d5d', '[\"*\"]', NULL, NULL, '2024-07-15 04:36:26', '2024-07-15 04:36:26'),
(15, 'App\\Models\\User', 7, '-AuthToken', '31c5b0412c7d7b7bbba2135f7c44950c9dfac4c97ff0355c340becb279681789', '[\"*\"]', NULL, NULL, '2024-07-15 04:41:00', '2024-07-15 04:41:00'),
(16, 'App\\Models\\User', 7, '-AuthToken', 'be9466cb3188e14dc4f4724529e2602795f146bbb6b603a6215ee483f6a8d3b1', '[\"*\"]', NULL, NULL, '2024-07-15 04:41:17', '2024-07-15 04:41:17'),
(17, 'App\\Models\\User', 7, '-AuthToken', '5a954643d5334afdd755279d8e1d4ec44dd850121b66c9c7eb008b252066b8df', '[\"*\"]', NULL, NULL, '2024-07-15 23:11:13', '2024-07-15 23:11:13'),
(18, 'App\\Models\\User', 7, '-AuthToken', '18579c490248fe9beb1a7fee08024b3ca5b99b3ab95b02005b0bef22aca89a63', '[\"*\"]', NULL, NULL, '2024-07-16 00:33:46', '2024-07-16 00:33:46'),
(19, 'App\\Models\\User', 7, '-AuthToken', '02c67dd208a4dfc92b33ba7adf8696cd3dd4731c48213b1040aa4d39d9263a7a', '[\"*\"]', NULL, NULL, '2024-07-16 01:38:39', '2024-07-16 01:38:39'),
(20, 'App\\Models\\User', 7, '-AuthToken', 'd30d3bba7fb9f77a5269af8172b59f5602d6074061d244f35514b17807191758', '[\"*\"]', NULL, NULL, '2024-07-16 01:38:51', '2024-07-16 01:38:51'),
(21, 'App\\Models\\User', 7, '-AuthToken', '72376c7f798772f9c0acb1fbb1668c3b37170ac69b14ac547aebbbe88a71f411', '[\"*\"]', NULL, NULL, '2024-07-18 06:15:06', '2024-07-18 06:15:06'),
(22, 'App\\Models\\User', 7, '-AuthToken', '994274f7f55876a3de557eb6f1fdc50efccfab0b18cd8edc9dabe7423131ff35', '[\"*\"]', NULL, NULL, '2024-07-25 05:18:30', '2024-07-25 05:18:30'),
(23, 'App\\Models\\User', 7, '-AuthToken', '206453d059d031239de57576c4ecdb98de7a28f3587a0a73a44095eb8ea92735', '[\"*\"]', NULL, NULL, '2024-07-28 02:15:23', '2024-07-28 02:15:23'),
(24, 'App\\Models\\User', 7, '-AuthToken', '86e7ad28ed9234ec13fe527556e29356e1498b6c5b33bf3f014b73ecd04350db', '[\"*\"]', NULL, NULL, '2024-07-29 00:18:41', '2024-07-29 00:18:41'),
(25, 'App\\Models\\User', 7, '-AuthToken', '87c3557e23e7ecb8bbe0aa9467159493178a00390448ed8ffa96776c7443b3e4', '[\"*\"]', NULL, NULL, '2024-07-29 00:21:42', '2024-07-29 00:21:42'),
(26, 'App\\Models\\User', 7, '-AuthToken', '7ab4d4a2d94586c840d3af7653f32d2ca297174ce4b0e4c39e8d7597118df84e', '[\"*\"]', NULL, NULL, '2024-07-30 00:04:18', '2024-07-30 00:04:18'),
(27, 'App\\Models\\User', 7, '-AuthToken', 'ea669320d89340fa85783778fb9ec2e7b626b912866bd1bbe0c87def4aab82a7', '[\"*\"]', NULL, NULL, '2024-08-13 23:22:04', '2024-08-13 23:22:04'),
(28, 'App\\Models\\User', 7, '-AuthToken', '91b588c9408f718799f98ded1e8571331f3fd74d01b1c3050a55134c8aee3027', '[\"*\"]', NULL, NULL, '2024-08-21 00:54:44', '2024-08-21 00:54:44'),
(29, 'App\\Models\\User', 7, '-AuthToken', '2a4e3b31059f4c9e465419a121e4c81787ccbc7166d958cf2f362b409967962a', '[\"*\"]', NULL, NULL, '2024-08-21 04:06:08', '2024-08-21 04:06:08'),
(30, 'App\\Models\\User', 16, '-AuthToken', '4f2ae91f9f705c769d7d242e304f5b38ce5a83261e3ffffc194dd90c1d2c1a85', '[\"*\"]', NULL, NULL, '2024-08-23 23:43:53', '2024-08-23 23:43:53'),
(31, 'App\\Models\\User', 7, '-AuthToken', 'a8180ce6db23fecbb6fc9b8cae19301db98026dd6761b14ff1b9081dcdf634f6', '[\"*\"]', NULL, NULL, '2024-08-24 23:36:48', '2024-08-24 23:36:48'),
(32, 'App\\Models\\User', 7, '-AuthToken', 'a74587b7c40a7ea7730dd5001a3d49e7a77d7badaf803b0096f4faa1be057957', '[\"*\"]', NULL, NULL, '2024-08-24 23:38:18', '2024-08-24 23:38:18'),
(33, 'App\\Models\\User', 16, '-AuthToken', 'aa22a7f40ba81fed3b560cdfe3a5b22ab43b0f82d67d41799d6bdf399a9f38b5', '[\"*\"]', NULL, NULL, '2024-08-25 00:07:38', '2024-08-25 00:07:38'),
(34, 'App\\Models\\User', 7, '-AuthToken', 'f4b5c24919ecc949b71fd6f037850130e0df5813090793a02a7c0568ce3152ab', '[\"*\"]', NULL, NULL, '2024-08-25 00:16:31', '2024-08-25 00:16:31'),
(35, 'App\\Models\\User', 16, '-AuthToken', '956ce2ef42fd88e5e26893b64b23ed211e85a886da7db7e14432a3b2f1b5c2c8', '[\"*\"]', NULL, NULL, '2024-08-25 00:17:13', '2024-08-25 00:17:13'),
(36, 'App\\Models\\User', 16, '-AuthToken', 'd89d8c049bc82d8f0696bbe663b4a15b0305e14e5e4c3f70c210e9761465bee4', '[\"*\"]', NULL, NULL, '2024-08-25 00:19:34', '2024-08-25 00:19:34'),
(37, 'App\\Models\\User', 16, '-AuthToken', 'b01f2c45aa9c8424fd36fc580f0a1febd9d7d6d5c9dcaf3a88e4b44a40437462', '[\"*\"]', NULL, NULL, '2024-08-25 00:31:08', '2024-08-25 00:31:08'),
(38, 'App\\Models\\User', 16, '-AuthToken', '46919602c79bc575fb106ba2aca33497d1c726f6430260fb1510a789095bd008', '[\"*\"]', NULL, NULL, '2024-08-25 00:38:33', '2024-08-25 00:38:33'),
(39, 'App\\Models\\User', 16, '-AuthToken', '1fd181bf466c027fc9f639658bf44d198c061fca45805c6754be8dedbd39f4d2', '[\"*\"]', NULL, NULL, '2024-08-25 00:39:10', '2024-08-25 00:39:10'),
(40, 'App\\Models\\User', 16, '-AuthToken', 'e77956bd7bd66198d6c68bd4a33cb8bfbd259e7cf6562e6bd3a400a2b45cb1aa', '[\"*\"]', NULL, NULL, '2024-08-25 00:41:19', '2024-08-25 00:41:19'),
(41, 'App\\Models\\User', 16, '-AuthToken', '55590ac9544b0a819ac9d365519b97f1adb994a396d875ced5bc69b89121b0d7', '[\"*\"]', NULL, NULL, '2024-08-25 00:41:20', '2024-08-25 00:41:20'),
(42, 'App\\Models\\User', 16, '-AuthToken', '38e9bf2eb3a86afc76da1e78eb699bceab439739cb1b2f8f330cfd3d324aff05', '[\"*\"]', NULL, NULL, '2024-08-25 00:41:28', '2024-08-25 00:41:28'),
(43, 'App\\Models\\User', 16, '-AuthToken', '72970e156956ba6f5ec8302445e235735757f80131aac313f56985581113b004', '[\"*\"]', NULL, NULL, '2024-08-25 00:41:41', '2024-08-25 00:41:41'),
(44, 'App\\Models\\User', 16, '-AuthToken', '5c67df5dd50457ad2c36f7e7fa10b2b319fa9b44f37000a2684d34260418e85d', '[\"*\"]', NULL, NULL, '2024-08-25 00:41:42', '2024-08-25 00:41:42'),
(45, 'App\\Models\\User', 16, '-AuthToken', '925c0e8c7b9e3e9dadca20616b799e18427385d5c9dfbee16910aa7916e23541', '[\"*\"]', NULL, NULL, '2024-08-25 00:41:54', '2024-08-25 00:41:54'),
(46, 'App\\Models\\User', 7, '-AuthToken', 'b3a355344c435476b508d5e7dfeeb4f85e824fe544d6a738f7b6950770af6fad', '[\"*\"]', NULL, NULL, '2024-08-25 00:43:10', '2024-08-25 00:43:10'),
(47, 'App\\Models\\User', 7, '-AuthToken', '472e9a0a6c8ca5cb40b78874128bad0ecde989940d5dc68d10c1a5a4e2bec721', '[\"*\"]', NULL, NULL, '2024-08-25 00:43:21', '2024-08-25 00:43:21'),
(48, 'App\\Models\\User', 7, '-AuthToken', '3b7eb91a31a75c0a5364cd4d34e160316721b4cf266e480242be334b1d86ef47', '[\"*\"]', NULL, NULL, '2024-08-25 00:43:56', '2024-08-25 00:43:56'),
(49, 'App\\Models\\User', 16, '-AuthToken', 'c95192cd4b84745d03bca65f0bab52bf6e37053cc760ad6ab315b248c88c2774', '[\"*\"]', NULL, NULL, '2024-08-25 00:44:29', '2024-08-25 00:44:29'),
(50, 'App\\Models\\User', 16, '-AuthToken', '1a3bfad09f46c1b9c5a13c2b0d0272a3d2b49b72e68f5fdc5854bc78dd3f67d7', '[\"*\"]', NULL, NULL, '2024-08-25 01:53:54', '2024-08-25 01:53:54'),
(51, 'App\\Models\\User', 7, '-AuthToken', 'ccdb7faf8f50fb253e38198070cf187951f59f53d5dc7704b5b03bad2f01725b', '[\"*\"]', NULL, NULL, '2024-08-25 01:57:51', '2024-08-25 01:57:51'),
(52, 'App\\Models\\User', 7, '-AuthToken', 'a60d9f724d87a713cbebd67bb54346ad0ae81ca04737ee1fac1b4f6745ed42ac', '[\"*\"]', NULL, NULL, '2024-08-25 02:12:27', '2024-08-25 02:12:27'),
(53, 'App\\Models\\User', 7, '-AuthToken', 'c0d465693c0d68936385cb3bbc7b3d8e0fda26d248f3b6ed31f4bad265537c22', '[\"*\"]', NULL, NULL, '2024-08-25 02:12:37', '2024-08-25 02:12:37'),
(54, 'App\\Models\\User', 16, '-AuthToken', '18285bd7a526d8aa96ba13c639d108bdfed52c0bc2761799c6c2779272432092', '[\"*\"]', NULL, NULL, '2024-08-25 02:13:00', '2024-08-25 02:13:00'),
(55, 'App\\Models\\User', 7, '-AuthToken', '13cae39ef51146638c62379a43293539054537dd31dda5408cfff360a6a471ee', '[\"*\"]', NULL, NULL, '2024-08-25 02:13:42', '2024-08-25 02:13:42'),
(56, 'App\\Models\\User', 7, '-AuthToken', 'de2e51f8b745eda5dc4db0ba823e1d73a85b39c1b6155ade33cb6bf7ec0eddf9', '[\"*\"]', NULL, NULL, '2024-08-25 02:14:24', '2024-08-25 02:14:24'),
(57, 'App\\Models\\User', 7, '-AuthToken', '95772b3fc37a43f13163b6a865120dbd5ff857dee3579fa14ebb25955e81c4c2', '[\"*\"]', NULL, NULL, '2024-08-25 02:15:17', '2024-08-25 02:15:17'),
(58, 'App\\Models\\User', 16, '-AuthToken', '358dd3bf0d154ff5b50cc4497554e41dd0aebccb553e5401bd63d1977986ec98', '[\"*\"]', NULL, NULL, '2024-08-25 23:58:39', '2024-08-25 23:58:39'),
(59, 'App\\Models\\User', 7, '-AuthToken', '61811ebd3e7254bebd3a9232abb1889381e51cddef3082a69eb72a9324696d24', '[\"*\"]', NULL, NULL, '2024-08-26 00:21:37', '2024-08-26 00:21:37'),
(60, 'App\\Models\\User', 7, '-AuthToken', '54bba5a3658c7ae6b41f58e59d6fd9e6b9e8090adb24ec295d161b76deecab21', '[\"*\"]', NULL, NULL, '2024-08-26 03:02:28', '2024-08-26 03:02:28'),
(61, 'App\\Models\\User', 7, '-AuthToken', '1670e1e294584e816cb4cc6732a94e24f6b5dfe04920757649f418584eb1e40e', '[\"*\"]', NULL, NULL, '2024-08-26 03:05:59', '2024-08-26 03:05:59'),
(62, 'App\\Models\\User', 7, '-AuthToken', 'c11e7df27c17ae0cbd5f2894a9f44adc9e30d93df725778f4506bc652e7cd090', '[\"*\"]', NULL, NULL, '2024-08-26 03:09:50', '2024-08-26 03:09:50'),
(63, 'App\\Models\\User', 16, '-AuthToken', 'fa4d77e522c408258a9b63b1a5271df2895f008723bd4bf163c8a2967ba01d52', '[\"*\"]', NULL, NULL, '2024-08-26 03:15:48', '2024-08-26 03:15:48'),
(64, 'App\\Models\\User', 16, '-AuthToken', '0f7eb6451e554984f6805c9cbd38a2e95d5b107beeb68c771623c23638e34302', '[\"*\"]', NULL, NULL, '2024-08-26 03:17:26', '2024-08-26 03:17:26'),
(65, 'App\\Models\\User', 7, '-AuthToken', '4baaf48d8adbb30b7ac2d828774099a42bc1f65fd1a8d1f493c1fd7b8c64b1f1', '[\"*\"]', NULL, NULL, '2024-08-26 03:53:49', '2024-08-26 03:53:49'),
(66, 'App\\Models\\User', 7, '-AuthToken', '6f747d3b2d10950c9b2b83113903548551050bfd031d3a309eaf576deffe1a01', '[\"*\"]', NULL, NULL, '2024-08-26 03:56:38', '2024-08-26 03:56:38'),
(67, 'App\\Models\\User', 7, '-AuthToken', '610459b1df60df292ae942743b837281f3ea9ae503d09ffb18506a7d46d62bd1', '[\"*\"]', NULL, NULL, '2024-08-26 04:04:31', '2024-08-26 04:04:31'),
(68, 'App\\Models\\User', 7, '-AuthToken', '94178005db82b58bfe8571cfea801e5697d9583b6945857ccf68a0028922d9f2', '[\"*\"]', NULL, NULL, '2024-08-26 04:57:19', '2024-08-26 04:57:19'),
(69, 'App\\Models\\User', 7, '-AuthToken', '0eb7cf1310d9ef96fbf1e1574b8bc54089acf953bc99d31bd0e7bdf1a7838434', '[\"*\"]', NULL, NULL, '2024-08-26 05:07:12', '2024-08-26 05:07:12'),
(70, 'App\\Models\\User', 16, '-AuthToken', '33842e04ee4702093e5498e9af05638ad54d2a7d20bf487baf5f9c4d68cb7254', '[\"*\"]', NULL, NULL, '2024-08-26 05:49:51', '2024-08-26 05:49:51'),
(71, 'App\\Models\\User', 16, '-AuthToken', '2db25df66bf8ddc76abef308bcd96a0fa7f90717c76c5207256c8958805486c7', '[\"*\"]', NULL, NULL, '2024-08-26 06:38:27', '2024-08-26 06:38:27'),
(72, 'App\\Models\\User', 7, '-AuthToken', '1d94df27d603039455b2b917faaea1f8e509670d346848f154e7755279a6d120', '[\"*\"]', NULL, NULL, '2024-08-26 07:01:03', '2024-08-26 07:01:03'),
(73, 'App\\Models\\User', 7, '-AuthToken', '9bf6c978bc5a6feb00cbd4cd4caa2b9969dc7e638831a747a759541dcece01e0', '[\"*\"]', NULL, NULL, '2024-08-26 07:23:05', '2024-08-26 07:23:05'),
(74, 'App\\Models\\User', 7, '-AuthToken', '93195840675b7c5a0679e692e4b52810c71a1ea101cb1ea00bb2c52701f26d86', '[\"*\"]', NULL, NULL, '2024-08-26 07:23:33', '2024-08-26 07:23:33'),
(75, 'App\\Models\\User', 7, '-AuthToken', '86b1ca807517b1b4cefd933b4c73fca63bd55d9f7ae058f1aef05640c21bdaf3', '[\"*\"]', NULL, NULL, '2024-08-26 07:35:11', '2024-08-26 07:35:11'),
(76, 'App\\Models\\User', 16, '-AuthToken', 'ac63dfea55e30ddaf4e0b609b89f5eb4d9765cffb32668afadaff18ff5e7fe90', '[\"*\"]', NULL, NULL, '2024-08-26 08:10:52', '2024-08-26 08:10:52'),
(77, 'App\\Models\\User', 7, '-AuthToken', '9cb7b21c591adf822097c0adab38a9f707bd71e0f45ca1b1467a7020d16d7dd7', '[\"*\"]', NULL, NULL, '2024-08-27 00:33:08', '2024-08-27 00:33:08'),
(78, 'App\\Models\\User', 16, '-AuthToken', 'e13038a54d89806c1fe7641e7c9b66d725026dba7a4a6b839e820677dbba6fa2', '[\"*\"]', NULL, NULL, '2024-08-27 00:37:59', '2024-08-27 00:37:59'),
(79, 'App\\Models\\User', 16, '-AuthToken', '0156ac2bfdc17a2866b2a109cf8d5363b92c04edc033436ad5b4a453c084bb9b', '[\"*\"]', NULL, NULL, '2024-08-27 00:44:45', '2024-08-27 00:44:45'),
(80, 'App\\Models\\User', 7, '-AuthToken', 'ba641e8600c605f20e333f8975e371a3b1c613a7c8e281b897a1a06047e43f3f', '[\"*\"]', NULL, NULL, '2024-08-27 00:53:33', '2024-08-27 00:53:33'),
(81, 'App\\Models\\User', 7, '-AuthToken', 'c3e7ba9e190d2f48f19c736f5cb54fa4fc2cdec1604712321822d128610bd7ab', '[\"*\"]', NULL, NULL, '2024-08-27 00:54:48', '2024-08-27 00:54:48'),
(82, 'App\\Models\\User', 16, '-AuthToken', 'f8c5a9d626af047526aa9af8ebed8c438e349f4eaf0145934cc817abf5ed9f6c', '[\"*\"]', NULL, NULL, '2024-08-27 01:07:13', '2024-08-27 01:07:13'),
(83, 'App\\Models\\User', 16, '-AuthToken', '02cfd7871726a85fb9bf2981f7ae3d0edefeb94f43124d0796423b07d02e44d9', '[\"*\"]', NULL, NULL, '2024-08-27 01:27:55', '2024-08-27 01:27:55'),
(84, 'App\\Models\\User', 7, '-AuthToken', '9db0306c22bbc10e7dd3f7c161b399fb61ccf803734d9e269c45e837a6bb40d6', '[\"*\"]', NULL, NULL, '2024-08-27 01:29:54', '2024-08-27 01:29:54'),
(85, 'App\\Models\\User', 7, '-AuthToken', '86dbe7e68192f93fafd431833b9b7da36b7388959fcfb381aba31491406cb2c8', '[\"*\"]', NULL, NULL, '2024-08-27 01:30:44', '2024-08-27 01:30:44'),
(86, 'App\\Models\\User', 7, '-AuthToken', '402dbf34bd5cffe32c35531c28a6dc6db4e1a265af793890949533820040f911', '[\"*\"]', NULL, NULL, '2024-08-27 01:35:31', '2024-08-27 01:35:31'),
(87, 'App\\Models\\User', 16, '-AuthToken', '8985e9c9c299eb9b69de02c0a4a89d436872ccb4de17817536c6735cd509c471', '[\"*\"]', NULL, NULL, '2024-08-27 01:36:10', '2024-08-27 01:36:10'),
(88, 'App\\Models\\User', 7, '-AuthToken', '759b808500ab1a48ea1d4591a6344e454debaa8682ca9dad70e01e2ac2de2285', '[\"*\"]', NULL, NULL, '2024-08-28 00:02:36', '2024-08-28 00:02:36'),
(89, 'App\\Models\\User', 16, '-AuthToken', '8b08cd3da6f5b9baaeb9aac078be1211074abc7394f537e1860803efbc46ee33', '[\"*\"]', NULL, NULL, '2024-08-28 01:03:04', '2024-08-28 01:03:04'),
(90, 'App\\Models\\User', 16, '-AuthToken', '63ef498683dc0ac875c5feb34d823cc9bbd71a0fbae1e5ab8bfe14abcd207e3d', '[\"*\"]', NULL, NULL, '2024-08-28 07:07:49', '2024-08-28 07:07:49'),
(91, 'App\\Models\\User', 16, '-AuthToken', 'bbe4a8e072c9098bc02a06d6ab5723c57e49aa9e3b72dfab7623b4c196a708b5', '[\"*\"]', NULL, NULL, '2024-08-28 23:13:15', '2024-08-28 23:13:15'),
(92, 'App\\Models\\User', 7, '-AuthToken', 'cf2dd752bb9dd63399e173eca2f239517889d5f998d36bed68041f393a208d15', '[\"*\"]', NULL, NULL, '2024-08-29 00:34:43', '2024-08-29 00:34:43'),
(93, 'App\\Models\\User', 16, '-AuthToken', '24c85ef5d5cfcf5e5644d1f006bcf5698b7ac7c0bc7b3f8d751c6f8134ad2dd6', '[\"*\"]', NULL, NULL, '2024-08-29 00:42:49', '2024-08-29 00:42:49'),
(94, 'App\\Models\\User', 7, '-AuthToken', '50f3489af945b359c6ee7168249ad7698448b2e1708d2f9a1521ebdcccd6acde', '[\"*\"]', NULL, NULL, '2024-08-31 00:31:36', '2024-08-31 00:31:36'),
(95, 'App\\Models\\User', 7, '-AuthToken', '4a1ac9c84489bc402d53afe29b363a7f086afe5c9578bdeeb21f5b4b8719116a', '[\"*\"]', NULL, NULL, '2024-08-31 00:31:50', '2024-08-31 00:31:50'),
(96, 'App\\Models\\User', 7, '-AuthToken', '618ed0ec04b40949e8a82ed4c5bef0a16899dab5cea77d134ba13f5b34c1029d', '[\"*\"]', NULL, NULL, '2024-08-31 00:35:48', '2024-08-31 00:35:48'),
(97, 'App\\Models\\User', 7, '-AuthToken', 'dce15752c3b5d9d6d5ac71a068f2386df9f91320cc04e96351e6e97debe75b05', '[\"*\"]', NULL, NULL, '2024-08-31 00:36:46', '2024-08-31 00:36:46'),
(98, 'App\\Models\\User', 7, '-AuthToken', 'b9c3749a277fb9dd99062754cf5e222bbf26000886cd7a48e70a6c561a1def1d', '[\"*\"]', NULL, NULL, '2024-08-31 00:36:57', '2024-08-31 00:36:57'),
(99, 'App\\Models\\User', 16, '-AuthToken', '8828bd664bc94a1661dfc255cf4696885b636c3b41922a928d31e972420e780c', '[\"*\"]', NULL, NULL, '2024-08-31 00:43:01', '2024-08-31 00:43:01'),
(100, 'App\\Models\\User', 7, '-AuthToken', '6b29ba53d500b81be7590ad4dede0b11830a12bce5d0c5cd50fe709c534d92f1', '[\"*\"]', NULL, NULL, '2024-08-31 01:14:49', '2024-08-31 01:14:49'),
(101, 'App\\Models\\User', 7, '-AuthToken', '72e2f7e77baa98fdf4d6720d2eecd81e62a8269d1bcaca4d49d75f5c4748561b', '[\"*\"]', NULL, NULL, '2024-08-31 01:16:26', '2024-08-31 01:16:26'),
(102, 'App\\Models\\User', 7, '-AuthToken', '384c3394b165c35527c161c778be6d6735dc138d8ac8f6ecd3a8811190c8279a', '[\"*\"]', NULL, NULL, '2024-08-31 01:16:40', '2024-08-31 01:16:40'),
(103, 'App\\Models\\User', 7, '-AuthToken', 'a14130315cd045b1b2afacbfca84277bfefc71f77134cf46d631ce15e49293c1', '[\"*\"]', NULL, NULL, '2024-08-31 01:17:18', '2024-08-31 01:17:18'),
(104, 'App\\Models\\User', 16, '-AuthToken', '1449baa2d2bde6b4416ffa44dc0cbf96c9b303af65f6276970b63342b1a62fc3', '[\"*\"]', NULL, NULL, '2024-08-31 01:18:53', '2024-08-31 01:18:53'),
(105, 'App\\Models\\User', 7, '-AuthToken', '8c1019f1866f3f1defd919ded341619d25d3c62774abea302d040fdc18c66f80', '[\"*\"]', NULL, NULL, '2024-08-31 01:21:34', '2024-08-31 01:21:34'),
(106, 'App\\Models\\User', 7, '-AuthToken', 'b69478297bbab83c8d10c82a8b97849e569594edcde52954870ece908a16bfb6', '[\"*\"]', NULL, NULL, '2024-08-31 01:22:39', '2024-08-31 01:22:39'),
(107, 'App\\Models\\User', 16, '-AuthToken', '451e4a9f0aa66c4de3641174572c92db65377d85ab43c6c8f20e441488a84fe9', '[\"*\"]', NULL, NULL, '2024-08-31 01:23:25', '2024-08-31 01:23:25'),
(108, 'App\\Models\\User', 16, '-AuthToken', 'c3ea6233de2003e796c724c660f3560bd734a20e9c2274a45ce6f1de02d7895e', '[\"*\"]', NULL, NULL, '2024-09-01 01:24:26', '2024-09-01 01:24:26'),
(109, 'App\\Models\\User', 16, '-AuthToken', 'c391c10441c8d783bc1876869796ff1a3c754987ecd852f06a943ce95e2edce5', '[\"*\"]', NULL, NULL, '2024-09-02 23:39:03', '2024-09-02 23:39:03'),
(110, 'App\\Models\\User', 16, '-AuthToken', 'ec4bcc98003582ce464d230696eed36aef6ad4cbdb9e2364d40a589bc9a90226', '[\"*\"]', NULL, NULL, '2024-09-02 23:44:25', '2024-09-02 23:44:25'),
(111, 'App\\Models\\User', 16, '-AuthToken', 'a0c08d9d9461ec7d7f8ea7cdadf375a0ce2da0f4155cd506528834ba8ce90a3e', '[\"*\"]', NULL, NULL, '2024-09-03 23:16:41', '2024-09-03 23:16:41'),
(112, 'App\\Models\\User', 7, '-AuthToken', 'bcb1e9235f4a3b778b8a06a283e41d315fff043e9eccdecd2e30912ba5f803dc', '[\"*\"]', NULL, NULL, '2024-09-04 00:50:48', '2024-09-04 00:50:48'),
(113, 'App\\Models\\User', 16, '-AuthToken', '84c878e32ba4bc9b8e37bafe953bc17d2233bcb25a91468d739a6eb14be01e98', '[\"*\"]', NULL, NULL, '2024-09-04 01:08:49', '2024-09-04 01:08:49'),
(114, 'App\\Models\\User', 16, '-AuthToken', '4b67479f44e4f972d76afccc093150d61a4320abc9802455a5030064d0684d6e', '[\"*\"]', NULL, NULL, '2024-09-04 01:56:28', '2024-09-04 01:56:28'),
(115, 'App\\Models\\User', 7, '-AuthToken', 'be79dffd2c2c5b20e8381b23680ab5b7e8e200284b5228b3fdc18259da58fdfb', '[\"*\"]', NULL, NULL, '2024-09-04 03:31:19', '2024-09-04 03:31:19'),
(116, 'App\\Models\\User', 7, '-AuthToken', '2dc1b46d4d496d5b943b6714e7916be491dc6a33280f577ebeca7a4b20968f97', '[\"*\"]', NULL, NULL, '2024-09-04 23:50:06', '2024-09-04 23:50:06'),
(117, 'App\\Models\\User', 16, '-AuthToken', 'db0497a25f81bedfea4fade9d2e406509a93160cc48186e106442bc60b6e7c60', '[\"*\"]', NULL, NULL, '2024-09-06 23:56:33', '2024-09-06 23:56:33'),
(118, 'App\\Models\\User', 16, '-AuthToken', 'a90d43f79b06f62815f8027f945f03b6be7287026868ad68ef5ae5e0bcbfb8b8', '[\"*\"]', NULL, NULL, '2024-09-07 00:13:56', '2024-09-07 00:13:56'),
(119, 'App\\Models\\User', 16, '-AuthToken', 'c84801d83e0c2f464dfffc2c8a22743056ad33a9872baf53b067c35854ad2be6', '[\"*\"]', NULL, NULL, '2024-09-07 01:08:20', '2024-09-07 01:08:20'),
(120, 'App\\Models\\User', 16, '-AuthToken', 'c8040ad8aef441755db76d0396edd9ced5926dd85406a93e9f73652c78244791', '[\"*\"]', NULL, NULL, '2024-09-07 03:34:01', '2024-09-07 03:34:01'),
(121, 'App\\Models\\User', 16, '-AuthToken', 'a11082c88286b07ca603b7b62a64df476742aabb4f0f67196146b7044eb7d083', '[\"*\"]', NULL, NULL, '2024-09-07 03:34:30', '2024-09-07 03:34:30'),
(122, 'App\\Models\\User', 16, '-AuthToken', 'e029d72a6f92be352de2c117e733fd74ac43168e09005a0b0f53b1db14a8a1ab', '[\"*\"]', NULL, NULL, '2024-09-08 01:26:53', '2024-09-08 01:26:53'),
(123, 'App\\Models\\User', 16, '-AuthToken', '28bde952fea30c8f95b4ed60bfe2999e4cae9a9004fea81e1c537361408fe252', '[\"*\"]', NULL, NULL, '2024-09-10 01:38:18', '2024-09-10 01:38:18'),
(124, 'App\\Models\\User', 7, '-AuthToken', '44c78690d23f16585d66debd52785e853c5ac4b565c88aca39f30185f502f21f', '[\"*\"]', NULL, NULL, '2024-09-10 01:52:46', '2024-09-10 01:52:46'),
(125, 'App\\Models\\User', 7, '-AuthToken', 'e1321597de8f2482b0a1b621121490a99141b4254c5b68bfbf0f79a8f7a2ef77', '[\"*\"]', NULL, NULL, '2024-09-24 02:32:36', '2024-09-24 02:32:36'),
(126, 'App\\Models\\User', 7, '-AuthToken', 'cb9a7158d1f1887dffecf6c12cd821d45c0e8b21e7184c56fe0a787d8841ec8e', '[\"*\"]', NULL, NULL, '2024-09-24 23:26:42', '2024-09-24 23:26:42'),
(127, 'App\\Models\\User', 7, '-AuthToken', '0a24f65c2361fcf28a635b420a6c3453134bc8ee89f490034ff21c68a34291f5', '[\"*\"]', NULL, NULL, '2024-09-24 23:27:12', '2024-09-24 23:27:12'),
(128, 'App\\Models\\User', 7, '-AuthToken', 'f1600c7e4103452728e41cd4c35fa267a7b476be5804866c1bb76d67737d6600', '[\"*\"]', NULL, NULL, '2024-09-25 23:34:53', '2024-09-25 23:34:53'),
(129, 'App\\Models\\User', 7, '-AuthToken', '1aa8412eb91f8d24eda8fba9a372878bd0e114b04477d86f698f24469e07deb9', '[\"*\"]', NULL, NULL, '2024-09-28 00:50:25', '2024-09-28 00:50:25'),
(130, 'App\\Models\\User', 7, '-AuthToken', '403b19aaaf25a2fec4ec9540240c26e9648025fe8601f8c879d8afcf0823df35', '[\"*\"]', NULL, NULL, '2024-09-28 23:30:04', '2024-09-28 23:30:04'),
(131, 'App\\Models\\User', 7, '-AuthToken', '9fc9ad5a6aaf14d8be84a4143ad9796ad26d4fe3c0229784f926b95ad1f3d416', '[\"*\"]', NULL, NULL, '2024-09-29 07:01:46', '2024-09-29 07:01:46'),
(132, 'App\\Models\\User', 17, '-AuthToken', '04116b849047c8f0589369fabf1802596027e191e1cf40458616b023d6d65748', '[\"*\"]', NULL, NULL, '2024-09-29 07:06:28', '2024-09-29 07:06:28'),
(133, 'App\\Models\\User', 7, '-AuthToken', '5b66a7c77f5e74fac96a16077da852fd367a425727c45a2e100ff3a10d3c61f9', '[\"*\"]', NULL, NULL, '2024-09-29 23:29:23', '2024-09-29 23:29:23'),
(134, 'App\\Models\\User', 18, '-AuthToken', '9a298f418036c25eda27a7e2496f99b64de17d5f3854a28f520f0e7c0b6a84e3', '[\"*\"]', NULL, NULL, '2024-09-29 23:39:12', '2024-09-29 23:39:12'),
(135, 'App\\Models\\User', 18, '-AuthToken', 'b6e83e02d1796040e51074a81afb41249edd94b2a0f2ad164017ad7db213b0ed', '[\"*\"]', NULL, NULL, '2024-09-29 23:43:07', '2024-09-29 23:43:07'),
(136, 'App\\Models\\User', 7, '-AuthToken', '0cc923ea84e0faeae6f02c81489426a248a42ac3f5071c73e6aeef2ad1642a48', '[\"*\"]', NULL, NULL, '2024-09-29 23:43:54', '2024-09-29 23:43:54'),
(137, 'App\\Models\\User', 18, '-AuthToken', 'c5338cd1aad3afb52171a2a9372b3d46effca463defdb6bb12efe814c0add10d', '[\"*\"]', NULL, NULL, '2024-09-29 23:57:32', '2024-09-29 23:57:32'),
(138, 'App\\Models\\User', 15, '-AuthToken', '33ecbe0079bffbc5dc731877253a747a182a73897dc49b1c55549ef245e6c95e', '[\"*\"]', NULL, NULL, '2024-09-30 01:55:23', '2024-09-30 01:55:23'),
(139, 'App\\Models\\User', 7, '-AuthToken', 'c306b4d7fcf133ad6b9b11e14390766d436d03e2e738ed4858f3d5127b0fc6f9', '[\"*\"]', NULL, NULL, '2024-09-30 23:53:09', '2024-09-30 23:53:09'),
(140, 'App\\Models\\User', 7, '-AuthToken', '2dfa93f569e9bbf3f757a3780f6cdf633a9a33c1199c71f5ee388f80677c251c', '[\"*\"]', NULL, NULL, '2024-10-02 23:26:53', '2024-10-02 23:26:53'),
(141, 'App\\Models\\User', 7, '-AuthToken', 'a906b9a4f7d88803286fd404c9270a427a82bc7540e2197902cb38ae90be9076', '[\"*\"]', NULL, NULL, '2024-10-03 00:39:35', '2024-10-03 00:39:35'),
(142, 'App\\Models\\User', 7, '-AuthToken', 'a9e47e1c2153f1965836877042c46bfe01989d7aa6361e9a09609992bbd35d94', '[\"*\"]', NULL, NULL, '2024-10-04 23:53:22', '2024-10-04 23:53:22'),
(143, 'App\\Models\\User', 7, '-AuthToken', '4e4d557f0b59883eb3bff0dbc4b4e1ac388d18f852010107f626b6d5c5f2a906', '[\"*\"]', NULL, NULL, '2024-10-14 01:48:35', '2024-10-14 01:48:35'),
(144, 'App\\Models\\User', 7, '-AuthToken', 'abb7b8b7062cdd7264e0edcac89949b4bb01ca5f71e5f52d0ec307a572929245', '[\"*\"]', NULL, NULL, '2024-10-14 01:48:36', '2024-10-14 01:48:36');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` char(36) NOT NULL,
  `asin` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `wh_price` decimal(20,2) DEFAULT NULL,
  `quantity` bigint(20) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `category_id` char(36) DEFAULT NULL,
  `sub_cat_id` int(11) DEFAULT 0,
  `powered_by` varchar(255) NOT NULL DEFAULT 'Insider Design',
  `created_by` char(36) DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT 0,
  `about` text DEFAULT NULL,
  `featured` varchar(11) DEFAULT 'off'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `asin`, `title`, `price`, `wh_price`, `quantity`, `type`, `description`, `url`, `category_id`, `sub_cat_id`, `powered_by`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`, `country_id`, `about`, `featured`) VALUES
('560b2ca2-a2f4-4f03-901f-1507bf520870', 'GH34234234234', 'Shampo', 50.00, 50.00, 0, NULL, '<p>sdfsdf</p>', NULL, '166', 249, 'Insider Design', NULL, NULL, NULL, '2024-10-03 06:30:22', '2024-10-03 06:30:22', 0, '<p>sdfsdf</p>', 'off'),
('c086a7d1-32db-453d-af26-61122c6b7931', 'dsfsdfsdfsd', 'example', 4343.00, 4343.00, 0, NULL, '<p>dsfsdf</p>', NULL, '166', 249, 'Insider Design', NULL, NULL, NULL, '2024-10-05 06:56:21', '2024-10-05 06:56:21', 0, '<p>dsfsdfsdf</p>', 'off'),
('faff77da-a840-4ea7-92f5-853218519d8a', 'HG23423423', 'Hair Color', NULL, NULL, 0, NULL, '<p>Keratin Healing Oil contains an ultra-healing mix, with Keratin Protein and Phyto IV Complex to heal stressed and damaged hair. This powerful restorative will add shine to your hair while rebuilding it from roots to ends.</p><p><br></p><p>The rich antioxidant content provides natural pollution and UV protection plus softness and shine</p><p><br></p><p>Add a few pumps to your palms and work through damp or dry hair. Blow dry or style as usual. The rich keratin complex prevents moisture loss and hair breakage</p>', NULL, '166', 249, 'Insider Design', NULL, NULL, NULL, '2024-10-05 06:46:52', '2024-10-14 02:40:35', 0, '<p><strong>Product Benefits</strong>The rich antioxidant content provides natural pollution and UV protection plus softness and shine<strong>Hair Type</strong>All<strong>Material Type Free</strong>Sulfate Free<strong>Scent</strong>Natural<strong>Liquid VolumeProduct Benefits</strong>The rich antioxidant content provides natural pollution and UV protection plus softness and shine<strong>Hair Type</strong>All<strong>Material Type Free</strong>Sulfate Free<strong>Scent</strong>Natural<strong>Liquid VolumeProduct Benefits</strong>The rich antioxidant content provides natural pollution and UV protection plus softness and shine<strong>Hair Type</strong>All<strong>Material Type Free</strong>Sulfate Free<strong>Scent</strong>Natural<strong>Liquid VolumeProduct Benefits</strong>The rich antioxidant content provides natural pollution and UV protection plus softness and shine<strong>Hair Type</strong>All<strong>Material Type Free</strong>Sulfate Free<strong>Scent</strong>Natural<strong>Liquid VolumeProduct Benefits</strong>The rich antioxidant content provides natural pollution and UV protection plus softness and shine<strong>Hair Type</strong>All<strong>Material Type Free</strong>Sulfate Free<strong>Scent</strong>Natural<strong>Liquid VolumeProduct Benefits</strong>The rich antioxidant content provides natural pollution and UV protection plus softness and shine<strong>Hair Type</strong>All<strong>Material Type Free</strong>Sulfate Free<strong>Scent</strong>Natural<strong>Liquid VolumeProduct Benefits</strong>The rich antioxidant content provides natural pollution and UV protection plus softness and shine<strong>Hair Type</strong>All<strong>Material Type Free</strong>Sulfate Free<strong>Scent</strong>Natural<strong>Liquid Volume</strong></p>', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` char(36) NOT NULL,
  `attribute_id` char(36) DEFAULT NULL,
  `product_id` char(36) NOT NULL,
  `values` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_discounts`
--

CREATE TABLE `product_discounts` (
  `id` int(11) NOT NULL,
  `product_id` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `discount_percentage` decimal(5,2) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `featured` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `name`, `code`) VALUES
(1, 1, 'Alabama', 'AL'),
(2, 1, 'Alaska', 'AK'),
(3, 1, 'Arizona', 'AZ'),
(4, 1, 'Arkansas', 'AR'),
(5, 1, 'California', 'CA'),
(6, 1, 'Colorado', 'CO'),
(7, 1, 'Connecticut', 'CT'),
(8, 1, 'Delaware', 'DE'),
(9, 1, 'Florida', 'FL'),
(10, 1, 'Georgia', 'GA'),
(11, 1, 'Hawaii', 'HI'),
(12, 1, 'Idaho', 'ID'),
(13, 1, 'Illinois', 'IL'),
(14, 1, 'Indiana', 'IN'),
(15, 1, 'Iowa', 'IA'),
(16, 1, 'Kansas', 'KS'),
(17, 1, 'Kentucky', 'KY'),
(18, 1, 'Louisiana', 'LA'),
(19, 1, 'Maine', 'ME'),
(20, 1, 'Maryland', 'MD'),
(21, 1, 'Massachusetts', 'MA'),
(22, 1, 'Michigan', 'MI'),
(23, 1, 'Minnesota', 'MN'),
(24, 1, 'Mississippi', 'MS'),
(25, 1, 'Missouri', 'MO'),
(26, 1, 'Montana', 'MT'),
(27, 1, 'Nebraska', 'NE'),
(28, 1, 'Nevada', 'NV'),
(29, 1, 'New Hampshire', 'NH'),
(30, 1, 'New Jersey', 'NJ'),
(31, 1, 'New Mexico', 'NM'),
(32, 1, 'New York', 'NY'),
(33, 1, 'North Carolina', 'NC'),
(34, 1, 'North Dakota', 'ND'),
(35, 1, 'Ohio', 'OH'),
(36, 1, 'Oklahoma', 'OK'),
(37, 1, 'Oregon', 'OR'),
(38, 1, 'Pennsylvania', 'PA'),
(39, 1, 'Rhode Island', 'RI'),
(40, 1, 'South Carolina', 'SC'),
(41, 1, 'South Dakota', 'SD'),
(42, 1, 'Tennessee', 'TN'),
(43, 1, 'Texas', 'TX'),
(44, 1, 'Utah', 'UT'),
(45, 1, 'Vermont', 'VT'),
(46, 1, 'Virginia', 'VA'),
(47, 1, 'Washington', 'WA'),
(48, 1, 'West Virginia', 'WV'),
(49, 1, 'Wisconsin', 'WI'),
(50, 1, 'Wyoming', 'WY');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` char(36) NOT NULL,
  `stock_name` varchar(100) NOT NULL,
  `country_id` int(11) DEFAULT 0,
  `state_id` int(11) DEFAULT 0,
  `city_id` int(11) DEFAULT 0,
  `address` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `stock_name`, `country_id`, `state_id`, `city_id`, `address`, `created_at`, `updated_at`) VALUES
('29975e7f-06f7-46de-895b-0825381b61e8', 'ST-5000', 1, 37, 73, 'Wyomings', '2024-09-28 05:25:28', '2024-09-28 06:00:35'),
('ca22177e-d5d6-4528-b3ad-06f5b1f50182', 'Home', 1, 31, 66, 'Footer', '2024-09-28 23:51:47', '2024-09-28 23:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `stock_products`
--

CREATE TABLE `stock_products` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` decimal(36,0) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_products`
--

INSERT INTO `stock_products` (`id`, `stock_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
('3bf9cb7a-f131-4392-ae5f-54ed8a53a9eb', 'ca22177e-d5d6-4528-b3ad-06f5b1f50182', 'faff77da-a840-4ea7-92f5-853218519d8a', 43, '2024-10-14 01:53:50', '2024-10-14 01:53:50'),
('ef713f89-dbf7-46aa-a411-c52109393e79', '29975e7f-06f7-46de-895b-0825381b61e8', '560b2ca2-a2f4-4f03-901f-1507bf520870', 5000, '2024-10-05 00:13:49', '2024-10-05 00:13:49');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_product` varchar(255) NOT NULL,
  `stripe_price` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_customer` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `team` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favorites` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `user_name`, `email`, `email_verified_at`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`, `is_customer`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`, `team`, `favorites`, `address`, `phone`) VALUES
(6, 'sdasd', NULL, NULL, 'romarzheyan@gmail.com', NULL, '$2y$10$Me/zhgT/5zFvBz7FrhIp1.q2wVxl76Id4rgW/0mybTuZEu3x0D36e', NULL, NULL, '2023-11-26 01:16:39', '2023-11-26 01:16:39', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'karim', NULL, NULL, 'admin@gmail.com', NULL, '$2y$10$vndn4VejN/g5Dq.hff6FVO6TS1R97keMB4QnNu6lR94.SBW7YfR4G', NULL, NULL, '2023-11-26 05:49:54', '2023-11-26 05:49:54', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'karim', NULL, NULL, 'karim1@gmail.com', NULL, '$2y$10$Me/zhgT/5zFvBz7FrhIp1.q2wVxl76Id4rgW/0mybTuZEu3x0D36e', NULL, NULL, '2023-11-26 23:16:18', '2023-11-26 23:16:18', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'tamim', NULL, NULL, 'tamim@gmail.com', NULL, '$2y$10$Me/zhgT/5zFvBz7FrhIp1.q2wVxl76Id4rgW/0mybTuZEu3x0D36e', NULL, NULL, '2023-12-28 13:55:07', '2023-12-28 13:55:07', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Ramin Azizi', NULL, NULL, 'ramine.azizi1122@gmail.com', NULL, '$2y$10$Me/zhgT/5zFvBz7FrhIp1.q2wVxl76Id4rgW/0mybTuZEu3x0D36e', NULL, NULL, '2023-12-29 08:33:33', '2023-12-29 08:33:33', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'tahir', 'Khan', NULL, 'tahir@gmail.com', NULL, '$2y$10$0hvB9OCWgDLQWQV3eZT.6OaGBebZgjynQ86pwt.483EgN0rwnB/OO', NULL, NULL, '2024-07-28 00:30:05', '2024-09-30 02:18:51', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Basit khans', 'Khan', 'basit', 'basit@gmail.com', NULL, '$2y$10$wQYQH1HIL1ZjhHnWQAloDOpnPPzsxd3MNgzqqRTFZc0gbALfAc4h2', NULL, NULL, '2024-08-23 23:41:23', '2024-09-07 03:35:03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'United State', '+93789647997'),
(17, 'tahirkhan', 'khan', NULL, 'tahirkhan@gmail.com', NULL, '$2y$10$vndn4VejN/g5Dq.hff6FVO6TS1R97keMB4QnNu6lR94.SBW7YfR4G', NULL, NULL, '2024-09-29 07:05:21', '2024-09-29 07:06:56', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'ferdows', NULL, NULL, 'ferdows@gmail.com', NULL, '$2y$10$Pti5b2g.PmJLCoSf0g0vNeqPtj05Tj2yTH9nRZq3Sl8z5KmnhrBqC', NULL, NULL, '2024-09-29 23:39:11', '2024-09-29 23:39:11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'abc', NULL, NULL, 'abc@gmail.com', NULL, '$2y$10$V/6oW6pqQ.4gu9q1/vw7Q.mAn.Yqc4Tu7UQsGZn43sCnl.mhlRnS6', NULL, NULL, '2024-09-29 23:48:28', '2024-09-29 23:48:28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'shams', NULL, NULL, 'shams@gmail.com', NULL, '$2y$10$StrU0g/21MiNLq.odXYN0Oc7JLPRAdLQyvZVmSVr2PyWrAq8CXLZS', NULL, NULL, '2024-09-29 23:50:10', '2024-09-29 23:50:10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'mansor', NULL, NULL, 'mansor@gmail.com', NULL, '$2y$10$Fvge9GBOYDxhVDnp/ativeJ7yI.enSPzwegkWyn7Me7Y.0s51Grky', NULL, NULL, '2024-09-29 23:52:25', '2024-09-29 23:52:25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'qais', 'Khan', NULL, 'qais@gmail.com', NULL, '$2y$10$UsStw0WliSEclLdi.FUtPuF7k3k7XdYoxZvrdVhQnDfwgKDBl1rIK', NULL, NULL, '2024-09-30 00:03:57', '2024-09-30 00:09:07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'sdfsdfsdf', '231231231'),
(23, 'basir', NULL, NULL, 'basir@gmail.com', NULL, '$2y$10$QxQ7fWjMZv/b98jCkyMh7.IF/zeYkOf6bPHNwVOtOr51o9pOUNtli', NULL, NULL, '2024-10-05 01:07:57', '2024-10-05 01:07:57', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'example', NULL, NULL, 'example@gmail.com', NULL, '$2y$10$KhrLJ.KpDF3RoJlAkYVl4OuzDmqtuFlUVNFY3OpfB2xgoPhX6HVXS', NULL, NULL, '2024-10-05 06:45:17', '2024-10-05 06:45:17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_files`
--
ALTER TABLE `app_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attributes_category_id_foreign` (`category_id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `billing_infos`
--
ALTER TABLE `billing_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`customer_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_created_by_foreign` (`created_by`),
  ADD KEY `products_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_attribute_id_foreign` (`attribute_id`),
  ADD KEY `product_attributes_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_discounts`
--
ALTER TABLE `product_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_products`
--
ALTER TABLE `stock_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_files`
--
ALTER TABLE `app_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=988;

--
-- AUTO_INCREMENT for table `billing_infos`
--
ALTER TABLE `billing_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `product_discounts`
--
ALTER TABLE `product_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
