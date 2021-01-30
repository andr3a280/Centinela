create database centinela_db;
use centinela_db;

create table TIPO_USUARIOS(
	id int auto_increment,
    tipo_usuario varchar(50),
    primary key(id)
);

create table USUARIOS(
	id int auto_increment,
    nombre_usuario varchar(50),
    correo varchar(80),
    clave varchar(80),
    tipo_usuario int,
    primary key(id),
    foreign key(tipo_usuario) references TIPO_USUARIOS(id)
);

create table PERFIL_USUARIOS(
	id int auto_increment,
    nombre varchar(50),
    apellido_p varchar(50),
    apellido_m varchar(50),
    edad int,
    foto_perfil varchar(255),
    id_usuario int,
    primary key(id),
    foreign key(id_usuario) references USUARIOS(id)
);

create table HOGAR(
	id int auto_increment,
    id_usuario int,
    direccion varchar(255),
    estado_alerta boolean,
    numero_habitantes int,
    primary key(id),
    foreign key(id_usuario) references USUARIOS(id)
);

create table HABITACION(
	id int auto_increment,
    descripcion varchar(255),
    numero_ventanas int,
    numero_puertas int,
    id_hogar int,
    primary key(id),
    foreign key(id_hogar) references HOGAR(id)
);

create table VENTANAS(
	id int auto_increment,
    descripcion varchar(255),
    id_habitacion int,
    id_sensor int,
    primary key(id),
    foreign key(id_habitacion) references HABITACION(id),
    foreign key(id_sensor) references SENSORES(id)
);

create table PUERTAS(
	id int auto_increment,
    descripcion varchar(255),
    id_habitacion int,
    id_sensor int,
    primary key(id),
    foreign key(id_habitacion) references HABITACION(id),
    foreign key(id_sensor) references SENSORES(id)
);

create table CERRADURAS(
	id int auto_increment,
    codigo varchar(255),
    estado varchar(50),
    modo_uso varchar(50),
    codigo_qr varchar(255),
    id_puerta int,
    primary key(id),
    foreign key(id_puerta) references PUERTAS(id)
);

create table SENSORES(
	id int auto_increment,
    nombre_sensor varchar(255),
    tipo_sensor varchar(50),
    primary key(id)
);

create table ACTIVIDADES(
	id int auto_increment,
    id_sensor int,
    tipo_actividad varchar(255),
    parametros varchar(255),
    fecha timestamp,
    primary key(id),
    foreign key(id_sensor) references SENSORES(id)
);
