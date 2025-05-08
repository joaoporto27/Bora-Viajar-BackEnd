CREATE DATABASE bora_viajar;

\c bora_viajar;

-- Tabela de USERS
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    city VARCHAR(120) NOT NULL,
    state VARCHAR(120) NOT NULL,
    type_user VARCHAR(20) DEFAULT 'usuário',
    password VARCHAR(15) NOT NULL
);

-- Alteração da tabela USERS

ALTER TABLE users ADD COLUMN photo TEXT;

-- Tabela de POSTS
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    image TEXT,
    description TEXT NOT NULL,
    tag VARCHAR(100),
    likes_count INTEGER DEFAULT 0
);

-- Tabela de COMMENTS
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    comment TEXT
);

-- Tabela de REGIONS
CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    text TEXT NOT NULL,
    links VARCHAR(255)
);

-- Tabela de NEWS
CREATE TABLE news (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    place VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    text TEXT NOT NULL,
    URL VARCHAR(255)
);

-- INSERTS da tabela USERS: usuários
INSERT INTO users (name, email, city, state, type_user, password) VALUES
('Amanda Gomes Mechi', 'amanda.mechi@aluno.senai.br', 'Campinas', 'SP', 'usuário','123456'),
('Andre Lucca Santos', 'andre.l.santos45@aluno.senai.br', 'Campinas', 'SP', 'guia turístico','234561'),
('Flavia Regina Alexandre Mendes', 'flavia.r.mendes@aluno.senai.br', 'Campinas', 'SP', 'usuário','345612'),
('Giovanna Caron de Barros', 'giovanna.c.barros@aluno.senai.br', 'Valinhos', 'SP', 'guia turístico','456123'),
('Isabella Borin de Moraes Rosa', 'isabella.b.rosa6@aluno.senai.br', 'Valinhos', 'SP', 'usuário','567234'),
('João Vitor Porto Sales', 'joao.v.sales15@aluno.senai.br', 'Campinas', 'SP', 'guia turístico','678345'),
('Laura Ferreira Violla', 'laura.violla@aluno.senai.br', 'Valinhos', 'SP', 'usuário','789456'),
('Carlos Silva', 'carlos.silva1@example.com', 'São Paulo', 'SP', 'usuário', '512735'),
('Ana Oliveira', 'ana.oliveira2@example.com', 'Rio de Janeiro', 'RJ', 'usuário', '184767'),
('Marcos Souza', 'marcos.souza3@example.com', 'Belo Horizonte', 'MG', 'usuário', '941209'),
('Juliana Lima', 'juliana.lima4@example.com', 'Curitiba', 'PR', 'usuário', '408734'),
('Rafael Costa', 'rafael.costa5@example.com', 'Porto Alegre', 'RS', 'usuário', '089987'),
('Fernanda Rocha', 'fernanda.rocha6@example.com', 'Recife', 'PE', 'usuário', '555133'),
('Lucas Martins', 'lucas.martins7@example.com', 'Salvador', 'BA', 'usuário', '576843'),
('Camila Ribeiro', 'camila.ribeiro8@example.com', 'Brasília', 'DF', 'usuário', '216441'),
('Pedro Almeida', 'pedro.almeida9@example.com', 'Fortaleza', 'CE', 'usuário', '418251'),
('Aline Mendes', 'aline.mendes10@example.com', 'Manaus', 'AM', 'usuário', '442272'),
('Vinícius Andrade', 'vinicius.andrade101@example.com', 'Campinas', 'SP', 'usuário', '180577'),
('Patrícia Moraes', 'patricia.moraes102@example.com', 'Maceió', 'AL', 'usuário', '900128'),
('Bruno Teixeira', 'bruno.teixeira103@example.com', 'João Pessoa', 'PB', 'usuário', '769424'),
('Larissa Pires', 'larissa.pires104@example.com', 'São Luís', 'MA', 'usuário', '638515'),
('Tiago Nunes', 'tiago.nunes105@example.com', 'Goiânia', 'GO', 'usuário', '378299'),
('Amanda Barreto', 'amanda.barreto201@example.com', 'Blumenau', 'SC', 'usuário', '717463'),
('João Vitor Sales', 'joao.sales202@example.com', 'Cuiabá', 'MT', 'usuário', '504921'),
('Luana Neves', 'luana.neves203@example.com', 'Palmas', 'TO', 'usuário', '137840'),
('Henrique Batista', 'henrique.batista204@example.com', 'Vitória', 'ES', 'usuário', '801356'),
('Bruna Costa', 'bruna.costa205@example.com', 'Maringá', 'PR', 'usuário', '370614'),
('André Souza', 'andre.souza206@example.com', 'Londrina', 'PR', 'usuário', '939015'),
('Tatiane Silva', 'tatiane.silva207@example.com', 'Caxias do Sul', 'RS', 'usuário', '905764'),
('Douglas Fernandes', 'douglas.fernandes208@example.com', 'Ribeirão Preto', 'SP', 'usuário', '425876'),
('Letícia Gomes', 'leticia.gomes209@example.com', 'Santarém', 'PA', 'usuário', '304881'),
('Gabriel Monteiro', 'gabriel.monteiro210@example.com', 'São José dos Campos', 'SP', 'usuário', '717008'),
('Lorena Dias', 'lorena.dias211@example.com', 'Uberlândia', 'MG', 'usuário', '643917'),
('Fábio Pimentel', 'fabio.pimentel212@example.com', 'Bauru', 'SP', 'usuário', '382112'),
('Rayssa Lopes', 'rayssa.lopes213@example.com', 'Aracaju', 'SE', 'usuário', '181202'),
('Caio Antunes', 'caio.antunes214@example.com', 'Macapá', 'AP', 'usuário', '641973'),
('Isis Ferreira', 'isis.ferreira215@example.com', 'Boa Vista', 'RR', 'usuário', '104559'),
('Eduarda Martins', 'eduarda.martins216@example.com', 'Joinville', 'SC', 'usuário', '178194'),
('Matheus Rocha', 'matheus.rocha217@example.com', 'São Bernardo do Campo', 'SP', 'usuário', '698730'),
('Yasmin Duarte', 'yasmin.duarte218@example.com', 'Teresina', 'PI', 'usuário', '390458'),
('Diego Cunha', 'diego.cunha219@example.com', 'Caruaru', 'PE', 'usuário', '952316'),
('Rebeca Vasconcelos', 'rebeca.vasconcelos220@example.com', 'Juazeiro do Norte', 'CE', 'usuário', '820013');

-- INSERTS da tabela USERS: guia turístico
INSERT INTO users (name, email, city, state, type_user, password) VALUES
('Eduardo Campos', 'eduardo.campos181@example.com', 'Foz do Iguaçu', 'PR', 'guia turístico', '781304'),
('Daniela Freitas', 'daniela.freitas182@example.com', 'Olinda', 'PE', 'guia turístico', '954702'),
('Rodrigo Leal', 'rodrigo.leal183@example.com', 'Paraty', 'RJ', 'guia turístico', '430872'),
('Vanessa Prado', 'vanessa.prado184@example.com', 'Bonito', 'MS', 'guia turístico', '629103'),
('Sérgio Araújo', 'sergio.araujo185@example.com', 'Lençóis', 'BA', 'guia turístico', '206187'),
('Beatriz Tavares', 'beatriz.tavares186@example.com', 'Gramado', 'RS', 'guia turístico', '540161'),
('Marcelo Barros', 'marcelo.barros187@example.com', 'Ouro Preto', 'MG', 'guia turístico', '811935'),
('Tatiane Lopes', 'tatiane.lopes188@example.com', 'Fernando de Noronha', 'PE', 'guia turístico', '731508'),
('Rogério Melo', 'rogerio.melo189@example.com', 'Chapada dos Veadeiros', 'GO', 'guia turístico', '647091'),
('Cíntia Fernandes', 'cintia.fernandes190@example.com', 'Ilhabela', 'SP', 'guia turístico', '300742'),
('Gustavo Reis', 'gustavo.reis191@example.com', 'Petrolina', 'PE', 'guia turístico', '284105'),
('Isabela Rocha', 'isabela.rocha192@example.com', 'Caldas Novas', 'GO', 'guia turístico', '578619'),
('Alexandre Duarte', 'alexandre.duarte193@example.com', 'Ilhéus', 'BA', 'guia turístico', '457680'),
('Priscila Martins', 'priscila.martins194@example.com', 'Tiradentes', 'MG', 'guia turístico', '810026'),
('Ricardo Farias', 'ricardo.farias195@example.com', 'Canela', 'RS', 'guia turístico', '990348'),
('Natália Gomes', 'natalia.gomes196@example.com', 'Arraial do Cabo', 'RJ', 'guia turístico', '602513'),
('Felipe Soares', 'felipe.soares197@example.com', 'Jericoacoara', 'CE', 'guia turístico', '928471'),
('Jéssica Castro', 'jessica.castro198@example.com', 'São Miguel dos Milagres', 'AL', 'guia turístico', '153709'),
('Murilo Batista', 'murilo.batista199@example.com', 'Ubatuba', 'SP', 'guia turístico', '794320'),
('Helena Carvalho', 'helena.carvalho200@example.com', 'Itacaré', 'BA', 'guia turístico', '239851');

-- INSERTS da tabela POSTS
INSERT INTO posts (user_id, description, tag) VALUES
(37, 'Descubra destinos incríveis para sua próxima viagem', 'promoção'),
(11, 'Desconto progressivo em pacotes de viagem imperdíveis', 'promoção'),
(27, 'Alerta: ofertas especiais para suas férias dos sonhos', 'promoção'),
(32, 'Atualização importante sobre nossos pacotes de viagem', 'promoção'),
(10, 'Alerta: ofertas especiais para suas férias dos sonhos', 'promoção'),
(16, 'Surpresa especial para sua próxima aventura', 'promoção'),
(20, 'Promoção exclusiva para explorar novos destinos', 'promoção'),
(35, 'Aproveite antes que acabe! Pacotes de viagem incríveis', 'promoção'),
(41, 'Atualização importante sobre nossos pacotes de viagem', 'promoção'),
(33, 'Oferta relâmpago: viagens com desconto por tempo limitado', 'novidades'),
(28, 'Desconto progressivo em pacotes de viagem imperdíveis', 'promoção'),
(29, 'Desconto progressivo em pacotes de viagem imperdíveis', 'promoção'),
(14, 'Alerta: ofertas especiais para suas férias dos sonhos', 'promoção'),
(32, 'Atualização importante sobre nossos pacotes de viagem', 'novidades'),
(3, 'Promoção exclusiva para explorar novos destinos', 'novidades'),
(6, 'Evento especial: comece sua próxima viagem hoje!', 'promoção'),
(41, 'Atualização importante sobre nossos pacotes de viagem', 'promoção'),
(15, 'Desconto progressivo em pacotes de viagem imperdíveis', 'promoção'),
(16, 'Lançamento imperdível de novos destinos de viagem', 'novidades'),
(32, 'Aproveite antes que acabe! Pacotes de viagem incríveis', 'promoção'),
(22, 'Alerta: ofertas especiais para suas férias dos sonhos', 'promoção'),
(1, 'Promoção exclusiva para explorar novos destinos', 'promoção'),
(8, 'Alerta: ofertas especiais para suas férias dos sonhos', 'promoção'),
(41, 'Atualização importante sobre nossos pacotes de viagem', 'novidades'),
(4, 'Aproveite antes que acabe! Pacotes de viagem incríveis', 'promoção'),
(13, 'Descubra destinos incríveis para sua próxima viagem', 'promoção'),
(26, 'Aproveite antes que acabe! Pacotes de viagem incríveis', 'promoção'),
(12, 'Aproveite antes que acabe! Pacotes de viagem incríveis', 'promoção'),
(33, 'Atualização importante sobre nossos pacotes de viagem', 'novidades'),
(35, 'Promoção exclusiva para explorar novos destinos', 'novidades'),
(14, 'Promoção exclusiva para explorar novos destinos', 'novidades'),
(41, 'Surpresa especial para sua próxima aventura', 'novidades'),
(33, 'Lançamento imperdível de novos destinos de viagem', 'promoção'),
(39, 'Desconto progressivo em pacotes de viagem imperdíveis', 'promoção'),
(16, 'Surpresa especial para sua próxima aventura', 'promoção'),
(22, 'Oferta relâmpago: viagens com desconto por tempo limitado', 'promoção'),
(27, 'Lançamento imperdível de novos destinos de viagem', 'novidades'),
(31, 'Alerta: ofertas especiais para suas férias dos sonhos', 'promoção'),
(28, 'Promoção exclusiva para explorar novos destinos', 'novidades'),
(11, 'Alerta: ofertas especiais para suas férias dos sonhos', 'novidades'),
(3, 'Atualização importante sobre nossos pacotes de viagem', 'novidades'),
(34, 'Descubra destinos incríveis para sua próxima viagem', 'promoção'),
(34, 'Alerta: ofertas especiais para suas férias dos sonhos', 'novidades'),
(5, 'Desconto progressivo em pacotes de viagem imperdíveis', 'promoção'),
(33, 'Lançamento imperdível de novos destinos de viagem', 'promoção'),
(22, 'Evento especial: comece sua próxima viagem hoje!', 'promoção'),
(36, 'Promoção exclusiva para explorar novos destinos', 'novidades'),
(42, 'Atualização importante sobre nossos pacotes de viagem', 'promoção'),
(11, 'Oferta relâmpago: viagens com desconto por tempo limitado', 'promoção'),
(13, 'Aproveite antes que acabe! Pacotes de viagem incríveis', 'promoção'),
(41, 'Atualização importante sobre nossos pacotes de viagem', 'novidades'),
(40, 'Descubra destinos incríveis para sua próxima viagem', 'promoção'),
(34, 'Evento especial: comece sua próxima viagem hoje!', 'promoção'),
(41, 'Oferta relâmpago: viagens com desconto por tempo limitado', 'novidades'),
(23, 'Promoção exclusiva para explorar novos destinos', 'promoção'),
(15, 'Aproveite antes que acabe! Pacotes de viagem incríveis', 'novidades'),
(33, 'Alerta: ofertas especiais para suas férias dos sonhos', 'novidades'),
(33, 'Aproveite antes que acabe! Pacotes de viagem incríveis', 'promoção'),
(15, 'Evento especial: comece sua próxima viagem hoje!', 'novidades'),
(2, 'Aproveite antes que acabe! Pacotes de viagem incríveis', 'promoção'),
(36, 'Surpresa especial para sua próxima aventura', 'novidades'),
(37, 'Oferta relâmpago: viagens com desconto por tempo limitado', 'promoção'),
(21, 'Descubra destinos incríveis para sua próxima viagem', 'promoção'),
(29, 'Lançamento imperdível de novos destinos de viagem', 'promoção'),
(6, 'Oferta relâmpago: viagens com desconto por tempo limitado', 'novidades'),
(2, 'Oferta relâmpago: viagens com desconto por tempo limitado', 'promoção'),
(33, 'Lançamento imperdível de novos destinos de viagem', 'novidades'),
(28, 'Surpresa especial para sua próxima aventura', 'promoção'),
(1, 'Desconto progressivo em pacotes de viagem imperdíveis', 'novidades'),
(23, 'Oferta relâmpago: viagens com desconto por tempo limitado', 'promoção'),
(18, 'Desconto progressivo em pacotes de viagem imperdíveis', 'promoção'),
(24, 'Descubra destinos incríveis para sua próxima viagem', 'promoção'),
(23, 'Atualização importante sobre nossos pacotes de viagem', 'novidades'),
(40, 'Descubra destinos incríveis para sua próxima viagem', 'promoção'),
(14, 'Evento especial: comece sua próxima viagem hoje!', 'novidades'),
(20, 'Promoção exclusiva para explorar novos destinos', 'novidades'),
(16, 'Aproveite antes que acabe! Pacotes de viagem incríveis', 'promoção'),
(15, 'Alerta: ofertas especiais para suas férias dos sonhos', 'novidades'),
(33, 'Desconto progressivo em pacotes de viagem imperdíveis', 'novidades'),
(32, 'Descubra destinos incríveis para sua próxima viagem', 'novidades'),
(20, 'Surpresa especial para sua próxima aventura', 'promoção'),
(1, 'Aproveite antes que acabe! Pacotes de viagem incríveis', 'promoção'),
(27, 'Promoção exclusiva para explorar novos destinos', 'promoção'),
(32, 'Alerta: ofertas especiais para suas férias dos sonhos', 'promoção'),
(10, 'Lançamento imperdível de novos destinos de viagem', 'promoção'),
(5, 'Surpresa especial para sua próxima aventura', 'promoção'),
(1, 'Atualização importante sobre nossos pacotes de viagem', 'promoção'),
(41, 'Desconto progressivo em pacotes de viagem imperdíveis', 'promoção'),
(28, 'Promoção exclusiva para explorar novos destinos', 'promoção'),
(6, 'Promoção exclusiva para explorar novos destinos', 'promoção'),
(22, 'Descubra destinos incríveis para sua próxima viagem', 'promoção'),
(18, 'Aproveite antes que acabe! Pacotes de viagem incríveis', 'promoção'),
(36, 'Promoção exclusiva para explorar novos destinos', 'novidades'),
(29, 'Desconto progressivo em pacotes de viagem imperdíveis', 'novidades'),
(19, 'Evento especial: comece sua próxima viagem hoje!', 'promoção'),
(8, 'Lançamento imperdível de novos destinos de viagem', 'promoção'),
(27, 'Promoção exclusiva para explorar novos destinos', 'promoção'),
(34, 'Surpresa especial para sua próxima aventura', 'promoção'),
(25, 'Descubra destinos incríveis para sua próxima viagem', 'promoção'),
(3, 'Ofertas especiais para suas férias dos sonhos', 'novidades'),
(1, 'Tempestades severas previstas para esta semana', 'alerta'),
(23, 'Interrupções em voos devido a condições climáticas', 'alerta'),
(20, 'Enchentes em áreas turísticas populares', 'alerta'),
(19, 'Fechamento de estradas por deslizamentos de terra', 'alerta'),
(39, 'Furacão se aproximando de destinos de viagem', 'alerta'),
(31, 'Condições climáticas adversas em regiões montanhosas', 'alerta'),
(21, 'Atrasos em viagens devido a nevascas intensas', 'alerta'),
(15, 'Evacuação de áreas costeiras por risco de tsunami', 'alerta'),
(41, 'Calor extremo afetando atividades ao ar livre', 'alerta'),
(37, 'Interrupções em cruzeiros devido a tempestades', 'alerta');

-- INSERTS da tabela COMMENTS
INSERT INTO comments (post_id, user_id, comment)
VALUES
(1, 1, 'Essa promoção é simplesmente incrível!'),
(2, 2, 'Nunca vi uma promoção tão boa como essa.'),
(3, 3, 'É impossível resistir a essa oferta!'),
(4, 4, 'Essa promoção é demais, estou adorando!'),
(5, 5, 'Mal posso acreditar nessa promoção, é perfeita!'),
(6, 6, 'Que promoção sensacional, não dá para perder!'),
(7, 7, 'Essa é a melhor promoção que já vi!'),
(8, 8, 'Estou apaixonado por essa promoção, é incrível!'),
(9, 9, 'Que promoção absurda! Simplesmente demais.'),
(10, 10, 'Essa promoção é de outro nível, perfeita!'),
(11, 11, 'Nunca imaginei uma promoção tão boa quanto essa.'),
(12, 12, 'Não acredito nessa promoção, é muito boa!'),
(13, 13, 'Essa é a promoção dos meus sonhos!'),
(14, 14, 'Que promoção fantástica, estou impressionado!'),
(15, 15, 'Essa oferta é simplesmente irresistível!'),
(16, 16, 'Uma promoção assim não aparece todo dia.'),
(17, 17, 'Essa promoção é espetacular, estou amando!'),
(18, 18, 'Essa promoção é boa demais para ser verdade!'),
(19, 19, 'Estou maravilhado com essa promoção incrível!'),
(20, 20, 'Essa promoção é tudo que eu precisava!'),
(21, 21, 'Essa promoção é um sonho realizado!'),
(22, 22, 'Não dá para acreditar nessa promoção fantástica!'),
(23, 23, 'Essa promoção é realmente demais, adorei!'),
(24, 24, 'Uma promoção dessas é tudo de bom!'),
(25, 25, 'Essa promoção é imperdível, que maravilha!'),
(26, 26, 'Essa promoção é pura perfeição, incrível!'),
(27, 27, 'Que promoção top, estou muito feliz!'),
(28, 28, 'Essa promoção é um arraso, adorei!'),
(29, 29, 'É a promoção mais incrível de todas!'),
(30, 30, 'Essa promoção é tudo e mais um pouco!'),
(31, 31, 'Essa promoção é espetacular, não dá para perder!'),
(32, 32, 'Essa promoção é a melhor coisa do ano!'),
(33, 33, 'Estou apaixonado por essa promoção incrível!'),
(34, 34, 'Essa é a promoção que todos esperavam.'),
(35, 35, 'Não tem como resistir a essa promoção maravilhosa!'),
(36, 36, 'Essa promoção é o que há de melhor!'),
(37, 37, 'Essa promoção é muito boa, adorei!'),
(38, 38, 'Essa promoção é inacreditável, estou feliz demais!'),
(39, 39, 'É a promoção mais sensacional de todas!'),
(40, 40, 'Essa promoção é a definição de perfeição!'),
(41, 41, 'Essa promoção é maravilhosa, que alegria!'),
(42, 42, 'Essa promoção é incrível, estou aproveitando muito!'),
(43, 1, 'Essa promoção é simplesmente demais, adorei!'),
(44, 2, 'Não acredito que essa promoção é real, é incrível!'),
(45, 3, 'Essa promoção é a melhor que eu já vi!'),
(46, 4, 'Essa promoção é de outro mundo, amei!'),
(47, 5, 'Essa promoção é um espetáculo, que demais!'),
(48, 6, 'Essa promoção é tudo que eu poderia querer.'),
(49, 7, 'Essa promoção é show, estou fascinado!'),
(50, 8, 'Essa promoção é uma oportunidade única, amei!'),
(51, 9, 'Essa promoção é boa demais para ser verdade!'),
(52, 10, 'Essa promoção é muito top, estou encantado!'),
(53, 11, 'Essa promoção é a melhor coisa que já aconteceu.'),
(54, 12, 'Essa promoção é impressionante, estou adorando!'),
(55, 13, 'Essa promoção é incrível, que felicidade!'),
(56, 14, 'Essa promoção é demais, estou muito satisfeito!'),
(57, 15, 'Essa promoção é um presente, que incrível!'),
(58, 16, 'Essa promoção é o máximo, estou amando!'),
(59, 17, 'Essa promoção é fenomenal, que demais!'),
(60, 18, 'Essa promoção é muito boa, estou adorando!'),
(61, 19, 'Essa promoção é sensacional, é demais!'),
(62, 20, 'Essa promoção é excelente, estou feliz demais!'),
(63, 21, 'Essa promoção é de outro nível, que maravilha!'),
(64, 22, 'Essa promoção é demais, estou impressionado!'),
(65, 23, 'Essa promoção é a melhor que já vi, incrível!'),
(66, 24, 'Essa promoção é muito boa, estou adorando!'),
(67, 25, 'Essa promoção é espetacular, que bom!'),
(68, 26, 'Essa promoção é demais, estou maravilhado!'),
(69, 27, 'Essa promoção é simplesmente fantástica!'),
(70, 28, 'Essa promoção é perfeita, estou muito feliz!'),
(71, 29, 'Essa promoção é maravilhosa, estou encantado!'),
(72, 30, 'Essa promoção é a melhor, que felicidade!'),
(73, 31, 'Essa promoção é sensacional, estou amando!'),
(74, 32, 'Essa promoção é incrível, estou aproveitando tudo!'),
(75, 33, 'Essa promoção é maravilhosa, que bom!'),
(76, 34, 'Essa promoção é demais, estou muito satisfeito!'),
(77, 35, 'Essa promoção é incrível, estou muito feliz!'),
(78, 36, 'Essa promoção é excelente, que demais!'),
(79, 37, 'Essa promoção é um espetáculo, estou encantado!'),
(80, 38, 'Essa promoção é demais, estou adorando muito!'),
(81, 39, 'Essa promoção é fantástica, que demais!'),
(82, 40, 'Essa promoção é ótima, estou muito feliz!'),
(83, 41, 'Essa promoção é incrível, estou muito satisfeito!'),
(84, 42, 'Essa promoção é sensacional, estou maravilhado!'),
(85, 1, 'Essa promoção é perfeita, estou adorando!'),
(86, 2, 'Essa promoção é incrível, estou muito animado!'),
(87, 3, 'Essa promoção é maravilhosa, estou encantado!'),
(88, 4, 'Essa promoção é demais, estou muito satisfeito!'),
(89, 5, 'Essa promoção é fantástica, estou muito feliz!'),
(90, 6, 'Essa promoção é excelente, estou adorando muito!'),
(91, 7, 'Essa promoção é incrível, estou muito satisfeito!'),
(92, 8, 'Essa promoção é sensacional, estou muito feliz!'),
(93, 9, 'Essa promoção é espetacular, estou encantado!'),
(94, 10, 'Essa promoção é demais, estou maravilhado!'),
(95, 11, 'Essa promoção é fantástica, estou muito animado!'),
(96, 12, 'Essa promoção é ótima, estou adorando muito!'),
(97, 13, 'Essa promoção é incrível, estou muito feliz!'),
(98, 14, 'Essa promoção é sensacional, estou encantado!'),
(99, 15, 'Essa promoção é demais, estou muito satisfeito!'),
(100, 16, 'Essa promoção é excelente, estou muito feliz!'),
(102, 1, 'Às vezes, a vida não é fácil, mas desejo que dias melhores cheguem em breve.'),
(103, 2, 'É triste ver situações assim, mas mantenha a esperança, coisas boas estão por vir.'),
(104, 3, 'Mesmo nos momentos difíceis, lembre-se de que tudo passa. Que você encontre força e paz.'),
(105, 4, 'A tristeza pode ser pesada, mas desejo que você encontre conforto e alegria logo.'),
(106, 5, 'Nem sempre a vida é justa, mas espero que dias mais felizes estejam no horizonte.'),
(107, 6, 'Que apesar da dor, você encontre motivos para sorrir novamente.'),
(108, 7, 'A vida pode ser dura, mas desejo que você tenha coragem para seguir em frente.'),
(109, 8, 'Que os dias tristes sejam substituídos por momentos de felicidade e luz.'),
(110, 9, 'Mesmo na escuridão, desejo que você encontre a luz que precisa para continuar.'),
(111, 10, 'Espero que a tristeza dê lugar à esperança e que coisas boas venham em sua direção.');

-- INSERTS da tabela REGIONS: Sudeste
INSERT INTO regions (name, state, text, links) VALUES
('São Paulo (capital)', 'SP', 'Centro cultural e econômico do país, com atrações como o MASP, Mercado Municipal, Parque Ibirapuera e a Avenida Paulista.', 'https://www.tripadvisor.com.br/Attractions-g303631-Activities-Sao_Paulo_State_of_Sao_Paulo.html');
INSERT INTO regions (name, state, text) VALUES
('Ilhabela', 'SP', 'Ilha paradisíaca com praias intocadas, trilhas na Mata Atlântica e ótimos locais para mergulho e esportes aquáticos.'),
('Campos do Jordão', 'SP', 'Conhecida como a “Suíça Brasileira”, oferece clima ameno, arquitetura europeia e o famoso Festival de Inverno.'),
('Holambra', 'SP', '"Capital das Flores", com campos floridos e o maior moinho da América Latina, refletindo a herança holandesa.');

INSERT INTO regions (name, state, text, links) VALUES
('Rio de Janeiro (capital)', 'RJ', 'Famosa mundialmente por suas belezas naturais, como o Pão de Açúcar, Cristo Redentor e praias como Copacabana e Ipanema.', 'https://www.tripadvisor.com.br/Attractions-g303506-Activities-Rio_de_Janeiro_State_of_Rio_de_Janeiro.html');
INSERT INTO regions (name, state, text) VALUES
('Paraty', 'RJ', ' Cidade colonial charmosa, reconhecida como Patrimônio Mundial da UNESCO, com centro histórico preservado e belas praias.'),
('Região dos Lagos:', 'RJ', 'Inclui destinos como Búzios, Arraial do Cabo e Cabo Frio, conhecidos por suas praias paradisíacas e excelente infraestrutura turística.');

INSERT INTO regions (name, state, text, links) VALUES
('Belo Horizonte (capital)', 'MG', 'Famosa por sua hospitalidade, culinária e vida noturna animada. Ponto de partida para cidades históricas como Ouro Preto e Mariana.', 'https://www.tripadvisor.com.br/Attractions-g303370-Activities-State_of_Minas_Gerais.html');
INSERT INTO regions (name, state, text) VALUES
('Ouro Preto', 'MG', 'Cidade colonial que preserva a rica herança do período do ouro no Brasil, com igrejas barrocas e ruas de paralelepípedos.'),
('Parques Nacionais', 'MG', 'Como o da Serra da Canastra, onde nasce o Rio São Francisco, e o da Serra do Cipó, conhecidos por suas belezas naturais e biodiversidade.');

INSERT INTO regions (name, state, text, links) VALUES
('Vitória (capital)', 'ES', 'Cidade litorânea com praias tranquilas, como a Ilha do Boi e a Ilha do Frade, além de uma rica gastronomia baseada em frutos do mar.', 'https://www.tripadvisor.com.br/Attractions-g303308-Activities-State_of_Espirito_Santo.html');

-- INSERTS da tabela REGIONS: Sul
INSERT INTO regions (name, state, text, links) VALUES
('Curitiba (capital)', 'PR', 'Reconhecida por seu planejamento urbano, oferece atrações como o Jardim Botânico, o Museu Oscar Niemeyer e o Parque Barigui.', 'https://www.tripadvisor.com.br/Attractions-g303435-Activities-State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Foz do Iguaçu', 'PR', 'Lar das impressionantes Cataratas do Iguaçu, uma das Sete Maravilhas Naturais do Mundo, e da Represa de Itaipu. A cidade também é ponto de acesso a Ciudad del Este (Paraguai) e Puerto Iguazú (Argentina).'),
('Serra do Mar', 'PR', 'Ideal para ecoturismo, com trilhas que levam a vilarejos históricos como Morretes e Antonina, onde se pode degustar o tradicional barreado.');

INSERT INTO regions (name, state, text, links) VALUES
('Florianópolis (capital)', 'SC', ' A capital, conhecida por suas belas praias, como Joaquina e Campeche, além da Lagoa da Conceição e da Ponte Hercílio Luz.', 'https://www.tripadvisor.com.br/Attractions-g303570-Activities-State_of_Santa_Catarina.html');
INSERT INTO regions (name, state, text) VALUES
('Balneário Camboriú', 'SC', 'Famosa por sua vida noturna vibrante e pelo Parque Unipraias, que oferece vistas panorâmicas e atividades de ecoturismo.'),
('São Joaquim', 'SC', 'Destino ideal para quem deseja vivenciar o inverno brasileiro, com possibilidade de neve e temperaturas negativas.');

INSERT INTO regions (name, state, text, links) VALUES
('Porto Alegre (capital)', 'RS', 'Cidade com forte influência cultural, sendo um dos principais centros urbanos do sul do Brasil. A cidade está situada às margens do Lago Guaíba e é conhecida por sua diversidade cultural, gastronomia, e seus famosos centros históricos e espaços ao ar livre.', 'https://www.tripadvisor.com.br/Attractions-g303530-Activities-State_of_Rio_Grande_do_Sul.html');
INSERT INTO regions (name, state, text) VALUES
('Vale dos Vinhedos', 'RS', 'Região produtora de vinhos, onde é possível visitar vinícolas e participar de degustações.'),
('Cânion Itaimbezinho', 'RS', 'Localizado no Parque Nacional de Aparados da Serra, oferece trilhas e vistas deslumbrantes.');

-- INSERTS da tabela REGIONS: Norte
INSERT INTO regions (name, state, text, links) VALUES
('Manaus (capital)', 'AM', 'Porta de entrada para a Amazônia, a capital amazonense oferece atrações como o Teatro Amazonas, o Mercado Municipal e o Encontro das Águas, onde os rios Negro e Solimões correm lado a lado sem se misturar.', 'https://www.tripadvisor.com.br/Attractions-g303226-Activities-State_of_Amazonas.html');
INSERT INTO regions (name, state, text) VALUES
('Floresta Amazônica', 'AM', 'Possibilidade de realizar passeios de barco, caminhadas na selva e observação de fauna e flora únicas.');

INSERT INTO regions (name, state, text, links) VALUES
('Belém (capital)', 'PA', 'Capital paraense, famosa por sua culinária típica, como o tacacá e o açaí, além de pontos turísticos como o Mercado Ver-o-Peso e o Museu Paraense Emílio Goeldi.', 'https://www.tripadvisor.com.br/Attractions-g303402-Activities-State_of_Para.html');
INSERT INTO regions (name, state, text) VALUES
('Alter do Chão', 'PA', 'Conhecida como o "Caribe Amazônico", oferece praias de água doce com areia branca e águas cristalinas, sendo considerada uma das praias mais bonitas do Brasil.');

INSERT INTO regions (name, state, text, links) VALUES
('Rio Branco (capital)', 'AC', 'Maior cidade do estado e está localizada na região norte do Brasil, próxima à fronteira com o Peru e a Bolívia. A cidade tem uma mistura de história, cultura e natureza, sendo a principal porta de entrada para quem deseja explorar a Floresta Amazônica e as belezas naturais do Acre.', 'https://www.tripadvisor.com.br/Attractions-g303199-Activities-State_of_Acre.html');
INSERT INTO regions (name, state, text) VALUES
('Geoglifos do Acre', 'AC', 'Estruturas geométricas misteriosas esculpidas no solo, com mais de 3.000 anos de idade, que despertam interesse arqueológico.');

INSERT INTO regions (name, state, text, links) VALUES
('Boa Vista (capital)', 'RR', 'Única capital brasileira situada completamente ao norte da linha do Equador e é conhecida por sua proximidade com a natureza e por ser uma cidade com forte presença de influências indígenas e amazônicas.', 'https://www.tripadvisor.com.br/Attractions-g303562-Activities-State_of_Roraima.html');
INSERT INTO regions (name, state, text) VALUES
('Monte Roraima', 'RR', 'Uma das formações geológicas mais antigas do planeta, oferece trilhas desafiadoras e vistas deslumbrantes, sendo inspiração para obras como "O Mundo Perdido" de Arthur Conan Doyle.');

INSERT INTO regions (name, state, text, links) VALUES
('Palmas (capital)', 'TO', 'Cidade planejada, inaugurada em 1989, e está situada às margens do Lago de Palmas, em uma região de grande beleza natural.', 'https://www.tripadvisor.com.br/Attractions-g303645-Activities-State_of_Tocantins.html');
INSERT INTO regions (name, state, text) VALUES
('Jalapão', 'TO', 'Conhecido por suas dunas douradas, fervedouros (poços de água que borbulham devido à pressão da água subterrânea) e cachoeiras, é um destino ideal para quem busca aventura e contato com a natureza.');

-- INSERTS da tabela REGIONS: Nordeste
INSERT INTO regions (name, state, text, links) VALUES
('Salvador (capital)', 'BA', 'Capital cultural do Brasil, famosa pelo Pelourinho, igrejas históricas e o Elevador Lacerda.', 'https://www.tripadvisor.com.br/Attractions-g303251-Activities-State_of_Bahia.html');
INSERT INTO regions (name, state, text) VALUES
('Chapada Diamantina', 'BA', 'Parque nacional com cachoeiras, cavernas e trilhas, ideal para os amantes de ecoturismo.'),
('Ilha de Itaparica', 'BA', 'Destino tranquilo com praias de águas calmas, perfeito para relaxar.');

INSERT INTO regions (name, state, text, links) VALUES
('Recife (capital)', 'PE', 'Cidade com forte influência cultural, sendo um dos principais centros urbanos do sul do Brasil. A cidade está situada às margens do Lago Guaíba e é conhecida por sua divePEidade cultural, gastronomia, e seus famosos centros históricos e espaços ao ar livre.', 'https://www.tripadvisor.com.br/Attractions-g303459-Activities-State_of_Pernambuco.html');
INSERT INTO regions (name, state, text) VALUES
('Olinda', 'PE', 'Cidade histórica com igrejas barrocas e ladeiras coloridas.'),
('Porto de Galinhas', 'PE', 'Praias paradisíacas com piscinas naturais e águas cristalinas.');

INSERT INTO regions (name, state, text, links) VALUES
('Fortaleza (capital)', 'CE', 'Capital vibrante com praias urbanas como Praia do Futuro e atrações culturais como o Mercado Central.', 'https://www.tripadvisor.com.br/Attractions-g303284-Activities-State_of_Ceara.html');
INSERT INTO regions (name, state, text) VALUES
('Jericoacoara', 'CE', 'Vila charmosa com dunas, lagoas e pôr do sol deslumbrante.'),
('Canoa Quebrada', 'CE', 'Praia famosa por suas falésias vermelhas e vida noturna animada.');

INSERT INTO regions (name, state, text, links) VALUES
('São Luís (capital)', 'MA', 'Centro histórico com casarões coloniais e manifestações culturais como o Bumba Meu Boi.', 'https://www.tripadvisor.com.br/Attractions-g303325-Activities-State_of_Maranhao.html');
INSERT INTO regions (name, state, text) VALUES
('Lençóis Maranhenses', 'MA', 'Parque nacional com dunas de areia branca e lagoas de água doce, criando paisagens únicas.');

INSERT INTO regions (name, state, text, links) VALUES
('Maceió (capital)', 'AL', 'Praias urbanas como Pajuçara e Ponta Verde, além de lagoas e piscinas naturais.', 'https://www.tripadvisor.com.br/Attractions-g303208-Activities-State_of_Alagoas.html');
INSERT INTO regions (name, state, text) VALUES
('Maragogi', 'AL', 'Conhecida como o "Caribe Brasileiro", com suas águas transparentes e recifes de corais.');

INSERT INTO regions (name, state, text, links) VALUES
('João Pessoa (capital)', 'PB', 'Capital tranquila com praias como Tambaú e Cabo Branco, além do Centro Histórico bem preservado.', 'https://www.tripadvisor.com.br/Attractions-g303422-Activities-State_of_Paraiba.html');
INSERT INTO regions (name, state, text) VALUES
('Praia de Coqueirinho', 'PB', 'Praia paradisíaca com falésias e águas calmas.');

INSERT INTO regions (name, state, text, links) VALUES
('Teresina (capital)', 'PI', 'Capital com rica culinária e proximidade com o Parque Nacional de Sete Cidades, conhecido por suas formações rochosas.', 'https://www.tripadvisor.com.br/Attractions-g303462-Activities-State_of_Piaui.html');
INSERT INTO regions (name, state, text) VALUES
('Delta do Parnaíba', 'PI', 'Único delta em mar aberto das Américas, com ilhas e igarapés.');

INSERT INTO regions (name, state, text, links) VALUES
('Natal (capital)', 'RN', 'Capital com praias urbanas como Ponta Negra e o famoso Forte dos Reis Magos.', 'https://www.tripadvisor.com.br/Attractions-g303510-Activities-State_of_Rio_Grande_do_Norte.html');
INSERT INTO regions (name, state, text) VALUES
('Genipabu', 'RN', 'Conhecida por suas dunas móveis e passeios de buggy.');

INSERT INTO regions (name, state, text, links) VALUES
('Aracaju (capital)', 'SE', 'Capital com praias como Atalaia e Orla de Atalaia, além de museus e mercados artesanais.', 'https://www.tripadvisor.com.br/Attractions-g303637-Activities-State_of_Sergipe.html');
INSERT INTO regions (name, state, text) VALUES
('Cânion do Xingó', 'SE', 'Formações rochosas impressionantes no Rio São Francisco.');

-- INSERTS da tabela REGIONS: Centro-Oeste
INSERT INTO regions (name, state, text, links) VALUES
('Goiânia (capital)', 'GO', 'Cidade moderna, planejada, e um dos principais centros urbanos da região Centro-Oeste do Brasil.', 'https://www.tripadvisor.com.br/Attractions-g303323-Activities-State_of_Goias.html');
INSERT INTO regions (name, state, text) VALUES
('Chapada dos Veadeiros', 'GO', 'Localizada no estado de Goiás, a Chapada dos Veadeiros é um parque nacional famoso por suas cachoeiras, trilhas e formações rochosas. Destinos como a Cachoeira de Santa Bárbara e a Cachoeira do Segredo são altamente recomendados para os amantes de natureza.'),
('Rio Quente', 'GO', 'Situado no estado de Goiás, Rio Quente é famoso por suas águas termais, com temperaturas que chegam a 38°C. O Hot Park é um dos maiores parques aquáticos da região e oferece diversas atrações para todas as idades.');

INSERT INTO regions (name, state, text, links) VALUES
('Cuiabá (capital)', 'MT', 'Conhecida como a "porta de entrada para o Pantanal" e também pela sua localização geográfica única: é considerada o centro da América do Sul.', 'https://www.tripadvisor.com.br/Attractions-g303346-Activities-State_of_Mato_Grosso.html');
INSERT INTO regions (name, state, text) VALUES
('Chapada dos Guimarães', 'MT', 'Próxima à Cuiabá, a Chapada dos Guimarães é conhecida por suas cachoeiras, cavernas e mirantes. O Parque Nacional da Chapada dos Guimarães é um local ideal para trilhas e observação da fauna local.');

INSERT INTO regions (name, state, text, links) VALUES
('Campo Grande (capital)', 'MS', 'Conhecida como a "Cidade Morena" devido à coloração avermelhada de seu solo, Campo Grande é um importante centro urbano e econômico do Centro-Oeste do Brasil. A cidade é uma mistura de culturas indígenas, sul-mato-grossense, paraguaia e pantaneira.', 'https://www.tripadvisor.com.br/Attractions-g303368-Activities-State_of_Mato_Grosso_do_Sul.html');
INSERT INTO regions (name, state, text) VALUES
('Bonito', 'MS', 'Famosa por suas águas cristalinas, Bonito oferece atividades como flutuação em rios, visita a cavernas e cachoeiras. A Gruta da Lagoa Azul e o Abismo Anhumas são atrações renomadas.');

INSERT INTO regions (name, state, text, links) VALUES
('Brasília (distrito federal)', 'DF', 'A capital federal do Brasil é reconhecida por sua arquitetura modernista, projetada por Oscar Niemeyer. Pontos turísticos como a Catedral Metropolitana, o Congresso Nacional e o Palácio da Alvorada são imperdíveis.', 'https://www.tripadvisor.com.br/Attractions-g303322-Activities-Brasilia_Federal_District.html');

-- INSERTS da tabela NEWS
INSERT INTO news (name, place, image, text, URL) VALUES
('Notícia 1', 'São Paulo', 'https://example.com/news1.jpg', 'Texto da notícia 1', 'https://example.com/news1'),
('Notícia 2', 'Rio de Janeiro', 'https://example.com/news2.jpg', 'Texto da notícia 2', 'https://example.com/news2'),
('Notícia 3', 'Minas Gerais', 'https://example.com/news3.jpg', 'Texto da notícia 3', 'https://example.com/news3');
