create table estadios(
	idEstadio SERIAL,
	nome varchar(50) not null,
	constraint pk_estadio primary key (idEstadio)
);

alter table estadios drop column nome;
alter table estadios add column nome varchar(255);

create table estadios_endereco(
	idEstadio SERIAL unique,
	rua varchar(255),
	numero integer,
	bairro varchar(150),
	cidade varchar(50),
	cep varchar(9),
	constraint pk_estadio_endereco primary key (idEstadio),
	constraint fk_estadio_endereco foreign key (idEstadio)
		references estadios(idEstadio)
);

create table juizes(
	idJuiz SERIAL,
	nome varchar(255),
	funcao varchar(100),
	constraint pk_juiz primary key (idJuiz)
);

create table times(
	idTime SERIAL,
	nome varchar(255),
	data_criacao date,
	nome_tecnico varchar(255),
	constraint pk_times primary key (idTime)
);

create table partidas(
	idPartida SERIAL,
	data_hora timestamp,
	rodada integer,
	golsCasa integer,
	golsFora integer,
	idEstadio integer,
	idTimeCasa integer,
	idTimeFora integer,
	constraint pk_partidas primary key(idPartida),
	constraint fk_partida_estadio foreign key (idEstadio)
		references estadios (idEstadio),
	constraint fk_time_casa foreign key (idTimeCasa)
		references times(idTime),
	constraint fk_time_fora foreign key(idTimeFora)
		references times(idTime)
);

create table atletas(
	idAtleta SERIAL,
	nome varchar(255),
	numero integer,
	idTime integer,
	constraint pk_atleta primary key(idAtleta),
	constraint fk_atletas_times foreign key (idTime)
		references times (idTime)
);

create table partidas_juizes(
	idJuiz integer unique,
	idPartida integer unique,
	constraint no_duplicate_partidas unique(idJuiz, idPartida),
	constraint pk_partidas_juizes primary key (idJuiz, idPartida),
	constraint fk_partidas_juizes_partidas foreign key (idPartida)
		references partidas(idPartida),
	constraint fk_partidas_juizes_juizes foreign key(idJuiz)
		references juizes(idJuiz)
);

create table atua(
	idAtleta integer,
	idPartida integer,
	posicao varchar(50),
	cartao_amarelo integer,
	cartao_vermelho integer,
	gols integer,
	assistencias integer,
	constraint unique_atua unique (idAtleta, idPartida),
	constraint pk_atletas_atua primary key (idAtleta, idPartida),
	constraint fk_atleta_atua foreign key (idAtleta)
		references atletas (idAtleta),
	constraint fk_partida_atua foreign key (idPartida)
		references partidas (idPartida)
);

INSERT INTO times (nome, data_criacao, nome_tecnico) VALUES
('Athletico Paranaense', '1924-03-26', 'Odair Hellmann'),
('Atlético Mineiro', '1908-03-25', 'Eduardo Domínguez'),
('Bahia', '1931-01-01', 'Rogério Ceni'),
('Botafogo', '1894-07-01', 'Tite'),
('Chapecoense', '1973-05-10', 'Rodrigo Chip e Ricardo Chuva (interinos)'),
('Corinthians', '1910-09-01', 'Clarence Seedorf'),
('Coritiba', '1909-10-12', 'Guilherme Bossle (interino)'),
('Cruzeiro', '1921-01-02', 'Artur Jorge'),
('Flamengo', '1895-11-17', 'Leonardo Jardim'),
('Fluminense', '1902-07-21', 'Marcão'),
('Grêmio', '1903-09-15', 'Comissão técnica'),
('Internacional', '1909-04-04', 'Ramón Díaz'),
('Mirassol', '1925-11-09', 'Mozart'),
('Palmeiras', '1914-08-26', 'Abel Ferreira'),
('Red Bull Bragantino', '1928-01-08', 'Fernando Seabra'),
('Remo', '1905-02-05', 'Pedro Emanuel'),
('Santos', '1912-04-14', 'Juan Pablo Vojvoda'),
('São Paulo', '1930-01-25', 'Hernán Crespo'),
('Vasco da Gama', '1898-08-21', 'Fernando Diniz'),
('Vitória', '1899-05-13', 'Cléber dos Santos (interino)');

INSERT INTO estadios (nome) VALUES
('Ligga Arena'),
('Arena MRV'),
('Arena Fonte Nova'),
('Estádio Nilton Santos'),
('Arena Condá'),
('Neo Química Arena'),
('Estádio Couto Pereira'),
('Mineirão'),
('Maracanã'),
('Arena do Grêmio'),
('Estádio Beira-Rio'),
('Estádio Municipal José Maria de Campos Maia'),
('Allianz Parque'),
('Estádio Nabi Abi Chedid'),
('Mangueirão'),
('Vila Belmiro'),
('MorumBis'),
('Estádio São Januário'),
('Barradão'),
('Arena Castelão');

INSERT INTO estadios_endereco (idEstadio, rua, numero, bairro, cidade, cep) VALUES
(1, 'Rua Buenos Aires', 1260, 'Água Verde', 'Curitiba', '80250-070'),
(2, 'Rua Cristina Maria de Assis', 202, 'Califórnia', 'Belo Horizonte', '30860-830'),
(3, 'Ladeira da Fonte das Pedras', 0, 'Nazaré', 'Salvador', '40050-565'),
(4, 'Rua José dos Reis', 425, 'Engenho de Dentro', 'Rio de Janeiro', '20770-001'),
(5, 'Rua Clevelândia', 65, 'Centro', 'Chapecó', '89801-570'),
(6, 'Avenida Miguel Ignácio Curi', 111, 'Itaquera', 'São Paulo', '08295-005'),
(7, 'Rua Ubaldino do Amaral', 37, 'Alto da Glória', 'Curitiba', '80060-195'),
(8, 'Avenida Antônio Carlos', 7475, 'Pampulha', 'Belo Horizonte', '31270-901'),
(9, 'Avenida Professor Eurico Rabelo', 0, 'Maracanã', 'Rio de Janeiro', '20271-150'),
(10, 'Avenida Padre Leopoldo Brentano', 110, 'Humaitá', 'Porto Alegre', '90250-590'),
(11, 'Avenida Padre Cacique', 891, 'Medianeira', 'Porto Alegre', '90810-240'),
(12, 'Avenida Lauro Luchesi', 2050, 'Jardim Aeroporto', 'Mirassol', '15130-000'),
(13, 'Rua Turiaçu', 1840, 'Perdizes', 'São Paulo', '05005-000'),
(14, 'Avenida Portugal', 885, 'Jardim do Lago', 'Bragança Paulista', '12929-001'),
(15, 'Rodovia Augusto Montenegro', 550, 'Tapanã', 'Belém', '66823-010'),
(16, 'Rua Princesa Isabel', 77, 'Vila Belmiro', 'Santos', '11075-500'),
(17, 'Praça Roberto Gomes Pedrosa', 1, 'Morumbi', 'São Paulo', '05653-070'),
(18, 'Rua General Almério de Moura', 131, 'Vasco da Gama', 'Rio de Janeiro', '20921-060'),
(19, 'Rua Artêmio Valente', 1, 'Canabrava', 'Salvador', '41260-300'),
(20, 'Avenida Alberto Craveiro', 2901, 'Castelão', 'Fortaleza', '60860-025');

INSERT INTO juizes (nome, funcao) VALUES
('Raphael Claus', 'Árbitro Principal'),
('Wilton Pereira Sampaio', 'Árbitro Principal'),
('Anderson Daronco', 'Árbitro Principal'),
('Ramon Abatti Abel', 'Árbitro Principal'),
('Bráulio da Silva Machado', 'Árbitro Principal'),
('Flavio Rodrigues de Souza', 'Árbitro Principal'),
('Rafael Rodrigo Klein', 'Árbitro Principal'),
('Paulo César Zanovelli', 'Árbitro Principal'),
('Rodrigo D''Alonso Ferreira', 'Árbitro de Vídeo (VAR)'),
('Daiane Caroline Muniz dos Santos', 'Árbitro de Vídeo (VAR)');


INSERT INTO atletas (nome, numero, idTime) VALUES
('Yuri Alberto', 9, 6),
('Rodrigo Garro', 10, 6),
('Cássio (Exemplo/Ídolo)', 12, 6),
('Giorgian de Arrascaeta', 14, 9),
('Pedro', 9, 9),
('Gerson', 8, 9),
('Raphael Veiga', 23, 13),
('Flaco López', 42, 13),
('Gustavo Gómez', 15, 13),
('Lucas Moura', 7, 17),
('Jonathan Calleri', 9, 17),
('Luciano', 10, 17);