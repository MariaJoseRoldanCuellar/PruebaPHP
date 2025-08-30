create DATABASE if not exists Tienda2;

use Tienda2;

create table if not exists t_usuario(
    id_usuario int(11) auto_increment not null,
    nombre    varchar(100)       not null,
    apellido  varchar(100)       not null,
    email     varchar(200)       not null,
    password  varchar(200)       not null,
    rol       varchar(20)        not null,
    imagen    varchar(200),
    constraint pk_usuario   primary key(id_usuario),
    constraint uq_email     unique(email)
)engine=InnoDB;

insert into t_usuario value (null, 'Majo', 'Roldan', 'major@gmail.com', '123456', 'admin', 'imagen');

create table if not exists t_categoria(
    id_categoria        int(11)      auto_increment    not null,
    nombre_categoria    varchar(100)                   not null,
    constraint pk_categoria   primary key(id_categoria)
)engine=InnoDB;

insert into t_categoria value (null, 'construcion'),(null, 'electricos'),(null, 'pinturas'),(null, 'pisos');

create table if not exists t_producto(
    id_producto      int(11)      auto_increment    not null,
    nombre_producto  varchar(100)    not null,
    stock            int(11)         not null,
    precio           float(11,2)     not null,
    imagen           varchar(255)    not null,
    oferta           int(200)        not null,
    id_categoria     int(11)         not null,
    descripcion      varchar(255)    not null,
    fecha            date            not null,
    constraint pk_producto   primary key(id_producto),
    constraint fk_producto_categoria foreign key(id_categoria)references t_categoria(id_categoria)
)engine=InnoDB;
