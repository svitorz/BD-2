
CREATE TABLE estadios (
    idEstadio SERIAL,
    nome VARCHAR(255) NOT NULL,
    CONSTRAINT pk_estadio PRIMARY KEY (idEstadio)
);

CREATE TABLE estadios_endereco (
    idEstadio INTEGER,
    rua VARCHAR(255),
    numero INTEGER,
    bairro VARCHAR(150),
    cidade VARCHAR(50),
    cep VARCHAR(9),
    CONSTRAINT pk_estadio_endereco PRIMARY KEY (idEstadio),
    CONSTRAINT fk_estadio_endereco FOREIGN KEY (idEstadio)
        REFERENCES estadios(idEstadio)
);

CREATE TABLE juizes (
    idJuiz SERIAL,
    nome VARCHAR(255),
    funcao VARCHAR(100),
    CONSTRAINT pk_juiz PRIMARY KEY (idJuiz)
);

CREATE TABLE times (
    idTime SERIAL,
    nome VARCHAR(255),
    data_criacao DATE,
    nome_tecnico VARCHAR(255),
    CONSTRAINT pk_times PRIMARY KEY (idTime)
);

CREATE TABLE partidas (
    idPartida SERIAL,
    data_hora TIMESTAMP,
    rodada INTEGER,
    golsCasa INTEGER,
    golsFora INTEGER,
    idEstadio INTEGER,
    idTimeCasa INTEGER,
    idTimeFora INTEGER,
    CONSTRAINT pk_partidas PRIMARY KEY (idPartida),
    CONSTRAINT fk_partida_estadio FOREIGN KEY (idEstadio)
        REFERENCES estadios(idEstadio),
    CONSTRAINT fk_time_casa FOREIGN KEY (idTimeCasa)
        REFERENCES times(idTime),
    CONSTRAINT fk_time_fora FOREIGN KEY (idTimeFora)
        REFERENCES times(idTime)
);

CREATE TABLE atletas (
    idAtleta SERIAL,
    nome VARCHAR(255),
    numero INTEGER,
    idTime INTEGER,
    CONSTRAINT pk_atleta PRIMARY KEY (idAtleta),
    CONSTRAINT fk_atletas_times FOREIGN KEY (idTime)
        REFERENCES times(idTime)
);

CREATE TABLE partidas_juizes (
    idJuiz INTEGER,
    idPartida INTEGER,
    CONSTRAINT pk_partidas_juizes PRIMARY KEY (idJuiz, idPartida),
    CONSTRAINT fk_partidas_juizes_partidas FOREIGN KEY (idPartida)
        REFERENCES partidas(idPartida),
    CONSTRAINT fk_partidas_juizes_juizes FOREIGN KEY (idJuiz)
        REFERENCES juizes(idJuiz)
);

CREATE TABLE atua (
    idAtleta INTEGER,
    idPartida INTEGER,
    posicao VARCHAR(50),
    cartao_amarelo INTEGER,
    cartao_vermelho INTEGER,
    gols INTEGER,
    assistencias INTEGER,
    CONSTRAINT pk_atletas_atua PRIMARY KEY (idAtleta, idPartida),
    CONSTRAINT fk_atleta_atua FOREIGN KEY (idAtleta)
        REFERENCES atletas(idAtleta),
    CONSTRAINT fk_partida_atua FOREIGN KEY (idPartida)
        REFERENCES partidas(idPartida)
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

INSERT INTO estadios_endereco
(idEstadio, rua, numero, bairro, cidade, cep) VALUES
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
('Daiane Caroline Muniz dos Santos', 'Árbitro de Vídeo (VAR)'),
('Sávio Pereira Sampaio', 'Árbitro Principal'),
('Matheus Delgado Candançan', 'Árbitro Principal'),
('Rodrigo José Pereira de Lima', 'Árbitro Principal');


INSERT INTO atletas (nome, numero, idTime) VALUES
('Yuri Alberto', 9, 6),
('Rodrigo Garro', 10, 6),
('Cássio (Exemplo/Ídolo)', 12, 6),
('Giorgian de Arrascaeta', 14, 9),
('Pedro', 9, 9),
('Gerson', 8, 9),
('Raphael Veiga', 23, 14),
('Flaco López', 42, 14),
('Gustavo Gómez', 15, 14),
('Lucas Moura', 7, 18),
('Jonathan Calleri', 9, 18),
('Luciano', 10, 18),
('Alexander Barboza', 0, 4),
('Agustín Giay', 0, 14),
('Joaquín Piquerez', 0, 14),
('Marlon Freitas', 0, 4),
('Memphis Depay', 0, 6),
('Gustavo Henrique', 0, 6),
('Matheus Bidu', 0, 6),
('Kaio César', 0, 6),
('Matheuzinho', 0, 6),
('André Ramalho', 0, 6),
('Neymar', 0, 17),
('Gabigol', 0, 17),
('Éverton Cebolinha', 0, 9),
('Philippe Coutinho', 0, 19),
('João Schmidt', 0, 17),
('Luan Peres', 0, 17),
('Benjamín Rollheiser', 0, 17),
('Luciano Juba', 0, 3),
('Bruno Santos', 0, 13),
('Edson Carioca', 0, 13),
('Samuel Lino', 0, 9),
('Amuzu', 0, 11),
('Walter Kannemann', 0, 11),
('Bruno Duarte', 0, 19),
('Andrés Gómez', 0, 19),
('Dylan Borrero', 0, 5),
('Túlio Eduardo', 0, 5);


INSERT INTO partidas
(data_hora, rodada, golsCasa, golsFora, idEstadio, idTimeCasa, idTimeFora)
VALUES
('2026-10-11 17:30:00', 30, 4, 1, 13, 14, 6),
('2026-10-24 21:00:00', 32, 1, 1, 16, 17, 3),
('2026-10-28 19:30:00', 33, 0, 0, 16, 17, 14),
('2026-10-30 20:00:00', 33, 2, 0, 6, 6, 13),
('2026-11-04 19:30:00', 34, 3, 1, 9, 9, 11),
('2026-11-14 20:30:00', 21, 0, 2, 5, 5, 19);


INSERT INTO partidas_juizes (idJuiz, idPartida) VALUES
(3, 1),
(11, 2),
(6, 3),
(12, 4),
(8, 5),
(13, 6);



INSERT INTO atua
(idAtleta, idPartida, posicao, cartao_amarelo, cartao_vermelho, gols, assistencias)
VALUES
(15, 1, 'Zagueiro', 0, 0, 1, 0),
(14, 1, 'Lateral', 1, 0, 0, 0),
(18, 1, 'Zagueiro', 0, 0, 1, 0),
(19, 1, 'Lateral', 0, 0, 0, 0),
(17, 1, 'Atacante', 1, 0, 0, 0),

(23, 2, 'Atacante', 0, 1, 0, 0),
(24, 2, 'Atacante', 0, 0, 0, 0),
(27, 2, 'Meio-campista', 0, 0, 0, 0),
(28, 2, 'Zagueiro', 0, 0, 1, 0),
(29, 2, 'Meio-campista', 0, 0, 0, 1),
(30, 2, 'Lateral', 0, 0, 1, 0),

(7, 3, 'Meio-campista', 1, 0, 0, 0),
(14, 3, 'Lateral', 1, 0, 0, 0),
(15, 3, 'Lateral', 1, 0, 0, 0),
(8, 3, 'Atacante', 1, 0, 0, 0),
(9, 3, 'Zagueiro', 1, 0, 0, 0),
(23, 3, 'Atacante', 1, 0, 0, 0),

(2, 4, 'Meio-campista', 0, 0, 0, 0),
(19, 4, 'Lateral', 0, 0, 1, 0),
(20, 4, 'Atacante', 0, 0, 1, 0),
(21, 4, 'Lateral', 1, 0, 0, 0),
(22, 4, 'Zagueiro', 1, 0, 0, 0),
(31, 4, 'Atacante', 0, 1, 0, 0),
(32, 4, 'Atacante', 1, 0, 0, 0),

(5, 5, 'Atacante', 0, 0, 2, 0),
(33, 5, 'Atacante', 0, 0, 1, 0),
(34, 5, 'Atacante', 0, 0, 1, 0),
(35, 5, 'Zagueiro', 1, 0, 0, 0),

(36, 6, 'Atacante', 0, 0, 2, 0),
(37, 6, 'Atacante', 0, 0, 0, 0),
(38, 6, 'Atacante', 0, 0, 0, 0),
(39, 6, 'Atacante', 0, 0, 0, 0);






