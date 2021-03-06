DROP DATABASE IF EXISTS `lauraperiale`;
CREATE DATABASE `lauraperiale` DEFAULT CHARSET=utf8;
USE `lauraperiale`;

CREATE TABLE `articoli` (
    `id` INTEGER AUTO_INCREMENT PRIMARY KEY, 
    `codice` VARCHAR(255) NOT NULL,
    `descrizione` VARCHAR(255) NOT NULL,
    `peso` DOUBLE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `ordini` (
    `id` INTEGER AUTO_INCREMENT PRIMARY KEY, 
    `numero` INTEGER NOT NULL,
    `data` DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tariffe_corriere` (
    `id` INTEGER AUTO_INCREMENT PRIMARY KEY, 
    `nome_corriere` VARCHAR(255) NOT NULL,
    `nome_tariffa` VARCHAR(255) NOT NULL,
    `peso_massimo` DOUBLE NOT NULL,
    `costo` DOUBLE NOT NULL
) ENGINE=InnoDB;


INSERT INTO `articoli` (`codice`,`descrizione`,`peso`)
    VALUES ('PNDRV8','Pen drive USB 8G no brand',0.18);
INSERT INTO `articoli` (`codice`,`descrizione`,`peso`)
    VALUES ('DCP-J715E','Stampante Brother DCP J715 W',5.1);
INSERT INTO `articoli` (`codice`,`descrizione`,`peso`)
    VALUES ('LNVCX1','Notebook Lenovo Carbon X1',2.1);
INSERT INTO `articoli` (`codice`,`descrizione`,`peso`)
    VALUES ('ALCPPC3','Smartphone Alcatel POP C3',0.63);
INSERT INTO `articoli` (`codice`,`descrizione`,`peso`)
    VALUES ('BSHT1R','Ampli Combo valvolare BlackStar HT 1-R',5);


INSERT INTO `tariffe_corriere` (`nome_corriere`,`nome_tariffa`,`peso_massimo`,`costo`)
    VALUES ('SDA','Economy',1,6.10);
INSERT INTO `tariffe_corriere` (`nome_corriere`,`nome_tariffa`,`peso_massimo`,`costo`)
    VALUES ('SDA','Veloce',5,7.80);
INSERT INTO `tariffe_corriere` (`nome_corriere`,`nome_tariffa`,`peso_massimo`,`costo`)
    VALUES ('SDA','Bigbox',30,13.00);
INSERT INTO `tariffe_corriere` (`nome_corriere`,`nome_tariffa`,`peso_massimo`,`costo`)
    VALUES ('DHL','Veloce',1.5,6.40);
INSERT INTO `tariffe_corriere` (`nome_corriere`,`nome_tariffa`,`peso_massimo`,`costo`)
    VALUES ('DHL','Assicurata',7.5,9.80);
INSERT INTO `tariffe_corriere` (`nome_corriere`,`nome_tariffa`,`peso_massimo`,`costo`)
    VALUES ('DHL','XXL',40,13.80);
INSERT INTO `tariffe_corriere` (`nome_corriere`,`nome_tariffa`,`peso_massimo`,`costo`)
    VALUES ('UPS','Economy',0.7,5.15);
INSERT INTO `tariffe_corriere` (`nome_corriere`,`nome_tariffa`,`peso_massimo`,`costo`)
    VALUES ('UPS','Standard',3,6.50);
INSERT INTO `tariffe_corriere` (`nome_corriere`,`nome_tariffa`,`peso_massimo`,`costo`)
    VALUES ('UPS','Jumbo',25,11.40);

INSERT INTO `ordini` (`numero`,`data`)
    VALUES (11,'2015-01-05');
INSERT INTO `ordini` (`numero`,`data`)
    VALUES (21,'2015-02-05');
INSERT INTO `ordini` (`numero`,`data`)
    VALUES (31,'2015-03-05');
INSERT INTO `ordini` (`numero`,`data`)
    VALUES (41,'2015-04-05');
INSERT INTO `ordini` (`numero`,`data`)
    VALUES (51,'2015-05-05');
INSERT INTO `ordini` (`numero`,`data`)
    VALUES (61,'2015-06-05');
INSERT INTO `ordini` (`numero`,`data`)
    VALUES (71,'2015-07-05');
INSERT INTO `ordini` (`numero`,`data`)
    VALUES (81,'2015-08-05');
INSERT INTO `ordini` (`numero`,`data`)
    VALUES (91,'2015-09-05');

CREATE TABLE `voci` (
    `id` INTEGER AUTO_INCREMENT PRIMARY KEY, 
    `id_ordini` INTEGER,
    `id_articoli` INTEGER,
    `quantita` INTEGER,
    FOREIGN KEY (`id_ordini`) REFERENCES ordini(id),
    FOREIGN KEY (`id_articoli`) REFERENCES articoli(id)
) ENGINE=InnoDB;

INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (1,3,2);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (2,3,1);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (2,4,1);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (3,2,1);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (3,3,1);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (4,4,2);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (4,1,1);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (5,1,2);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (5,4,1);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (6,2,7);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (7,1,3);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (8,5,6);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (9,5,1);
INSERT INTO `voci` (`id_ordini`,`id_articoli`,`quantita`)
    VALUES (9,3,1);