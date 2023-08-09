CREATE DATABASE biblioteca;

CREATE TABLE autores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

insert into autores (nome) values
('Autor 1'), 
('Autor 2'),
('Autor 3');

create table livros (
id serial primary key,
titulo varchar(200) not null,
ano_publicacao integer not null,
autor_id integer references autores(id) on delete cascade
);

select * from autores;
select * from livros;

insert into livros(titulo, ano_publicacao, autor_id) values
('Livro 1', 2020, 1),
('Livro 2', 2018, 2),
('Livro 3', 2015, 1),
('Livro 4', 2019, 3),
('Livro 5', 2022, 2);

insert into autores values (
4, 'Laiz'
);

insert into livros (titulo, ano_publicacao, autor_id) values
('ABC', 2020, 4),
('XYZ', 2021, 4);

select nome as autor, titulo as livro
from autores
join livros on autores.id = autor_id;

select titulo, ano_publicacao 
from livros
where ano_publicacao > 2018;

select nome as autor, count(livros.id) as total_livros, max(ano_publicacao) as primeira_publicacao
from autores
left join livros on autores.id = livros.autor_id
group by nome;

select * 
from autores a 
left join livros l on a.id = l.autor_id;

insert into autores (nome) values ('Joao');
