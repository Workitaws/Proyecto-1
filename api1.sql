-- Crear base de dato

CREATE DATABASE dbapi;

-- Usar base de dato

use dbapi;

-- CREAR TABLAS Y ELIMINAR TABLAS
DROP TABLE IF EXISTS `precios_semana_20200413`;
CREATE TABLE IF NOT EXISTS `precios_semana_20200413` (
  `precio`			decimal(25,2),
  `producto_id` 	varchar(225),
  `sucursal_id`		varchar(225)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `precios_semana_20200503`;
CREATE TABLE IF NOT EXISTS `precios_semana_20200503` (
  `precio`			decimal(25,2),
  `producto_id` 	varchar(225),
  `sucursal_id`		varchar(225) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


DROP TABLE IF EXISTS `precios_semana_20200518`;
CREATE TABLE IF NOT EXISTS `precios_semana_20200518` (
  `precio`			decimal(25,2),
  `producto_id` 	varchar(225),
  `sucursal_id`		varchar(225) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `precios_semanas_20200419_20200426_ok2`;
CREATE TABLE IF NOT EXISTS `precios_semanas_20200419_20200426_ok2` (
  `precio`			decimal(25,2) ,
  `producto_id` 	varchar(225) ,
  `sucursal_id`		varchar(225) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE IF NOT EXISTS `sucursal` (
  `sucursal_id` varchar(225) ,
`comercioId` int ,
`banderaId` int ,
`banderaDescripcion` varchar(225) ,
`comercioRazonSocial` varchar(225) ,
`provincia` varchar(225) ,
`localidad` varchar(225) ,
`direccion` varchar(225) ,
`lat` decimal(15,6) ,
`lng` decimal(15,6) ,
`sucursalNombre` varchar(225) ,
`sucursalTipo` varchar(225),
	Primary Key (Sucursal_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `producto_id` 	varchar(225),
  `marca`		varchar(225),
  `nombre`			varchar(225),
  `presentacion`		varchar(225),
  Primary Key (producto_id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


-- LLAVES PRIMARIAS Y DESBLOQUEO FK , BLOQUEO FK

SET FOREIGN_KEY_CHECKS=0;
SET GLOBAL FOREIGN_KEY_CHECKS=0;

ALTER TABLE sucursal
 ADD CONSTRAINT PK_CUSTID PRIMARY KEY (sucursal_id);
 DESC sucursal;
 
 ALTER TABLE producto
 ADD CONSTRAINT PK_CUSTID PRIMARY KEY (producto_id);
 DESC producto;
 
 -- LLLAVES FK
 
ALTER TABLE precios_semana_20200413 ADD CONSTRAINT `producto_fk_semana` FOREIGN KEY (Producto_id) REFERENCES producto(Producto_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE precios_semana_20200413 ADD CONSTRAINT `sucursal_fk_semana` FOREIGN KEY (sucursal_id) REFERENCES sucursal(sucursal_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE precios_semana_20200503 ADD CONSTRAINT `producto_fk_semana3` FOREIGN KEY (Producto_id) REFERENCES producto(Producto_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE precios_semana_20200503 ADD CONSTRAINT `sucursal_fk_semana3` FOREIGN KEY (sucursal_id) REFERENCES sucursal(sucursal_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE precios_semana_20200518 ADD CONSTRAINT `producto_fk_semana2` FOREIGN KEY (Producto_id) REFERENCES producto(Producto_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE precios_semana_20200518 ADD CONSTRAINT `sucursal_fk_semana2` FOREIGN KEY (sucursal_id) REFERENCES sucursal(sucursal_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE precios_semanas_20200419_20200426_ok2 ADD CONSTRAINT `producto_fk_semana1` FOREIGN KEY (Producto_id) REFERENCES producto(Producto_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE precios_semanas_20200419_20200426_ok2 ADD CONSTRAINT `sucursal_fk_semana1` FOREIGN KEY (sucursal_id) REFERENCES sucursal(sucursal_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- QUERY (join)

SELECT  DISTINCT
		s.producto_id,
        sum(s.precio),
        p.marca
FROM producto p
LEFT JOIN precios_semana_20200413_ok s ON (p.Producto_id = s.Producto_id);

SELECT s.sucursal_id , AVG(k.precio) as PS413 , k.producto_id
FROM sucursal s
left JOIN precios_semana_20200413 k ON (s.sucursal_id = k.sucursal_id)
where s.sucursal_id = "9-1-688";

select  AVG(precio)
from precios_semana_20200413_ok
where sucursal_id  = "9-1-688";

SELECT s.sucursal_id , AVG(k.precio) as PS413 , k.producto_id
FROM sucursal s
left JOIN precios_semana_20200518 k ON (s.sucursal_id = k.sucursal_id)
where s.sucursal_id = "9-1-688";

SELECT s.sucursal_id , AVG(k.precio) as PS413 , k.producto_id
FROM sucursal s
left JOIN precios_semana_20200503 k ON (s.sucursal_id = k.sucursal_id)
where s.sucursal_id = "9-1-688";

SELECT s.sucursal_id , AVG(k.precio) as PS413 , k.producto_id, s.provincia
FROM sucursal s
left JOIN precios_semana_20200503 k ON (s.sucursal_id = k.sucursal_id)
where s.sucursal_id = "9-1-688";

SELECT s.sucursal_id , AVG(k.precio) as PS413 , k.producto_id, s.provincia
FROM sucursal s
left JOIN precios_semanas_20200419_20200426_ok2 k ON (s.sucursal_id = k.sucursal_id)
where s.sucursal_id = "10-1-32";

SELECT s.sucursal_id , AVG(k.precio) as PS413 , k.producto_id, s.provincia
FROM sucursal s
left JOIN precios_semana_20200413 k ON (s.sucursal_id = k.sucursal_id)
where s.sucursal_id = "9-1-688";






