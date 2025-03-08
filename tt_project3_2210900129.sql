-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 01, 2025 lúc 05:29 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tt_project3_2210900129`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `TT_Ma_Don` int(11) NOT NULL,
  `TT_id_khach` int(11) DEFAULT NULL,
  `TT_Thoi_Gian` time DEFAULT NULL,
  `TT_Dia_Chi_Nhan` varchar(100) DEFAULT NULL,
  `TT_So_Tien` varchar(10) DEFAULT NULL,
  `TT_ThanhToan` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donnhap`
--

CREATE TABLE `donnhap` (
  `TT_Ma` int(11) NOT NULL,
  `TT_id_Do` int(11) DEFAULT NULL,
  `TT_Phan_Loai` varchar(50) DEFAULT NULL,
  `TT_So_Luong` int(11) DEFAULT NULL,
  `TT_Thoi_Gian_Nhap` time DEFAULT NULL,
  `TT_Tong_Tien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `TT_id_Khach` int(11) NOT NULL,
  `TT_Ho` varchar(255) DEFAULT NULL,
  `TT_Ten` varchar(50) DEFAULT NULL,
  `TT_Dia_Chi` varchar(50) DEFAULT NULL,
  `TT_email` varchar(50) DEFAULT NULL,
  `TT_SDT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `TT_id` int(11) NOT NULL,
  `TT_TaiKhoan` varchar(255) DEFAULT NULL,
  `TT_Mat_Khau` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vattu`
--

CREATE TABLE `vattu` (
  `TT_id_do` int(11) NOT NULL,
  `TT_Ten_Do` varchar(255) DEFAULT NULL,
  `TT_Phan_Loai` varchar(50) DEFAULT NULL,
  `TT_Gia` int(11) DEFAULT NULL,
  `TT_SoLuong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`TT_Ma_Don`),
  ADD KEY `TT_id_khach` (`TT_id_khach`);

--
-- Chỉ mục cho bảng `donnhap`
--
ALTER TABLE `donnhap`
  ADD PRIMARY KEY (`TT_Ma`),
  ADD KEY `TT_id_Do` (`TT_id_Do`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`TT_id_Khach`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`TT_id`);

--
-- Chỉ mục cho bảng `vattu`
--
ALTER TABLE `vattu`
  ADD PRIMARY KEY (`TT_id_do`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `TT_Ma_Don` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `donnhap`
--
ALTER TABLE `donnhap`
  MODIFY `TT_Ma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `TT_id_Khach` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `TT_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vattu`
--
ALTER TABLE `vattu`
  MODIFY `TT_id_do` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`TT_id_khach`) REFERENCES `khachhang` (`TT_id_Khach`);

--
-- Các ràng buộc cho bảng `donnhap`
--
ALTER TABLE `donnhap`
  ADD CONSTRAINT `donnhap_ibfk_1` FOREIGN KEY (`TT_id_Do`) REFERENCES `vattu` (`TT_id_do`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
