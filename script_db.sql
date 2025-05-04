-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2025 at 12:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitalmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `datebooking` date NOT NULL,
  `dateofbirth` date NOT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `major_id` bigint(20) DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `time_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `fullname` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `denyreason` varchar(255) DEFAULT NULL,
  `gmail` varchar(255) NOT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `note` varchar(255) NOT NULL,
  `phonenumber` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `status` enum('PENDING','CONFIRMING','ACCEPTING','DENYING','SUCCESS','FAILURE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`datebooking`, `dateofbirth`, `createddate`, `id`, `major_id`, `modifieddate`, `time_id`, `user_id`, `fullname`, `address`, `createdby`, `denyreason`, `gmail`, `modifiedby`, `note`, `phonenumber`, `token`, `status`) VALUES
('2025-05-02', '2025-04-16', '2025-05-02 01:06:04.000000', 1, 3, NULL, 6, 13, 'Đỗ THị A', 'hà nội', NULL, NULL, 'kimhiendothi1405@gmail.com', NULL, '- Sâu răng', '0978673232', NULL, 'SUCCESS'),
('2025-05-03', '2025-05-08', '2025-05-02 10:28:45.000000', 2, 3, NULL, 3, 13, 'Nguyễn Thị A', 'hà nội', NULL, NULL, 'kimhiendothi1405+1@gmail.com', NULL, '- Làm răng giả', '0978673232', NULL, 'ACCEPTING');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `createddate` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `gmail` varchar(255) NOT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `note` varchar(255) NOT NULL,
  `vocative` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dailybooking`
--

CREATE TABLE `dailybooking` (
  `count` int(11) NOT NULL,
  `date` date NOT NULL,
  `doctor_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `time_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dailybooking`
--

INSERT INTO `dailybooking` (`count`, `date`, `doctor_id`, `id`, `time_id`) VALUES
(1, '2025-05-02', 13, 1, 6),
(1, '2025-05-03', 13, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `createddate` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `idimage` varchar(64) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `shortdescription` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`createddate`, `id`, `modifieddate`, `idimage`, `createdby`, `description`, `image`, `modifiedby`, `name`, `shortdescription`) VALUES
('2025-05-01 21:30:57.000000', 1, NULL, 'y5rskaubmh0q7vjcm1mo', NULL, 'Khoa Gan Mật chuyên điều trị các bệnh lý như viêm gan virus (A, B, C), xơ gan, gan nhiễm mỡ.', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746110323/y5rskaubmh0q7vjcm1mo.png', NULL, 'Khoa Gan Mật', 'Chẩn đoán và điều trị các bệnh về gan và hệ thống mật.'),
('2025-05-01 21:32:10.000000', 2, NULL, 'pucbc3bo97skqlvh3ypr', NULL, 'Đội ngũ y bác sĩ có chuyên môn cao kết hợp trang thiết bị hiện đại giúp nâng cao tỷ lệ thành công cho các cặp vợ chồng hiếm muộn.', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746109929/pucbc3bo97skqlvh3ypr.png', NULL, 'Khoa Hỗ Trợ Sinh Sản', 'Hỗ trợ chẩn đoán và điều trị vô sinh – hiếm muộn.'),
('2025-05-01 21:32:50.000000', 3, NULL, 'gdutsdp25gmfopnnt2le', NULL, 'Khoa cung cấp dịch vụ khám, điều trị các bệnh về sâu răng, viêm lợi, chỉnh nha, phục hình răng, nhổ răng khôn, phẫu thuật hàm mặt, và nha khoa thẩm mỹ. Cơ sở vật chất hiện đại, vô trùng và thân thiện với bệnh nhân.', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746109969/gdutsdp25gmfopnnt2le.png', NULL, 'Khoa Răng Hàm Mặt', 'Điều trị các bệnh lý răng miệng và hàm mặt.'),
('2025-05-01 21:33:25.000000', 4, NULL, 'ls2yxnozdamxiimxkwig', NULL, 'Khoa Tiêu Hóa chuyên tiếp nhận và điều trị các bệnh như viêm loét dạ dày – tá tràng, trào ngược dạ dày thực quản, viêm đại tràng, hội chứng ruột kích thích, bệnh lý gan mật tụy. Khoa thực hiện nội soi chẩn đoán và can thiệp tiêu hóa với thiết bị hiện đại.', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746110004/ls2yxnozdamxiimxkwig.png', NULL, 'Khoa Tiêu Hóa', 'Khám và điều trị các bệnh lý đường tiêu hóa.'),
('2025-05-01 21:33:53.000000', 5, NULL, 'wf9qxltzhqqrfkzwdd9d', NULL, 'Ứng dụng kỹ thuật điện tim đồ, siêu âm tim, can thiệp mạch vành và đặt stent.', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746110032/wf9qxltzhqqrfkzwdd9d.png', NULL, 'Khoa Tim Mạch', 'Điều trị bệnh lý tim và mạch máu.'),
('2025-05-01 21:36:15.000000', 6, NULL, 'ritjdwvjpfpjbzzobdfz', NULL, 'Trung tâm Mắt Công Nghệ Cao sử dụng các phương pháp tiên tiến như phẫu thuật Phaco, lasik điều trị tật khúc xạ, OCT võng mạc, điều trị đục thủy tinh thể, glôcôm, thoái hóa hoàng điểm… Cung cấp dịch vụ chuyên sâu, chất lượng cao, đảm bảo an toàn và hiệu quả thị lực.\n\n', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746110175/ritjdwvjpfpjbzzobdfz.png', NULL, 'Trung Tâm Mắt Công Nghệ Cao', 'Điều trị các bệnh mắt bằng công nghệ hiện đại.'),
('2025-05-01 21:37:27.000000', 7, NULL, 'd8rtegieezeeym0ppzgn', NULL, 'Khoa chuyên điều trị gãy xương, trật khớp, chấn thương thể thao, thoát vị đĩa đệm', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746110247/d8rtegieezeeym0ppzgn.png', NULL, 'Khoa Chấn Thương Chỉnh Hình', 'Điều trị các chấn thương và bệnh lý về xương khớp.');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `createddate` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `name` varchar(10) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`createddate`, `id`, `modifieddate`, `name`, `createdby`, `modifiedby`) VALUES
('2025-04-24 02:18:56.000000', 1, '2025-04-24 02:18:56.000000', 'admin', NULL, NULL),
('2025-04-24 02:18:56.000000', 2, '2025-04-24 02:18:56.000000', 'doctor', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

CREATE TABLE `time` (
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time`
--

INSERT INTO `time` (`end`, `start`, `createddate`, `id`, `modifieddate`, `createdby`, `modifiedby`) VALUES
(9, 8, '2025-05-02 01:04:49.000000', 1, '2025-05-02 01:04:49.000000', NULL, NULL),
(10, 9, '2025-05-02 01:04:49.000000', 2, '2025-05-02 01:04:49.000000', NULL, NULL),
(11, 10, '2025-05-02 01:04:49.000000', 3, '2025-05-02 01:04:49.000000', NULL, NULL),
(12, 11, '2025-05-02 01:04:49.000000', 4, '2025-05-02 01:04:49.000000', NULL, NULL),
(14, 13, '2025-05-02 01:04:49.000000', 5, '2025-05-02 01:04:49.000000', NULL, NULL),
(15, 14, '2025-05-02 01:04:49.000000', 6, '2025-05-02 01:04:49.000000', NULL, NULL),
(16, 15, '2025-05-02 01:04:49.000000', 7, '2025-05-02 01:04:49.000000', NULL, NULL),
(17, 16, '2025-05-02 01:04:49.000000', 8, '2025-05-02 01:04:49.000000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `certification` int(11) DEFAULT NULL,
  `dateofbirth` date NOT NULL,
  `deletedyear` int(11) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `major_id` bigint(20) DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `degree` varchar(10) DEFAULT NULL,
  `identity` varchar(12) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `ethnicity` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `idimage` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`certification`, `dateofbirth`, `deletedyear`, `experience`, `status`, `createddate`, `id`, `major_id`, `modifieddate`, `role_id`, `degree`, `identity`, `phonenumber`, `ethnicity`, `name`, `idimage`, `address`, `avatar`, `createdby`, `description`, `gender`, `gmail`, `modifiedby`, `password`, `username`) VALUES
(NULL, '1980-05-12', NULL, NULL, 1, '2025-04-24 02:18:57.000000', 1, NULL, '2025-04-24 02:18:57.000000', 1, NULL, '', '0900000001', '', 'KH admin', NULL, 'Hanoi', 'https://res.cloudinary.com/dnrowyoq8/image/upload/v1746093332/szixt6cskiufeljdpadh.png', NULL, NULL, 'M', 'admin@gmail.com', NULL, '$2a$12$vdcX04KPDEQpyFQZbFoZXORGiETTRoW5Efxi4bojD8Zbflmr25wEG', 'admin'),
(3, '1977-05-12', NULL, 5, 1, '2025-05-01 21:47:14.000000', 11, 1, NULL, 2, 'BSCK', '001203001218', '0978673232', 'Kinh', 'Đỗ Kim A', 'msv84hi1nlxcx0ahz4fe', 'hà nội', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746117968/msv84hi1nlxcx0ahz4fe.jpg', NULL, '- Ko có gì thật!!!', 'Nam', 'dokima@gmail.com', NULL, '$2a$10$7UYJ2Atx.r.JjtEvixXauerdYt31RAm4B9/7fabc2ri80VVUAM/gC', 'dokima'),
(3, '2025-05-13', NULL, 5, 1, '2025-05-01 21:49:33.000000', 12, 2, NULL, 2, 'BSCK', '001203001218', '0978673232', 'Kinh', 'Đỗ Kim B', 'uhxt6p3nn6mu0acwhc2n', 'hà nội', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746110972/uhxt6p3nn6mu0acwhc2n.jpg', NULL, '- Ko có gì', 'Nữ', 'dokimb@gmail.om', NULL, '$2a$10$M.94e3oV8oq7NTDH2RaZGOFJAtZ.uV7vS/jXvuVMVPkbSYBC9bRvy', 'dokimb'),
(3, '2025-05-21', NULL, 5, 1, '2025-05-01 21:51:22.000000', 13, 3, NULL, 2, 'GS', '001203001218', '0978673232', 'Kinh', 'Đỗ Kim C', 'da94wisr5t2d1rdblsdd', 'hà nội', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746111081/da94wisr5t2d1rdblsdd.jpg', NULL, '- Nhiều năm kinh nghiệm', 'Nam', 'dokimc@gmail.com', NULL, '$2a$10$qIcKRuEN0l/VU8DykhM.C.0zAXpgMJh9mOPGtCFUYBBKRm1WF/om6', 'dokimc'),
(3, '2025-05-21', NULL, 5, 1, '2025-05-01 21:53:02.000000', 14, 4, NULL, 2, 'BS', '001203001218', '0978673232', 'Kinh', 'Đỗ Kim D', 'onjuts8vauqk9mbr4awb', 'hà nội', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746111181/onjuts8vauqk9mbr4awb.png', NULL, '- Nhiều năm kinh nghiệm', 'Nam', 'dokimd@gmail.com', NULL, '$2a$10$G7lo.Yeq0xaMxRm4Blq7y.oD05oxtQtSFQL5OuW1sxVi98NdYZFAS', 'dokimd'),
(3, '2025-05-21', NULL, 5, 1, '2025-05-01 21:53:27.000000', 15, 5, NULL, 2, 'Ths', '001203001218', '0978673232', 'Kinh', 'Đỗ Kim E', 'zvhbf8jmvzpluj3uyrsa', 'hà nội', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746111206/zvhbf8jmvzpluj3uyrsa.jpg', NULL, '- Nhiều năm kinh nghiệm', 'Nam', 'dokime@gmail.com', NULL, '$2a$10$WxZA2oWoEboVF5QZoGtPVuRhbedSEUUYCCiVviBIkKVrkLyR6RCfq', 'dokime'),
(3, '2025-05-21', NULL, 5, 1, '2025-05-01 21:54:08.000000', 16, 6, NULL, 2, 'TS', '001203001218', '0978673232', 'Kinh', 'Đỗ Kim F', 'jczfhyyaefgtstxvelyu', 'hà nội', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746111247/jczfhyyaefgtstxvelyu.jpg', NULL, '- Nhiều năm kinh nghiệm', 'Nữ', 'dokimf@gmail.com', NULL, '$2a$10$LzPZEM0l8eGOZAEI47Kmu.Xh3K/d/iR8viaZ14StZGggJ6vz8arWy', 'dokimf'),
(10, '2025-05-21', NULL, 10, 1, '2025-05-01 21:55:04.000000', 17, 7, NULL, 2, 'PGS', '001203001218', '0978673232', 'Kinh', 'Đỗ Kim G', 'vrmph4sou33fjkvzchpc', 'hà nội', 'http://res.cloudinary.com/dnrowyoq8/image/upload/v1746111302/vrmph4sou33fjkvzchpc.png', NULL, '- Nhiều năm kinh nghiệm', 'Nữ', 'dokimg@gmail.com', NULL, '$2a$10$SYoruVFQr6ZX9AYn2hWVougwqIEVL9kE9ySGZ6kHRHbCLVFqwi2fW', 'dokimg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK13agieknd19mbcxgcj9d8fpi3` (`time_id`),
  ADD KEY `FKkgseyy7t56x7lkjgu3wah5s3t` (`user_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKe07k4jcfdophemi6j1lt84b61` (`user_id`);

--
-- Indexes for table `dailybooking`
--
ALTER TABLE `dailybooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_oi0ctjbjvktdcfxws9w2exiwb` (`name`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  ADD KEY `FKc1q9juawhjvqie7wi3p44me9y` (`major_id`),
  ADD KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dailybooking`
--
ALTER TABLE `dailybooking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `major`
--
ALTER TABLE `major`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `time`
--
ALTER TABLE `time`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK13agieknd19mbcxgcj9d8fpi3` FOREIGN KEY (`time_id`) REFERENCES `time` (`id`),
  ADD CONSTRAINT `FKkgseyy7t56x7lkjgu3wah5s3t` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FKe07k4jcfdophemi6j1lt84b61` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKc1q9juawhjvqie7wi3p44me9y` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  ADD CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
