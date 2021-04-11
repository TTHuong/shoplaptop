-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 11, 2021 lúc 06:17 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopping`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2017-01-24 16:21:18', '21-06-2018 08:27:55 PM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(7, 'ASUS', '', '2021-04-10 15:48:18', NULL),
(8, 'HP', '', '2021-04-10 15:48:23', NULL),
(9, 'ACER', '', '2021-04-10 15:48:34', NULL),
(10, 'DELL', '', '2021-04-10 15:48:39', NULL),
(11, 'LENOVO', '', '2021-04-10 15:48:47', NULL),
(12, 'MSI', '', '2021-04-10 15:48:51', NULL),
(13, 'APPLE', '', '2021-04-10 15:48:58', NULL),
(14, 'LG', '', '2021-04-10 15:49:02', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2017-03-07 19:32:57', 'COD', NULL),
(3, 1, '4', 1, '2017-03-10 19:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2017-03-08 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2017-03-08 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2017-03-08 19:21:38', 'COD', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(21, 7, 14, 'Laptop ASUS Vivobook X515EP', 'ASUS', 16990, 17990, '<span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- CPU: Intel Core i5-1135G7 </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- Hình: 15,6 \"(1920 x 1080) </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- RAM: 8GB (4GB + 4GB Onboard) DDR4 3200MHz </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- ?? h?a: NVIDIA GeForce MX330Intel Iris Xe Graphics </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- L?u tr?: 512GB SSD M.2 NVMe / </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- H? ?i?u hành: Windows 10 Home SL 64-bit </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- Pin: 2 cell 37 Wh Pin li?n </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- Kh?i l??ng: 1,7 kg</font></font></span><br>', '1.png', '2.webp', '3.webp', 30000, 'In Stock', '2021-04-10 16:01:59', NULL),
(22, 7, 14, 'Laptop ASUS ExpertBook P2451FA', 'ASUS', 17890, 17990, '<span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- CPU: Intel Core i5-10210U</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Màn hình: 14\" IPS (1920 x 1080)</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- RAM: 1 x 8GB DDR4 2666MHz</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- ?? h?a: Intel UHD Graphics</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- L?u tr?: 512GB SSD M.2 NVMe /</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- H? ?i?u hành: Windows 10 Home 64-bit</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Pin: 3 cell 48 Wh Pin li?n</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Kh?i l??ng: 1.5 kg</span><br>', '1.png', '', '', 30000, 'In Stock', '2021-04-10 17:11:40', NULL),
(23, 7, 14, 'Laptop ASUS TUF Gaming FX506LH', 'ASUS', 20090, 20490, '<span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- CPU: Intel Core i5-10300H</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Màn hình: 15.6\" IPS (1920 x 1080)</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- RAM: 1 x 8GB DDR4 2933MHz</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- ?? h?a: NVIDIA GeForce GTX 1650 4GB GDDR6 / Intel UHD Graphics</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- L?u tr?: 512GB SSD M.2 NVMe /</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- H? ?i?u hành: Windows 10 Home 64-bit</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Pin: 3 cell 48 Wh Pin li?n</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Kh?i l??ng: 2.3 kg</span><br>', '1.png', NULL, NULL, 30000, 'In Stock', '2021-04-10 17:18:06', NULL),
(24, 7, 14, 'Laptop ASUS Vivobook S433EA', 'ASUS', 18890, 18990, '<span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- CPU: Intel Core i5-1135G7</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Màn hình: 14\" IPS (1920 x 1080)</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- RAM: 8GB Onboard DDR4 3200MHz</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- ?? h?a: Intel Iris Xe Graphics</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- L?u tr?: 512GB SSD M.2 NVMe /</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- H? ?i?u hành: Windows 10 Home 64-bit</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Pin: 3 cell 50 Wh Pin li?n</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Kh?i l??ng: 1.4 kg</span><br>', '1.png', NULL, NULL, 30000, 'In Stock', '2021-04-10 17:24:29', NULL),
(25, 7, 14, 'Laptop ASUS Vivobook X509MA', 'ASUS', 6790, 6890, '<span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- CPU: Intel Celeron N4020</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Màn hình: 15.6\" (1366 x 768)</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- RAM: 1 x 4GB DDR4 2666MHz</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- ?? h?a: Intel UHD Graphics 600</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- L?u tr?: 256GB SSD M.2 NVMe /</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- H? ?i?u hành: Windows 10 Home SL 64-bit</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Pin: 2 cell 32 Wh Pin li?n</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Kh?i l??ng: 1.6 kg</span><br>', '1.png', NULL, NULL, 30000, 'In Stock', '2021-04-10 17:26:01', NULL),
(26, 8, 15, 'Laptop HP 340s G7', 'HP', 20290, 20390, '<span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- CPU: Intel Core i7-1065G7</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Màn hình: 14\" IPS (1920 x 1080)</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- RAM: 1 x 8GB DDR4 2666MHz</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- ?? h?a: Intel Iris Plus Graphics</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- L?u tr?: 512GB SSD M.2 NVMe /</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- H? ?i?u hành: Windows 10 Home SL 64-bit</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Pin: 3 cell 41 Wh Pin li?n</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Kh?i l??ng: 1.4 kg</span><br>', '1.png', NULL, NULL, 30000, 'In Stock', '2021-04-10 17:28:25', NULL),
(27, 9, 13, 'Laptop ACER Nitro 5 AN515-56', 'ACER', 23890, 23990, '<span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- CPU: Intel Core i5-11300H </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- Hình: 15,6 \"IPS (1920 x 1080), 144Hz </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- RAM: 1 x 8GB DDR4 3200MHz </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- ?? h?a: NVIDIA GeForce GTX 1650 6GB GDDR5 / Intel Iris Xe Graphics </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- L?u tr?: 512GB SSD M.2 NVMe / </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- H? ?i?u hành: Windows 10 Home 64-bit </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- 57 Wh Pin li?n </font></font></span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">- Kh?i l??ng: 2,2 kg</font></font></span><br>', '1.png', NULL, NULL, 30000, 'In Stock', '2021-04-10 17:37:57', NULL),
(28, 10, 16, 'Laptop Dell Vostro 14 3400', 'DELL', 16990, 17990, '<span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- CPU: Intel Core i7-1165G7</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Màn hình: 14\" WVA (1920 x 1080)</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- RAM: 1 x 8GB DDR4 3200MHz</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- ?? h?a: NVIDIA GeForce MX330 2GB GDDR5 / Intel Iris Xe Graphics</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- L?u tr?: 512GB SSD M.2 NVMe /</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- H? ?i?u hành: Windows 10 Home SL 64-bit</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Pin: 3 cell 42 Wh Pin li?n</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Kh?i l??ng: 1.6 kg</span><br>', '1.png', NULL, NULL, 30000, 'In Stock', '2021-04-10 17:39:12', NULL),
(29, 11, 17, 'Laptop Lenovo Legion 5 15ARH05', 'LENOVO', 24590, 24790, '<span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- CPU: AMD Ryzen 5 4600H</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Màn hình: 15.6\" IPS (1920 x 1080), 144Hz</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- RAM: 1 x 8GB DDR4 3200MHz</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- ?? h?a: NVIDIA GeForce GTX 1650Ti 4GB GDDR6 / AMD Radeon Graphics</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- L?u tr?: 512GB SSD M.2 NVMe /</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- H? ?i?u hành: Windows 10 Home 64-bit</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Pin: 4 cell 60 Wh Pin li?n</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Kh?i l??ng: 2.3 kg</span><br>', '1.png', NULL, NULL, 30000, 'In Stock', '2021-04-10 17:40:24', NULL),
(30, 12, 18, 'Laptop MSI Thin GF65 10UE', 'MSI', 35890, 35990, '<span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- CPU: Intel Core i7-10750H</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Màn hình: 15.6\" IPS (1920 x 1080), 144Hz</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- RAM: 2 x 8GB DDR4 3200MHz</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- ?? h?a: NVIDIA GeForce RTX 3060 6GB GDDR6 / Intel UHD Graphics</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- L?u tr?: 512GB SSD M.2 NVMe /</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- H? ?i?u hành: Windows 10 Home 64-bit</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Pin: 3 cell 51 Wh Pin li?n</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Kh?i l??ng: 1.9 kg</span><br>', '1.png', NULL, NULL, 30000, 'In Stock', '2021-04-10 17:41:44', NULL),
(31, 13, 19, 'Laptop APPLE MacBook', 'APPLE', 39590, 39990, '<span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- CPU: Apple M1</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Màn hình: 13.3\" IPS (2560 x 1600)</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- RAM: 1 x 16GB LPDDR4 3733MHz</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- ?? h?a:</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- L?u tr?: 256GB SSD /</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- H? ?i?u hành: macOS</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Pin li?n</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Kh?i l??ng: 1.4 kg</span><br>', '1.png', NULL, NULL, 30000, 'In Stock', '2021-04-10 17:43:16', NULL),
(32, 14, 20, 'Laptop LG Gram 17Z90N', 'LG', 42300, 42500, '<span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- CPU: Intel Core i7-1065G7</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Màn hình: 17\" IPS (2560 x 1600)</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- RAM: 1 x 8GB Onboard DDR4 3200MHz</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- ?? h?a: Intel Iris Plus Graphics</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- L?u tr?: 512GB SSD M.2 NVMe /</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- H? ?i?u hành: Windows 10 Home 64-bit</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Pin: 2 cell 80 Wh Pin li?n</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px;\">- Kh?i l??ng: 1.4 kg</span><br>', '1.png', NULL, NULL, 30000, 'In Stock', '2021-04-10 17:44:53', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Led Television', '2017-01-26 16:24:52', '26-01-2017 11:03:40 PM'),
(3, 4, 'Television', '2017-01-26 16:29:09', ''),
(4, 4, 'Mobiles', '2017-01-30 16:55:48', ''),
(5, 4, 'Mobile Accessories', '2017-02-04 04:12:40', ''),
(6, 4, 'Laptops', '2017-02-04 04:13:00', ''),
(7, 4, 'Computers', '2017-02-04 04:13:27', ''),
(8, 3, 'Comics', '2017-02-04 04:13:54', ''),
(9, 5, 'Beds', '2017-02-04 04:36:45', ''),
(10, 5, 'Sofas', '2017-02-04 04:37:02', ''),
(11, 5, 'Dining Tables', '2017-02-04 04:37:51', ''),
(12, 6, 'Men Footwears', '2017-03-10 20:12:59', ''),
(13, 9, 'ACER', '2021-04-10 15:57:56', '10-04-2021 09:28:46 PM'),
(14, 7, 'ASUS', '2021-04-10 15:58:58', NULL),
(15, 8, 'HP', '2021-04-10 15:59:04', NULL),
(16, 10, 'DELL', '2021-04-10 15:59:17', NULL),
(17, 11, 'LENOVO', '2021-04-10 15:59:25', NULL),
(18, 12, 'MSI', '2021-04-10 15:59:32', NULL),
(19, 13, 'APPLE', '2021-04-10 15:59:39', NULL),
(20, 14, 'LG', '2021-04-10 15:59:45', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Anuj Kumar', 'anuj.lpu1@gmail.com', 9009857868, 'f925916e2754e5e03f75dd58a5733251', 'CS New Delhi', 'New Delhi', 'Delhi', 110001, 'New Delhi', 'New Delhi', 'Delhi', 110092, '2017-02-04 19:30:50', ''),
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2017-03-15 17:21:22', ''),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, '', '', '', 0, '2018-04-29 09:30:32', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
