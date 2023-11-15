-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: workhub
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `id` varchar(5) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clasificacion`
--

DROP TABLE IF EXISTS `clasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clasificacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comentarios_publicacion_estudiante`
--

DROP TABLE IF EXISTS `comentarios_publicacion_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios_publicacion_estudiante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_autor` varchar(12) NOT NULL,
  `id_empresa` int DEFAULT NULL,
  `contenido` text NOT NULL,
  `fecha_publicacion` datetime NOT NULL,
  `id_post` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_post` (`id_post`),
  KEY `id_autor` (`id_autor`),
  KEY `id_empresa` (`id_empresa`),
  CONSTRAINT `comentarios_publicacion_estudiante_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `detallespublicacionesestudiante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comentarios_publicacion_estudiante_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `user_estudiante` (`no_control`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comentarios_publicacion_estudiante_ibfk_3` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detallespublicacionesestudiante`
--

DROP TABLE IF EXISTS `detallespublicacionesestudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallespublicacionesestudiante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text,
  `fecha_publicacion` datetime NOT NULL,
  `id_ubicacion` int NOT NULL,
  `id_carrera` varchar(5) NOT NULL,
  `habilidades` text,
  `experiencia` text,
  `id_clasificacion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ubicacion` (`id_ubicacion`),
  KEY `id_clasificacion` (`id_clasificacion`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `detallespublicacionesestudiante_ibfk_1` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detallespublicacionesestudiante_ibfk_2` FOREIGN KEY (`id_clasificacion`) REFERENCES `clasificacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detallespublicacionesestudiante_ibfk_3` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contraseña` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logo` mediumblob,
  `telefono` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_ubicacion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ubicacion` (`id_ubicacion`),
  CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etiquetas`
--

DROP TABLE IF EXISTS `etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` enum('nuevo','urgente','disponible','nodisponible') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_post` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `etiquetas_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `detallespublicacionesestudiante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_emisor` varchar(12) NOT NULL,
  `id_receptor` int NOT NULL,
  `contenido` text NOT NULL,
  `fecha_envio` datetime NOT NULL,
  `leido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_emisor` (`id_emisor`),
  KEY `id_receptor` (`id_receptor`),
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`id_emisor`) REFERENCES `user_estudiante` (`no_control`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`id_receptor`) REFERENCES `empresas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ofertas_trabajo`
--

DROP TABLE IF EXISTS `ofertas_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofertas_trabajo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `fecha_publicacion` datetime NOT NULL,
  `id_empresa` int NOT NULL,
  `id_ubicacion` int NOT NULL,
  `id_carrera` varchar(5) DEFAULT NULL,
  `habilidades_requeridas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `experiencia_requerida` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `id_clasificacion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_empresa` (`id_empresa`),
  KEY `id_ubicacion` (`id_ubicacion`),
  KEY `id_carrera` (`id_carrera`),
  KEY `id_clasificacion` (`id_clasificacion`),
  CONSTRAINT `ofertas_trabajo_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ofertas_trabajo_ibfk_2` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ofertas_trabajo_ibfk_3` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ofertas_trabajo_ibfk_4` FOREIGN KEY (`id_clasificacion`) REFERENCES `clasificacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posts_estudiantes`
--

DROP TABLE IF EXISTS `posts_estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_estudiantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imagen` mediumblob NOT NULL,
  `id_autor` varchar(12) NOT NULL,
  `id_detallespublicacionesestudiante` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_detallespublicacionesestudiante` (`id_detallespublicacionesestudiante`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `posts_estudiantes_ibfk_1` FOREIGN KEY (`id_detallespublicacionesestudiante`) REFERENCES `detallespublicacionesestudiante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_estudiantes_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `user_estudiante` (`no_control`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol` enum('invitado','admin','estudiante','empresa') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `numero` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_estudiante`
--

DROP TABLE IF EXISTS `user_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_estudiante` (
  `no_control` varchar(12) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `foto` mediumblob,
  `telefono` varchar(15) NOT NULL,
  `id_carrera` varchar(5) NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`no_control`),
  KEY `id_carrera` (`id_carrera`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `user_estudiante_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_estudiante_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-15 14:51:12
