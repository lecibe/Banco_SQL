--DDL (Data definition language)
--create, drop, alter, grant, revoke
CREATE DATABASE banco_sql;

-- CREATE TABLE [nome_table]
CREATE TABLE cliente(
	-- [nome_coluna] [tipo_dado] [restrições]
	id INT NOT NULL,
	nome VARCHAR(100),
	cpf VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	data_nascimento varchar(10) NOT NULL,
	-- CONSTRAINT [nome_constraint] [tipo_constraint] [coluna_aplica]
	CONSTRAINT pk_cliente PRIMARY KEY (id)
);

CREATE TABLE agencia(
	id INT NOT NULL,
	numero_ag varchar(50) NOT NULL,
	nome_ag varchar(50) NOT NULL,
	rua VARCHAR(50) NOT NULL,
	numero INT NOT NULL,
	cidade varchar(50) NOT NULL,
	estado varchar(50) NOT NULL,
	CONSTRAINT pk_agencia PRIMARY KEY (id)
);

CREATE TABLE conta(
	id INT NOT NULL,
	numero_conta INT NOT NULL,
	digito_conta INT NOT NULL,
	tipo_conta VARCHAR(40) NOT NULL,
	CONSTRAINT pk_conta PRIMARY KEY (id)
);

CREATE TABLE cliente_conta(
	id_cliente INT NOT NULL,
	id_conta INT NOT NULL,
	CONSTRAINT pk_cliente_conta PRIMARY KEY (id_cliente, id_conta)
);

CREATE TABLE operacao(
	id INT NOT NULL,
	tipo VARCHAR(80) NOT NULL,
	valor DECIMAL(18,6) NOT NULL,
	data_hora DATETIME NOT NULL,
	CONSTRAINT pk_operacao PRIMARY KEY (id)
);

CREATE TABLE enderecocliente(
	id INT NOT NULL,
	rua VARCHAR(50) NOT NULL,
	numero INT NOT NULL,
	cidade varchar(50) NOT NULL,
	estado varchar(50) NOT NULL,
	CONSTRAINT pk_enderecocliente PRIMARY KEY (id)
);


--ALTER TABLE [tabela] ADD CONSTRAINT [nome] 
ALTER TABLE cliente	ADD CONSTRAINT fk_cliente_enderecocliente
--[TIPO_CONSTRAINT] [coluna_aplica] [REFERENCES] [tabela_referencia] ([coluna_referencia])
FOREIGN KEY (id) REFERENCES enderecocliente(id);

ALTER TABLE agencia ADD CONSTRAINT fk_agencia_conta FOREIGN KEY (id) REFERENCES conta(id);

ALTER TABLE conta ADD CONSTRAINT fk_conta_cliente_conta FOREIGN KEY (id_conta) REFERENCES cliente_conta(id_conta);

ALTER TABLE operacao ADD CONSTRAINT fk_operacao_conta FOREIGN KEY (id) REFERENCES conta(id);


--DML (Data model language)
--insert, update, delete

insert into cliente (id, nome, cpf, email, data_nascimento)
values
(1, 'Cibele', 815684894, 'cibele@test.com', '14-11-1996'),
(2, 'Fulano', 4564651, 'fulano@test.com', '01-06-1999');

insert into agencia (id, numero_ag, nome_ag, rua, numero, cidade, estado)
values (4, 123,'Bradesco', 'Av São Paulo', 656, 'Osasco', 'SP');

insert into conta (id, numero_conta, digito_conta, tipo_conta)
values
(4, 1234, 6, 'corrente');

insert into cliente_conta (id_cliente, id_conta)
values
(1),
(4);

insert into operacao (id, tipo, valor, data_hora)
values
(4, 'extrato', 50.00, @@DATEFIRST);

SELECT *FROM cliente;
SELECT *FROM agencia;
SELECT *FROM conta;
SELECT *FROM  cliente_conta;
SELECT *FROM operacao;