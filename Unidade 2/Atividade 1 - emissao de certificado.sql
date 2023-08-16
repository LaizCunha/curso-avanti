create database certidao;
use certidao;

create table cliente (
id int primary key auto_increment,
nome varchar(50) not null,
cpf varchar(11) not null unique
) engine InnoDB;

create table certidao (
id int primary key auto_increment,
cliente_id int not null,
data_emissao date not null,
hora_emissao time not null,
validade date,
codigo_validacao int not null
) engine InnoDB;

create table imovel(
id int primary key auto_increment,
cliente_id int,
endereco text,
contrato_ativo boolean not null
) engine InnoDB;

create table debito(
id int primary key auto_increment,
imovel_id int not null,
valor decimal not null,
data_vencimento date
) engine InnoDB;

alter table certidao
add foreign key (cliente_id)
references cliente(id);

alter table debito
add foreign key (imovel_id)
references imovel(id);

alter table imovel
add foreign key (cliente_id)
references cliente(id);

insert into cliente (nome, cpf) values 
('Maria Pereira', '56787654567'),
('Ana Claudia Souza', '98765456787'),
('Vitor Oliveira', '76765434321'),
('Felipe Silva', '43267120987'),
('Jhonas Nascimento', '87687654320'),
('Gustavo Aquino', '74328765432'),
('Antônio Fortes', '43267843526'),
('Carolina Coelho', '30927364572'),
('Claudio Araujo', '65432765432'),
('Ana Botelho', '30987162534'),
('Verena Bezerra', '29856439870');

insert into imovel (cliente_id, endereco, contrato_ativo) values 
(6, 'Rua F, n 456, Barra', true),
(2, 'Rua G, n 3, Prainha', true),
(1, 'Rua F, n 11, Barra', false),
(3, 'Rua H, n 02, Parque Verde', true),
(4, 'Rua K, n 33, Iracema', true),
(5, 'Rua A, n 9, Barra', false),
(6, 'Rua A, n 10, Barra', true),
(7, 'Rua G, n 5, Prainha', true),
(8, 'Rua H, n 30, Parque Verde', true),
(9, 'Rua K, n 01, Iracema', false),
(10, 'Rua F, n 40, Barra', true),
(11, 'Rua H, n 45, Parque Verde', true),
(7, 'Rua F, n 67, Barra', true),
(4, 'Rua A, n 21, Barra', true);

insert into debito (imovel_id, valor, data_vencimento) values
(1, 2000, '2023-12-01'),
(2, 500, '2023-10-01'),
(4, 8000, '2023-12-11'),
(6, 8000, '2023-11-02'),
(3, 1000, '2023-10-01'),
(7, 850, '2023-08-30');

insert into certidao (cliente_id, data_emissao, hora_emissao, validade, codigo_validacao) values
(4, '2023-08-14', '12:00:28', '2023-09-13', '2244'),
(6, '2023-08-11', '22:15:07', '2023-09-10', '2231'),
(6, '2023-06-07', '13:09:08', '2023-07-07', '2121'),
(7, '2023-07-07', '08:12:14', '2023-08-06', '2243'),
(8, '2023-05-12', '11:02:58', '2023-06-12', '2134'),
(9, '2023-03-01', '23:13:09', '2023-04-01', '2111'),
(10, '2023-02-22', '15:28:10', '2023-03-24', '2213'),
(11, '2023-08-05', '20:17:15', '2023-09-04', '2123'),
(4, '2023-08-11', '07:32:11', '2023-09-12', '2241');

select * from cliente;

select * from certidao;

select * from debito join imovel on imovel_id = imovel.id where cliente_id = 2;

select cliente.nome, imovel.* from imovel join cliente on imovel.cliente_id = cliente.id
where contrato_ativo = 1 and cliente_id = 4;

select * from certidao
where cliente_id = 4 and data_emissao between '2023-08-10' and '2023-08-15';

select sum(valor) from debito
join imovel on imovel_id = imovel.id
where cliente_id = 6;

select codigo_validacao, validade from certidao;

select cliente.nome, debito.* from cliente
join imovel on cliente.id = cliente_id
join debito on imovel.id = imovel_id;

select extract(month from data_emissao), count(*) from certidao
group by extract(month from data_emissao);


select c.nome, count(d.id)
from cliente c
left join imovel i on c.id = i.cliente_id
left join debito d on d.imovel_id = i.id
group by c.nome;






