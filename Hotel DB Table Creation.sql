Use hotel_model;

/* create guest table*/

CREATE TABLE IF NOT EXISTS huespedes(
	id_huesped int not null unique auto_increment,
	nombre varchar(100) not null,
	apellido varchar (100) not null,
	correo varchar(100) not null unique,
	telefono int(9),
	id_direccion int unique,
    primary key (id_huesped),
    foreign key (id_direccion) references direccion(id_direccion)
);

/* create address table*/

CREATE TABLE IF NOT EXISTS direccion(
	id_direccion int not null unique auto_increment,
    calle varchar(100) not null,
    num_ext int,
    num_int int,
    ciudad varchar(100),
    estado varchar(100),
    codigo_postal int(5) not null,
	pais varchar (100) not null,
    primary key (id_direccion)
);

/* create reservations table*/

CREATE TABLE IF NOT EXISTS reservaciones(
	id_reservacion int not null unique auto_increment,
    id_huesped int not null,
    id_habitacion int not null, 
    id_canal int not null,
    check_in date not null,
    check_out date not null,
    num_huespeded int(2),
    estatus varchar(100) not null default 'Reserved',
    primary key (id_reservacion),
    foreign key (id_huesped) references huespedes(id_huesped),
    foreign key (id_habitacion) references habitaciones(id_habitacion),
    foreign key (id_canal) references canales(id_canal)
);

/* create channel table*/

CREATE TABLE IF NOT EXISTS canales(
	id_canal int not null unique auto_increment,
    canal varchar (100) not null unique,
    comision DECIMAL(2,2) not null,
    primary key(id_canal)
);

/* create rooms table*/

CREATE TABLE IF NOT EXISTS habitaciones(
	id_habitacion int not null unique auto_increment,
    num_habitacion int not null unique,
    caregoria varchar(100) not null,
    tamano decimal (6,2) not null,
    piso int not null,
    vista_mar tinyint not null,
    cama_sofa tinyint not null,
    primary key(id_habitacion)
);

/* create additional purchases table*/

CREATE TABLE IF NOT EXISTS compra_adicional(
	id_compra_adictional int not null unique auto_increment,
    id_reservacion int not null,
    id_producto int not null,
    primary key (id_compra_adictional),
    foreign key (id_reservacion) references reservaciones(id_reservacion),
    foreign key (id_producto) references producto(id_producto)
);

/* create calendar rate table*/

CREATE TABLE IF NOT EXISTS calendario_tarifa(
	fecha date not null,
    id_habitacion int not null,
    tarifa_abierta_neta decimal(5,2) not null,
    tarifa_abierta_bruta decimal(5,2) not null,
    id_reservacion int,
    primary key(fecha, id_habitacion),
    foreign key (id_reservacion) references reservaciones(id_reservacion)
);

/* create extra products table*/

CREATE TABLE IF NOT EXISTS producto(
	id_producto int not null unique auto_increment,
    id_departamento int not null,
    nombre_producto varchar(100) not null,
    precio_neto decimal(5,2),
    precio_bruta decimal (5,2),
    primary key(id_producto),
    foreign key (id_departamento) references departamento(id_departamento)
);

/* create transactions table*/

CREATE TABLE IF NOT EXISTS transaccion(
	id_transaccion int not null unique auto_increment,
	id_reservacion int not null,
    monto decimal(6,2) not null,
    metodo_pago varchar(100) not null,
    estatus_pago tinyint not null default 0,
    primary key (id_transaccion),
    foreign key(id_reservacion) references reservaciones(id_reservacion)
);

/* create department table*/

CREATE TABLE IF NOT EXISTS departamento(
	id_departamento int not null unique auto_increment,
	nombre_departamento varchar(100) not null unique,
    primary key(id_departamento)
);


