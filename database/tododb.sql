create table users (
	iduser serial,
	username VARCHAR(64) not null,
	password VARCHAR(64) not null,	
	constraint pk_iduser primary key(iduser)
);

create table tasks (
	idtask serial,
	iduser int not null,
	title varchar(64) default null,
	description varchar(256) default null,
	status bit(1) default null,
	deadline date default null,
	constraint pk_idtask primary key(idtask),
	constraint fk_iduser foreign key(iduser) references users(iduser)
);
-- for pgsql 
-- Table: public.tasks

-- DROP TABLE public.tasks;

CREATE TABLE public.tasks
(
    idtask integer NOT NULL DEFAULT nextval('tasks_idtask_seq'::regclass),
    iduser integer NOT NULL,
    title character varying(64) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    description character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    status bit(1) DEFAULT NULL::"bit",
    deadline date,
    CONSTRAINT pk_idtask PRIMARY KEY (idtask),
    CONSTRAINT fk_iduser FOREIGN KEY (iduser)
        REFERENCES public.users (iduser) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.tasks
    OWNER to pgessea;

-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    iduser integer NOT NULL DEFAULT nextval('users_iduser_seq'::regclass),
    username character varying(64) COLLATE pg_catalog."default" NOT NULL,
    password character varying(64) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_iduser PRIMARY KEY (iduser)
)

TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to pgessea;
