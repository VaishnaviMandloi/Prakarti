-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2023 at 03:57 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prakarti`
--

-- --------------------------------------------------------

--
-- Table structure for table `accpted`
--

CREATE TABLE `accpted` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `f_appoinment` varchar(50) DEFAULT NULL,
  `slot` varchar(50) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `doctor` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `date2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accpted`
--

INSERT INTO `accpted` (`id`, `name`, `email`, `f_appoinment`, `slot`, `service`, `doctor`, `date`, `date2`) VALUES
(52, 'divyani', 'sudha@outlook.com', 'Further Consultation', 'Afternoon slot', 'Triple', 'Dr. Divyani Mandloi', '2023-03-31', '2023-03-27'),
(53, 'vasudha', 'sudha@outlook.com', 'First Consultation', 'Afternoon slot', 'Triple', 'Dr. Vicky Chodhary', '2023-04-19', '2023-04-27'),
(54, 'divyani', 'sudha@outlook.com', 'Further Consultation', 'Afternoon slot', 'Triple', 'Dr. Divyani Mandloi', '2023-03-31', '2023-03-27'),
(55, 'sudha', 'sudha@outlook.com', 'First Consultation', 'Afternoon slot', 'Triple', 'Dr. Divyani Mandloi', '2023-03-30', '2023-03-30'),
(56, 'vasudha', 'sudha@outlook.com', 'First Consultation', 'Afternoon slot', 'Triple', 'Dr. Vicky Chodhary', '2023-04-19', '2023-04-27'),
(57, 'vanshita', 'joshi@gmail.com', 'First Consultation', 'Afternoon slot', 'Triple', 'Dr. Vicky Chodhary', '2023-04-26', '2023-05-06'),
(58, 'Kamal', 'sudha@outlook.com', 'Further Consultation', 'Afternoon slot', 'Other', 'Dr. Vicky Chodhary', '2023-04-28', '2023-04-29');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'vaishnavi', '123'),
(2, 'divyani', '123');

-- --------------------------------------------------------

--
-- Table structure for table `appoinment`
--

CREATE TABLE `appoinment` (
  `id` int(11) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `first_appoinment` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `slot` varchar(50) DEFAULT NULL,
  `service_type` varchar(50) DEFAULT NULL,
  `doctor` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `date2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appoinment`
--

INSERT INTO `appoinment` (`id`, `Title`, `first_name`, `last_name`, `email`, `first_appoinment`, `phone`, `slot`, `service_type`, `doctor`, `date`, `date2`) VALUES
(90, 'Prof.', 'Kamal', 'Sinha', 'sudha@outlook.com', 'Further Consultation', '08345678456', 'evening slot', 'Quad', 'Dr. Divyani Mandloi', '2023-04-17', '2023-04-25');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(9, 'Ashtang'),
(10, 'Baidyanath'),
(5, 'Dabar'),
(7, 'Dhootapapeshwar'),
(4, 'Himalaya'),
(1, 'kotakal'),
(11, 'neuherbs'),
(8, 'Zandu');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'capsule'),
(4, 'Juice'),
(5, 'paste'),
(2, 'powder'),
(3, 'Tablet');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` varchar(100) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `email`, `phone`, `id`) VALUES
('digpal singh', 'digpal@gmail.com', '9534567892', 26),
('mahipal singh', 'mahipal@gmail.com', '8334567892', 28),
('sudha satnayak', 'sudha@outlook.com', '9634567895', 29),
('vasudha satyanayak', 'vasudha@outlook.com', '9034567895', 40),
('divyani mandloi', 'divyani@outlook.com', '8534567895', 45),
('vanshita joshi', 'joshi@gmail.com', '894566092', 46),
('vanshita joshi', 'joshi@gmail.com', '894566092', 47),
('vanshita joshi', 'joshi@gmail.com', '894566092', 48),
('vanshita joshi', 'joshi@gmail.com', '894566092', 49),
('vasudha satyanayak', 'sudha@outlook.com', '08345678456', 50),
('vasudha satyanayak', 'sudha@outlook.com', '08345678456', 51),
('vanshita joshi', 'joshi@gmail.com', '894566092', 52),
('vanshita joshi', 'joshi@gmail.com', '894566092', 53),
('vanshita joshi', 'joshi@gmail.com', '894566092', 54),
('vanshita joshi', 'joshi@gmail.com', '894566092', 55),
('vanshita joshi', 'joshi@gmail.com', '894566092', 56),
('vanshita joshi', 'joshi@gmail.com', '894566092', 57),
('vanshita joshi', 'joshi@gmail.com', '894566092', 58);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `price` float NOT NULL,
  `discount` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL,
  `flavours` text NOT NULL,
  `desc` text NOT NULL,
  `pub_date` datetime NOT NULL DEFAULT current_timestamp(),
  `category_id` int(11) NOT NULL,
  `category` varchar(30) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `image_1` varchar(150) NOT NULL DEFAULT 'image1.jpg',
  `image_2` varchar(150) NOT NULL DEFAULT 'image2.jpg',
  `image_3` varchar(150) NOT NULL DEFAULT 'image3.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `discount`, `stock`, `flavours`, `desc`, `pub_date`, `category_id`, `category`, `brand_id`, `brand`, `image_1`, `image_2`, `image_3`) VALUES
(1, 'Chyavanaprasam', 230, 0, 100, 'fix-fruit , amla', 'Usage : As directed by the physician\r\nDosage : 10 to 15 g for adult and 5 to 10 g for children or as directed by the Physician\r\nIndication : Deficient immune disorders, respiratory ailments, debilitating diseases, disorders of urinary bladder, hoarseness of voice, poor memory & intelligence -Rasayana & prophylactic medicine in cardio-pulmonary ailments & neoplasms', '2023-04-16 08:05:58', 1, '', 1, '', '034509c1010de1562326.jpg', '0a7eb50ed610abbe2748.jpg', '152ae644a2515474db58.jpg'),
(2, 'Chyavanaprasam', 400, 10, 100, 'mix-fruit , amla', 'About the Product\r\nChyavanaprasha is a classic recipe with authenticate herbs that promote wellness naturally. It is a combination of five tastes including sweet, sour, bitter, pungent and astringent.Chyavanaprasha can be consumed in all seasons, as it contains ingredients, which are weather friendly, nullifying the unpleasant effects due to extreme environmental and climactic conditions.\r\nHow to Use\r\nFor best results, consume half-an-hour after dinner followed by warm water/ milk.\r\nBenefits\r\nChyavanaprasha is made in an Amalaki (Indian gooseberry base), which is the richest source of Vitamin C and antioxidants.', '2023-04-16 08:20:46', 1, '', 4, '', '497d81b1dbf2b1fcb2ee.jpg', '2e8bc4eab6c6c912abf0.jpg', '21145f35054dd972016d.jpg'),
(3, 'chamanprash', 113.85, 5, 100, 'mix-fruit , amla', 'Dabur Chyawanprash is an immune booster, derived from a proven Ayurvedic formula that is more than 2,500 years old. Made from over 45 trusted Ayurvedic ingredients, it is safe to use as a nutrition supplement.\r\n\r\nChyawanprash is an ancient Ayurveda formulation that is used to boost immunity and longevity. The main ingredient is Amla (Indian Gooseberry). It is not only a powerful antioxidant but is also very rich in Vitamin C and minerals such as calcium, phosphorus, iron, carotene and Vitamin B Complex.\r\n\r\nBenefits\r\nDabur Chyawanprash is known to stimulate the body’s immunity against everyday infections like cough, cold and infections caused by seasonal weather changes.\r\nIt increases energy and supports overall well-being.\r\nIt provides digestive support.\r\nIt is packed with strong antioxidant properties.\r\nIngredients\r\nAmla\r\nAshwagandha\r\nHareetaki\r\nDashmul\r\nGhrit\r\nSeveral other herbs and herbal extracts.\r\nHow to Use\r\nWith its tangy sweet-sour taste it can be taken directly or with milk.\r\nWe recommend taking 1/2 tsp for children and 1 tsp for adults, twice daily followed by warm milk or water.\r\nSafety Information\r\nRead the label carefully before use.\r\nDo not exceed the recommended dose.\r\nKeep it out of the reach and sight of children.\r\nContents mentioned here are only for information purposes.\r\nIt is always advisable to consult the physician/doctor.', '2023-04-16 09:00:22', 1, '', 5, '', '986b12eb0e6fb68c0f28.png', 'd24bf47814e9bea86476.png', '027911ad0780b8d9c286.png'),
(5, 'Nishamalaki', 266, 5, 30, 'none', 'Product highlights\r\nIt helps to improve digestion and gut health of the body\r\nIt aids in maintaining the overall health of the liver\r\nIt helps to improve overall health and well-being of the body\r\nDhootapapeshwar Nishamalaki is a health tonic that helps to regulate blood sugar levels. It helps to maintain proper digestion and keeps the skin healthy. It has anti-ageing properties that help to slow down the ageing process. It boosts immunity and improves the wellbeing of the body.\r\nKey Ingredients:\r\nNishamalaki\r\nKey Benefits:\r\nIt helps to improve digestion and gut health of the body\r\nIt aids in maintaining the overall health of the liver\r\nIt has anti-inflammatory properties that help to reduce inflammation in the body\r\nIt helps to improve overall health and well-being of the body\r\nDirection For Use:\r\nUse as directed by the physician.\r\nSafety Information:\r\nStore in a cool and dry place\r\nKeep away from direct sunlight', '2023-04-16 19:12:39', 4, '', 7, '', '416f36491e92fa00f88d.jpg', '5d95a07266d3cc861cc0.jpg', '44e23969b0fccdb10b1e.jpg'),
(6, 'Karela Jamun + 3 Herbs Health Juice (1L)', 325, 26, 100, 'jamun , neem', 'Zandu is introducing a range of healthy juices that not only helps you stay disease-free but is also tasty!\r\nKarela (bitter gourd) and Jamun are widely used in blood sugar regulation. Zandu Karela Jamun + 3 Herbs Health Juice is enriched with Karela, Jamun, Methi, Neem and Tvak. Hence, this juice effectively reduces high blood glucose levels and helps in blood purification. It also boosts appetite. These juices are natural and safe and do not contain added sugar, synthetic colours or flavours.\r\n\r\nHow to Use\r\nShake the bottle well before use. Take 30ml (3 tablespoons) juice. Mix it in a glass of water and consume 1-2 times a day before meals or as directed by physician.', '2023-04-16 19:23:04', 4, '', 8, '', 'f743d02fbdccbc5772d4.png', '2a7e93250910f34f7b18.png', 'ca81b151f0e87d1d1c93.png'),
(7, 'Ashtang Methi Mix 100 Grams', 110, 0, 11, 'none', 'Indications / Benefits of Methi Mix :\r\nThe whole spices are dry roasted on special iron so that their medical properties are enhance and then powdered together in formulated proportion. The unique formulation helps in digestion, weight loss, cholesterol reduction and calm sleep.\r\nSuggested Dosage / How to Use Methi Mix :\r\nPowder should be mixed with luke warm water and have daily at night.\r\n\r\nMethi Dana	Fenugreek Seeds	50 gm\r\nAjwain	Carrom Seeds	20 gm\r\nKala Jeera	Black Cumin Seeds	10 gm', '2023-04-16 19:29:19', 2, '', 9, '', '274937c8de77115168bf.jpg', '8a37e92f51615ce939f0.jpg', 'ee0501f654a7a669999f.jpg'),
(8, 'Baidyanath-Amla-Juice', 235, 15, 33, 'pure-amla , alovera-amla , wild-amla , carrot-amla', 'Improves digestion, takes care of acidity, indigestion and gases\r\nRich in Vitamin C, A and B6 , Minerals like Copper, Phosphorus, Iron and Calcium serves as power house of daily nourishment\r\nHelps to improve eyesight and enriches hair growth, keeps them long and strong\r\nIt helps to boost immunity and prevents infections\r\nBalances all the processes in the body and brings equilibrium all three doshas Vata, Pitta and Kapha', '2023-04-16 19:35:32', 4, '', 10, '', 'a00bc627d279eb63d02a.jpg', '7d1f06bf5f0982127419.jpg', '3b26e3771db5cd669f2e.jpg'),
(9, 'Triphala Powder', 249, 24, 44, 'none', 'neuherbs brings to you pure, natural & organic Triphala Powder made from plants and fruit containing medicinal properties to boost your immunity & gut health naturally & in an Ayurvedic way. Triphala Churna powder has been in use since ancient times for its most recognized health advantages like supporting digestive health, maintaining the gut microbiome, and helping ease digestive problems like constipation, indigestion, gas, and more. Also, Triphala powder benefits you by its antioxidant, anti-inflammatory & antimicrobial properties, which may help boost immunity & remove toxins from the body, due to which it may also help with weight management. neuherbs Organic Triphala Powder can be an important part of your daily diet to bring a good change in your gut health & immunity without any added preservatives, colours & fragrances.', '2023-04-16 19:42:14', 2, '', 11, '', 'f36788870e5edf3c9d6f.png', 'bbe173fe4f233d5aaedd.png', '877ce31a457193c95eed.png'),
(10, 'Baidyanath Nagpur Arjun Ghanbati', 125, 15, 70, 'none', 'Arjun Ghan tablet is fortified with Arjuna bark (Terminalia arjuna)- an ancient cardiovascular drug that provides beneficial effects on the heart and also has potent antioxidant properties\r\n\r\n\r\nIngredients :\r\n\r\nEach capsule contains 250 mg dried extract of Arjuna (Terminalia arjuna)\r\n\r\n How To Use: One capsule twice a day morning and evening', '2023-04-17 05:27:48', 1, '', 10, '', '1f1e5315d30d3b0e415d.jpg', '20813410231e0e673f55.png', 'fff46f64d42615dddbc2.png');

-- --------------------------------------------------------

--
-- Table structure for table `reject`
--

CREATE TABLE `reject` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `f_appoinment` varchar(50) DEFAULT NULL,
  `slot` varchar(50) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `doctor` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `date2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reject`
--

INSERT INTO `reject` (`id`, `name`, `email`, `f_appoinment`, `slot`, `service`, `doctor`, `date`, `date2`) VALUES
(23, 'divyani', 'digpal@gmail.com', 'Further Consultation', 'Afternoon slot', 'Single', 'Dr. Divyani Mandloi', '2023-03-30', '2023-03-23');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `name`, `email`, `password`) VALUES
(3, 'vaishnavi Mandloi', 'vaish@gmail.com', '123'),
(4, 'Devanshi Mandloi', 'devanshi@gmail.com', '123'),
(5, 'Devi Shukla', 'devi@gmail.com', '123'),
(6, 'Devyani Tomar', 'devyani@gmail.com', '123'),
(7, 'anita tomar', 'anita@yahoo.com', '123'),
(12, 'digpal singh', 'digpal@gmail.com', '123'),
(13, 'sudha satyanayak', 'sudha@outlook.com', '123'),
(14, 'vanshita joshi', 'joshi@gmail.com', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accpted`
--
ALTER TABLE `accpted`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appoinment`
--
ALTER TABLE `appoinment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_brand` (`brand_id`),
  ADD KEY `Fk_category` (`category_id`);

--
-- Indexes for table `reject`
--
ALTER TABLE `reject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accpted`
--
ALTER TABLE `accpted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appoinment`
--
ALTER TABLE `appoinment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reject`
--
ALTER TABLE `reject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Fk_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `Fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
