-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: xuatnhaphang
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chitietphieunhap`
--

DROP TABLE IF EXISTS `chitietphieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietphieunhap` (
  `IdPhieuNhap` int DEFAULT NULL,
  `IdVatTu` int DEFAULT NULL,
  `SLNhap` int DEFAULT NULL,
  `DGNhap` decimal(10,0) DEFAULT NULL,
  KEY `IdPhieuNhap` (`IdPhieuNhap`),
  KEY `IdVatTu` (`IdVatTu`),
  CONSTRAINT `chitietphieunhap_ibfk_1` FOREIGN KEY (`IdPhieuNhap`) REFERENCES `phieunhap` (`IdPhieuNhap`),
  CONSTRAINT `chitietphieunhap_ibfk_2` FOREIGN KEY (`IdVatTu`) REFERENCES `vattu` (`IdVatTu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chitietphieuxuat`
--

DROP TABLE IF EXISTS `chitietphieuxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietphieuxuat` (
  `IdPhieuXuat` int DEFAULT NULL,
  `IdVatTu` int DEFAULT NULL,
  `SLXuat` int DEFAULT NULL,
  `DGXuat` decimal(10,0) DEFAULT NULL,
  KEY `IdPhieuXuat` (`IdPhieuXuat`),
  KEY `IdVatTu` (`IdVatTu`),
  CONSTRAINT `chitietphieuxuat_ibfk_1` FOREIGN KEY (`IdPhieuXuat`) REFERENCES `phieuxuat` (`IdPhieuXuat`),
  CONSTRAINT `chitietphieuxuat_ibfk_2` FOREIGN KEY (`IdVatTu`) REFERENCES `vattu` (`IdVatTu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dondathang`
--

DROP TABLE IF EXISTS `dondathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dondathang` (
  `IdDatHang` int NOT NULL AUTO_INCREMENT,
  `NgayDatHang` datetime DEFAULT NULL,
  `IdNhaCungCap` int DEFAULT NULL,
  PRIMARY KEY (`IdDatHang`),
  KEY `IdNhaCungCap` (`IdNhaCungCap`),
  CONSTRAINT `dondathang_ibfk_1` FOREIGN KEY (`IdNhaCungCap`) REFERENCES `nhacungcap` (`IdNhaCungCap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nccphone`
--

DROP TABLE IF EXISTS `nccphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nccphone` (
  `IdNhaCungCap` int DEFAULT NULL,
  `SoDienThoai` varchar(11) DEFAULT NULL,
  KEY `IdNhaCungCap` (`IdNhaCungCap`),
  CONSTRAINT `nccphone_ibfk_1` FOREIGN KEY (`IdNhaCungCap`) REFERENCES `nhacungcap` (`IdNhaCungCap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nhacungcap`
--

DROP TABLE IF EXISTS `nhacungcap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhacungcap` (
  `IdNhaCungCap` int NOT NULL AUTO_INCREMENT,
  `TenNhaCungCap` varchar(30) NOT NULL,
  `DiaChi` varchar(30) DEFAULT 'Huế',
  PRIMARY KEY (`IdNhaCungCap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phieunhap`
--

DROP TABLE IF EXISTS `phieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieunhap` (
  `IdPhieuNhap` int NOT NULL AUTO_INCREMENT,
  `NgayNhap` datetime NOT NULL,
  PRIMARY KEY (`IdPhieuNhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phieuxuat`
--

DROP TABLE IF EXISTS `phieuxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieuxuat` (
  `IdPhieuXuat` int NOT NULL AUTO_INCREMENT,
  `NgayXuat` datetime NOT NULL,
  PRIMARY KEY (`IdPhieuXuat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vattu`
--

DROP TABLE IF EXISTS `vattu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vattu` (
  `IdVatTu` int NOT NULL AUTO_INCREMENT,
  `TenVatTu` varchar(30) NOT NULL,
  `IdDatHang` int DEFAULT NULL,
  PRIMARY KEY (`IdVatTu`),
  KEY `IdDatHang` (`IdDatHang`),
  CONSTRAINT `vattu_ibfk_1` FOREIGN KEY (`IdDatHang`) REFERENCES `dondathang` (`IdDatHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-24 10:16:21
