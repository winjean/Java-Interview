
ALTER table tb_name add COLUMN cl_name int4 null;

ALTER table tb_name DROP COLUMN cl_name;

ALTER table tb_name RENAME COLUMN cl_name1 TO cl_name2;

ALTER table tb_name ALTER COLUMN cl_name set not null;

ALTER TABLE tb_name ALTER COLUMN cl_name TYPE int USING cl_name::integer;