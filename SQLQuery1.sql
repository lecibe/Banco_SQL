--DDL (Data definition language)
--create, drop, alter, grant, revoke
CREATE DATABASE banco_sql;
USE banco_sql;

create table agencia(
	id_agencia INT NOT NULL,
	nome_agencia VARCHAR(50) NOT NULL,
	numero int not null,
	id_local int not null,
	constraint pk_agencia primary key (id_agencia)
);

create table cep(
	id_cep int not null,
	cep varchar(11),
	constraint pk_cep primary key (id_cep)
);

create table cidade(
	id_cidade int not null,
	nome_cidade varchar(100),
	id_estado int not null,
	constraint pk_cidade primary key (id_cidade)
);

create table cliente(
	id_cliente int not null,
	cpf varchar(11) not null,
	rg varchar (11) not null,
	nome varchar(100) not null,
	data_nascimento varchar(11) not null,
	id_endereco int not null,
	constraint pk_cliente primary key (id_cliente)
);

create table cliente_conta(
	id_cliente_conta int not null,
	id_conta int not null,
	constraint pk_cliente_conta primary key (id_cliente_conta, id_conta)
);

create table conta(
	id_conta int not null,
	numero int not null,
	digito int not null,
	id_tipo int not null,
	id_agencia int not null,
	constraint pk_conta primary key (id_conta)

);

create table conta_agencia(
	id_conta_ag int not null,
	contato varchar(50) not null,
	id_tipo_contato int not null,
	id_agencia int not null,
	constraint pk_conta_agencia primary key (id_conta_ag)
);

create table contato_agencia (
	id_contato_agencia int not null,
	contato varchar (50) not null,
	id_tipo_contato_ag int not null,
	id_agencia int not null,
	constraint pk_contato_agencia primary key (id_contato_agencia)
);

create table contato_cliente (
	id_contato_cliente int not null,
	contato varchar (50) not null,
	id_tipo_contato_cli int not null,
	id_cliente int not null,
	constraint pk_contato_cliente primary key (id_contato_cliente)
);

create table estado (
	id_estado int not null,
	nome_estado varchar(50) not null,
	id_pais int not null,
	constraint pk_estado primary key (id_estado)
);

create table endereco (
	id_endereco int not null,
	longadouro varchar(80) not null,
	bairro varchar(50),
	descricacao varchar(50),
	numero int not null,
	id_cep int not null,
	id_cidade int not null,
	id_tipo_longadouro int not null,
	constraint pk_endereco primary key (id_endereco)
);

create table operacao (
	id_operacao int not null,
	valor decimal(18,6) not null,
	data_hora varchar(50) not null,
	id_tipo int not null,
	id_conta int not null,
	id_operacao_origem int not null
	constraint pk_operacao primary key (id_operacao)
);

create table pais(
	id_pais int not null,
	nome_pais varchar(100) not null,
	constraint pk_pais primary key (id_pais)
);

create table tipo_conta(
	id_tipo_conta int not null,
	descricao varchar(50),
	constraint pk_tipo_conta primary key (id_tipo_conta)
);

create table tipo_contato(
	id_tipo int not null,
	descricao varchar(50) not null,
	constraint pk_tipo_contato primary key (id_tipo)
);

create table tipo_longadouro(
	id_tipo_longadouro int not null,
	sigla varchar(50),
	constraint pk_tipo_longadouro primary key (id_tipo_longadouro)
);

create table tipo_operacao(
	id_tipo_operacao int not null,
	descricao varchar(50) not null,
	constraint pk_tipo_operacao primary key (id_tipo_operacao)
);

--ALTER TABLE [tabela] ADD CONSTRAINT [nome] 
alter table agencia	add constraint fk_id_local
--[TIPO_CONSTRAINT] [coluna_aplica] [REFERENCES] [tabela_referencia] ([coluna_referencia])
foreign key (id_local) references endereco (id_endereco);

alter table cidade add constraint fk_id_estado
foreign key (id_estado) references estado (id_estado);

alter table cliente add constraint fk_id_endereco
foreign key (id_endereco) references endereco (id_endereco);

alter table conta add constraint fk_id_tipo
foreign key (id_tipo) references tipo_conta (id_tipo_conta);

alter table conta add constraint fk_id_agencia
foreign key (id_agencia) references agencia (id_agencia);

alter table conta_agencia add constraint fk_id_conta_agencia
foreign key (id_agencia) references agencia (id_agencia);

alter table contato_agencia add constraint fk_id_tipo_contato_ag
foreign key (id_tipo_contato_ag) references tipo_contato (id_tipo);

alter table contato_agencia add constraint fk_id_contato_agencia
foreign key (id_agencia) references agencia (id_agencia);

alter table contato_cliente add constraint fk_id_tipo_contato_cli
foreign key (id_tipo_contato_cli) references tipo_contato (id_tipo);

alter table contato_cliente add constraint fk_id_cliente
foreign key (id_cliente) references cliente (id_cliente);

alter table estado add constraint fk_id_pais
foreign key (id_pais) references pais (id_pais);

alter table endereco add constraint fk_id_cep
foreign key (id_cep) references cep (id_cep);

alter table endereco add constraint fk_id_cidade
foreign key (id_cidade) references cidade (id_cidade);

alter table endereco add constraint fk_id_tipo_longadouro
foreign key (id_tipo_longadouro) references tipo_longadouro (id_tipo_longadouro);

alter table operacao add constraint fk_id_conta
foreign key (id_conta) references conta (id_conta);

alter table operacao add constraint fk_id_operacao_origem
foreign key (id_operacao_origem) references tipo_operacao (id_tipo_operacao);

---------------------------------------------------------------------------------------------
insert into cep (id_cep, cep) values
(1, 07894-963),
(2, 25896-123),
(3, 01235-125),
(4, 10005-124),
(5, 89541-122),
(6, 63298-147),
(7, 02587-159),
(8, 78965-156),
(9, 03478-126),
(10,78412-489);

insert into pais (id_pais, nome_pais) values
(41, 'Brasil'),
(42, 'Brasil'),
(43, 'Brasil'),
(44, 'Brasil'),
(45, 'Brasil'),
(46, 'Brasil'),
(47, 'Brasil'),
(48, 'Brasil'),
(49, 'Brasil'),
(50, 'Brasil');

insert into estado (id_estado, nome_estado, id_pais) values
(31, 'SP', 41),
(32, 'SP', 42),
(33, 'RJ', 43),
(34, 'SC', 44),
(35, 'MA', 45),
(36, 'BA', 46),
(37, 'SP', 47),
(38, 'RJ', 48),
(39, 'SP', 49),
(40, 'MG', 50);

insert into cidade (id_cidade, nome_cidade, id_estado) values
(11,'Sao Paulo', 31),
(12,'Minas Gerais', 32),
(13,'Curitiba', 33),
(14,'Santos', 34),
(15,'Sao Paulo', 35),
(16,'Osasco', 36),
(17,'Laranjeiras', 37),
(18,'Goias', 38),
(19,'Sao Paulo', 39),
(20,'Sao Paulo', 40);

insert into tipo_longadouro (id_tipo_longadouro, sigla) values
(21, 'AV.'),
(22, 'AV.'),
(23, 'AV.'),
(24, 'RUA'),
(25, 'AV.'),
(26, 'RUA'),
(27, 'RUA'),
(28, 'AV.'),
(29, 'AV.'),
(30, 'AV.');


insert into endereco (id_endereco, longadouro, bairro, descricacao, numero, id_cep, id_cidade, id_tipo_longadouro) values
(1, 'Av. Paulista', 'Bela Vista', 'Agencia Prime', 1002, 1, 11, 21),
(2, 'Av. Santos', 'Jd. Botanico', 'Agencia Classic', 122, 2, 12, 22),
(3, 'Av. Brasil', 'Lapa', 'Agencia Prime', 252, 3, 13, 23),
(4, 'Rua 7 de Setembro', 'Jd. Alice', 'Agencia Black', 587, 4, 14, 24),
(5, 'Av. Hermano Market', 'Pq. Paulista', 'Agencia Pravite', 53, 5, 15, 25),
(6, 'Rua Analice Sakaust', 'Pq. Montreal', 'Agencia Prime', 455, 6, 16, 26),
(7, 'Rua Jucelino Kubetch', 'Jd. Alphaville', 'Agencia Classic', 625, 7, 17, 27),
(8, 'Av. Fontes de Andrade', 'Sao Paulo', 'Agencia Pravite', 548, 8, 18, 28),
(9, 'Av. Aurora Soares', 'Vila Bela', 'Agencia Classic', 755, 9, 19, 29),
(10,'Av. Francisco Matarazzo', 'Vila Bazu', 'Agencia Prime', 24, 10, 20, 30);


insert into agencia (id_agencia, nome_agencia, numero, id_local) values
(1, 'Bela Vista', 456, 1),
(2, 'Jardim Botanico', 789, 2),
(3, 'Avenida Brasil', 268, 3),
(4, 'Montes Claros', 678, 4),
(5, 'Eldorado', 852, 5),
(6, 'Higienopolis', 336, 6),
(7, 'Cidade São Paulo', 895, 7),
(8, 'Interlagos', 176, 8),
(9, 'Osasco', 954, 9),
(10, 'Franca', 102, 10);

insert into cliente (id_cliente, cpf, rg, nome, id_endereco, data_nascimento) values
(10, 456789123, 5247541232,'Cibele de Oliveira', 1, '1996-14-11'),
(11, 456239123, 236541239, 'Mateus Augusto Amaral', 2, '1986-12-02'),
(12, 4896789123,874141236, 'Rita Maria de Oliveira Cebola', 3, '1974-03-03'),
(13, 478789123, 236841233, 'Aline Antunes', 4, '1993-02-12'),
(14, 412789123, 214741234, 'Pamela Rodrigues', 5, '1995-14-07'),
(15, 410089123, 234441237, 'Julia Rodrigues de Oliveria', 6, '2000-13-01'),
(16, 411189123, 201441238, 'Pedro Silva dos Santos', 7, '1966-08-10'),
(17, 423189123, 5896541231,'Barbara Larissa Costa', 8, '1998-09-05'),
(18, 474189123, 236441231, 'Amanda Araujo da Cunha', 9, '1996-12-12'),
(19, 410189123, 621441230, 'Adriele Souza de Sá', 10, '1999-02-08');

insert into cliente_conta (id_cliente_conta, id_conta) values
(10, 51),
(9, 52),
(8, 53),
(7, 54),
(6, 55),
(5, 56),
(4, 57),
(3, 58),
(2, 59),
(1, 60);

insert into tipo_conta (id_tipo_conta, descricao) values
(61, 'Conta-Corrente'),
(62, 'Conta-Poupança'),
(63, 'Conta-Corrente'),
(64, 'Conta-Corrente'),
(65, 'Conta-Poupança'),
(66, 'Conta-Corrente'),
(67, 'Conta-Poupança'),
(68, 'Conta-Salário'),
(69, 'Conta-Poupança'),
(70, 'Conta-Corrente');

insert into tipo_contato (id_tipo, descricao) values
(71, 'Telefone e e-mail'),
(72, 'Telefone e E-mail'),
(73, 'Telefone e E-mail'),
(74, 'Telefone e E-mail'),
(75, 'Telefone e E-mail'),
(76, 'Telefone e E-mail'),
(77, 'Telefone e E-mail'),
(78, 'Telefone e E-mail'),
(79, 'Telefone e E-mail'),
(80, 'Telefone e E-mail');

insert into conta_agencia (id_conta_ag, contato, id_tipo_contato, id_agencia) values
(10,'agenciabelavista@bradesco.com''4561-4789', 71, 1),
(9, 'agenciabotanico@bradesco.com''4561-0004', 72, 2),
(8, 'agencialapa@bradesco.com''4561-8564', 73, 3),
(7, 'agenciaalice@bradesco.com''4561-1964', 74, 4),
(6, 'agenciapaulista@bradesco.com''4561-2364', 75, 5),
(5, 'agenciamontreal@bradesco.com''4561-4464', 76, 6),
(4, 'agenciaalphaville@bradesco.com''4561-8764', 77, 7),
(3, 'agenciasp@bradesco.com''4561-7764', 78, 8),
(2, 'agenciabela@bradesco.com''4561-4164', 79, 9),
(1, 'agenciabazu@bradesco.com''4561-2364', 80, 10);

insert into contato_agencia (id_contato_agencia, contato, id_tipo_contato_ag, id_agencia) values
(81, 'agenciabelavista@bradesco.com''4561-4789', 71, 1),
(82, 'agenciabotanico@bradesco.com''4561-0004', 72, 2),
(83, 'agencialapa@bradesco.com''4561-8564', 73, 3),
(84, 'agenciaalice@bradesco.com''4561-1964', 74, 4),
(85, 'agenciapaulista@bradesco.com''4561-2364', 75, 5),
(86, 'agenciamontreal@bradesco.com''4561-4464', 76, 6),
(87, 'agenciaalphaville@bradesco.com''4561-8764', 77, 7),
(88, 'agenciasp@bradesco.com''4561-7764', 78, 8),
(89, 'agenciabela@bradesco.com''4561-4164', 79, 9),
(90, 'agenciabazu@bradesco.com''4561-2364', 80, 10);

insert into contato_cliente (id_contato_cliente, contato, id_tipo_contato_cli, id_cliente) values
(81, '97899-1231', 71, 10),
(82, '97452-4120', 72, 11),
(83, '96420-7776', 73, 12),
(84, '94520-5206', 74, 13),
(85, '97852-3026', 75, 14),
(86, '94152-2206', 76, 15),
(87, '95820-5636', 77, 16),
(88, '90526-2096', 78, 17),
(89, '97180-5896', 79, 18),
(90, '95020-9696', 80, 19);

insert into tipo_operacao (id_tipo_operacao, descricao) values
(90, 'Deposito'),
(91, 'Saque'),
(92, 'Transferencia'),
(93, 'Extrato');

insert into conta ( id_conta, numero, digito, id_tipo, id_agencia) values
(10, 4569, 2, 61, 1),
(9, 1479, 5, 62, 2),
(8, 2694, 8, 63, 3),
(7, 5963, 2, 64, 4),
(6, 8941, 1, 65, 5),
(5, 2108, 9, 66, 6),
(4, 98746, 6, 67, 7),
(3, 45616, 3, 68, 8),
(2, 9895, 4, 69, 9),
(1, 0587, 7, 70, 10);

insert into operacao (id_operacao, valor, data_hora, id_tipo, id_conta, id_operacao_origem) values
(100, 50, '12:56''terça', 90, 8, 90),
(101, 100, '14:30''quinta', 91, 7, 91),
(102, 500, '09:40''sexta', 92, 6, 92),
(103, 20,	'16:12''sabado', 93, 5, 93),
(104, 150, '17:42''segunda', 90, 2, 90);


--1 - Listar id, número, digito e tipo da conta. Deve ser listado apenas para as contas do tipo 'Conta Corrente'
select conta.id_conta,conta.numero, conta.digito, tipo_conta.descricao from conta
inner join tipo_conta on tipo_conta.id_tipo_conta = conta.id_tipo
where tipo_conta.descricao = 'Conta-Corrente'

--2 - Listar cliente(nome, cpf), conta(agência, número e dígito). Deve ser listado apenas dos clientes que residem na cidade de 'São Paulo' e no estado de 'São Paulo'
select cliente.nome, cliente.cpf, conta.id_agencia, conta.numero, conta.digito, cidade.nome_cidade from cliente, conta, cidade
inner join endereco on cidade.nome_cidade = cidade.nome_cidade
where cidade.nome_cidade = 'Sao Paulo'

--3 - Listar conta(agência, número e digito), operação(tipo, data, valor) das contas. Nesta listagem deve ser considerado apenas as operações do ano de 2022
select conta.id_agencia, conta.numero, conta.digito, operacao.id_tipo, operacao.data_hora, operacao.valor from conta, operacao
inner join cliente on cliente.id_cliente = operacao.id_conta
where operacao.data_hora = '2022'

--4 - Listar todas as contas que não tiveram operação no ano de 2022.
SELECT data_hora FROM operacao WHERE data_hora < '2022'

--5 - Crie uma view para exibir o saldo das contas.
CREATE VIEW conta_oper AS
SELECT id_conta, valor FROM operacao;

SELECT * FROM conta_oper

--6 - Crie uma view para exibir o histórico de transações.
CREATE VIEW historico AS
SELECT id_operacao, valor, data_hora, id_tipo, id_conta FROM operacao;

SELECT * FROM historico



