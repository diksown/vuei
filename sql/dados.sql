-- Funções para facilitar a inserção de datas
-- E não ter 1001's "YYYY-MM-DD HH24:MI:SS" no código
CREATE OR REPLACE FUNCTION format_datetime(date_str VARCHAR)
RETURNS TIMESTAMP AS $$
BEGIN
    RETURN TO_TIMESTAMP(date_str, 'YYYY-MM-DD HH24:MI:SS');
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION format_date(date_str VARCHAR)
RETURNS TIMESTAMP AS $$
BEGIN
    RETURN TO_TIMESTAMP(date_str, 'YYYY/MM/DD');
END;
$$ LANGUAGE plpgsql;

-- Inserção de dados

INSERT INTO PESSOA (EMAIL, NOME, SENHA, TELEFONE, DATA)
VALUES ('j_silva@gmail.com', 'João Silva', 'R$w#2gFq7P', '(11)99876-5432', format_date('1997/10/12')),
       ('mari.asantos@gmail.com', 'Maria Santos', 't9*G@zKp$L', '(21)95555-1234', format_date('1998/10/16')),
       ('pcosta1999@gmail.com', 'Pedro Costa', '5xU$P#zJwY', '(31)97777-8888', format_date('1999/05/05')),
       ('anaoliveira_@gmail.com', 'Ana Oliveira', 'B4r!E%hV2D', '(41)93333-9999', format_date('1996/08/05')),
       ('lp2000lp@gmail.com', 'Lucas Pereira', 'L@7wT$y1KX', '(51)96666-2222', format_date('2000/07/01')),
       ('srodrigues@gmail.com', 'Sofia Rodrigues', '3vN!QzR#Pm', '(61)92222-4444', format_date('1997/05/27')),
       ('c_fernandes@gmail.com', 'Carlos Fernandes', 'X$W5pZ9*Vt', '(71)98888-5555', format_date('1999/06/11')),
       ('mendeslaura@gmail.com', 'Laura Mendes', '8jF!qU@rZL', '(81)94444-7777', format_date('1998/08/20')),
       ('a.almeida@gmail.com', 'André Almeida', 's2vY$uM@1A', '(91)99999-3333', format_date('2000/11/23')),
       ('biacardoso@gmail.com', 'Beatriz Cardoso', 'Pz7H*V6@Tf', '(12)91234-5678', format_date('1995/11/22')),
       ('felipecarv@gmail.com', 'Felipe Carvalho', 'Y$eFtX#k9G', '(22)98765-4321', format_date('1998/12/02')),
       ('clarasouza_@gmail.com', 'Clara Sousa', '1aR*KzL8$b', '(32)93456-7890', format_date('1997/03/02')),
       ('gomes.math@gmail.com', 'Matheus Gomes', 'D$Pf5Wq#oX', '(42)95678-1234', format_date('1996/05/27')),
       ('iteixeira@gmail.com', 'Isabela Teixeira', 'C2vG@jB$Lr', '(52)97890-1234', format_date('1996/02/20')),
       ('gsantos98@gmail.com', 'Guilherme Santos', 'W$9oT#z4Sd', '(62)92345-6789', format_date('1998/01/16')),
       ('ribcamila@gmail.com', 'Camila Ribeiro', '6QwA8*J$Kf', '(72)98765-2345', format_date('1996/02/20')),
       ('thmiranda@gmail.com', 'Thiago Miranda', 'ZcM3*S@bYg', '(82)94321-6789', format_date('1996/12/08')),
       ('luana_ferreira@gmail.com', 'Luana Ferreira', 'k1X*VzP$uH', '(92)93456-7890', format_date('1996/12/06')),
       ('moreiraleo@gmail.com', 'Leonardo Moreira', 'I7yW@eN#pL', '(13)99876-5432', format_date('1999/04/24')),
       ('jc1996@gmail.com', 'Julia Coelho', 'V$2FwGqR!t', '(23)98765-4321', format_date('1996/09/09')),
       ('juliamartins@gmail.com', 'Julia Martins', 'K$7FwXqG!t', '(34)56789-1234', format_date('1995/08/15')),
       ('pedrosilva@hotmail.com', 'Pedro Silva', 'R$4TgPzD#w', '(11)34567-8901', format_date('1990/07/25')),
       ('anacarvalho@yahoo.com', 'Ana Carvalho', 'S#1BzAqT@w', '(27)12345-6789', format_date('1993/12/01')),
       ('luizrodrigues@gmail.com', 'Luiz Rodrigues', 'M$9FwPzD!r', '(55)98765-4321', format_date('1985/03/12')),
       ('carolpereira@hotmail.com', 'Carol Pereira', 'C$7XzTqW!f', '(44)56789-1234', format_date('1988/04/22')),
       ('marciooliveira@gmail.com', 'Marcio Oliveira', 'D$3VqEzF!w', '(66)34567-8901', format_date('1994/02/03')),
       ('patriciarosa@yahoo.com', 'Patricia Rosa', 'G#1WzDqA@t', '(99)12345-6789', format_date('1987/07/18')),
       ('felipenunes@hotmail.com', 'Felipe Nunes', 'T$6KzXqL@y', '(77)98765-4321', format_date('1991/05/29')),
       ('andressouza@gmail.com', 'Andres Souza', 'P$2CzGqB@x', '(88)56789-1234', format_date('1992/11/11')),
       ('marinamartins@yahoo.com', 'Marina Martins', 'H$4RzEqD@z', '(10)34567-8901', format_date('1997/06/06')),
       ('carlosrodrigues@hotmail.com', 'Carlos Rodrigues', 'A$3PzTqX@q', '(29)12345-6789', format_date('1986/10/20')),
       ('joanagarcia@gmail.com', 'Joana Garcia', 'W$2SzGqP@r', '(12)98765-4321', format_date('1998/09/09')),
       ('robertocarvalho@yahoo.com', 'Roberto Carvalho', 'E$1YzDqA@u', '(45)56789-1234', format_date('1989/03/30')),
       ('rafaelalmeida@hotmail.com', 'Rafael Almeida', 'F$5QzWqX@v', '(20)34567-8901', format_date('1992/08/05')),
       ('laurasilva@gmail.com', 'Laura Silva', 'V$3PzBqF@y', '(35)12345-6789', format_date('1996/07/14')),
       ('marceloferreira@yahoo.com', 'Marcelo Ferreira', 'T$2GzVqP@w', '(56)98765-4321', format_date('1994/01/26')),
       ('larissasantos@hotmail.com', 'Larissa Santos', 'W$4HzGqZ@x', '(48)56789-1234', format_date('1990/05/09')),
       ('marcosvieira@gmail.com', 'Marcos Vieira', 'K$3FzPqX@e', '(69)34567-8901', format_date('1991/12/03')),
       ('analuiza@hotmail.com', 'Ana Luiza', 'H$7SzVqD@r', '(10)12345-6789', format_date('1993/04/18')),
       ('pedromiranda@yahoo.com', 'Pedro Miranda', 'M$5XzGqB@t', '(89)98765-4321', format_date('1995/11/01')),
       ('laracosta@gmail.com', 'Lara Costa', 'P$1DzXqR@y', '(79)56789-1234', format_date('1998/03/22')),
       ('joaopedro@hotmail.com', 'João Pedro', 'C$9GzBqZ@u', '(19)34567-8901', format_date('1992/06/16')),
       ('julianascimento@yahoo.com', 'Julia Nascimento', 'F$2PzTqA@i', '(22)12345-6789', format_date('1994/09/07')),
       ('rodrigoferreira@gmail.com', 'Rodrigo Ferreira', 'A$4HzWqV@o', '(33)98765-4321', format_date('1997/02/28')),
       ('amandasilva@hotmail.com', 'Amanda Silva', 'K$6XzBqZ@p', '(40)56789-1234', format_date('1996/10/15')),
       ('lucasrodrigues@yahoo.com', 'Lucas Rodrigues', 'R$3QzVqT@j', '(44)34567-8901', format_date('1990/11/25')),
       ('isabelacarvalho@gmail.com', 'Isabela Carvalho', 'F$7GzPqA@k', '(55)12345-6789', format_date('1995/05/10')),
       ('marcosferreira@hotmail.com', 'Marcos Ferreira', 'P$2XzBqZ@m', '(66)98765-4321', format_date('1993/07/07')),
       ('larissaalmeida@yahoo.com', 'Larissa Almeida', 'S$8WzTqV@n', '(77)56789-1234', format_date('1991/12/11')),
       ('gabrieloliveira@gmail.com', 'Gabriel Oliveira', 'D$1FzBqA@l', '(88)34567-8901', format_date('1998/01/03'));


INSERT INTO PILOTO (EMAIL, LICENCA)
VALUES ('c_fernandes@gmail.com','123987456321654'),
       ('clarasouza_@gmail.com','456789123012345'),
       ('pcosta1999@gmail.com','462897625123155'),
       ('felipecarv@gmail.com','753159642806495'),
       ('moreiraleo@gmail.com','648731982554679'),
       ('lp2000lp@gmail.com','143897256431852');


INSERT INTO TURISTA(EMAIL, PAIS)
VALUES ('j_silva@gmail.com','Brasil'),
       ('mari.asantos@gmail.com','Noruega'),
       ('anaoliveira_@gmail.com', 'Canada'),
       ('srodrigues@gmail.com', 'Nova Zelandia'),
       ('mendeslaura@gmail.com', 'Portugal'),
       ('a.almeida@gmail.com', 'Nova Zelandia'),
       ('biacardoso@gmail.com', 'Portugal'),
       ('gomes.math@gmail.com', 'Canada'),
       ('iteixeira@gmail.com', 'Canada'),
       ('gsantos98@gmail.com', 'Portugal'),
       ('ribcamila@gmail.com', 'Argentina'),
       ('thmiranda@gmail.com', 'Argentina'),
       ('luana_ferreira@gmail.com', 'Portugal'),
       ('jc1996@gmail.com','Noruega'),
       ('juliamartins@gmail.com', 'Venezuela'),
       ('pedrosilva@hotmail.com', 'Argentina'),
       ('anacarvalho@yahoo.com', 'Argentina'),
       ('luizrodrigues@gmail.com', 'Canada'),
       ('carolpereira@hotmail.com', 'Venezuela'),
       ('marciooliveira@gmail.com', 'Holanda'),
       ('patriciarosa@yahoo.com','Brasil'),
       ('felipenunes@hotmail.com', 'Portugal'),
       ('andressouza@gmail.com', 'Nova Zelandia'),
       ('marinamartins@yahoo.com', 'Nova Zelandia'),
       ('carlosrodrigues@hotmail.com', 'Nova Zelandia'),
       ('joanagarcia@gmail.com', 'Holanda'),
       ('robertocarvalho@yahoo.com','Brasil'),
       ('rafaelalmeida@hotmail.com', 'Holanda'),
       ('laurasilva@gmail.com', 'Holanda'),
       ('marceloferreira@yahoo.com', 'Venezuela'),
       ('larissasantos@hotmail.com', 'Canada'),
       ('marcosvieira@gmail.com', 'Filipinas'),
       ('analuiza@hotmail.com','Noruega'),
       ('pedromiranda@yahoo.com', 'Colombia'),
       ('laracosta@gmail.com','Brasil'),
       ('joaopedro@hotmail.com', 'Filipinas'),
       ('julianascimento@yahoo.com', 'Colombia'),
       ('rodrigoferreira@gmail.com', 'Canada'),
       ('amandasilva@hotmail.com', 'Colombia'),
       ('lucasrodrigues@yahoo.com','Brasil'),
       ('isabelacarvalho@gmail.com', 'Colombia'),
       ('marcosferreira@hotmail.com', 'Argentina'),
       ('larissaalmeida@yahoo.com', 'Colombia'),
       ('gabrieloliveira@gmail.com', 'Canada');


INSERT INTO GALAXIA(NOME)
VALUES ('Pégaso'),
       ('Olho de Coruja'),
       ('Redemoinho'),
       ('Nebula'),
       ('Rodamoinho do Sul'),
       ('Sombrero'),
       ('Via Láctea'),
       ('Andrômeda'),
       ('Cetus A'),
       ('Nuvem de Magalhães'),
       ('Roda de Carroça'),
       ('Cisne Negro'),
       ('Cão Maior'),
       ('Águia Careca'),
       ('Dragão de Komodo'),
       ('Apokolips'),
       ('Trem-bala'),
       ('Grande Libélula'),
       ('Baleia Cinza'),
       ('Excalibur'),
       ('Trishula de Shiva'),
       ('Artemis'),
       ('Canguru-Caracol');


INSERT INTO NAVE (NUMERO_REGISTRO, MODELO, CAPACIDADE)
VALUES (57165, 'A12B3C4D5E6F7G8', 30),
       (67890, 'H1I2J3KF4L5M6N7', 40),
       (54655, 'O1P2Q3R4VS5T6U7', 55),
       (22151, 'V1W2X3Y4ZT5A6B7', 25),
       (21568, 'C1D2E3F4GD5H6I7', 60),
       (21321, 'J1K2L3M4N5HO6P7', 35),
       (66566, 'Q1R2S3T4U5VV6W7', 45),
       (48825, 'X1Y2Z3A4B5CE6D7', 50),
       (21819, 'E1F2G3H4I5J6SK7', 70),
       (79874, 'L1M2N3O4PV5Q6R7', 30),
       (28920, 'S1T2U3V4WU5X6Y7', 55),
       (00201, 'Z1A2B3C4DN5E6F7', 40),
       (14142, 'G1H2I3J4KV5L6M7', 25),
       (32111, 'N1O2P3Q4RE5S6T7', 35),
       (87652, 'U1V2W3X4Y5KZ6A7', 60),
       (56789, 'B1C2D3E4F5BG6H7', 65),
       (23456, 'I1J2K3L4M5DN6O7', 70),
       (78901, 'P1Q2R3S4T5BU6V7', 50),
       (34567, 'W1X2Y3Z4A5FB6C7', 45),
       (89012, 'D1E2F3G4H5IS6J7', 30),
       (45678, 'K1L2M3N4O5P6SQ7', 40),
       (90123, 'R1S2T3U4V5UW6X7', 60),
       (30378, 'Y1Z2A3B4C5BD6E7', 55),
       (52008, 'F1G2H3I4J5KB6L7', 25),
       (44554, 'M1N2O3P4Q5R56S7', 70);


INSERT INTO ROTA (NOME)
VALUES ('Rota da Aventura'),
       ('Rota dos Mistérios Antigos'),
       ('Rota do Explorador Solitário'),
       ('Rota das Maravilhas Naturais'),
       ('Rota do Viajante Intrépido'),
       ('Rota do Tesouro Perdido'),
       ('Rota da Serenidade'),
       ('Rota das Aventuras Aquáticas'),
       ('Rota das Maravilhas do Deserto'),
       ('Rota da Floresta Encantada'),
       ('Rota das Montanhas Majestosas'),
       ('Rota das Cidades Históricas'),
       ('Rota da Cultura Local'),
       ('Rota dos Sabores Exóticos'),
       ('Rota das Praias Paradisíacas'),
       ('Rota do Vinho e da Gastronomia'),
       ('Rota da Aventura Extrema'),
       ('Rota das Paisagens Pintadas'),
       ('Rota do Patrimônio Cultural'),
       ('Rota das Cidades Antigas'),
       ('Rota do Caminho Espiritual'),
       ('Rota da História e Mitologia'),
       ('Rota da Beleza Natural'),
       ('Rota das Cores e Arte'),
       ('Rota dos Sons e Música'),
       ('Rota das Escapadas Românticas'),
       ('Rota da Vida Selvagem'),
       ('Rota dos Tesouros Subaquáticos'),
       ('Rota da Aventura na Neve');


INSERT INTO FACCAO (NOME, NUMERO_MEMBROS)
VALUES ('Ordem das Estrelas Luminosas', 72652),
       ('Aliança Celestial', 51745),
       ('Concílio das Esferas Cósmicas', 66551),
       ('Liga dos Planetas Livres', 43588),
       ('Consórcio Interplanetário', 81246),
       ('Tribo das Nebulosas Eternas', 27912),
       ('Soberanos da Galáxia', 61435),
       ('Irmandade Estelar', 35132),
       ('Conglomerado Intergaláctico', 74625),
       ('Fraternidade das Dimensões', 49988),
       ('Congregação Estelar', 67646),
       ('Confederação das Esferas', 32558),
       ('União dos Mundos Unidos', 48712),
       ('Pacto dos Astros', 54864),
       ('Assembleia das Constelações', 25915),
       ('Legião dos Viajantes do Espaço', 46237),
       ('Reinos Intergalácticos', 79659),
       ('Sociedade das Estrelas', 66562),
       ('Coletivo das Nebulosas', 43246),
       ('Legado dos Antigos', 34748),
       ('Reinos da Fronteira', 61805),
       ('Círculo das Luas Lunares', 57204),
       ('Conclave Estelar', 46303),
       ('Ordem dos Guardiões da Galáxia', 31839),
       ('Liga dos Exploradores Cósmicos', 51132),
       ('Sindicato das Constelações', 29521),
       ('União Astral', 75858),
       ('Pacto Intergaláctico', 41372);


INSERT INTO RACA (NOME, PESO_MEDIO, TAMANHO_MEDIO, DESCRICAO)
VALUES ('Zorgon', 85, 180, 'Pele azul, olhos grandes'),
       ('Xenoth', 102, 210, 'Exoesqueleto resistente'),
       ('Drakar', 75, 175, 'Quatro braços, verde'),
       ('Nelkari', 110, 230, 'Pele escamosa, cauda'),
       ('Lyrion', 95, 190, 'Pele prateada, olhos vermelhos'),
       ('Vrillar', 78, 165, 'Pele transparente'),
       ('Gorix', 115, 240, 'Pele roxa, quatro olhos'),
       ('Zygoran', 92, 200, 'Cristais bioluminescentes'),
       ('Ogriak', 105, 220, 'Antenas no topo da cabeça'),
       ('Zentar', 88, 185, 'Pele de mármore, orelhas pontudas'),
       ('Korvax', 98, 200, 'Placas metálicas no corpo'),
       ('Yolthar', 80, 170, 'Tentáculos na cabeça'),
       ('Florin', 60, 160, 'Corpo de planta'),
       ('Sylthor', 112, 235, 'Quatro olhos, pele escorregadia'),
       ('Astron', 70, 175, 'Asas nas costas'),
       ('Naxor', 100, 200, 'Pele de pedra'),
       ('Kryllar', 89, 195, 'Olhos luminescentes'),
       ('Zephyr', 68, 170, 'Asas transparentes'),
       ('Eldar', 118, 245, 'Pele dourada, antenas'),
       ('Varkor', 77, 180, 'Pele metálica'),
       ('Zyndari', 94, 205, 'Pele de cristal'),
       ('Graxion', 108, 225, 'Quatro patas, olhos múltiplos'),
       ('Xyrron', 76, 175, 'Exoesqueleto articulado'),
       ('Krothar', 96, 195, 'Pele vermelha, chifres'),
       ('Zelthar', 87, 190, 'Pele de veludo'),
       ('Zylok', 104, 210, 'Escamas iridescentes'),
       ('Thyrrax', 81, 175, 'Quatro olhos, antenas'),
       ('Xylos', 97, 200, 'Pele de pedra, barbatanas'),
       ('Vylkor', 73, 170, 'Asas membranosas'),
       ('Grynthor', 115, 240, 'Pele escorregadia, tentáculos');


INSERT INTO EXPEDICAO(PILOTO, NAVE, DH_INICIO, DH_FIM, ROTA) VALUES 
('lp2000lp@gmail.com', 22151, format_datetime('2023-01-15 08:00:00'), format_datetime('2023-01-30 16:00:00'), 'Rota da Aventura'),
('c_fernandes@gmail.com', 14142, format_datetime('2023-02-10 10:30:00'), format_datetime('2023-02-15 18:30:00'), 'Rota dos Mistérios Antigos'),
('clarasouza_@gmail.com', 21321, format_datetime('2023-03-05 09:45:00'), format_datetime('2023-03-20 17:45:00'), 'Rota do Explorador Solitário'),  
('lp2000lp@gmail.com', 66566, format_datetime('2023-04-20 11:15:00'), format_datetime('2023-04-27 19:15:00'), 'Rota das Maravilhas Naturais'),          
('felipecarv@gmail.com', 32111, format_datetime('2023-05-10 07:30:00'), format_datetime('2023-05-15 15:30:00'), 'Rota do Viajante Intrépido'),           
('moreiraleo@gmail.com', 44554, format_datetime('2023-06-08 10:00:00'), format_datetime('2023-06-13 18:00:00'), 'Rota do Tesouro Perdido'),           
('clarasouza_@gmail.com', 21321, format_datetime('2023-07-25 08:45:00'), format_datetime('2023-07-30 16:45:00'), 'Rota da Serenidade'),        
('c_fernandes@gmail.com', 67890, format_datetime('2023-08-14 09:30:00'), format_datetime('2023-08-16 17:30:00'), 'Rota das Aventuras Aquáticas'),           
('c_fernandes@gmail.com', 45678, format_datetime('2023-09-03 07:15:00'), format_datetime('2023-09-17 15:15:00'), 'Rota das Maravilhas do Deserto'),         
('pcosta1999@gmail.com', 52008, format_datetime('2023-10-12 11:30:00'), format_datetime('2023-10-17 19:30:00'), 'Rota da Floresta Encantada'),        
('pcosta1999@gmail.com', 48825, format_datetime('2023-11-20 10:15:00'), format_datetime('2023-11-25 18:15:00'), 'Rota das Montanhas Majestosas');


-- INSERT INTO EXPEDICAO_TURISTA(NAVE, DH_INICIO, TURISTA) VALUES 
-- ('22151', format_datetime('2023-02-10 10:30:00'), 'c_fernandes@gmail.com'),
-- ('21321', format_datetime('2023-03-05 09:45:00'), 'clarasouza_@gmail.com'),
-- ('66566', format_datetime('2023-04-20 11:15:00'), 'lp2000lp@gmail.com'),
-- ('32111', format_datetime('2023-05-10 07:30:00'), 'felipecarv@gmail.com'),
-- ('44554', format_datetime('2023-06-08 10:00:00'), 'moreiraleo@gmail.com'),
-- ('21321', format_datetime('2023-07-25 08:45:00'), 'clarasouza_@gmail.com'),
-- ('67890', format_datetime('2023-08-14 09:30:00'), 'c_fernandes@gmail.com'),
-- ('45678', format_datetime('2023-09-03 07:15:00'), 'c_fernandes@gmail.com'),
-- ('52008', format_datetime('2023-10-12 11:30:00'), 'pcosta1999@gmail.com'),
-- ('48825', format_datetime('2023-11-20 10:15:00'), 'pcosta1999@gmail.com'),
-- ('32111', format_datetime('2023-05-10 07:30:00'), 'jc1996@gmail.com'),
-- ('14142', format_datetime('2023-02-10 10:30:00'), 'juliamartins@gmail.com'),
-- ('32111', format_datetime('2023-05-10 07:30:00'), 'pedrosilva@hotmail.com'),
-- ('67890', format_datetime('2023-08-14 09:30:00'), 'anacarvalho@yahoo.com'),
-- ('66566', format_datetime('2023-04-20 11:15:00'), 'luizrodrigues@gmail.com'),
-- ('32111', format_datetime('2023-05-10 07:30:00'), 'carolpereira@hotmail.com'),
-- ('44554', format_datetime('2023-06-08 10:00:00'), 'marciooliveira@gmail.com'),
-- ('67890', format_datetime('2023-08-14 09:30:00'), 'patriciarosa@yahoo.com'),
-- ('45678', format_datetime('2023-09-03 07:15:00'), 'felipenunes@hotmail.com'),
-- ('52008', format_datetime('2023-10-12 11:30:00'), 'andressouza@gmail.com'),
-- ('48825', format_datetime('2023-11-20 10:15:00'), 'marinamartins@yahoo.com'),
-- ('32111', format_datetime('2023-05-10 07:30:00'), 'carlosrodrigues@hotmail.com'),
-- ('14142', format_datetime('2023-02-10 10:30:00'), 'joanagarcia@gmail.com'),
-- ('66566', format_datetime('2023-04-20 11:15:00'), 'robertocarvalho@yahoo.com'),
-- ('44554', format_datetime('2023-06-08 10:00:00'), 'rafaelalmeida@hotmail.com');


-- INSERT INTO CORPO (GALAXIA, NOME, RAIO, MASSA, GRAVIDADE, TEMPERATURA, DISTANCIA_TERRA, TIPO)
-- VALUES ('Pégaso', 'Alpha Centauri', 1276, 54980, 56, 32, 49782, 'estrela'),
--        ('Olho de Coruja', 'Hermes', 764, 34901, 43, 25, 33453, 'planeta'),
--        ('Redemoinho', 'Terra', 6371, 59780, 24, 15, 0, 'planeta'),
--        ('Nebula', 'Halley', 987, 41562, 68, 39, 92938, 'estrela'),
--        ('Rodamoinho do Sul', 'Saturno', 58232, 83645, 15, 21, 129854, 'planeta'),
--        ('Sombrero', 'Marte', 3397, 42659, 38, 27, 224872, 'planeta'),
--        ('Via Láctea', 'Júpiter', 69911, 98502, 51, 44, 390220, 'planeta'),
--        ('Andrômeda', 'Plutão', 1186, 25987, 17, 19, 447609, 'planeta'),
--        ('Cetus A', 'Venus', 6051, 73542, 27, 33, 723409, 'planeta'),
--        ('Nuvem de Magalhães', 'Ganimedes', 2631, 32751, 46, 55, 654230, 'planeta'),
--        ('Roda de Carroça', 'Mimas', 297, 12654, 62, 47, 384212, 'planeta'),
--        ('Cisne Negro', 'Encélado', 252, 11256, 59, 41, 354159, 'planeta'),
--        ('Cão Maior', 'Prometeu', 134, 6743, 71, 63, 378906, 'estrela'),
--        ('Águia Careca', 'Titã', 2576, 78562, 32, 29, 974220, 'planeta'),
--        ('Dragão de Komodo', 'Cometar', 493, 20684, 53, 59, 675439, 'estrela'),
--        ('Apokolips', 'Betelgeuse', 1198, 56782, 72, 66, 556799, 'estrela'),
--        ('Trem-bala', 'Fobos', 11, 128, 80, 67, 35793, 'planeta'),
--        ('Grande Libélula', 'Éris', 1162, 49276, 75, 48, 987456, 'planeta'),
--        ('Baleia Cinza', 'Caronte', 603, 24769, 50, 37, 65432, 'estrela'),
--        ('Excalibur', 'Oumuamua', 567, 23987, 22, 20, 54673, 'planeta'),
--        ('Trishula de Shiva', 'Hale-Bopp', 1687, 59847, 41, 34, 87863, 'estrela'),
--        ('Artemis', 'Io', 1821, 64523, 31, 26, 29312, 'planeta'),
--        ('Canguru-Caracol', 'Tétis', 1052, 47653, 66, 57, 78674, 'estrela'),
--        ('Pégaso', 'Sirius', 1847, 75231, 49, 35, 108932, 'estrela'),
--        ('Olho de Coruja', 'Apolo', 367, 15245, 57, 42, 45698, 'planeta'),
--        ('Redemoinho', 'Urano', 25362, 86542, 29, 31, 289036, 'planeta'),
--        ('Nebula', 'Neowise', 893, 39657, 65, 57, 76298, 'estrela'),
--        ('Rodamoinho do Sul', 'Netuno', 24764, 98456, 30, 37, 405284, 'planeta'),
--        ('Sombrero', 'Pluto', 1186, 36895, 23, 27, 683247, 'planeta'),
--        ('Via Láctea', 'Sírius B', 125, 4526, 75, 61, 124659, 'estrela'),
--        ('Andrômeda', 'Oberon', 763, 32984, 47, 45, 549723, 'estrela'),
--        ('Cetus A', 'Nix', 88, 3186, 68, 54, 345678, 'estrela'),
--        ('Nuvem de Magalhães', 'Miranda', 235, 8754, 73, 60, 32145, 'estrela'),
--        ('Pégaso', 'Hércules', 1436, 65987, 53, 49, 87654, 'estrela'),
--        ('Olho de Coruja', 'Hades', 477, 24756, 61, 50, 39872, 'planeta'),
--        ('Redemoinho', 'Júpiter', 69911, 98502, 51, 44, 390220, 'planeta'),
--        ('Nebula', 'Pan-STARRS', 596, 27563, 64, 58, 98321, 'estrela'),
--        ('Rodamoinho do Sul', 'Vênus', 6051, 73542, 27, 33, 723409, 'planeta'),
--        ('Via Láctea', 'Antares', 2075, 81246, 55, 51, 256489, 'estrela'),
--        ('Andrômeda', 'Tântalo', 468, 20569, 67, 63, 46528, 'planeta'),


-- INSERT INTO ROTA_CORPO(ROTA, GALAXIA_CORPO, NOME_CORPO)
-- VALUES ('Rota da Aventura', 'Pégaso', 'Alpha Centauri'),
--        ('Rota dos Mistérios Antigos', 'Olho de Coruja', 'Hermes'),
--        ('Rota do Explorador Solitário', 'Redemoinho', 'Terra'),
--        ('Rota das Maravilhas Naturais', 'Nebula', 'Halley'),
--        ('Rota do Viajante Intrépido', 'Rodamoinho do Sul', 'Saturno'),
--        ('Rota do Tesouro Perdido', 'Sombrero', 'Marte'),
--        ('Rota da Serenidade', 'Via Láctea', 'Júpiter'),
--        ('Rota das Aventuras Aquáticas', 'Andrômeda', 'Plutão'),
--        ('Rota das Maravilhas do Deserto', 'Cetus A', 'Venus'),
--        ('Rota da Floresta Encantada', 'Nuvem de Magalhães', 'Ganimedes'),
--        ('Rota dos Sabores Exóticos', 'Roda de Carroça', 'Mimas'),
--        ('Rota das Praias Paradisíacas', 'Cisne Negro', 'Encélado'),
--        ('Rota do Vinho e da Gastronomia', 'Cão Maior', 'Prometeu'),
--        ('Rota da Aventura na Neve', 'Dragão de Komodo', 'Cometar'),
--        ('Rota da Cultura Local', 'Águia Careca', 'Titã');


-- INSERT INTO ESTRELA(GALAXIA, NOME, LUMINOSIDADE) 
-- VALUES ('Pégaso', 'Alpha Centauri', 452264),
--        ('Nebula', 'Halley', 854237),
--        ('Cão Maior', 'Prometeu', 973158),
--        ('Dragão de Komodo', 'Cometar', 872164),
--        ('Apokolips', 'Betelgeuse', 456897),
--        ('Baleia Cinza', 'Caronte', 246289),
--        ('Trishula de Shiva', 'Hale-Bopp', 756426),
--        ('Canguru-Caracol', 'Tétis', 132856),
--        ('Pégaso', 'Sirius', 542313),
--        ('Nebula', 'Neowise', 723165),
--        ('Via Láctea', 'Sírius B', 129546),
--        ('Andrômeda', 'Oberon', 226421),
--        ('Cetus A', 'Nix', 462187),
--        ('Nuvem de Magalhães', 'Miranda', 135280),
--        ('Pégaso', 'Hércules', 285423),
--        ('Nebula', 'Pan-STARRS', 219876),
--        ('Via Láctea', 'Antares', 564298);


-- INSERT INTO PLANETA (GALAXIA, NOME, TEM_AGUA, HABITAVEL, GALAXIA_ESTRELA, NOME_ESTRELA)
-- VALUES ('Olho de Coruja', 'Hermes', 'S', 'S', 'Pégaso', 'Alpha Centauri'),
--        ('Redemoinho', 'Terra', 'N', 'N', 'Nebula', 'Halley'),
--        ('Rodamoinho do Sul', 'Saturno', 'S', 'N', 'Cão Maior', 'Prometeu'),
--        ('Sombrero', 'Marte', 'N', 'N', 'Dragão de Komodo', 'Cometar'),
--        ('Via Láctea', 'Júpiter', 'S', 'N', 'Apokolips', 'Betelgeuse'),
--        ('Andrômeda', 'Plutão', 'S', 'S', 'Baleia Cinza', 'Caronte'), 
--        ('Cetus A', 'Venus', 'N', 'N', 'Trishula de Shiva', 'Hale-Bopp'),
--        ('Nuvem de Magalhães', 'Ganimedes', 'S', 'N', 'Canguru-Caracol', 'Tétis'),
--        ('Roda de Carroça', 'Mimas', 'S', 'N', 'Pégaso', 'Sirius'),
--        ('Cisne Negro', 'Encélado', 'S', 'N', 'Nebula', 'Neowise'),
--        ('Águia Careca', 'Titã', 'N', 'N', 'Via Láctea', 'Sírius B'),
--        ('Trem-bala', 'Fobos', 'N', 'N', 'Andrômeda', 'Oberon'),
--        ('Grande Libélula', 'Éris', 'S', 'N', 'Cetus A', 'Nix');  
--        ('Excalibur', 'Oumuamua', 'S', 'S', 'Nuvem de Magalhães', 'Miranda'),
--        ('Artemis', 'Io', 'S', 'N', 'Pégaso', 'Hércules'),
--        ('Olho de Coruja', 'Apolo', 'S', 'N', 'Nebula', 'Pan-STARRS');
--        ('Redemoinho', 'Urano', 'S', 'S', 'Via Láctea', 'Antares'),
--        ('Rodamoinho do Sul', 'Netuno', 'N', 'N', 'Pégaso', 'Alpha Centauri'),
--        ('Sombrero', 'Pluto', 'S', 'S', 'Nebula', 'Halley');
--        ('Olho de Coruja', 'Hades', 'N', 'N', 'Cão Maior', 'Prometeu');
--        ('Redemoinho', 'Júpiter', 'N', 'S', 'Dragão de Komodo', 'Cometar'),
--        ('Rodamoinho do Sul', 'Vênus', 'S', 'N', 'Apokolips', 'Betelgeuse'),
--        ('Andrômeda', 'Tântalo', 'S', 'S', 'Baleia Cinza', 'Caronte');

-- INSERT INTO PLANETA_HABITAVEL(GALAXIA, NOME)
-- VALUES ('Olho de Coruja', 'Hermes'),
--        ('Andrômeda', 'Plutão'),
--        ('Cetus A', 'Aqua Prime'),
--        ('Excalibur', 'Oumuamua'),
--        ('Redemoinho', 'Urano'),
--        ('Sombrero', 'Pluto'),
--        ('Redemoinho', 'Júpiter'),
--        ('Andrômeda', 'Tântalo');



-- INSERT INTO FACCAO_RACA(FACCAO, RACA)
-- VALUES ('Ordem das Estrelas Luminosas', 'Zorgon'),
--        ('Aliança Celestial', 'Xenoth'),
--        ('Concílio das Esferas Cósmicas', 'Drakar'),
--        ('Liga dos Planetas Livres', 'Nelkari'),
--        ('Consórcio Interplanetário', 'Lyrion'),
--        ('Tribo das Nebulosas Eternas', 'Vrillar'),
--        ('Soberanos da Galáxia', 'Gorix'),
--        ('Irmandade Estelar', 'Zygoran'),
--        ('Conglomerado Intergaláctico', 'Ogriak'),
--        ('Fraternidade das Dimensões', 'Zentar'),
--        ('Congregação Estelar', 'Korvax'),
--        ('Confederação das Esferas', 'Yolthar'),
--        ('União dos Mundos Unidos', 'Florin'),
--        ('Pacto dos Astros', 'Sylthor'),
--        ('Assembleia das Constelações', 'Astron'),
--        ('Legião dos Viajantes do Espaço', 'Naxor'),
--        ('Reinos Intergalácticos', 'Kryllar'),
--        ('Sociedade das Estrelas', 'Zephyr'),
--        ('Coletivo das Nebulosas', 'Eldar'),
--        ('Legado dos Antigos', 'Varkor'),
--        ('Reinos da Fronteira', 'Zyndari'),
--        ('Círculo das Luas Lunares', 'Graxion'),
--        ('Conclave Estelar', 'Xyrron'),
--        ('Ordem dos Guardiões da Galáxia', 'Krothar'),
--        ('Liga dos Exploradores Cósmicos', 'Zelthar'),
--        ('Sindicato das Constelações', 'Zylok'),
--        ('União Astral', 'Thyrrax'),
--        ('Pacto Intergaláctico', 'Xylos'),
--        ('Ordem das Estrelas Luminosas', 'Vylkor'),
--        ('Aliança Celestial', 'Grynthor'),
--        ('Concílio das Esferas Cósmicas', 'Zorgon'),
--        ('Liga dos Planetas Livres', 'Xenoth'),
--        ('Consórcio Interplanetário', 'Drakar'),
--        ('Tribo das Nebulosas Eternas', 'Nelkari'),
--        ('Soberanos da Galáxia', 'Lyrion'),
--        ('Irmandade Estelar', 'Vrillar'),
--        ('Conglomerado Intergaláctico', 'Gorix'),
--        ('Fraternidade das Dimensões', 'Zygoran'),
--        ('Congregação Estelar', 'Ogriak'),
--        ('Confederação das Esferas', 'Zentar'),
--        ('Pacto dos Astros', 'Kryllar'),
--        ('Assembleia das Constelações', 'Zephyr'),
--        ('Legião dos Viajantes do Espaço', 'Eldar'),
--        ('Reinos Intergalácticos', 'Varkor'),
--        ('Sociedade das Estrelas', 'Zyndari'),
--        ('Coletivo das Nebulosas', 'Graxion'),
--        ('Legado dos Antigos', 'Xyrron'),
--        ('Reinos da Fronteira', 'Krothar'),
--        ('Círculo das Luas Lunares', 'Zelthar'),
--        ('Conclave Estelar', 'Zylok'),
--        ('Ordem dos Guardiões da Galáxia', 'Thyrrax'),
--        ('Liga dos Exploradores Cósmicos', 'Xylos'),
--        ('Sindicato das Constelações', 'Vylkor'),
--        ('União Astral', 'Grynthor'),
--        ('Pacto Intergaláctico', 'Zorgon'),


-- INSERT INTO COLONIA (ID, GALAXIA, NOME_PLANETA, FACCAO_NOME, DH_INICIO, DH_FIM, NOME)
-- VALUES (57649102, 'Olho de Coruja', 'Hermes', 'Ordem das Estrelas Luminosas', format_datetime('2023-01-15 08:30:00'), format_datetime('2026-03-20 16:45:00'), 'Colônia Aurora'),
--        (67482134, 'Andrômeda', 'Plutão', 'Liga dos Planetas Livres', format_datetime('2023-02-05 12:15:00'), NULL, 'Libertária Prime'),
--        (48970234, 'Cetus A', 'Aqua Prime', 'União dos Mundos Unidos', format_datetime('2023-03-20 09:45:00'), format_datetime('2029-06-25 18:00:00'), 'Aqualux'),
--        (59234512, 'Excalibur', 'Oumuamua', 'Fraternidade das Dimensões', format_datetime('2023-05-10 14:30:00'), NULL, 'Cidade Arco-Íris'),
--        (68894562, 'Redemoinho', 'Urano', 'Pacto dos Astros', format_datetime('2023-07-01 17:20:00'), NULL, 'Astrocolônia Pinnacle'),
--        (39487623, 'Sombrero', 'Pluto', 'Legado dos Antigos', format_datetime('2023-09-15 11:10:00'), format_datetime('2039-12-20 15:30:00'), 'Esmeralda Central'),
--        (52183476, 'Olho de Coruja', 'Hermes', 'Sociedade das Estrelas', format_datetime('2024-01-05 20:45:00'), NULL, 'Estrela Prospera'),
--        (70235689, 'Andrômeda', 'Plutão', 'Congregação Estelar', format_datetime('2024-02-20 14:00:00'), format_datetime('2033-05-25 16:20:00'), 'Pacífica Celestial'),
--        (45768932, 'Cetus A', 'Aqua Prime', 'Ordem das Estrelas Luminosas', format_datetime('2024-03-20 09:45:00'), NULL, 'Colônia Azul'),
--        (57893124, 'Excalibur', 'Oumuamua', 'Liga dos Planetas Livres', format_datetime('2024-05-10 14:30:00'), format_datetime('2039-08-15 10:10:00'), 'Prisma Celeste'),
--        (67892453, 'Redemoinho', 'Urano', 'União dos Mundos Unidos', format_datetime('2024-07-01 17:20:00'), NULL, 'Polaris'),
--        (39817265, 'Sombrero', 'Pluto', 'Fraternidade das Dimensões', format_datetime('2024-09-15 11:10:00'), format_datetime('2037-12-20 15:30:00'), 'Vortex Prime'),
--        (54279810, 'Olho de Coruja', 'Hermes', 'Pacto dos Astros', format_datetime('2025-01-05 20:45:00'), format_datetime('2028-04-10 08:15:00'), 'Colônia Celestial'),
--        (70012345, 'Andrômeda', 'Plutão', 'Sociedade das Estrelas', format_datetime('2025-02-20 14:00:00'), NULL, 'Vênus Radiante'),
--        (46782309, 'Cetus A', 'Aqua Prime', 'Congregação Estelar', format_datetime('2025-03-20 09:45:00'), NULL, 'Aqualuna'),
--        (59123478, 'Excalibur', 'Oumuamua', 'Ordem das Estrelas Luminosas', format_datetime('2025-05-10 14:30:00'), format_datetime('2028-08-15 10:10:00'), 'Celestialis'),
--        (68567923, 'Redemoinho', 'Urano', 'Liga dos Planetas Livres', format_datetime('2025-07-01 17:20:00'), format_datetime('2029-10-05 20:45:00'), 'Plutonion'),
--        (39472156, 'Sombrero', 'Pluto', 'União dos Mundos Unidos', format_datetime('2025-09-15 11:10:00'), format_datetime('2028-12-20 15:30:00'), 'EcoVenus'),
--        (51982734, 'Olho de Coruja', 'Hermes', 'Fraternidade das Dimensões', format_datetime('2026-01-05 20:45:00'), NULL, 'Dimensia Prime'),
--        (70589642, 'Andrômeda', 'Plutão', 'Pacto dos Astros', format_datetime('2026-02-20 14:00:00'), format_datetime('2030-05-25 16:20:00'), 'AstroVenus'),
--        (47823456, 'Cetus A', 'Aqua Prime', 'Sociedade das Estrelas', format_datetime('2026-03-20 09:45:00'), format_datetime('2029-06-25 18:00:00'), 'Aquafuturis'),
--        (59321876, 'Excalibur', 'Oumuamua', 'Congregação Estelar', format_datetime('2026-05-10 14:30:00'), NULL, 'Éris Stellaris'),
--        (67890543, 'Redemoinho', 'Urano', 'Ordem das Estrelas Luminosas', format_datetime('2026-07-01 17:20:00'), NULL, 'Pluto Celestial'),
--        (39456789, 'Redemoinho', 'Júpiter', 'Liga dos Planetas Livres', format_datetime('2026-09-15 11:10:00'), NULL, 'Vênus Liberta'),
--        (52349876, 'Redemoinho', 'Júpiter', 'União dos Mundos Unidos', format_datetime('2027-01-05 20:45:00'), NULL, 'Terra Unida');


-- INSERT INTO GUERRA (AGRESSOR, DEFENSOR, DH_INICIO, DH_FIM, OBITOS)
-- VALUES (57649102, 67482134, format_datetime('2022-01-15 08:30:00'), format_datetime('2023-08-20 16:45:00'), 421),
--        (57649102, 48970234, format_datetime('2022-03-05 12:15:00'), format_datetime('2023-10-10 14:20:00'), 1567),
--        (59234512, 68894562, format_datetime('2022-05-20 09:45:00'), NULL, 314),
--        (39487623, 52183476, format_datetime('2022-08-10 14:30:00'), format_datetime('2024-02-15 10:10:00'), 489),
--        (70235689, 45768932, format_datetime('2022-12-01 17:20:00'), NULL, 621),
--        (57893124, 67892453, format_datetime('2023-03-15 11:10:00'), format_datetime('2024-09-20 15:30:00'), 352),
--        (39817265, 54279810, format_datetime('2023-06-30 20:45:00'), format_datetime('2025-01-05 08:15:00'), 5422),
--        (39817265, 70012345, format_datetime('2023-10-20 14:00:00'), format_datetime('2025-04-25 16:20:00'), 389),
--        (46782309, 59123478, format_datetime('2024-02-15 09:45:00'), NULL, 631),
--        (68567923, 39472156, format_datetime('2024-06-05 14:30:00'), format_datetime('2026-01-10 10:10:00'), 478),
--        (51982734, 70589642, format_datetime('2024-09-20 17:20:00'), format_datetime('2026-03-25 20:45:00'), 5173),
--        (47823456, 59321876, format_datetime('2025-01-10 11:10:00'), format_datetime('2026-07-15 15:30:00'), 297),
--        (67890543, 39456789, format_datetime('2025-05-25 20:45:00'), NULL, 642),
--        (52349876, 57893124, format_datetime('2025-09-15 14:00:00'), format_datetime('2027-03-20 16:20:00'), 532),
--        (45768932, 39487623, format_datetime('2026-01-05 09:45:00'), format_datetime('2027-07-10 18:00:00'), 4651);
