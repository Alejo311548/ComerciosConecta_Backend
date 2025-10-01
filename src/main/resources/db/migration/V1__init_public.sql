CREATE TABLE comercio (
                          id serial PRIMARY KEY,
                          nombre varchar,
                          nit varchar,
                          direccion varchar,
                          telefono varchar,
                          email varchar,
                          esquema_bd varchar,
                          logo_url varchar,
                          created_at timestamp DEFAULT now()
);

CREATE TABLE rol (
                     id serial PRIMARY KEY,
                     nombre varchar,
                     descripcion varchar
);

CREATE TABLE usuario (
                         id serial PRIMARY KEY,
                         comercio_id int REFERENCES comercio(id),
                         nombre varchar,
                         email varchar UNIQUE,
                         password varchar,
                         estado varchar,
                         created_at timestamp DEFAULT now()
);

CREATE TABLE usuario_rol (
                             usuario_id int REFERENCES usuario(id),
                             rol_id int REFERENCES rol(id),
                             PRIMARY KEY(usuario_id, rol_id)
);

CREATE TABLE refresh_token (
                               id serial PRIMARY KEY,
                               usuario_id int REFERENCES usuario(id),
                               token_hash varchar,
                               expires_at timestamp,
                               revoked boolean DEFAULT false,
                               created_at timestamp DEFAULT now()
);
