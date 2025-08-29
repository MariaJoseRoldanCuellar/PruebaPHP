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


