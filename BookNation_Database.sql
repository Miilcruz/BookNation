CREATE DATABASE BookNation;
go

USE BookNation;
go

CREATE TABLE Usuarios (
    id_usuario INT IDENTITY (1, 1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    direccion TEXT,
    telefono VARCHAR(20),
    fecha_registro TIME
);
go

CREATE TABLE Libros (
    id_libro INT IDENTITY (1,1) PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    imagen VARCHAR(255),
    stock INT DEFAULT 0
);
go

CREATE TABLE MetodosPago (
    id_metodo INT IDENTITY (1,1) PRIMARY KEY,
    metodo VARCHAR(50) NOT NULL
);
go


-- Tabla de compras
CREATE TABLE Compras (
    id_compra INT IDENTITY (1,1) PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    id_metodo INT,
	cantidad INT NOT NULL CHECK (cantidad > 0),
    total DECIMAL(10,2) NOT NULL CHECK (total >= 0),
    fecha_compra TIME,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro),
    FOREIGN KEY (id_metodo) REFERENCES MetodosPago(id_metodo)
);
go

INSERT INTO MetodosPago (metodo) VALUES ('Tarjeta de Credito/Debito'), ('PayPal');
go

INSERT INTO Usuarios (nombre, email, contrasena, direccion, telefono) VALUES
('Steven Gomez', 'StevenJG@gmail.com', 'steven5522', 'Americas 2, Managua', '1234567890'),
('Milton Cruz', 'miltonelidcruz@gmail.com', 'milton123', 'Barrio San Judas , Managua', '0987654321');
go

INSERT INTO Libros (titulo, autor, descripcion, precio, imagen, stock) VALUES
('El Principito', 'Antoine de Saint-Exup�ry', 'Un clasico de la literatura.', 9.99, 'el_principito.jpg', 10),
('1984', 'George Orwell', 'Distopia sobre el futuro.', 14.99, '1984.jpg', 15),
('Cien Años De Soledad', 'Gabriel Garcia Marquez', 'trata un siglo en la vida de la familia Buendia, cuyo patriarca, Jos� Arcadio Buend�a, fund� el pueblo ficticio de Macondo, en Colombia', 14.99, '1984.jpg', 15);
go

INSERT INTO Compras (id_usuario, id_libro, id_metodo, cantidad, total) VALUES
(1, 1, 1, 1, 9.99),
(2, 2, 2, 2, 29.98);
go

select*from Usuarios
go
create login Steven___Gomez
with password = 'steven5522'
go

create user Steven___Gomez
for login Steven___Gomez
go

grant select, update, delete, insert to Steven___Gomez
go


create login Milton___Cruz
with password = 'milton123'
go

create user Milton___Cruz
for login Milton___Cruz
go

grant select, update, delete, insert to Milton___Cruz
go