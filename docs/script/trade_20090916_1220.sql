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
CREATE TABLE  `trade`.`Producto` (
  `idProducto` varchar(150) NOT NULL default '',
  `nombre` varchar(150) default NULL,
  `precioUnitario` double(10,2) default NULL,
  `costoUnitario` double(10,2) default NULL,
  `tipoRegistro` tinyint(1) default NULL,
  `tipoProducto` int(10) default NULL,
  `contenido` double(10,2) default NULL,
  `tipoContenido` int(10) default NULL,
  `marca` varchar(150) default NULL,
  `fechaActualizacion` date default NULL,
  `fechaModificacion` date default NULL,
  PRIMARY KEY  (`idProducto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
INSERT INTO `trade`.`Producto` VALUES  ('7501017005024','Chiles Rajas',6.50,0.00,1,3,220.00,1,'La Costeña',NULL,NULL),
 ('7501017005000','Chiles Jalapeños',5.50,0.00,0,3,220.00,1,'La Costeña',NULL,NULL),
 ('7501017005031','Chiles Chipotles',12.00,0.00,1,3,220.00,1,'La Costeña',NULL,NULL),
 ('7501017005765','Chiles picados',7.50,0.00,1,3,220.00,1,'La Costeña',NULL,NULL),
 ('7501017005017','Chiles Serranos',6.00,0.00,1,3,220.00,1,'La Costeña',NULL,NULL),
 ('7501052476001','Chiles Rajas',6.50,0.00,1,3,220.00,1,'Clemente Jacques',NULL,NULL),
 ('7501052476209','Chiles Jalapeños Enteros',5.50,0.00,1,3,220.00,1,'Clemente Jacques',NULL,NULL),
 ('7501003124272','Garbanzos',9.00,0.00,1,3,400.00,1,'Herdez',NULL,NULL),
 ('7501003124241','Granos de elote',11.00,0.00,1,3,400.00,1,'Herdez',NULL,NULL),
 ('7501024002085','Champiñones rebanados',15.50,0.00,1,3,380.00,1,'Monteblanco',NULL,NULL),
 ('7501003124340','Ensalada de legumbres',10.00,0.00,1,3,400.00,1,'Herdez',NULL,NULL),
 ('7501003124180','Chicharosn con zanahoria',9.50,0.00,1,3,400.00,1,'Herdez',NULL,NULL),
 ('7501052476018','Chiles Jalapeños en rajas',12.00,0.00,1,3,380.00,1,'Clemente Jacques',NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501017004003','Chiles Jalapeños enteros',9.00,0.00,1,3,380.00,1,'La Costeña',NULL,NULL),
 ('7501011909281','Chiles Chipotles',19.50,0.00,1,3,380.00,1,'FARO',NULL,NULL),
 ('7501052476315','Chiles Chipotles',19.50,0.00,1,3,380.00,1,'CLemente Jacques',NULL,NULL),
 ('7501023318033','Chiles Chipotles',19.50,0.00,1,3,380.00,1,'San Marcos',NULL,NULL),
 ('7501023318040','Chiles Chipotles',12.00,0.00,1,3,215.00,1,'San Marcos',NULL,NULL),
 ('7501003124166','Chicharos con zanahoria',5.50,0.00,1,3,225.00,1,'Herdez',NULL,NULL),
 ('7501062700141','Chiles Jalapeños en rajas',6.50,0.00,1,3,210.00,1,'La Morena',NULL,NULL),
 ('7501162000035','Macarela Cocinada Salmon',22.00,0.00,1,3,425.00,1,'DON EFE',NULL,NULL),
 ('7501062700042','Chiles jalapeños enteros',5.50,0.00,1,3,210.00,1,'La Morena',NULL,NULL),
 ('7501062841028','Chiles gueros',16.50,0.00,1,3,400.00,1,'La Morena',NULL,NULL),
 ('7501023314028','Chiles gueros',17.50,0.00,1,3,400.00,1,'San Marcos',NULL,NULL),
 ('7501083100029','Vinagre Blanco',7.50,0.00,1,3,750.00,4,'BARRILITO',NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501083100012','Vinagre obscuro',7.50,0.00,1,3,750.00,4,'BARRILITO',NULL,NULL),
 ('7501017003020','Chiles jalapeños en rajas',19.50,0.00,1,3,800.00,1,'La Costeña',NULL,NULL),
 ('7501023602064','Atun en agua',95.00,0.00,1,3,1.35,2,'NAIR',NULL,NULL),
 ('7501023602057','Atún en aceite',95.00,0.00,1,3,1.35,2,'NAIR',NULL,NULL),
 ('7501052476025','Chiles jalapeños en rajas',19.00,0.00,1,3,800.00,1,'Clemente Jacques',NULL,NULL),
 ('7501052476223','Chiles jalapeños enteros',16.00,0.00,1,3,780.00,1,'Clemente Jacques',NULL,NULL),
 ('7501062700424','Chiles jalapeños enteros',19.00,0.00,1,3,800.00,1,'La Morena',NULL,NULL),
 ('7501052476032','Chiles jalapeños en rajas',49.00,0.00,1,3,2.80,2,'Clemente Jacques',NULL,NULL),
 ('7501052476230','Chiles  jalapeños enteros',33.00,0.00,1,3,2.80,2,'Clemente Jacques',NULL,NULL),
 ('681131003445','Chiles jalapeños rodajas',44.00,0.00,1,3,2.80,2,'Bakers & Chefs',NULL,NULL),
 ('7501078509806','Duraznos',18.00,0.00,1,3,220.00,1,'La Pasiega',NULL,NULL),
 ('028571008560','Duraznos en almibar',18.00,0.00,0,3,500.00,1,'Flor de California',NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501055900039','Leche clasica 2000',12.50,0.00,1,3,1.00,3,'Alpura',NULL,NULL),
 ('7501023318057','Chiles Chipotles',6.00,0.00,1,3,100.00,1,'San Marcos',NULL,NULL),
 ('7501017006021','Chiles chipotles ',6.00,0.00,1,3,105.00,1,'La Costeña',NULL,NULL),
 ('7501017006014','Chiles jalapeños rajas',4.00,0.00,1,3,105.00,1,'La Costeña',NULL,NULL),
 ('7501001600105','La Lechera',13.50,0.00,1,3,397.00,1,'Nestle',NULL,NULL),
 ('7501011361492','Crema Elote',16.50,0.00,1,3,430.00,1,'Campbells',NULL,NULL),
 ('7501017041206','Crema Elote',15.00,0.00,1,3,430.00,1,'LaCosteña',NULL,NULL),
 ('7501011323278','Crema Champiñones',26.00,0.00,1,3,735.00,1,'Campbells',NULL,NULL),
 ('7501003129185','Atún en agua',10.00,0.00,1,3,170.00,1,'Herdez',NULL,NULL),
 ('7501045400044','Atún en aceite',10.00,0.00,1,3,170.00,1,'Dolores',NULL,NULL),
 ('7501045400013','Atún en aceite',9.00,0.00,1,3,170.00,1,'MazAtún',NULL,NULL),
 ('7501041414885','Atún con verduras',11.50,0.00,1,3,155.00,1,'Tuny',NULL,NULL),
 ('7501076110929','Atún en aceite',9.00,0.00,1,3,174.00,1,'OLA',NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501007809205','Atún en aceite y agua',9.00,0.00,1,3,170.00,1,'excelsior',NULL,NULL),
 ('7501023602002','Atún en aceite',9.00,0.00,1,3,170.00,1,'NAIR',NULL,NULL),
 ('7501017041053','Frijoles Negros Enteros',8.50,0.00,1,3,425.00,1,'La Costeña',NULL,NULL),
 ('7501052420431','Frijoles Bayos Refritos',13.00,0.00,1,3,580.00,1,'La Sierra',NULL,NULL),
 ('7501006536942','Granos de elote',7.00,0.00,1,3,130.00,1,'Del Monte',NULL,NULL),
 ('7501003124333','Ensalada de legumbres',6.00,0.00,1,3,220.00,1,'Herdez',NULL,NULL),
 ('7501003124135','Chicharos',4.50,0.00,1,3,200.00,1,'Herdez',NULL,NULL),
 ('7501728027032','Pimiento Morron',8.50,0.00,1,3,185.00,1,'Don Agustin',NULL,NULL),
 ('605388002327','Catsup',42.30,0.00,1,3,3.80,2,'Bakers & Chefs',NULL,NULL),
 ('7501868722095','Aderezo de Mayonesa',42.50,0.00,1,3,3.80,2,'VENECIA',NULL,NULL),
 ('681131698504','Mostaza',49.00,0.00,1,3,3.78,2,'Bakers & Chefs',NULL,NULL),
 ('7501003340160','Mayonesa',115.00,0.00,1,3,3.40,2,'McCormick',NULL,NULL),
 ('758104000159','Agua',8.00,0.00,1,3,1.50,3,'Bonafont',NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501052473055','Salsa Ranchera',14.00,0.00,1,3,370.00,1,'Clemente Jacques',NULL,NULL),
 ('7501052473048','Salsa taquera',14.00,0.00,1,3,370.00,1,'Clemente Jacques',NULL,NULL),
 ('7501003336422','Mermelada Naranja',12.00,0.00,1,3,270.00,1,'McCormick',NULL,NULL),
 ('7501003336125','Mermelada Fresa',12.00,0.00,1,3,270.00,1,'McCormick',NULL,NULL),
 ('7501052474007','Mermelada Fresa',12.00,0.00,1,3,300.00,1,'Clemente Jacques',NULL,NULL),
 ('7501003336323','Mermelada Piña',12.00,0.00,1,3,270.00,1,'McCormick',NULL,NULL),
 ('700016001502','Mermelada',19.00,0.00,1,3,510.00,1,'Dolche',NULL,NULL),
 ('7501010758125','Mermelada',19.00,0.00,1,3,500.00,1,'Golden Hills',NULL,NULL),
 ('7501052424613','Frijoles Bayos Enteros',11.00,0.00,1,3,560.00,1,'La Sierra',NULL,NULL),
 ('75012175','Mayonesa',12.00,0.00,1,3,195.00,1,'Kraft',NULL,NULL),
 ('7501003340122','Mayonesa',11.00,0.00,1,3,190.00,1,'McCormick',NULL,NULL),
 ('7501003340115','Mayonensa',7.50,0.00,1,3,105.00,1,'McCormik',NULL,NULL),
 ('7501003335012','Mostaza',5.50,0.00,1,3,115.00,1,'McCormick',NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7502007295111','Aceitunas',16.50,0.00,1,3,250.00,1,'San Lucas',NULL,NULL),
 ('7501001600426','Media Crema',11.50,0.00,1,3,225.00,1,'Nestle',NULL,NULL),
 ('7501017004270','Frijoles Bayos Refritos',13.00,0.00,1,3,580.00,1,'La Costeña',NULL,NULL),
 ('7501017004423','Frijoles negros refritos',13.00,0.00,1,3,580.00,1,'La Costeña',NULL,NULL),
 ('7501003390417','Aceitunas',8.50,0.00,1,3,150.00,1,'Búfalo',NULL,NULL),
 ('7501072400154','Aceitunas',8.50,0.00,1,3,36.00,1,'California Stars',NULL,NULL),
 ('7501000149100','Pan Molido Crujiente',8.00,0.00,1,3,175.00,1,'BIMBO',NULL,NULL),
 ('7501000111855','Pan Molido',8.00,0.00,1,3,210.00,1,'BIMBO',NULL,NULL),
 ('7501032389000','Crema ',6.50,0.00,1,3,200.00,1,'Danone',NULL,NULL),
 ('7501020513134','Crema',7.00,0.00,1,3,200.00,4,'LALA',NULL,NULL),
 ('7501020511451','Crema',14.50,0.00,1,0,450.00,4,'LALA',NULL,NULL),
 ('7501020511468','Crema',29.00,0.00,1,3,1.00,3,'LALA',NULL,NULL),
 ('7501020526066','Leche',11.50,0.00,1,3,1.00,3,'LALA',NULL,NULL),
 ('7501055900022','Leche',11.50,0.00,1,3,1.00,3,'Alpura',NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501020512373','Crema',108.00,0.00,1,3,4.00,3,'LALA',NULL,NULL),
 ('7501040047138','Fajitas',25.00,0.00,1,3,500.00,1,'Guten',NULL,NULL),
 ('7501040047084','Desebrada',25.00,0.00,1,3,500.00,1,'GUTEN',NULL,NULL),
 ('7501020515350','Leche light',12.50,0.00,1,3,1.00,3,'LALA',NULL,NULL),
 ('7501594374766','Paq. Manchego',14.00,0.00,1,3,180.00,1,'CHEN',NULL,NULL),
 ('027000384954','Salsa Barbecue',16.00,0.00,1,3,612.00,1,'Hunts',NULL,NULL),
 ('7501000664221','Saladitas',6.50,0.00,1,3,186.00,1,'Gamesa',NULL,NULL),
 ('7501003150233','Mole',19.50,0.00,1,3,235.00,1,'Doña Maria',NULL,NULL),
 ('7503002190029','Aceite Vegetal',18.00,0.00,1,3,175.00,4,'Navarra',NULL,NULL),
 ('7501001604103','Jugo Maggi',21.50,0.00,1,3,100.00,4,'Maggi',NULL,NULL),
 ('75014322','Catsup',10.00,0.00,1,3,390.00,1,'Del Monte',NULL,NULL),
 ('07503007001832','Piña',18.00,0.00,1,3,800.00,1,'HerFruit',NULL,NULL),
 ('7501727500116','Piña 10 Rebanadas',18.00,0.00,1,3,800.00,1,'Agrover',NULL,NULL),
 ('8850044011577','Piña',18.00,0.00,1,3,800.00,1,'TropFrut',NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501030480778','Totopos',14.00,0.00,1,3,280.00,1,'Milpa Real',NULL,NULL),
 ('7501017050215','Mayonesa',12.00,0.00,1,3,190.00,1,'La Costeña',NULL,NULL),
 ('7501017040506','Mayonesa',22.00,0.00,1,3,385.00,1,'La Costeña',NULL,NULL),
 ('7501003335029','Mostaza',6.50,0.00,1,3,210.00,1,'McCormick',NULL,NULL),
 ('661953299035','Atún en aceite',9.00,0.00,1,3,170.00,1,'atunsito',NULL,NULL),
 ('7501045400068','Atun en agua',10.00,0.00,1,3,170.00,1,'Dolores',NULL,NULL),
 ('633148100013','Tajin clasico',14.50,0.00,1,3,142.00,1,'Tajin',NULL,NULL),
 ('7501003398239','Salsa picante polvo',6.00,0.00,1,3,160.00,1,'Búfalo',NULL,NULL),
 ('7502007292219','Aceite de olivo',15.00,0.00,1,3,180.00,4,'El Olivo',NULL,NULL),
 ('7501003340139','Mayonesa',22.00,0.00,1,3,390.00,1,'McCormick',NULL,NULL),
 ('7501003340146','Mayonesa',37.50,0.00,1,3,790.00,1,'McCormick',NULL,NULL),
 ('758104001712','Agua',5.00,0.00,1,3,600.00,4,'Bonafont',NULL,NULL),
 ('758104100422','Agua',7.00,0.00,1,3,1.00,3,'Bonafont',NULL,NULL),
 ('7501018203849','Catsup',15.00,0.00,1,3,1.00,2,'Embasa',NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7502217040556','Nutrileche',10.50,0.00,1,3,1.00,3,'Nutrileche',NULL,NULL),
 ('097339000054','Salsa picante',6.00,0.00,1,3,370.00,1,'Valentina',NULL,NULL),
 ('041789001987','Sopa Camaron con Chile piquin',5.00,0.00,1,3,64.00,1,'Maruchan',NULL,NULL),
 ('041789001956','Sopa con camaron',5.00,0.00,1,3,64.00,1,'Maruchan',NULL,NULL),
 ('7501078509752','Coctel de frutas',20.00,0.00,1,3,480.00,1,'La Pasiega',NULL,NULL),
 ('7502244820114','Piña',18.50,0.00,1,3,490.00,1,'Valdepeñas',NULL,NULL),
 ('7503003951612','Duraznos en almibar',18.00,0.00,1,3,800.00,1,'La Preteria',NULL,NULL),
 ('7501078509820','Mangos en almibar',20.00,0.00,1,3,480.00,1,'La Pasiega',NULL,NULL),
 ('7501078509813','Piña en almibar',18.00,0.00,1,3,800.00,1,'La Pasiega',NULL,NULL),
 ('041789001918','Sopa Pollo',5.00,0.00,1,3,64.00,1,'Maruchan',NULL,NULL),
 ('7501020515398','Leche Vive',14.50,0.00,1,3,1.00,3,'LALA',NULL,NULL),
 ('041789001864','Sopa Camaron Limon Habanero',5.00,0.00,1,3,46.00,1,'Maruchan',NULL,NULL),
 ('7501039400418','Jugo de Fresa',11.00,0.00,1,3,1.00,3,'Boing',NULL,NULL);
INSERT INTO `trade`.`Producto` VALUES  ('7501039400470','Jugo de piña',11.00,0.00,1,3,1.00,3,'Boing',NULL,NULL),
 ('7501039400449','Jugo de Mango',11.00,0.00,1,3,1.00,3,'Boing',NULL,NULL),
 ('7501039400456','Jugo de Manzana',11.00,0.00,1,3,1.00,3,'Boing',NULL,NULL),
 ('7501030428695','Galleta de avena',4.00,0.00,1,3,54.00,3,'Tia Rosa',NULL,NULL),
 ('7501000149469','Polvorón',3.00,0.00,1,3,65.00,1,'Tia Rosa',NULL,NULL),
 ('7501052470016','Aderezo Cesar',15.00,0.00,1,3,237.00,4,'Clemente Jacques',NULL,NULL),
 ('7501052470030','Aderezo Italiana',15.00,0.00,1,3,237.00,4,'Clemente Jacques',NULL,NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
