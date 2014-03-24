-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: bank_upt
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abono`
--

DROP TABLE IF EXISTS `abono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abono` (
  `folio_abono` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_abono` date NOT NULL,
  `monto_abono` decimal(8,2) NOT NULL,
  `Alumno_matricula` int(11) NOT NULL,
  PRIMARY KEY (`folio_abono`),
  KEY `fk_Abono_Alumno1_idx` (`Alumno_matricula`),
  CONSTRAINT `fk_Abono_Alumno1` FOREIGN KEY (`Alumno_matricula`) REFERENCES `alumno` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abono`
--

LOCK TABLES `abono` WRITE;
/*!40000 ALTER TABLE `abono` DISABLE KEYS */;
INSERT INTO `abono` VALUES (1,'2013-03-10',100.00,29126001),(2,'2013-04-11',100.00,29106006),(3,'2013-05-12',50.00,29116002),(4,'2013-06-07',50.00,29116003);
/*!40000 ALTER TABLE `abono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ahorros`
--

DROP TABLE IF EXISTS `ahorros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahorros` (
  `folio_ahorro` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_deposito` date NOT NULL,
  `monto_deposito` decimal(8,2) NOT NULL,
  `matricula_persona` int(11) NOT NULL,
  PRIMARY KEY (`folio_ahorro`),
  KEY `fk_Ahorros_Empleado1_idx` (`matricula_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahorros`
--

LOCK TABLES `ahorros` WRITE;
/*!40000 ALTER TABLE `ahorros` DISABLE KEYS */;
INSERT INTO `ahorros` VALUES (1,'2012-04-09',100.00,110),(2,'2012-06-06',50.00,29126004),(3,'2012-05-04',200.00,29106006),(4,'2012-06-05',100.00,29126004);
/*!40000 ALTER TABLE `ahorros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `carrera` varchar(100) NOT NULL,
  `grado` varchar(1) NOT NULL,
  `materias_reprobadas` int(11) NOT NULL,
  `materias_recursadas` int(11) NOT NULL,
  `grupo` varchar(1) NOT NULL,
  `promedio_general` float NOT NULL,
  `matricula` int(11) NOT NULL,
  PRIMARY KEY (`matricula`),
  KEY `fk_Alumno_Persona1_idx` (`matricula`),
  CONSTRAINT `fk_Alumno_Persona1` FOREIGN KEY (`matricula`) REFERENCES `persona` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES ('Quimica','8',3,0,'C',7.9,29106003),('Mecatronica','8',1,1,'A',9.3,29106006),('Financiera','5',2,1,'B',8.1,29116002),('Industrial','5',3,1,'E',7,29116003),('Tecnologias ','2',1,0,'A',9,29126001),('Biotecnologia','2',2,0,'D',8,29126004);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora` (
  `inicio_sesion` date NOT NULL,
  `cierre_sesion` date NOT NULL,
  `acciones_realizadas` varchar(100) NOT NULL,
  `Persona_matricula` int(11) NOT NULL,
  `id_sesion` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_sesion`),
  KEY `fk_Bitacora_Persona1_idx` (`Persona_matricula`),
  CONSTRAINT `fk_Bitacora_Persona1` FOREIGN KEY (`Persona_matricula`) REFERENCES `persona` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES ('2013-03-10','2013-03-10','Se logeo',29106003,1),('2013-04-11','2013-04-11','Cancelo',29106006,2),('2013-05-12','2013-05-12','Dio de baja',29116002,3),('2013-06-07','2013-06-07','Se logeo',29116003,4);
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `puesto` varchar(45) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `numero_cuentabancaria` varchar(45) NOT NULL,
  `matricula` int(11) NOT NULL,
  `id_tipo_Empleado` int(11) NOT NULL,
  PRIMARY KEY (`matricula`),
  KEY `fk_Empleado_Persona1_idx` (`matricula`),
  KEY `fk_Empleado_Tipo_empleado1_idx` (`id_tipo_Empleado`),
  CONSTRAINT `fk_Empleado_Persona1` FOREIGN KEY (`matricula`) REFERENCES `persona` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_Tipo_empleado1` FOREIGN KEY (`id_tipo_Empleado`) REFERENCES `tipo_empleado` (`id_tipo_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('PA','2010-01-10','Encargado de laboratorio','67890',110,2),('PTC','2010-02-10','director','12345',29106003,1),('PA','2010-04-05','Encargado de laboratorio','34567',29106006,4);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `matricula` int(11) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (29106003,'papito1');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

CREATE  TABLE IF NOT EXISTS `bank_upt`.`Pagos` (
  `folio_pago` INT NOT NULL AUTO_INCREMENT ,
  `id_tipo_pago` INT NOT NULL ,
  `fecha_pago` DATETIME NOT NULL ,
  `Alumno_matricula` INT NOT NULL ,
  `monto_pago` DECIMAL(8,2) NOT NULL ,
  INDEX `fk_Pagos_Tipo_pago1` (`id_tipo_pago` ASC) ,
  INDEX `fk_Pagos_Alumno1` (`Alumno_matricula` ASC) ,
  PRIMARY KEY (`folio_pago`) ,
  CONSTRAINT `fk_Pagos_Tipo_pago1`
    FOREIGN KEY (`id_tipo_pago` )
    REFERENCES `mydb`.`Tipo_pago` (`id_tipo_pago` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pagos_Alumno1`
    FOREIGN KEY (`Alumno_matricula` )
    REFERENCES `mydb`.`Alumno` (`matricula` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `matricula` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido_paterno` varchar(20) NOT NULL,
  `apellido_materno` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `rfc` varchar(45) NOT NULL,
  `curp` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (110,'Oscar','Romero','Arredondo','oscar@uptlax.com','Calle estrella #45','ROAO861005','ROAO861005MTLR0','2467973974'),(29106003,'Agustin','Maldonado','Dominguez','agus_evans@hotmail.com','4 poniente #45','MADA910329','MADA910329MTLR0','2467843579'),(29106006,'Leticia','Castillo','Perez','lecape@hotmail.com','Calle niño perdido #5','CAPL920129','CAPL920129','2467979001'),(29116002,'Viridiana','Carvente','Velazquez','viri_ca@hotmai.coml','Calle del peral #3','CAVV920221','CAVV920221MTLR0','2467890797'),(29116003,'Ivone ','Cuapio','Juarez','ivone@hotmail.com','Calle la Paz #100','CXJA921221','CXJA921221','2461467895'),(29126001,'Arisbel','Cote','Juarez','aris_flower_pretty@hotmail.com','Av. Reforma #52','CXJA920210','CXJA920210MTLR0','2462494567'),(29126004,'Joe ','Carro','Lima','joe_car@hotmail.com','Porfirio Diaz #5','CALJ911012','CALJ911012MTLR0','2461234567');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `monto_prestamos` decimal(8,2) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `feha_limitepago` date NOT NULL,
  `interes_mensual` decimal(8,2) NOT NULL,
  `folio_prestamo` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_prestamo` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  PRIMARY KEY (`folio_prestamo`,`id_tipo_prestamo`),
  KEY `fk_Prestamos_Tipo_prestamo_idx` (`id_tipo_prestamo`),
  KEY `fk_Prestamos_Alumno1_idx` (`matricula`),
  CONSTRAINT `fk_Prestamos_Alumno1` FOREIGN KEY (`matricula`) REFERENCES `alumno` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestamos_Tipo_prestamo` FOREIGN KEY (`id_tipo_prestamo`) REFERENCES `tipo_prestamo` (`id_tipo_prestamo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (100.00,'2013-04-02','2013-08-02',1.50,1,1,29106006),(200.00,'2013-06-05','2013-10-05',1.50,2,2,29106003),(300.00,'2013-02-02','2013-06-02',1.50,3,3,29116002),(400.00,'2012-09-07','2013-01-07',1.50,4,4,29116003),(500.00,'2012-12-04','2013-04-04',1.50,5,5,29126001);
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_empleado`
--

DROP TABLE IF EXISTS `tipo_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_empleado` (
  `id_tipo_Empleado` int(11) NOT NULL AUTO_INCREMENT,
  `clave_tipo_empleado` varchar(3) NOT NULL,
  `descripcion_tipo_empleado` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_Empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_empleado`
--

LOCK TABLES `tipo_empleado` WRITE;
/*!40000 ALTER TABLE `tipo_empleado` DISABLE KEYS */;
INSERT INTO `tipo_empleado` VALUES (1,'PTC','Profesor de tiempo completo'),(2,'PA','Profesor por asignatura'),(3,'CO','Comisionado'),(4,'PRA','Presidente de academia'),(5,'PL','Personal de limpieza'),(6,'PV','Personal de vigilancia');
/*!40000 ALTER TABLE `tipo_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_pago` (
  `id_tipo_pago` int(11) NOT NULL AUTO_INCREMENT,
  `descripccion_tipo_pago` varchar(100) NOT NULL,
  `monto_tipo_pago` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_tipo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pago`
--

LOCK TABLES `tipo_pago` WRITE;
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
INSERT INTO `tipo_pago` VALUES (1,'Inscripcion',2400.00),(2,'Cuota de recuperacion cuatrimestral',1250.00),(3,'Examen de recuperacion',100.00),(4,'Expedicion-Reposicion de credencial',50.00),(5,'Expedicion de documentos oficiales',50.00),(6,'Cuota cuatrimestral por materia a recursar',200.00),(7,'Revalidacion de materias',200.00);
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_prestamo`
--

DROP TABLE IF EXISTS `tipo_prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_prestamo` (
  `id_tipo_prestamo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipo_prestamo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_prestamo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_prestamo`
--

LOCK TABLES `tipo_prestamo` WRITE;
/*!40000 ALTER TABLE `tipo_prestamo` DISABLE KEYS */;
INSERT INTO `tipo_prestamo` VALUES (1,'Inscripcion'),(2,'Cuota de recuperacion cuatrimestral'),(3,'Examen de recuperacion'),(4,'Expedicion-Reposicion de credencial'),(5,'Expedicion de documentos oficiales'),(6,'Cuota cuatrimestral por materia a recursar'),(7,'Viaje industrial'),(8,'Congresos');
/*!40000 ALTER TABLE `tipo_prestamo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-14 13:07:03
