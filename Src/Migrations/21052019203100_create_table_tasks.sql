-- +goose Up    
CREATE TABLE public.tasks
(
    id bigserial NOT NULL,
    name character varying(255) NOT NULL,
    section_id bigint NOT NULL,
    CONSTRAINT tasks_pkey PRIMARY KEY (id),
    CONSTRAINT tasks_section_id_fkey FOREIGN KEY (section_id)
    REFERENCES public.sections (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
