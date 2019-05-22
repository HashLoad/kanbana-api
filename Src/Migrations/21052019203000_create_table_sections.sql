-- +goose Up    
CREATE TABLE public.sections
(
    id bigserial NOT NULL,
    name character varying(255) NOT NULL,
    board_id bigint NOT NULL,
    CONSTRAINT sections_pkey PRIMARY KEY (id),
    CONSTRAINT sections_board_id_fkey FOREIGN KEY (board_id)
    REFERENCES public.boards (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
