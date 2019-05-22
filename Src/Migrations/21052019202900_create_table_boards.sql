-- +goose Up    
CREATE TABLE public.boards
(
    id bigserial NOT NULL,
    name character varying(255) NOT NULL,
    CONSTRAINT boards_pkey PRIMARY KEY (id)
);
