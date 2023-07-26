CREATE DATABASE proyectoSPA;
USE proyectoSPA;

CREATE TABLE CLIENTE (
	id_cliente INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(20),
	correo VARCHAR(30),
	ciudad VARCHAR(15),
	direccion VARCHAR(25),
	PRIMARY KEY (id_cliente)
);

CREATE TABLE CIRCUITO (
	id_circuito INT NOT NULL AUTO_INCREMENT,
	tipo VARCHAR(15),
	nombre VARCHAR(20),
	componentes VARCHAR(40),
	costo INT,
	PRIMARY KEY (id_circuito)
);

CREATE TABLE ENVIO (
	id_envio INT NOT NULL AUTO_INCREMENT,
	tcircuito INT,
	ncliente INT,
	cantidad INT,
	ciudad VARCHAR(20),
	fecha DATE,
	descripcion VARCHAR(30),
	costo INT,
	PRIMARY KEY(id_envio),
	FOREIGN KEY(tcircuito) REFERENCES CIRCUITO(id_circuito),
	FOREIGN KEY(ncliente) REFERENCES CLIENTE(id_cliente)
);
insert into CLIENTE (id_cliente, nombre, correo, ciudad, direccion) values (1, 'Lesly', 'ldoerffer0@weebly.com', 'Shilovo', '7 Annamark Park');
insert into CLIENTE (id_cliente, nombre, correo, ciudad, direccion) values (2, 'Anya', 'abonifazio1@disqus.com', 'Ketanggi', '45 Hovde Trail');
insert into CLIENTE (id_cliente, nombre, correo, ciudad, direccion) values (3, 'Lamar', 'lstoeck2@columbia.edu', 'San Nicolas', '152 Grayhawk Circle');
insert into CLIENTE (id_cliente, nombre, correo, ciudad, direccion) values (4, 'Ira', 'iledrun3@bandcamp.com', 'Alcains', '9 Tomscot Avenue');
insert into CLIENTE (id_cliente, nombre, correo, ciudad, direccion) values (5, 'Myer', 'mogden4@ihg.com', 'West End', '1 Magdeline Parkway');
insert into CLIENTE (id_cliente, nombre, correo, ciudad, direccion) values (6, 'Adrian', 'amaggorini5@narod.ru', 'Huacrapuquio', '86 Forest Dale Terrace');
insert into CLIENTE (id_cliente, nombre, correo, ciudad, direccion) values (7, 'Job', 'jlorentzen6@eventbrite.com', 'Yeghvard', '5533 Darwin Lane');
insert into CLIENTE (id_cliente, nombre, correo, ciudad, direccion) values (8, 'Joelle', 'jkettles7@tamu.edu', 'Kuanping', '10122 Mosinee Avenue');
insert into CLIENTE (id_cliente, nombre, correo, ciudad, direccion) values (9, 'Joell', 'jreek8@army.mil', 'Bhimbar', '21 Scott Pass');
insert into CLIENTE (id_cliente, nombre, correo, ciudad, direccion) values (10, 'Andreana', 'aiddon9@clickbank.net', 'Holoriang', '87810 Rigney Center');
insert into CIRCUITO (id_circuito, tipo, nombre, componentes, costo) values (1, 'serie', 'Stanton-Dooley', 'interruptor', 5551);
insert into CIRCUITO (id_circuito, tipo, nombre, componentes, costo) values (2, 'serie', 'Wiegand-Kertzmann', 'fusible', 4544);
insert into CIRCUITO (id_circuito, tipo, nombre, componentes, costo) values (3, 'mixto', 'Kuhic-Keebler', 'Generador', 7646);
insert into CIRCUITO (id_circuito, tipo, nombre, componentes, costo) values (4, 'paralelo', 'Pouros LLC', 'Generador', 2412);
insert into CIRCUITO (id_circuito, tipo, nombre, componentes, costo) values (5, 'mixto', 'Torp and Sons', 'receptor', 3828);
insert into ENVIO (id_envio, tcircuito, ncliente, cantidad, fecha, ciudad, descripcion, costo) values (1, 4, 2, 4, '2022-12-30', 'Tiang', 'varius integer ac', 7538);
insert into ENVIO (id_envio, tcircuito, ncliente, cantidad, fecha, ciudad, descripcion, costo) values (2, 1, 10, 11, '2023-03-01', 'Kap Choeng', 'praesent', 2551);
insert into ENVIO (id_envio, tcircuito, ncliente, cantidad, fecha, ciudad, descripcion, costo) values (3, 3, 1, 12, '2023-06-11', 'Talipan', 'lobortis ', 7455);
insert into ENVIO (id_envio, tcircuito, ncliente, cantidad, fecha, ciudad, descripcion, costo) values (4, 1, 6, 5, '2022-07-29', 'Jiangjiazui', 'consectetuer', 2241);
insert into ENVIO (id_envio, tcircuito, ncliente, cantidad, fecha, ciudad, descripcion, costo) values (5, 3, 5, 3, '2023-04-20', 'Creil', 'ac neque', 6918);