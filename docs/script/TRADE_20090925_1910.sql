-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.75-0ubuntu10.2


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema trade
--

CREATE DATABASE IF NOT EXISTS trade;
USE trade;

--
-- Definition of table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
CREATE TABLE  `Categoria` (
  `idCategoria` int(10) NOT NULL auto_increment,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY  (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Descripción del tipo de producto';

--
-- Dumping data for table `Categoria`
--

/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
LOCK TABLES `Categoria` WRITE;
INSERT INTO `Categoria` VALUES  (1,'Quesos'),
 (2,'Carnes frias'),
 (3,'Cremería y Abarrotes'),
 (4,'Otros');
UNLOCK TABLES;
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;

Definition
--
--  of table `UnidadMedida`
--

DROP TABLE IF EXISTS `UnidadMedida`;
CREATE TABLE  `UnidadMedida` (
  `idUnidadMedida` int(10) NOT NULL auto_increment,
  `unidad` varchar(20) NOT NULL,
  `descripcion` varchar(50) default NULL,
  PRIMARY KEY  (`idUnidadMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='Almacena la unidad de medida del contenido de los productos';




--
-- Definition of table `Grupo`
--

DROP TABLE IF EXISTS `Grupo`;
CREATE TABLE  `Grupo` (
  `idGrupo` int(11) NOT NULL auto_increment,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(250) default 'N/A',
  PRIMARY KEY  (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Grupo`
--

/*!40000 ALTER TABLE `Grupo` DISABLE KEYS */;
LOCK TABLES `Grupo` WRITE;
INSERT INTO `Grupo` VALUES  (0,'NA','N/A');
UNLOCK TABLES;
/*!40000 ALTER TABLE `Grupo` ENABLE KEYS */;



--
-- Definition of table `Marca`
--

DROP TABLE IF EXISTS `Marca`;
CREATE TABLE  `Marca` (
  `idMarca` int(10) NOT NULL auto_increment,
  `descripcion` varchar(120) NOT NULL,
  PRIMARY KEY  (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1 COMMENT='Tabla con las descripciones de las marcas';




--
-- Definition of table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
CREATE TABLE  `Producto` (
  `idProducto` varchar(150) NOT NULL default '',
  `nombre` varchar(150) default NULL,
  `precioUnitario` double(10,2) default NULL,
  `tipoRegistro` tinyint(1) default NULL,
  `idCategoria` int(10) NOT NULL default '1',
  `idGrupo` int(11) NOT NULL default '0',
  `contenido` double(10,2) default NULL,
  `idUnidadMedida` int(10) NOT NULL default '1',
  `idMarca` int(10) NOT NULL default '1',
  `fechaRegistro` datetime default NULL,
  `fechaActualizacion` datetime default NULL,
  PRIMARY KEY  (`idProducto`),
  KEY `idx_idMarca` (`idMarca`),
  KEY `fk_idMarca` (`idMarca`),
  KEY `fk_idGrupo` (`idGrupo`),
  KEY `fk_idCategoria` (`idCategoria`),
  KEY `fk_idUnidadMedida` (`idUnidadMedida`),
  KEY `idx_idCategoria` (`idCategoria`),
  KEY `idx_idUnidadMedida` (`idUnidadMedida`),
  CONSTRAINT `fk_idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `Categoria` (`idCategoria`),
  CONSTRAINT `fk_idGrupo` FOREIGN KEY (`idGrupo`) REFERENCES `Grupo` (`idGrupo`),
  CONSTRAINT `fk_idMarca` FOREIGN KEY (`idMarca`) REFERENCES `Marca` (`idMarca`),
  CONSTRAINT `fk_idUnidadMedida` FOREIGN KEY (`idUnidadMedida`) REFERENCES `UnidadMedida` (`idUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB; (`idMarca`) REFER `trade/Marca`(`idMa';

--
-- Definition of table `Inventario`
--

DROP TABLE IF EXISTS `Inventario`;
CREATE TABLE  `Inventario` (
  `idInventario` int(10) NOT NULL,
  `idProducto` varchar(150) NOT NULL,
  `cantidadTotal` double default NULL,
  `fechaActualizacion` datetime default NULL,
  PRIMARY KEY  (`idInventario`),
  KEY `fk_idProducto_1` USING BTREE (`idProducto`),
  CONSTRAINT `fk_idProducto_1` FOREIGN KEY (`idProducto`) REFERENCES `Producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB; (`Producto_idProducto`) REFER `trade/';




DROP TABLE IF EXISTS `DetalleInventario`;
CREATE TABLE  `DetalleInventario` (
  `idDetalleInventario` bigint(20) NOT NULL,
  `idInventario` int(10) NOT NULL,
  `idProducto` varchar(150) NOT NULL,
  `costoUnitario` double default NULL,
  `cantidad` int(10) NOT NULL,
  `cantidadTotal` int(10) default NULL,
  `idUnidadMedida` int(10) NOT NULL,
  `fechaRegistro` datetime default NULL,
  `fechaActualizacion` datetime default NULL,
  `tipoRegistro` tinyint(1) default NULL,
  PRIMARY KEY  (`idDetalleInventario`),
  KEY `fk_idInventario` (`idInventario`),
  KEY `fk_idUnidadMedida_1` (`idUnidadMedida`),
  KEY `fk_idProducto_2` USING BTREE (`idProducto`),
  CONSTRAINT `fk_idInventario` FOREIGN KEY (`idInventario`) REFERENCES `Inventario` (`idInventario`),
  CONSTRAINT `fk_idProducto_2` FOREIGN KEY (`idProducto`) REFERENCES `Producto` (`idProducto`),
  CONSTRAINT `fk_idUnidadMedida_1` FOREIGN KEY (`idUnidadMedida`) REFERENCES `UnidadMedida` (`idUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;








--
-- Dumping data for table `UnidadMedida`
--

/*!40000 ALTER TABLE `UnidadMedida` DISABLE KEYS */;
LOCK TABLES `UnidadMedida` WRITE;
INSERT INTO `UnidadMedida` VALUES  (1,'gr','Gramos'),
 (2,'kg','Kilos'),
 (3,'Lt','Litros'),
 (4,'ml','Mililitros'),
 (5,'Pza','Piezas'),
 (6,'Oz','Onzas'),
 (7,'lb','Libras'),
 (8,'na','otros');
UNLOCK TABLES;
/*!40000 ALTER TABLE `UnidadMedida` ENABLE KEYS */;


/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
LOCK TABLES `Marca` WRITE;
INSERT INTO `Marca` VALUES  (1,'Sin Marca'),
 (2,'Agrover'),
 (3,'Alpura'),
 (4,'atunsito'),
 (5,'Bakers & Chefs'),
 (6,'BARRILITO'),
 (7,'BIMBO'),
 (8,'Boing'),
 (9,'Bonafont'),
 (10,'Búfalo'),
 (11,'California Stars'),
 (12,'Campbells'),
 (13,'CHEN'),
 (14,'Clemente Jacques'),
 (15,'Danone'),
 (16,'Del Monte'),
 (17,'Dolche'),
 (18,'Dolores'),
 (19,'Don Agustin'),
 (20,'DON EFE'),
 (21,'Doña Maria'),
 (22,'El Olivo'),
 (23,'Embasa'),
 (24,'excelsior'),
 (25,'FARO'),
 (26,'Flor de California'),
 (27,'Gamesa'),
 (28,'Golden Hills'),
 (29,'Guten'),
 (30,'Herdez'),
 (31,'HerFruit'),
 (32,'Hunts'),
 (33,'Kraft'),
 (34,'La Costeña'),
 (35,'La Morena'),
 (36,'La Pasiega'),
 (37,'La Prateria'),
 (38,'La Sierra'),
 (39,'LALA'),
 (40,'Maggi'),
 (41,'Maruchan'),
 (42,'MazAtún'),
 (43,'McCormick'),
 (44,'Milpa Real'),
 (45,'Monteblanco'),
 (46,'NAIR'),
 (47,'Navarra'),
 (48,'Nestle'),
 (49,'Nutrileche'),
 (50,'OLA'),
 (51,'San Lucas'),
 (52,'San Marcos'),
 (53,'Tajin'),
 (54,'Tia Rosa'),
 (55,'TropFrut');
INSERT INTO `Marca` VALUES  (56,'Tuny'),
 (57,'Valdepeñas'),
 (58,'Valentina'),
 (59,'VENECIA'),
 (60,'del Valle'),
 (61,'Al-Día'),
 (62,'FUD'),
 (63,'IBERIA'),
 (64,'Primavera'),
 (65,'Yoplait'),
 (66,'Chipilo'),
 (67,'San Antonio'),
 (68,'Blue House'),
 (69,'Camelia'),
 (70,'Bonafina'),
 (71,'Bafar'),
 (72,'Sabadell'),
 (73,'Normex'),
 (74,'El pozolito michoacano'),
 (75,'SAGITARIO'),
 (76,'HertiPak'),
 (77,'Alpino'),
 (78,'CHARRAS'),
 (79,'CROSSE &BLACKWELL'),
 (80,'Figatza'),
 (81,'Wonder'),
 (82,'Del Hogar'),
 (83,'Dalmata'),
 (84,'Ponto'),
 (85,'IBERO'),
 (86,'OVIEDO'),
 (87,'Coca-Cola'),
 (88,'Fanta'),
 (89,'Ciel'),
 (90,'DerlawarePunch'),
 (91,'Senzao'),
 (92,'Sprite'),
 (93,'Manzana lift'),
 (94,'Fresa'),
 (95,'Fresca'),
 (96,'Valle Frut');
UNLOCK TABLES;
/*!40000 ALTER TABLE `Marca` ENABLE KEYS */;


--
-- Dumping data for table `Producto`
--

/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
LOCK TABLES `Producto` WRITE;
INSERT INTO `Producto` VALUES  ('027000384954','Salsa Barbecue',16.00,1,3,0,612.00,1,32,NULL,NULL),
 ('028571008560','Duraznos en almibar',18.00,1,3,0,500.00,1,26,NULL,NULL),
 ('032239052017','Jugo de durazno',7.50,1,3,0,413.00,4,60,NULL,NULL),
 ('032239052024','Jugo de manzana',7.50,1,3,0,413.00,4,60,NULL,NULL),
 ('032239058118','Jugo de mango',4.00,1,3,0,200.00,4,60,NULL,NULL),
 ('032239058125','Jugo de manzana Amarilla',4.00,1,3,0,200.00,4,60,NULL,NULL),
 ('032239058149','Jugo de durazno',4.00,1,3,0,200.00,4,60,NULL,NULL),
 ('032239058156','Jugo de Manzana',3.00,1,3,0,200.00,4,60,NULL,NULL),
 ('041789001864','Sopa Camaron Limon Habanero',5.00,1,3,0,46.00,1,41,NULL,NULL),
 ('041789001918','Sopa Pollo',5.00,1,3,0,64.00,1,41,NULL,NULL),
 ('041789001956','Sopa con camaron',5.00,1,3,0,64.00,1,41,NULL,NULL),
 ('041789001987','Sopa Camaron con Chile piquin',5.00,1,3,0,64.00,1,41,NULL,NULL),
 ('07503007001832','Piña',18.00,1,3,0,800.00,1,31,NULL,NULL),
 ('097339000054','Salsa picante',6.00,1,3,0,370.00,1,58,NULL,NULL),
 ('1','x',12.00,0,3,0,0.00,1,2,NULL,NULL);
INSERT INTO `Producto` VALUES  ('605388002327','Catsup',42.30,1,3,0,3.80,2,5,NULL,NULL),
 ('633148100013','Tajin clasico',14.50,1,3,0,142.00,1,53,NULL,NULL),
 ('661953299035','Atún en aceite',9.00,1,3,0,170.00,1,4,NULL,NULL),
 ('681131003445','Chiles jalapeños rodajas',44.00,1,3,0,2.80,2,5,NULL,NULL),
 ('681131698504','Mostaza',49.00,1,3,0,3.78,2,5,NULL,NULL),
 ('7000000000003','Maiz cocido',9.00,1,3,0,850.00,1,74,NULL,NULL),
 ('700016001502','Mermelada',19.00,1,3,0,510.00,1,17,NULL,NULL),
 ('711719810322','game',1.00,1,4,0,1.00,5,1,NULL,NULL),
 ('731082007112','Sardinas',11.00,1,3,0,120.00,1,84,NULL,NULL),
 ('75001759','Jugo de mango',4.00,1,3,0,250.00,4,8,NULL,NULL),
 ('75001773','Jugo de guayaba',4.00,1,3,0,250.00,4,8,NULL,NULL),
 ('75001797','Jugo de manzana',4.00,1,3,0,250.00,4,8,NULL,NULL),
 ('75004330','Salchichas tipo viena',9.00,1,2,0,200.00,1,62,NULL,NULL),
 ('75007614','Cocacola 600',7.50,1,3,0,600.00,4,87,NULL,NULL),
 ('7501000100996','Pan Blanco Grande',20.00,1,3,0,567.00,1,81,NULL,NULL),
 ('7501000101009','SuperPan Leche y ajonjolí',23.00,1,3,0,680.00,1,81,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501000101078','Pan integral 100%',22.00,1,3,0,680.00,1,81,NULL,NULL),
 ('7501000101252','Bollos con ajonjoli',20.00,1,3,0,450.00,1,81,NULL,NULL),
 ('7501000103034','Patelito',5.00,1,3,0,55.00,1,83,NULL,NULL),
 ('7501000103065','Chocotorro',5.00,1,3,0,50.00,1,81,NULL,NULL),
 ('7501000103195','Tuinky Vainilla',6.00,1,3,0,76.00,1,81,NULL,NULL),
 ('7501000103225','Tuinky fresa',6.00,1,3,0,76.00,1,81,NULL,NULL),
 ('7501000103577','Panitos chocolate',7.00,1,3,0,30.00,1,81,NULL,NULL),
 ('7501000106936','Tostadas planas',10.00,1,3,0,175.00,1,44,NULL,NULL),
 ('7501000111091','Pan blanco chico',13.00,1,3,0,360.00,1,7,NULL,NULL),
 ('7501000111251','Tortillinas 10 pza.',10.00,1,3,0,245.00,1,54,NULL,NULL),
 ('7501000111466','Pan Integral Grande',24.00,1,3,0,670.00,1,7,NULL,NULL),
 ('7501000111800','Pan tostado blanco',13.00,1,3,0,210.00,1,7,NULL,NULL),
 ('7501000111855','Pan Molido',8.00,1,3,0,210.00,1,7,NULL,NULL),
 ('7501000125050','Minibigotes Chocolate',7.00,1,3,0,65.00,1,54,NULL,NULL),
 ('7501000130306','Pan tostado blanco',13.00,1,3,0,180.00,1,81,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501000139699','Pan Integral 100% ajonjolí',24.00,1,3,0,680.00,1,81,NULL,NULL),
 ('7501000142200','Bigotes',6.00,1,3,0,60.00,1,54,NULL,NULL),
 ('7501000142347','MiniDoraditas',3.50,1,3,0,45.00,1,81,NULL,NULL),
 ('7501000142705','Cuernitos',8.00,1,3,0,100.00,1,54,NULL,NULL),
 ('7501000142804','Doraditas',7.00,1,3,0,147.00,1,54,NULL,NULL),
 ('7501000143047','Mantecadas Chocolate',8.00,1,3,0,95.00,1,81,NULL,NULL),
 ('7501000149100','Pan Molido Crujiente',8.00,1,3,0,175.00,1,7,NULL,NULL),
 ('7501000149469','Polvorón',3.00,1,3,0,65.00,1,54,NULL,NULL),
 ('7501000301799','Pan Tostado CeroCero',14.00,1,3,0,200.00,1,81,NULL,NULL),
 ('7501000306657','Base para pizza',16.00,1,3,0,345.00,1,80,NULL,NULL),
 ('7501000332564','Orejas',6.50,1,3,0,0.00,1,54,NULL,NULL),
 ('7501000664221','Saladitas',6.50,1,3,0,186.00,1,27,NULL,NULL),
 ('7501001600105','La Lechera',13.50,1,3,0,397.00,1,48,NULL,NULL),
 ('7501001600426','Media Crema',11.50,1,3,0,225.00,1,48,NULL,NULL),
 ('7501001604103','Jugo Maggi',21.50,1,3,0,100.00,4,40,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501001604318','Salsa inglesa',17.50,1,3,0,145.00,4,79,NULL,NULL),
 ('7501002615122','Philadelphia queso crema',21.50,1,3,0,190.00,1,33,NULL,NULL),
 ('7501003124135','Chicharos',4.50,1,3,0,200.00,1,30,NULL,NULL),
 ('7501003124166','Chicharos con zanahoria',5.50,1,3,0,225.00,1,30,NULL,NULL),
 ('7501003124180','Chicharosn con zanahoria',9.50,1,3,0,400.00,1,30,NULL,NULL),
 ('7501003124241','Granos de elote',11.00,1,3,0,400.00,1,30,NULL,NULL),
 ('7501003124272','Garbanzos',9.00,1,3,0,400.00,1,30,NULL,NULL),
 ('7501003124333','Ensalada de legumbres',6.00,1,3,0,220.00,1,30,NULL,NULL),
 ('7501003124340','Ensalada de legumbres',10.00,1,3,0,400.00,1,30,NULL,NULL),
 ('7501003129185','Atún en agua',10.00,1,3,0,170.00,1,30,NULL,NULL),
 ('7501003150233','Mole',19.50,1,3,0,235.00,1,21,NULL,NULL),
 ('7501003335012','Mostaza',5.50,1,3,0,115.00,1,43,NULL,NULL),
 ('7501003335029','Mostaza',6.50,1,3,0,210.00,1,43,NULL,NULL),
 ('7501003336125','Mermelada Fresa',12.00,1,3,0,270.00,1,43,NULL,NULL),
 ('7501003336323','Mermelada Piña',12.00,1,3,0,270.00,1,43,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501003336422','Mermelada Naranja',12.00,1,3,0,270.00,1,43,NULL,NULL),
 ('7501003340115','Mayonensa',7.50,1,3,0,105.00,1,43,NULL,NULL),
 ('7501003340122','Mayonesa',11.00,1,3,0,190.00,1,43,NULL,NULL),
 ('7501003340139','Mayonesa',22.00,1,3,0,390.00,1,43,NULL,NULL),
 ('7501003340146','Mayonesa',37.50,1,3,0,790.00,1,43,NULL,NULL),
 ('7501003340160','Mayonesa',115.00,1,3,0,3.40,2,43,NULL,NULL),
 ('7501003340467','Mayonesa',23.00,1,3,0,507.00,1,43,NULL,NULL),
 ('7501003390417','Aceitunas',8.50,1,3,0,150.00,1,10,NULL,NULL),
 ('7501003398239','Salsa picante polvo',6.00,1,3,0,160.00,1,10,NULL,NULL),
 ('7501005108096','Mantequilla con sal',7.00,1,3,0,90.00,1,64,NULL,NULL),
 ('7501006536942','Granos de elote',7.00,1,3,0,130.00,1,16,NULL,NULL),
 ('7501007809205','Atún en aceite y agua',9.00,1,3,0,170.00,1,24,NULL,NULL),
 ('7501010758125','Mermelada',19.00,1,3,0,500.00,1,28,NULL,NULL),
 ('7501011323278','Crema Champiñones',26.00,1,3,0,735.00,1,12,NULL,NULL),
 ('7501011361492','Crema Elote',16.50,1,3,0,430.00,1,12,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501011909281','Chiles Chipotles',19.50,1,3,0,380.00,1,25,NULL,NULL),
 ('7501013620085','Margarina azul',28.00,1,3,0,1.00,2,67,NULL,NULL),
 ('7501017003020','Chiles jalapeños en rajas',19.50,1,3,0,800.00,1,34,NULL,NULL),
 ('7501017004003','Chiles Jalapeños enteros',9.00,1,3,0,380.00,1,34,NULL,NULL),
 ('7501017004270','Frijoles Bayos Refritos',13.00,1,3,0,580.00,1,34,NULL,NULL),
 ('7501017004423','Frijoles negros refritos',13.00,1,3,0,580.00,1,34,NULL,NULL),
 ('7501017005000','Chiles Jalapeños',5.50,1,3,0,220.00,1,34,NULL,NULL),
 ('7501017005017','Chiles Serranos',6.00,1,3,0,220.00,1,34,NULL,NULL),
 ('7501017005024','Chiles Rajas',6.50,1,3,0,220.00,1,34,NULL,NULL),
 ('7501017005031','Chiles Chipotles',12.00,1,3,0,220.00,1,34,NULL,NULL),
 ('7501017005765','Chiles picados',7.50,1,3,0,220.00,1,34,NULL,NULL),
 ('7501017006014','Chiles jalapeños rajas',4.00,1,3,0,105.00,1,34,NULL,NULL),
 ('7501017006021','Chiles chipotles ',6.00,1,3,0,105.00,1,34,NULL,NULL),
 ('7501017040506','Mayonesa',22.00,1,3,0,385.00,1,34,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501017041053','Frijoles Negros Enteros',8.50,1,3,0,425.00,1,34,NULL,NULL),
 ('7501017041206','Crema Elote',15.00,1,3,0,430.00,1,34,NULL,NULL),
 ('7501017050215','Mayonesa',12.00,1,3,0,190.00,1,34,NULL,NULL),
 ('7501018203849','Catsup',15.00,1,3,0,1.00,2,23,NULL,NULL),
 ('7501020511451','Crema',14.50,1,0,0,450.00,4,39,NULL,NULL),
 ('7501020511468','Crema',29.00,1,3,0,1.00,3,39,NULL,NULL),
 ('7501020512373','Crema',108.00,1,3,0,4.00,3,39,NULL,NULL),
 ('7501020513134','Crema',7.00,1,3,0,200.00,4,39,NULL,NULL),
 ('7501020515350','Leche light',12.50,1,3,0,1.00,3,39,NULL,NULL),
 ('7501020515398','Leche Vive',14.50,1,3,0,1.00,3,39,NULL,NULL),
 ('7501020526066','Leche',11.50,1,3,0,1.00,3,39,NULL,NULL),
 ('7501023314028','Chiles gueros',17.50,1,3,0,400.00,1,52,NULL,NULL),
 ('7501023318033','Chiles Chipotles',19.50,1,3,0,380.00,1,52,NULL,NULL),
 ('7501023318040','Chiles Chipotles',12.00,1,3,0,215.00,1,52,NULL,NULL),
 ('7501023318057','Chiles Chipotles',6.00,1,3,0,100.00,1,52,NULL,NULL),
 ('7501023602002','Atún en aceite',9.00,1,3,0,170.00,1,46,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501023602057','Atún en aceite',95.00,1,3,0,1.35,2,46,NULL,NULL),
 ('7501023602064','Atun en agua',95.00,1,3,0,1.35,2,46,NULL,NULL),
 ('7501024002085','Champiñones rebanados',15.50,1,3,0,380.00,1,45,NULL,NULL),
 ('7501024203246','Margarina sin sal',15.00,1,3,0,190.00,1,64,NULL,NULL),
 ('7501030428695','Galleta de avena',4.00,1,3,0,54.00,3,54,NULL,NULL),
 ('7501030442387','Pan Integral Blanco',24.00,1,3,0,680.00,1,81,NULL,NULL),
 ('7501030471240','Semitas',10.00,1,3,0,120.00,1,54,NULL,NULL),
 ('7501030480778','Totopos',14.00,1,3,0,280.00,1,44,NULL,NULL),
 ('7501030496359','Nuevecitos',7.00,1,3,0,71.00,1,54,NULL,NULL),
 ('7501030498339','Tortillas de harina',9.00,1,3,0,245.00,1,82,NULL,NULL),
 ('7501030498667','Díamantes',10.00,1,3,0,110.00,1,54,NULL,NULL),
 ('7501032332037','Yoghurt con fresa',2.50,1,3,0,125.00,1,15,NULL,NULL),
 ('7501032332044','Yoghurt con durazno',2.50,1,3,0,125.00,1,15,NULL,NULL),
 ('7501032334000','Danup fresa',6.00,1,3,0,250.00,1,15,NULL,NULL),
 ('7501032334703','Danup piña coco',7.00,1,3,0,250.00,1,15,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501032339517','Yoghurt fresa',4.00,1,3,0,250.00,1,15,NULL,NULL),
 ('7501032339524','Yoghurt durazno',4.00,1,3,0,250.00,1,15,NULL,NULL),
 ('7501032346324','Activia con ciruela pasa',7.50,1,3,0,250.00,1,15,NULL,NULL),
 ('7501032389000','Crema ',6.50,1,3,0,200.00,1,15,NULL,NULL),
 ('7501032600624','Mantequilla sin sal',36.00,1,3,0,1.00,2,63,NULL,NULL),
 ('7501032600686','Mantequilla sin sal',7.00,1,3,0,90.00,1,63,NULL,NULL),
 ('7501032600839','Mantequilla sin sal',13.00,1,3,0,225.00,1,63,NULL,NULL),
 ('7501032601256','Caja de Amarillo',0.00,1,1,0,2.00,2,66,NULL,NULL),
 ('7501032604578','Naranjada',5.50,1,3,0,1.00,3,70,NULL,NULL),
 ('7501039400418','Jugo de Fresa',11.00,1,3,0,1.00,3,8,NULL,NULL),
 ('7501039400449','Jugo de Mango',11.00,1,3,0,1.00,3,8,NULL,NULL),
 ('7501039400456','Jugo de Manzana',11.00,1,3,0,1.00,3,8,NULL,NULL),
 ('7501039400470','Jugo de piña',11.00,1,3,0,1.00,3,8,NULL,NULL),
 ('7501040000270','Salchichas de Pavo',9.00,1,2,0,200.00,1,62,NULL,NULL),
 ('7501040003066','Paquete Salchicha Hotdog',36.00,1,2,0,0.00,2,62,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501040003660','Salchicha Viena',30.00,1,2,0,0.00,2,85,NULL,NULL),
 ('7501040008900','Salchicha Fud',36.00,1,2,0,1.00,2,62,NULL,NULL),
 ('7501040047084','Desebrada',25.00,1,3,0,500.00,1,29,NULL,NULL),
 ('7501040047138','Fajitas',25.00,1,3,0,500.00,1,29,NULL,NULL),
 ('7501040047398','Tiras de pollo',25.00,1,3,0,500.00,1,29,NULL,NULL),
 ('7501040090028','Yoghuhrt Naturl¡al 1L',25.00,1,3,0,1.00,3,65,NULL,NULL),
 ('7501040090042','Yoghurt con durazno',4.00,1,3,0,150.00,1,3,NULL,NULL),
 ('7501040090080','Yoghurt fresa 1L',25.00,1,3,0,1.00,3,65,NULL,NULL),
 ('7501040090141','Yoghurt Frutas y cereales',4.00,1,3,0,150.00,1,65,NULL,NULL),
 ('7501040090165','Yoghurt Frutas y cereales',25.00,1,3,0,1.00,3,65,NULL,NULL),
 ('7501040090707','Yoghurt natural',4.00,1,3,0,125.00,1,65,NULL,NULL),
 ('7501040091612','Crema ',14.50,1,3,0,400.00,4,65,NULL,NULL),
 ('7501040806100','Barra de amarillo',44.00,1,1,0,2.00,2,73,NULL,NULL),
 ('7501040807015','Queso fundido',20.00,1,3,0,1.00,2,69,NULL,NULL),
 ('7501040807152','Crema vegetal',13.00,1,3,0,1.00,2,69,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501040820069','Caja amarillo',79.20,1,1,0,1.80,2,68,NULL,NULL),
 ('7501041414885','Atún con verduras',11.50,1,3,0,155.00,1,56,NULL,NULL),
 ('7501045400013','Atún en aceite',9.00,1,3,0,170.00,1,42,NULL,NULL),
 ('7501045400044','Atún en aceite',10.00,1,3,0,170.00,1,18,NULL,NULL),
 ('7501045400068','Atun en agua',10.00,1,3,0,170.00,1,18,NULL,NULL),
 ('7501052420431','Frijoles Bayos Refritos',13.00,1,3,0,580.00,1,38,NULL,NULL),
 ('7501052424613','Frijoles Bayos Enteros',11.00,1,3,0,560.00,1,38,NULL,NULL),
 ('7501052470016','Aderezo Cesar',15.00,1,3,0,237.00,4,14,NULL,NULL),
 ('7501052470030','Aderezo Italiana',15.00,1,3,0,237.00,4,14,NULL,NULL),
 ('7501052473048','Salsa taquera',14.00,1,3,0,370.00,1,14,NULL,NULL),
 ('7501052473055','Salsa Ranchera',14.00,1,3,0,370.00,1,14,NULL,NULL),
 ('7501052474007','Mermelada Fresa',12.00,1,3,0,300.00,1,14,NULL,NULL),
 ('7501052476001','Chiles Rajas',6.50,1,3,0,220.00,1,14,NULL,NULL),
 ('7501052476018','Chiles Jalapeños en rajas',12.00,1,3,0,380.00,1,14,NULL,NULL),
 ('7501052476025','Chiles jalapeños en rajas',19.00,1,3,0,800.00,1,14,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501052476032','Chiles jalapeños en rajas',49.00,1,3,0,2.80,2,14,NULL,NULL),
 ('7501052476209','Chiles Jalapeños Enteros',5.50,1,3,0,220.00,1,14,NULL,NULL),
 ('7501052476223','Chiles jalapeños enteros',16.00,1,3,0,780.00,1,14,NULL,NULL),
 ('7501052476230','Chiles  jalapeños enteros',33.00,1,3,0,2.80,2,14,NULL,NULL),
 ('7501052476315','Chiles Chipotles',19.50,1,3,0,380.00,1,14,NULL,NULL),
 ('7501055300075','Refresco Lata',6.00,1,3,0,355.00,4,87,NULL,NULL),
 ('7501055303779','Fanta Naranja',6.00,1,3,0,600.00,4,88,NULL,NULL),
 ('7501055303786','Fresca 600',6.00,1,3,0,600.00,4,95,NULL,NULL),
 ('7501055303793','Manzana lift 600',6.00,1,3,0,600.00,4,93,NULL,NULL),
 ('7501055304653','Delaware punch',6.00,1,3,0,600.00,4,90,NULL,NULL),
 ('7501055304721','Agua Embotellada',8.00,1,3,0,1.50,3,89,NULL,NULL),
 ('7501055305629','Sprite 600',6.00,1,3,0,600.00,4,92,NULL,NULL),
 ('7501055307906','Agua embotellada',3.50,1,3,0,600.00,4,89,NULL,NULL),
 ('7501055307913','Manzanita lift',3.00,1,3,0,250.00,4,93,NULL,NULL),
 ('7501055308330','Senzao guarana',6.00,1,3,0,600.00,4,91,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501055309658','CocaCola mini',4.00,1,3,0,237.00,4,87,NULL,NULL),
 ('7501055316182','Fanta piña',10.00,1,3,0,1.00,3,88,NULL,NULL),
 ('7501055316731','Fanta tuti-fruti',10.00,1,3,0,2.50,3,88,NULL,NULL),
 ('7501055321889','Fanta limon',10.00,1,3,0,2.50,3,88,NULL,NULL),
 ('7501055330379','Valle pulpy con pulpa guayaba',3.50,1,3,0,200.00,4,60,NULL,NULL),
 ('7501055330409','Valle Frut con pulpa cango',3.50,1,3,0,200.00,4,60,NULL,NULL),
 ('7501055330461','Citrus punch',10.00,1,3,0,2.00,3,96,NULL,NULL),
 ('7501055330683','Citrus punch',5.00,1,3,0,500.00,5,96,NULL,NULL),
 ('7501055331635','Jugo de uva',3.00,1,3,0,200.00,4,60,NULL,NULL),
 ('7501055900022','Leche',11.50,1,3,0,1.00,3,3,NULL,NULL),
 ('7501055900039','Leche clasica 2000',12.50,1,3,0,1.00,3,3,NULL,NULL),
 ('7501055900121','Crema 1/4',7.00,1,3,0,200.00,4,3,NULL,NULL),
 ('7501055900336','Crema 1/2',14.50,1,3,0,450.00,1,3,NULL,NULL),
 ('7501055900343','Crema Litro',29.00,1,3,0,900.00,1,3,NULL,NULL),
 ('7501055901104','Yoghurt con fresa',4.00,1,3,0,150.00,1,3,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501055901111','Yoghurt con durazno',4.00,1,3,0,150.00,1,3,NULL,NULL),
 ('7501055901128','Yoghurt de manzana',4.00,1,3,0,150.00,1,3,NULL,NULL),
 ('7501055903924','Crema ligth',7.00,1,3,0,200.00,4,3,NULL,NULL),
 ('7501055903931','Crema ligth 1/2',14.50,1,3,0,450.00,4,3,NULL,NULL),
 ('7501059204102','Salsa inglesa',15.50,1,3,0,100.00,4,40,NULL,NULL),
 ('7501062700042','Chiles jalapeños enteros',5.50,1,3,0,210.00,1,35,NULL,NULL),
 ('7501062700141','Chiles Jalapeños en rajas',6.50,1,3,0,210.00,1,35,NULL,NULL),
 ('7501062700424','Chiles jalapeños enteros',19.00,1,3,0,800.00,1,35,NULL,NULL),
 ('7501062841028','Chiles gueros',16.50,1,3,0,400.00,1,35,NULL,NULL),
 ('7501072400154','Aceitunas',8.50,1,3,0,36.00,1,11,NULL,NULL),
 ('7501076110929','Atún en aceite',9.00,1,3,0,174.00,1,50,NULL,NULL),
 ('7501078509752','Coctel de frutas',20.00,1,3,0,480.00,1,36,NULL,NULL),
 ('7501078509806','Duraznos',18.00,1,3,0,220.00,1,36,NULL,NULL),
 ('7501078509813','Piña en almibar',18.00,1,3,0,800.00,1,36,NULL,NULL),
 ('7501078509820','Mangos en almibar',20.00,1,3,0,480.00,1,36,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7501083100012','Vinagre obscuro',7.50,1,3,0,750.00,4,6,NULL,NULL),
 ('7501083100029','Vinagre Blanco',7.50,1,3,0,750.00,4,6,NULL,NULL),
 ('7501162000035','Macarela Cocinada Salmon',22.00,1,3,0,425.00,1,20,NULL,NULL),
 ('75012175','Mayonesa',12.00,1,3,0,195.00,1,33,NULL,NULL),
 ('7501325702554','Salchicha Frankfurt de pavo',38.00,1,2,0,0.00,2,77,NULL,NULL),
 ('75014322','Catsup',10.00,1,3,0,390.00,1,16,NULL,NULL),
 ('7501518461213','Salchicha de pavo',38.00,1,2,0,2.30,2,71,NULL,NULL),
 ('7501594374766','Paq. Manchego',14.00,1,3,0,180.00,1,13,NULL,NULL),
 ('7501727500116','Piña 10 Rebanadas',18.00,1,3,0,800.00,1,2,NULL,NULL),
 ('7501728027032','Pimiento Morron',8.50,1,3,0,185.00,1,19,NULL,NULL),
 ('7501868722095','Aderezo de Mayonesa',42.50,1,3,0,3.80,2,59,NULL,NULL),
 ('7502005241059','Leche de Chocolate',5.50,1,3,0,250.00,4,61,NULL,NULL),
 ('7502005241066','Leche de fresa',5.50,1,3,0,200.00,4,61,NULL,NULL),
 ('7502007292219','Aceite de olivo',15.00,1,3,0,180.00,4,22,NULL,NULL),
 ('7502007295111','Aceitunas',16.50,1,3,0,250.00,1,51,NULL,NULL);
INSERT INTO `Producto` VALUES  ('7502209170582','Tocino aumado',52.00,1,2,0,0.00,2,76,NULL,NULL),
 ('7502213580704','Salchicha de pavo',38.00,1,2,0,1.60,2,72,NULL,NULL),
 ('7502213581367','Salchicha viena',24.00,1,3,0,0.00,2,86,NULL,NULL),
 ('7502217040556','Nutrileche',10.50,1,3,0,1.00,3,49,NULL,NULL),
 ('7502244820114','Piña',18.50,1,3,0,490.00,1,57,NULL,NULL),
 ('7503002190029','Aceite Vegetal',18.00,1,3,0,175.00,4,47,NULL,NULL),
 ('7503003951612','Duraznos en almibar',18.00,1,3,0,800.00,1,37,NULL,NULL),
 ('7503007109057','Maiz cocido',11.00,1,3,0,800.00,1,75,NULL,NULL),
 ('756702131732','Tostadas planas',8.50,1,3,0,148.00,1,78,NULL,NULL),
 ('756702132685','Tostada casera',10.00,1,3,0,220.00,1,78,NULL,NULL),
 ('758104000159','Agua',8.00,1,3,0,1.50,3,9,NULL,NULL),
 ('758104001712','Agua',5.00,1,3,0,600.00,4,9,NULL,NULL),
 ('758104100422','Agua',7.00,1,3,0,1.00,3,9,NULL,NULL),
 ('8850044011577','Piña',18.00,1,3,0,800.00,1,55,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;