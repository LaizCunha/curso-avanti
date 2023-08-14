create database certidao;
use certidao;

create table cliente (
id serial primary key not null,
nome varchar(50),
cpf varchar(11)
);

create table certidao (
id serial primary key not null,
cliente_id int,
data_emissao date,
hora_emissao time,
validade date,
codigo_validacao int
);

create table imovel(
id serial primary key not null,
cliente_id int,
endereco text,
contrato_ativo boolean
);

create table debito(
id serial primary key,
cliente_id int,
valor decimal,
data_vencimento date
);

alter table certidao
add foreign key (cliente_id)
references cliente(id);

alter table debito
add foreign key (cliente_id)
references cliente(id);

alter table imovel
add foreign key (cliente_id)
references cliente(id);

insert into cliente (nome, cpf) values 
('Maria Pereira', '56787654567'),
('Ana Claudia Souza', '98765456787'),
('Vitor Oliveira', '76765434321'),
('Felipe Silva', '43267120987'),
('Jhonas Nascimento', '87687654320'),
('Gustavo Aquino', '743287654321'),
('Antônio Fortes', '43267843526'),
('Carolina Coelho', '30927364572'),
('Claudio Araujo', '65432765432'),
('Ana Botelho', '30987162534'),
('Verena Bezerra', '29856439870');

insert into imovel (cliente_id, endereco, contrato_ativo) values 
('2', 'Rua F, n 456, Barra', true),
('2', 'Rua G, n 3, Prainha', true),
('1', 'Rua F, n 11, Barra', false),
('3', 'Rua H, n 02, Parque Verde', true),
('4', 'Rua K, n 33, Iracema', true),
('5', 'Rua A, n 9, Barra', false),
('6', 'Rua A, n 10, Barra', true),
('7', 'Rua G, n 5, Prainha', true),
('8', 'Rua H, n 30, Parque Verde', true),
('9', 'Rua K, n 01, Iracema', false),
('10', 'Rua F, n 40, Barra', true),
('11', 'Rua H, n 45, Parque Verde', true),
('7', 'Rua F, n 67, Barra', true),
('4', 'Rua A, n 21, Barra', true);

insert into debito (cliente_id, valor, data_vencimento) values
('2', '2000', '2023-12-01'),
('3', '500', '2023-10-01'),
('4', '8000', '2023-12-11'),
('6', '8000', '2023-11-02');

insert into debito (cliente_id, valor, data_vencimento) values
('3', '1000', '2023-10-01');

insert into certidao (cliente_id, data_emissao, hora_emissao, validade, codigo_validacao) values
('1', '2023-08-14', '12:00:28', '2023-09-13', '2244'),
('5', '2023-08-11', '22:15:07', '2023-09-10', '2231'),
('6', '2023-06-07', '13:09:08', '2023-07-07', '2121'),
('7', '2023-07-07', '08:12:14', '2023-08-06', '2243'),
('8', '2023-05-12', '11:02:58', '2023-06-12', '2134'),
('9', '2023-03-01', '23:13:09', '2023-04-01', '2111'),
('10', '2023-02-22', '15:28:10', '2023-03-24', '2213'),
('11', '2023-08-05', '20:17:15', '2023-09-04', '2123');

insert into certidao (cliente_id, data_emissao, hora_emissao, validade, codigo_validacao) values
('1', '2023-08-11', '07:32:11', '2023-09-12', '2241');

select * from cliente;

select * from certidao;

select * from debito
where cliente_id = '2';

select * from imovel join cliente on imovel.cliente_id = cliente.id
where contrato_ativo = '1';

select * from certidao
where cliente_id = '1' and data_emissao between '2023-08-10' and '2023-08-15';

select nome, cliente_id, sum(valor) from debito
join cliente on cliente_id = cliente.id
where cliente_id = '3';

select codigo_validacao, validade from certidao;

select * from cliente
join debito on cliente.id = cliente_id;









