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

create table if not exists t_pedido(
    id_pedido        int(11)      auto_increment      not null,
    id_usuario       int(11)                          not null,
    fecha            date                             not null,
    hora             time                             not null,
    ciudad           varchar(100)                     not null,
    direccion        varchar(200)                     not null,
    costo            float(10,2)                      not null,
    estado           varchar(20)                      not null,
    constraint pk_pedido   primary key(id_pedido),
    constraint fk_pedido_usuario foreign key(id_usuario)references t_usuario(id_usuario)
)engine=InnoDB;

create table if not exists t_detalle_pedido(
    id_detalle_pedido   int(11)     auto_increment    not null,
    id_pedido           int(11)                       not null,
    id_producto         int(11)                       not null,
    cantidad            int(11)                       not null,
   constraint pk_detalle_pedido   primary key(id_detalle_pedido),
    constraint fk_pedido foreign key(id_pedido)references t_pedido(id_pedido),
    constraint fk_producto foreign key(id_producto)references t_producto(id_producto)
)engine=InnoDB;
