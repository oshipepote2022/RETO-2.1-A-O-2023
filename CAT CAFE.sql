CREATE DATABASE cat_cafe;

USE cat_cafe;

CREATE TABLE Gatitos (
  nombre VARCHAR(50),
  edad INT,
  peso DECIMAL(4, 1),
  actividad_preferida VARCHAR(100),
  color VARCHAR(50),
  ojos VARCHAR(50)
);

INSERT INTO Gatitos (nombre, edad, peso, actividad_preferida, color, ojos)
VALUES ('Rocket', 3, 3.0, 'Dormir mucho', 'Blanco', 'Celestes');

INSERT INTO Gatitos (nombre, edad, peso, actividad_preferida, color, ojos)
VALUES ('Pinto', 5, 3.5, 'Mimos', 'Naranja con blanco', 'Amarillo con verde');

INSERT INTO Gatitos (nombre, edad, peso, actividad_preferida, color, ojos)
VALUES ('Sunny', 2, 5.0, 'Jugar con pelotitas', 'Negro', 'Amarillentos');

INSERT INTO Gatitos (nombre, edad, peso, actividad_preferida, color, ojos)
VALUES ('Emelia', 5, 4.4, 'Reposar donde hay sol', 'Gris con negro', 'Amarillentos');

INSERT INTO Gatitos (nombre, edad, peso, actividad_preferida, color, ojos)
VALUES ('Nikki', 4, 4.3, 'No se despega de Ricochet', 'Gris', 'Verdes claros');

INSERT INTO Gatitos (nombre, edad, peso, actividad_preferida, color, ojos)
VALUES ('Ricochet', 4, 4.7, 'Le gustan los lugares altos', 'Blanco con gris', 'Celestes');

INSERT INTO Gatitos (nombre, edad, peso, actividad_preferida, color, ojos)
VALUES ('Onyk', 7, 3.3, 'Va donde hay comida', 'Naranja con marrón', 'Amarillentos');

INSERT INTO Gatitos (nombre, edad, peso, actividad_preferida, color, ojos)
VALUES ('Seiko', 2, 3.7, 'Dormir junto a otros gatos', 'Blanco con gris', 'Verdosos');

INSERT INTO Gatitos (nombre, edad, peso, actividad_preferida, color, ojos)
VALUES ('Nathan', 7, 4.5, 'Le encanta esconderse', 'Negro', 'Amarillentos');

ALTER TABLE Gatitos ADD apodo VARCHAR(50);

ALTER TABLE Gatitos MODIFY COLUMN apodo VARCHAR(50) DEFAULT 'no tiene';

UPDATE Gatitos SET apodo= DEFAULT;

INSERT INTO Gatitos (nombre, edad, peso, actividad_preferida, color, ojos, apodo)
VALUES ('Pinto', 5, 3.5, 'Dormir mucho', 'Blanco', 'Celestes', 'Pin');

INSERT INTO Gatitos (nombre, edad, peso, actividad_preferida, color, ojos, apodo)
VALUES ('Emelia', 5, 4.4, 'reposar donde hay sol', 'color gris con negro', 'ojos amarillentos', 'Emeli');

INSERT INTO Gatitos (nombre, edad, peso, actividad_preferida, color, ojos, apodo)
VALUES ('Nathan', 7, 4.5, 'le encanta esconderse', 'Negro', 'Amarillentos', 'Ninja nate');

ALTER TABLE Gatitos ADD COLUMN numero INT;


ALTER TABLE Gatitos MODIFY COLUMN numero INT AUTO_INCREMENT PRIMARY KEY;

/* esto se hizo porque al insertar los gatos que tienen apodo, me quedaban 3 gatitos repetidos 2 veces y para no cargar una nueva tabla se agrego el campo numero para borrar los campos que estuvieran repetidos y que tuvieran el default no tiene */
DELETE FROM gatitos WHERE numero = 2;
DELETE FROM gatitos WHERE numero = 4;
DELETE FROM gatitos WHERE numero = 9;

ALTER TABLE Gatitos ADD COLUMN acompañante INT;

ALTER TABLE Gatitos MODIFY COLUMN acompañante VARCHAR(50) DEFAULT 'solitos';
UPDATE Gatitos SET acompañante = DEFAULT;

ALTER TABLE gatitos
ADD COLUMN dieta BOOLEAN AFTER peso;

UPDATE gatitos
SET dieta = (peso > 4);

ALTER TABLE gatitos MODIFY COLUMN dieta VARCHAR(1) NOT NULL;

UPDATE gatitos
SET dieta = IF(dieta = TRUE, 'V', 'F');

   
ALTER TABLE gatitos MODIFY COLUMN numero INT AFTER nombre;

ALTER TABLE gatitos
ADD COLUMN años_para_jubilacion INT AFTER edad;

UPDATE gatitos
SET años_para_jubilacion = 11 - edad;


INSERT INTO gatitos (nombre, numero, edad, peso, dieta, actividad_preferida, color, ojos, apodo, acompañante)
VALUES ('Toffee', 13,  4, 3.4, 0, 'le gusta jugar y estar solo a veces', 'blanco con gris', 'verdosos','Tofisito','Chucky');
       
INSERT INTO gatitos (nombre, numero, edad, peso, dieta, actividad_preferida, color, ojos, apodo, acompañante)
VALUES ('Chucky', 14, 10, 4.3, 1, 'le gusta dormir y caminar', 'naranja con blanco', 'verdosos','Null','Toffee');

UPDATE gatitos
SET años_para_jubilacion = 11 - edad;

/* ahora no funciono los dos gatitos ultimos me quedan como 0 y 1, LOS DATOS NO INGRESARON AUTOMATICAMENTE*/
UPDATE gatitos
SET dieta = IF(dieta = TRUE, 'V', 'F');

ALTER TABLE gatitos UPDATE COLUMN dieta VARCHAR(7);

UPDATE gatitos
SET apodo = 'No tiene'
WHERE numero = 14;

UPDATE gatitos
SET dieta =  ' F '
WHERE numero = 13;

UPDATE gatitos
SET dieta =  ' V '
WHERE numero = 14;

UPDATE gatitos
SET dieta =  'F'
WHERE numero = 13;

UPDATE gatitos
SET dieta =  'V'
WHERE numero = 14;

DELETE FROM gatitos
WHERE numero IN (13, 14);

INSERT INTO gatitos (nombre, numero, edad, peso, dieta, actividad_preferida, color, ojos, apodo, acompañante)
VALUES ('Toffee', 13,  4, 3.4, default, 'le gusta jugar y estar solo a veces', 'blanco con gris', 'verdosos','Tofisito','Chucky');

DELETE FROM gatitos
WHERE numero IN (13);
 

INSERT INTO gatitos (nombre, edad, peso, actividad_preferida, color, ojos)
VALUES ('Toffee', 4, 3.4, 'jugar', 'blanco-gris', 'verdosos'),
       ('Chucky', 10, 4.3, 'dormir-caminar', 'naranja-blanco', 'amarillentos');
DELETE FROM gatitos
WHERE numero IN (15, 16);
 
/* apodo si ingresa automaticamente pero dieta y años_para_jubilarse no entonces volvemos a la eliminar los 2 ultimos dos registros para tratar de volver a ingresar pero automaticamente*/
ALTER TABLE gatitos
DROP COLUMN dieta;


ALTER TABLE gatitos
ADD COLUMN dieta BOOLEAN AFTER peso;

ALTER TABLE gatitos

MODIFY COLUMN años_para_jubilacion INT DEFAULT (11 - edad);
UPDATE gatitos
SET dieta = (peso > 4);

INSERT INTO gatitos (nombre, edad, peso, actividad_preferida, color, ojos)
VALUES ('Toffee', 4, 3.4, 'jugar', 'blanco-gris', 'verdosos'),
       ('Chucky', 10, 4.3, 'dormir-caminar', 'naranja-blanco', 'amarillentos');

/* AHORA ME ENTRARON LOS DATOS AUTOMATICAMENTE PERO DEJANDO EL CAMPO DIETA CON 0 Y 1 NO COMO F Y V LOS DATOS DE LOS 2 ULTIMOS INGRESOS ENTRAN AUTOMATICAMENTE, COMO NO HABIA OTRA CON F Y V TAMPOCO SE PUDO VOLVER LA COLUMNA DIETA A NUMEROS DIRECTAMENTE, ENTONCES SE BORRO LA COLUMNA DIETA Y VOLVI A HACER EL PROCESO DE NUEVO, PODRIA AGREGARLE AHORA F Y V PERO LOS DATOS NO CAERIAN AUTOMATICAMENTE*/