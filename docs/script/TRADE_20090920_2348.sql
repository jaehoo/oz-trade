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
-- Definition of table `trade`.`Marca`
--

DROP TABLE IF EXISTS `trade`.`Marca`;
CREATE TABLE  `trade`.`Marca` (
  `idMarca` int(10) NOT NULL auto_increment,
  `descripcion` varchar(120) NOT NULL,
  PRIMARY KEY  (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1 COMMENT='Tabla con las descripciones de las marcas';

--
-- Dumping data for table `trade`.`Marca`
--

/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
LOCK TABLES `Marca` WRITE;
INSERT INTO `trade`.`Marca` VALUES  (1,'Sin Marca'),
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
INSERT INTO `trade`.`Marca` VALUES  (56,'Tuny'),
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
-- Definition of table `trade`.`Producto`
--

DROP TABLE IF EXISTS `trade`.`Producto`;
CREATE TABLE  `trade`.`Producto` (
  `idProducto` varchar(150) NOT NULL default '',
  `nombre` varchar(150) default NULL,
  `precioUnitario` double(10,2) default NULL,
  `costoUnitario` double(10,2) default NULL,
  `tipoRegistro` tinyint(1) default NULL,
  `tipoProducto` int(10) NOT NULL default '1',
  `contenido` double(10,2) default NULL,
  `tipoContenido` int(10) NOT NULL default '1',
  `marca` varchar(150) default NULL,
  `idMarca` int(10) NOT NULL default '1',
  `fechaActualizacion` date default NULL,
  `fechaModificacion` date default NULL,
  PRIMARY KEY  (`idProducto`),
  KEY `idx_idMarca` (`idMarca`),
  KEY `idx_idTipoContenido` (`tipoContenido`),
  KEY `idx_idTipoProducto` (`tipoProducto`),
  KEY `fk_idMarca` (`idMarca`),
  KEY `fk_idTipoContenido` (`tipoContenido`),
  KEY `fk_idTipoProducto` (`tipoProducto`),
  CONSTRAINT `fk_idMarca` FOREIGN KEY (`idMarca`) REFERENCES `Marca` (`idMarca`),
  CONSTRAINT `fk_idTipoContenido` FOREIGN KEY (`tipoContenido`) REFERENCES `TipoContenido` (`idContenido`),
  CONSTRAINT `fk_idTipoProducto` FOREIGN KEY (`tipoProducto`) REFERENCES `TipoProducto` (`idTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB; (`idMarca`) REFER `trade/Marca`(`idMa';

--
-- Dumping data for table `trade`.`Producto`
--

/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
LOCK TABLES `Producto` WRITE;
INSERT INTO `trade`.`Producto` VALUES  ('027000384954','Salsa Barbecue',16.00,0.00,1,3,612.00,1,'Hunts',32,NULL,NULL),
 ('028571008560','Duraznos en almibar',18.00,0.00,1,3,500.00,1,'Flor de California',26,NULL,NULL),
 ('032239052017','Jugo de durazno',7.50,0.00,1,3,413.00,4,NULL,60,NULL,NULL),
 ('032239052024','Jugo de manzana',7.50,0.00,1,3,413.00,4,NULL,60,NULL,NULL),
 ('032239058118','Jugo de mango',4.00,0.00,1,3,200.00,4,NULL,60,NULL,NULL),
 ('032239058125','Jugo de manzana Amarilla',4.00,0.00,1,3,200.00,4,NULL,60,NULL,NULL),
 ('032239058149','Jugo de durazno',4.00,0.00,1,3,200.00,4,NULL,60,NULL,NULL),
 ('032239058156','Jugo de Manzana',3.00,0.00,1,3,200.00,4,NULL,60,NULL,NULL),
 ('041789001864','Sopa Camaron Limon Habanero',5.00,0.00,1,3,46.00,1,'Maruchan',41,NULL,NULL),
 ('041789001918','Sopa Pollo',5.00,0.00,1,3,64.00,1,'Maruchan',41,NULL,NULL),
 ('041789001956','Sopa con camaron',5.00,0.00,1,3,64.00,1,'Maruchan',41,NULL,NULL),
 ('041789001987','Sopa Camaron con Chile piquin',5.00,0.00,1,3,64.00,1,'Maruchan',41,NULL,NULL),
 ('07503007001832','Piña',18.00,0.00,1,3,800.00,1,'HerFruit',31,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('097339000054','Salsa picante',6.00,0.00,1,3,370.00,1,'Valentina',58,NULL,NULL),
 ('605388002327','Catsup',42.30,0.00,1,3,3.80,2,'Bakers & Chefs',5,NULL,NULL),
 ('633148100013','Tajin clasico',14.50,0.00,1,3,142.00,1,'Tajin',53,NULL,NULL),
 ('661953299035','Atún en aceite',9.00,0.00,1,3,170.00,1,'atunsito',4,NULL,NULL),
 ('681131003445','Chiles jalapeños rodajas',44.00,0.00,1,3,2.80,2,'Bakers & Chefs',5,NULL,NULL),
 ('681131698504','Mostaza',49.00,0.00,1,3,3.78,2,'Bakers & Chefs',5,NULL,NULL),
 ('7000000000003','Maiz cocido',9.00,0.00,1,3,850.00,1,NULL,74,NULL,NULL),
 ('700016001502','Mermelada',19.00,0.00,1,3,510.00,1,'Dolche',17,NULL,NULL),
 ('711719810322','game',1.00,0.00,1,4,1.00,5,NULL,1,NULL,NULL),
 ('731082007112','Sardinas',11.00,0.00,1,3,120.00,1,NULL,84,NULL,NULL),
 ('75001759','Jugo de mango',4.00,0.00,1,3,250.00,4,NULL,8,NULL,NULL),
 ('75001773','Jugo de guayaba',4.00,0.00,1,3,250.00,4,NULL,8,NULL,NULL),
 ('75001797','Jugo de manzana',4.00,0.00,1,3,250.00,4,NULL,8,NULL,NULL),
 ('75004330','Salchichas tipo viena',9.00,0.00,1,2,200.00,1,NULL,62,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('75007614','Cocacola 600',7.50,0.00,1,3,600.00,4,NULL,87,NULL,NULL),
 ('7501000100996','Pan Blanco Grande',20.00,0.00,1,3,567.00,1,NULL,81,NULL,NULL),
 ('7501000101009','SuperPan Leche y ajonjolí',23.00,0.00,1,3,680.00,1,NULL,81,NULL,NULL),
 ('7501000101078','Pan integral 100%',22.00,0.00,1,3,680.00,1,NULL,81,NULL,NULL),
 ('7501000101252','Bollos con ajonjoli',20.00,0.00,1,3,450.00,1,NULL,81,NULL,NULL),
 ('7501000103034','Patelito',5.00,0.00,1,3,55.00,1,NULL,83,NULL,NULL),
 ('7501000103065','Chocotorro',5.00,0.00,1,3,50.00,1,NULL,81,NULL,NULL),
 ('7501000103195','Tuinky Vainilla',6.00,0.00,1,3,76.00,1,NULL,81,NULL,NULL),
 ('7501000103225','Tuinky fresa',6.00,0.00,1,3,76.00,1,NULL,81,NULL,NULL),
 ('7501000103577','Panitos chocolate',7.00,0.00,1,3,30.00,1,NULL,81,NULL,NULL),
 ('7501000106936','Tostadas planas',10.00,0.00,1,3,175.00,1,NULL,44,NULL,NULL),
 ('7501000111091','Pan blanco chico',13.00,0.00,1,3,360.00,1,NULL,7,NULL,NULL),
 ('7501000111251','Tortillinas 10 pza.',10.00,0.00,1,3,245.00,1,NULL,54,NULL,NULL),
 ('7501000111466','Pan Integral Grande',24.00,0.00,1,3,670.00,1,NULL,7,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501000111800','Pan tostado blanco',13.00,0.00,1,3,210.00,1,NULL,7,NULL,NULL),
 ('7501000111855','Pan Molido',8.00,0.00,1,3,210.00,1,'BIMBO',7,NULL,NULL),
 ('7501000125050','Minibigotes Chocolate',7.00,0.00,1,3,65.00,1,NULL,54,NULL,NULL),
 ('7501000130306','Pan tostado blanco',13.00,0.00,1,3,180.00,1,NULL,81,NULL,NULL),
 ('7501000139699','Pan Integral 100% ajonjolí',24.00,0.00,1,3,680.00,1,NULL,81,NULL,NULL),
 ('7501000142200','Bigotes',6.00,0.00,1,3,60.00,1,NULL,54,NULL,NULL),
 ('7501000142347','MiniDoraditas',3.50,0.00,1,3,45.00,1,NULL,81,NULL,NULL),
 ('7501000142705','Cuernitos',8.00,0.00,1,3,100.00,1,NULL,54,NULL,NULL),
 ('7501000142804','Doraditas',7.00,0.00,1,3,147.00,1,NULL,54,NULL,NULL),
 ('7501000143047','Mantecadas Chocolate',8.00,0.00,1,3,95.00,1,NULL,81,NULL,NULL),
 ('7501000149100','Pan Molido Crujiente',8.00,0.00,1,3,175.00,1,'BIMBO',7,NULL,NULL),
 ('7501000149469','Polvorón',3.00,0.00,1,3,65.00,1,'Tia Rosa',54,NULL,NULL),
 ('7501000301799','Pan Tostado CeroCero',14.00,0.00,1,3,200.00,1,NULL,81,NULL,NULL),
 ('7501000306657','Base para pizza',16.00,0.00,1,3,345.00,1,NULL,80,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501000332564','Orejas',6.50,0.00,1,3,0.00,1,NULL,54,NULL,NULL),
 ('7501000664221','Saladitas',6.50,0.00,1,3,186.00,1,'Gamesa',27,NULL,NULL),
 ('7501001600105','La Lechera',13.50,0.00,1,3,397.00,1,'Nestle',48,NULL,NULL),
 ('7501001600426','Media Crema',11.50,0.00,1,3,225.00,1,'Nestle',48,NULL,NULL),
 ('7501001604103','Jugo Maggi',21.50,0.00,1,3,100.00,4,'Maggi',40,NULL,NULL),
 ('7501001604318','Salsa inglesa',17.50,0.00,1,3,145.00,4,NULL,79,NULL,NULL),
 ('7501002615122','Philadelphia queso crema',21.50,0.00,1,3,190.00,1,NULL,33,NULL,NULL),
 ('7501003124135','Chicharos',4.50,0.00,1,3,200.00,1,'Herdez',30,NULL,NULL),
 ('7501003124166','Chicharos con zanahoria',5.50,0.00,1,3,225.00,1,'Herdez',30,NULL,NULL),
 ('7501003124180','Chicharosn con zanahoria',9.50,0.00,1,3,400.00,1,'Herdez',30,NULL,NULL),
 ('7501003124241','Granos de elote',11.00,0.00,1,3,400.00,1,'Herdez',30,NULL,NULL),
 ('7501003124272','Garbanzos',9.00,0.00,1,3,400.00,1,'Herdez',30,NULL,NULL),
 ('7501003124333','Ensalada de legumbres',6.00,0.00,1,3,220.00,1,'Herdez',30,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501003124340','Ensalada de legumbres',10.00,0.00,1,3,400.00,1,'Herdez',30,NULL,NULL),
 ('7501003129185','Atún en agua',10.00,0.00,1,3,170.00,1,'Herdez',30,NULL,NULL),
 ('7501003150233','Mole',19.50,0.00,1,3,235.00,1,'Doña Maria',21,NULL,NULL),
 ('7501003335012','Mostaza',5.50,0.00,1,3,115.00,1,'McCormick',43,NULL,NULL),
 ('7501003335029','Mostaza',6.50,0.00,1,3,210.00,1,'McCormick',43,NULL,NULL),
 ('7501003336125','Mermelada Fresa',12.00,0.00,1,3,270.00,1,'McCormick',43,NULL,NULL),
 ('7501003336323','Mermelada Piña',12.00,0.00,1,3,270.00,1,'McCormick',43,NULL,NULL),
 ('7501003336422','Mermelada Naranja',12.00,0.00,1,3,270.00,1,'McCormick',43,NULL,NULL),
 ('7501003340115','Mayonensa',7.50,0.00,1,3,105.00,1,'McCormick',43,NULL,NULL),
 ('7501003340122','Mayonesa',11.00,0.00,1,3,190.00,1,'McCormick',43,NULL,NULL),
 ('7501003340139','Mayonesa',22.00,0.00,1,3,390.00,1,'McCormick',43,NULL,NULL),
 ('7501003340146','Mayonesa',37.50,0.00,1,3,790.00,1,'McCormick',43,NULL,NULL),
 ('7501003340160','Mayonesa',115.00,0.00,1,3,3.40,2,'McCormick',43,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501003340467','Mayonesa',23.00,0.00,1,3,507.00,1,NULL,43,NULL,NULL),
 ('7501003390417','Aceitunas',8.50,0.00,1,3,150.00,1,'Búfalo',10,NULL,NULL),
 ('7501003398239','Salsa picante polvo',6.00,0.00,1,3,160.00,1,'Búfalo',10,NULL,NULL),
 ('7501005108096','Mantequilla con sal',7.00,0.00,1,3,90.00,1,NULL,64,NULL,NULL),
 ('7501006536942','Granos de elote',7.00,0.00,1,3,130.00,1,'Del Monte',16,NULL,NULL),
 ('7501007809205','Atún en aceite y agua',9.00,0.00,1,3,170.00,1,'excelsior',24,NULL,NULL),
 ('7501010758125','Mermelada',19.00,0.00,1,3,500.00,1,'Golden Hills',28,NULL,NULL),
 ('7501011323278','Crema Champiñones',26.00,0.00,1,3,735.00,1,'Campbells',12,NULL,NULL),
 ('7501011361492','Crema Elote',16.50,0.00,1,3,430.00,1,'Campbells',12,NULL,NULL),
 ('7501011909281','Chiles Chipotles',19.50,0.00,1,3,380.00,1,'FARO',25,NULL,NULL),
 ('7501013620085','Margarina azul',28.00,0.00,1,3,1.00,2,NULL,67,NULL,NULL),
 ('7501017003020','Chiles jalapeños en rajas',19.50,0.00,1,3,800.00,1,'La Costeña',34,NULL,NULL),
 ('7501017004003','Chiles Jalapeños enteros',9.00,0.00,1,3,380.00,1,'La Costeña',34,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501017004270','Frijoles Bayos Refritos',13.00,0.00,1,3,580.00,1,'La Costeña',34,NULL,NULL),
 ('7501017004423','Frijoles negros refritos',13.00,0.00,1,3,580.00,1,'La Costeña',34,NULL,NULL),
 ('7501017005000','Chiles Jalapeños',5.50,0.00,1,3,220.00,1,'La Costeña',34,NULL,NULL),
 ('7501017005017','Chiles Serranos',6.00,0.00,1,3,220.00,1,'La Costeña',34,NULL,NULL),
 ('7501017005024','Chiles Rajas',6.50,0.00,1,3,220.00,1,'La Costeña',34,NULL,NULL),
 ('7501017005031','Chiles Chipotles',12.00,0.00,1,3,220.00,1,'La Costeña',34,NULL,NULL),
 ('7501017005765','Chiles picados',7.50,0.00,1,3,220.00,1,'La Costeña',34,NULL,NULL),
 ('7501017006014','Chiles jalapeños rajas',4.00,0.00,1,3,105.00,1,'La Costeña',34,NULL,NULL),
 ('7501017006021','Chiles chipotles ',6.00,0.00,1,3,105.00,1,'La Costeña',34,NULL,NULL),
 ('7501017040506','Mayonesa',22.00,0.00,1,3,385.00,1,'La Costeña',34,NULL,NULL),
 ('7501017041053','Frijoles Negros Enteros',8.50,0.00,1,3,425.00,1,'La Costeña',34,NULL,NULL),
 ('7501017041206','Crema Elote',15.00,0.00,1,3,430.00,1,'La Costeña',34,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501017050215','Mayonesa',12.00,0.00,1,3,190.00,1,'La Costeña',34,NULL,NULL),
 ('7501018203849','Catsup',15.00,0.00,1,3,1.00,2,'Embasa',23,NULL,NULL),
 ('7501020511451','Crema',14.50,0.00,1,0,450.00,4,'LALA',39,NULL,NULL),
 ('7501020511468','Crema',29.00,0.00,1,3,1.00,3,'LALA',39,NULL,NULL),
 ('7501020512373','Crema',108.00,0.00,1,3,4.00,3,'LALA',39,NULL,NULL),
 ('7501020513134','Crema',7.00,0.00,1,3,200.00,4,'LALA',39,NULL,NULL),
 ('7501020515350','Leche light',12.50,0.00,1,3,1.00,3,'LALA',39,NULL,NULL),
 ('7501020515398','Leche Vive',14.50,0.00,1,3,1.00,3,'LALA',39,NULL,NULL),
 ('7501020526066','Leche',11.50,0.00,1,3,1.00,3,'LALA',39,NULL,NULL),
 ('7501023314028','Chiles gueros',17.50,0.00,1,3,400.00,1,'San Marcos',52,NULL,NULL),
 ('7501023318033','Chiles Chipotles',19.50,0.00,1,3,380.00,1,'San Marcos',52,NULL,NULL),
 ('7501023318040','Chiles Chipotles',12.00,0.00,1,3,215.00,1,'San Marcos',52,NULL,NULL),
 ('7501023318057','Chiles Chipotles',6.00,0.00,1,3,100.00,1,'San Marcos',52,NULL,NULL),
 ('7501023602002','Atún en aceite',9.00,0.00,1,3,170.00,1,'NAIR',46,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501023602057','Atún en aceite',95.00,0.00,1,3,1.35,2,'NAIR',46,NULL,NULL),
 ('7501023602064','Atun en agua',95.00,0.00,1,3,1.35,2,'NAIR',46,NULL,NULL),
 ('7501024002085','Champiñones rebanados',15.50,0.00,1,3,380.00,1,'Monteblanco',45,NULL,NULL),
 ('7501024203246','Margarina sin sal',15.00,0.00,1,3,190.00,1,NULL,64,NULL,NULL),
 ('7501030428695','Galleta de avena',4.00,0.00,1,3,54.00,3,'Tia Rosa',54,NULL,NULL),
 ('7501030442387','Pan Integral Blanco',24.00,0.00,1,3,680.00,1,NULL,81,NULL,NULL),
 ('7501030471240','Semitas',10.00,0.00,1,3,120.00,1,NULL,54,NULL,NULL),
 ('7501030480778','Totopos',14.00,0.00,1,3,280.00,1,'Milpa Real',44,NULL,NULL),
 ('7501030496359','Nuevecitos',7.00,0.00,1,3,71.00,1,NULL,54,NULL,NULL),
 ('7501030498339','Tortillas de harina',9.00,0.00,1,3,245.00,1,NULL,82,NULL,NULL),
 ('7501030498667','Díamantes',10.00,0.00,1,3,110.00,1,NULL,54,NULL,NULL),
 ('7501032332037','Yoghurt con fresa',2.50,0.00,1,3,125.00,1,NULL,15,NULL,NULL),
 ('7501032332044','Yoghurt con durazno',2.50,0.00,1,3,125.00,1,NULL,15,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501032334000','Danup fresa',6.00,0.00,1,3,250.00,1,NULL,15,NULL,NULL),
 ('7501032334703','Danup piña coco',7.00,0.00,1,3,250.00,1,NULL,15,NULL,NULL),
 ('7501032339517','Yoghurt fresa',4.00,0.00,1,3,250.00,1,NULL,15,NULL,NULL),
 ('7501032339524','Yoghurt durazno',4.00,0.00,1,3,250.00,1,NULL,15,NULL,NULL),
 ('7501032346324','Activia con ciruela pasa',7.50,0.00,1,3,250.00,1,NULL,15,NULL,NULL),
 ('7501032389000','Crema ',6.50,0.00,1,3,200.00,1,'Danone',15,NULL,NULL),
 ('7501032600624','Mantequilla sin sal',36.00,0.00,1,3,1.00,2,NULL,63,NULL,NULL),
 ('7501032600686','Mantequilla sin sal',7.00,0.00,1,3,90.00,1,NULL,63,NULL,NULL),
 ('7501032600839','Mantequilla sin sal',13.00,0.00,1,3,225.00,1,NULL,63,NULL,NULL),
 ('7501032601256','Caja de Amarillo',0.00,0.00,1,1,2.00,2,NULL,66,NULL,NULL),
 ('7501032604578','Naranjada',5.50,0.00,1,3,1.00,3,NULL,70,NULL,NULL),
 ('7501039400418','Jugo de Fresa',11.00,0.00,1,3,1.00,3,'Boing',8,NULL,NULL),
 ('7501039400449','Jugo de Mango',11.00,0.00,1,3,1.00,3,'Boing',8,NULL,NULL),
 ('7501039400456','Jugo de Manzana',11.00,0.00,1,3,1.00,3,'Boing',8,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501039400470','Jugo de piña',11.00,0.00,1,3,1.00,3,'Boing',8,NULL,NULL),
 ('7501040000270','Salchichas de Pavo',9.00,0.00,1,2,200.00,1,NULL,62,NULL,NULL),
 ('7501040003066','Paquete Salchicha Hotdog',36.00,0.00,1,2,0.00,2,NULL,62,NULL,NULL),
 ('7501040003660','Salchicha Viena',30.00,0.00,1,2,0.00,2,NULL,85,NULL,NULL),
 ('7501040008900','Salchicha Fud',36.00,0.00,1,2,1.00,2,NULL,62,NULL,NULL),
 ('7501040047084','Desebrada',25.00,0.00,1,3,500.00,1,'GUTEN',29,NULL,NULL),
 ('7501040047138','Fajitas',25.00,0.00,1,3,500.00,1,'Guten',29,NULL,NULL),
 ('7501040047398','Tiras de pollo',25.00,0.00,1,3,500.00,1,NULL,29,NULL,NULL),
 ('7501040090028','Yoghuhrt Naturl¡al 1L',25.00,0.00,1,3,1.00,3,NULL,65,NULL,NULL),
 ('7501040090042','Yoghurt con durazno',4.00,0.00,1,3,150.00,1,NULL,3,NULL,NULL),
 ('7501040090080','Yoghurt fresa 1L',25.00,0.00,1,3,1.00,3,NULL,65,NULL,NULL),
 ('7501040090141','Yoghurt Frutas y cereales',4.00,0.00,1,3,150.00,1,NULL,65,NULL,NULL),
 ('7501040090165','Yoghurt Frutas y cereales',25.00,0.00,1,3,1.00,3,NULL,65,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501040090707','Yoghurt natural',4.00,0.00,1,3,125.00,1,NULL,65,NULL,NULL),
 ('7501040091612','Crema ',14.50,0.00,1,3,400.00,4,NULL,65,NULL,NULL),
 ('7501040806100','Barra de amarillo',44.00,0.00,1,1,2.00,2,NULL,73,NULL,NULL),
 ('7501040807015','Queso fundido',20.00,0.00,1,3,1.00,2,NULL,69,NULL,NULL),
 ('7501040807152','Crema vegetal',13.00,0.00,1,3,1.00,2,NULL,69,NULL,NULL),
 ('7501040820069','Caja amarillo',79.20,0.00,1,1,1.80,2,NULL,68,NULL,NULL),
 ('7501041414885','Atún con verduras',11.50,0.00,1,3,155.00,1,'Tuny',56,NULL,NULL),
 ('7501045400013','Atún en aceite',9.00,0.00,1,3,170.00,1,'MazAtún',42,NULL,NULL),
 ('7501045400044','Atún en aceite',10.00,0.00,1,3,170.00,1,'Dolores',18,NULL,NULL),
 ('7501045400068','Atun en agua',10.00,0.00,1,3,170.00,1,'Dolores',18,NULL,NULL),
 ('7501052420431','Frijoles Bayos Refritos',13.00,0.00,1,3,580.00,1,'La Sierra',38,NULL,NULL),
 ('7501052424613','Frijoles Bayos Enteros',11.00,0.00,1,3,560.00,1,'La Sierra',38,NULL,NULL),
 ('7501052470016','Aderezo Cesar',15.00,0.00,1,3,237.00,4,'Clemente Jacques',14,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501052470030','Aderezo Italiana',15.00,0.00,1,3,237.00,4,'Clemente Jacques',14,NULL,NULL),
 ('7501052473048','Salsa taquera',14.00,0.00,1,3,370.00,1,'Clemente Jacques',14,NULL,NULL),
 ('7501052473055','Salsa Ranchera',14.00,0.00,1,3,370.00,1,'Clemente Jacques',14,NULL,NULL),
 ('7501052474007','Mermelada Fresa',12.00,0.00,1,3,300.00,1,'Clemente Jacques',14,NULL,NULL),
 ('7501052476001','Chiles Rajas',6.50,0.00,1,3,220.00,1,'Clemente Jacques',14,NULL,NULL),
 ('7501052476018','Chiles Jalapeños en rajas',12.00,0.00,1,3,380.00,1,'Clemente Jacques',14,NULL,NULL),
 ('7501052476025','Chiles jalapeños en rajas',19.00,0.00,1,3,800.00,1,'Clemente Jacques',14,NULL,NULL),
 ('7501052476032','Chiles jalapeños en rajas',49.00,0.00,1,3,2.80,2,'Clemente Jacques',14,NULL,NULL),
 ('7501052476209','Chiles Jalapeños Enteros',5.50,0.00,1,3,220.00,1,'Clemente Jacques',14,NULL,NULL),
 ('7501052476223','Chiles jalapeños enteros',16.00,0.00,1,3,780.00,1,'Clemente Jacques',14,NULL,NULL),
 ('7501052476230','Chiles  jalapeños enteros',33.00,0.00,1,3,2.80,2,'Clemente Jacques',14,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501052476315','Chiles Chipotles',19.50,0.00,1,3,380.00,1,'CLemente Jacques',14,NULL,NULL),
 ('7501055300075','Refresco Lata',6.00,0.00,1,3,355.00,4,NULL,87,NULL,NULL),
 ('7501055303779','Fanta Naranja',6.00,0.00,1,3,600.00,4,NULL,88,NULL,NULL),
 ('7501055303786','Fresca 600',6.00,0.00,1,3,600.00,4,NULL,95,NULL,NULL),
 ('7501055303793','Manzana lift 600',6.00,0.00,1,3,600.00,4,NULL,93,NULL,NULL),
 ('7501055304653','Delaware punch',6.00,0.00,1,3,600.00,4,NULL,90,NULL,NULL),
 ('7501055304721','Agua Embotellada',8.00,0.00,1,3,1.50,3,NULL,89,NULL,NULL),
 ('7501055305629','Sprite 600',6.00,0.00,1,3,600.00,4,NULL,92,NULL,NULL),
 ('7501055307906','Agua embotellada',3.50,0.00,1,3,600.00,4,NULL,89,NULL,NULL),
 ('7501055307913','Manzanita lift',3.00,0.00,1,3,250.00,4,NULL,93,NULL,NULL),
 ('7501055308330','Senzao guarana',6.00,0.00,1,3,600.00,4,NULL,91,NULL,NULL),
 ('7501055309658','CocaCola mini',4.00,0.00,1,3,237.00,4,NULL,87,NULL,NULL),
 ('7501055316182','Fanta piña',10.00,0.00,1,3,1.00,3,NULL,88,NULL,NULL),
 ('7501055316731','Fanta tuti-fruti',10.00,0.00,1,3,2.50,3,NULL,88,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501055321889','Fanta limon',10.00,0.00,1,3,2.50,3,NULL,88,NULL,NULL),
 ('7501055330379','Valle pulpy con pulpa guayaba',3.50,0.00,1,3,200.00,4,NULL,60,NULL,NULL),
 ('7501055330409','Valle Frut con pulpa cango',3.50,0.00,1,3,200.00,4,NULL,60,NULL,NULL),
 ('7501055330461','Citrus punch',10.00,0.00,1,3,2.00,3,NULL,96,NULL,NULL),
 ('7501055330683','Citrus punch',5.00,0.00,1,3,500.00,5,NULL,96,NULL,NULL),
 ('7501055331635','Jugo de uva',3.00,0.00,1,3,200.00,4,NULL,60,NULL,NULL),
 ('7501055900022','Leche',11.50,0.00,1,3,1.00,3,'Alpura',3,NULL,NULL),
 ('7501055900039','Leche clasica 2000',12.50,0.00,1,3,1.00,3,'Alpura',3,NULL,NULL),
 ('7501055900121','Crema 1/4',7.00,0.00,1,3,200.00,4,NULL,3,NULL,NULL),
 ('7501055900336','Crema 1/2',14.50,0.00,1,3,450.00,1,NULL,3,NULL,NULL),
 ('7501055900343','Crema Litro',29.00,0.00,1,3,900.00,1,NULL,3,NULL,NULL),
 ('7501055901104','Yoghurt con fresa',4.00,0.00,1,3,150.00,1,NULL,3,NULL,NULL),
 ('7501055901111','Yoghurt con durazno',4.00,0.00,1,3,150.00,1,NULL,3,NULL,NULL),
 ('7501055901128','Yoghurt de manzana',4.00,0.00,1,3,150.00,1,NULL,3,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501055903924','Crema ligth',7.00,0.00,1,3,200.00,4,NULL,3,NULL,NULL),
 ('7501055903931','Crema ligth 1/2',14.50,0.00,1,3,450.00,4,NULL,3,NULL,NULL),
 ('7501059204102','Salsa inglesa',15.50,0.00,1,3,100.00,4,NULL,40,NULL,NULL),
 ('7501062700042','Chiles jalapeños enteros',5.50,0.00,1,3,210.00,1,'La Morena',35,NULL,NULL),
 ('7501062700141','Chiles Jalapeños en rajas',6.50,0.00,1,3,210.00,1,'La Morena',35,NULL,NULL),
 ('7501062700424','Chiles jalapeños enteros',19.00,0.00,1,3,800.00,1,'La Morena',35,NULL,NULL),
 ('7501062841028','Chiles gueros',16.50,0.00,1,3,400.00,1,'La Morena',35,NULL,NULL),
 ('7501072400154','Aceitunas',8.50,0.00,1,3,36.00,1,'California Stars',11,NULL,NULL),
 ('7501076110929','Atún en aceite',9.00,0.00,1,3,174.00,1,'OLA',50,NULL,NULL),
 ('7501078509752','Coctel de frutas',20.00,0.00,1,3,480.00,1,'La Pasiega',36,NULL,NULL),
 ('7501078509806','Duraznos',18.00,0.00,1,3,220.00,1,'La Pasiega',36,NULL,NULL),
 ('7501078509813','Piña en almibar',18.00,0.00,1,3,800.00,1,'La Pasiega',36,NULL,NULL),
 ('7501078509820','Mangos en almibar',20.00,0.00,1,3,480.00,1,'La Pasiega',36,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501083100012','Vinagre obscuro',7.50,0.00,1,3,750.00,4,'BARRILITO',6,NULL,NULL),
 ('7501083100029','Vinagre Blanco',7.50,0.00,1,3,750.00,4,'BARRILITO',6,NULL,NULL),
 ('7501162000035','Macarela Cocinada Salmon',22.00,0.00,1,3,425.00,1,'DON EFE',20,NULL,NULL),
 ('75012175','Mayonesa',12.00,0.00,1,3,195.00,1,'Kraft',33,NULL,NULL),
 ('7501325702554','Salchicha Frankfurt de pavo',38.00,0.00,1,2,0.00,2,NULL,77,NULL,NULL),
 ('75014322','Catsup',10.00,0.00,1,3,390.00,1,'Del Monte',16,NULL,NULL),
 ('7501518461213','Salchicha de pavo',38.00,0.00,1,2,2.30,2,NULL,71,NULL,NULL),
 ('7501594374766','Paq. Manchego',14.00,0.00,1,3,180.00,1,'CHEN',13,NULL,NULL),
 ('7501727500116','Piña 10 Rebanadas',18.00,0.00,1,3,800.00,1,'Agrover',2,NULL,NULL),
 ('7501728027032','Pimiento Morron',8.50,0.00,1,3,185.00,1,'Don Agustin',19,NULL,NULL),
 ('7501868722095','Aderezo de Mayonesa',42.50,0.00,1,3,3.80,2,'VENECIA',59,NULL,NULL),
 ('7502005241059','Leche de Chocolate',5.50,0.00,1,3,250.00,4,NULL,61,NULL,NULL),
 ('7502005241066','Leche de fresa',5.50,0.00,1,3,200.00,4,NULL,61,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7502007292219','Aceite de olivo',15.00,0.00,1,3,180.00,4,'El Olivo',22,NULL,NULL),
 ('7502007295111','Aceitunas',16.50,0.00,1,3,250.00,1,'San Lucas',51,NULL,NULL),
 ('7502209170582','Tocino aumado',52.00,0.00,1,2,0.00,2,NULL,76,NULL,NULL),
 ('7502213580704','Salchicha de pavo',38.00,0.00,1,2,1.60,2,NULL,72,NULL,NULL),
 ('7502213581367','Salchicha viena',24.00,0.00,1,3,0.00,2,NULL,86,NULL,NULL),
 ('7502217040556','Nutrileche',10.50,0.00,1,3,1.00,3,'Nutrileche',49,NULL,NULL),
 ('7502244820114','Piña',18.50,0.00,1,3,490.00,1,'Valdepeñas',57,NULL,NULL),
 ('7503002190029','Aceite Vegetal',18.00,0.00,1,3,175.00,4,'Navarra',47,NULL,NULL),
 ('7503003951612','Duraznos en almibar',18.00,0.00,1,3,800.00,1,'La Prateria',37,NULL,NULL),
 ('7503007109057','Maiz cocido',11.00,0.00,1,3,800.00,1,NULL,75,NULL,NULL),
 ('756702131732','Tostadas planas',8.50,0.00,1,3,148.00,1,NULL,78,NULL,NULL),
 ('756702132685','Tostada casera',10.00,0.00,1,3,220.00,1,NULL,78,NULL,NULL),
 ('758104000159','Agua',8.00,0.00,1,3,1.50,3,'Bonafont',9,NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('758104001712','Agua',5.00,0.00,1,3,600.00,4,'Bonafont',9,NULL,NULL),
 ('758104100422','Agua',7.00,0.00,1,3,1.00,3,'Bonafont',9,NULL,NULL),
 ('8850044011577','Piña',18.00,0.00,1,3,800.00,1,'TropFrut',55,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;


--
-- Definition of table `trade`.`TipoContenido`
--

DROP TABLE IF EXISTS `trade`.`TipoContenido`;
CREATE TABLE  `trade`.`TipoContenido` (
  `idContenido` int(10) NOT NULL auto_increment,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY  (`idContenido`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='Almacena la unidad de medida del contenido de los productos';

--
-- Dumping data for table `trade`.`TipoContenido`
--

/*!40000 ALTER TABLE `TipoContenido` DISABLE KEYS */;
LOCK TABLES `TipoContenido` WRITE;
INSERT INTO `trade`.`TipoContenido` VALUES  (1,'gr. gramos'),
 (2,'Kg. Kilos'),
 (3,'Lt. Litros'),
 (4,'ml. Mililitros'),
 (5,'Pza. Piezas'),
 (6,'Oz. Onzas'),
 (7,'Otro');
UNLOCK TABLES;
/*!40000 ALTER TABLE `TipoContenido` ENABLE KEYS */;


--
-- Definition of table `trade`.`TipoProducto`
--

DROP TABLE IF EXISTS `trade`.`TipoProducto`;
CREATE TABLE  `trade`.`TipoProducto` (
  `idTipoProducto` int(10) NOT NULL auto_increment,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY  (`idTipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Descripción del tipo de producto';

--
-- Dumping data for table `trade`.`TipoProducto`
--

/*!40000 ALTER TABLE `TipoProducto` DISABLE KEYS */;
LOCK TABLES `TipoProducto` WRITE;
INSERT INTO `trade`.`TipoProducto` VALUES  (1,'Quesos'),
 (2,'Carnes Frias'),
 (3,'Cremeria y Abarrotes'),
 (4,'Otros');
UNLOCK TABLES;
/*!40000 ALTER TABLE `TipoProducto` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
