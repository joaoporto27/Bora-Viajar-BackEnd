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
    text TEXT NOT NULL
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
(34, 'Acabei de voltar de Bonito (MS) e fiquei encantado com o novo Mirante da Nascente Azul! A passarela suspensa é incrível e a vista é de tirar o fôlego.', 'NOVIDADES'),
(78, 'ALERTA: Algumas lagoas dos Lençóis Maranhenses estão com menor volume de água este mês por causa das chuvas irregulares. Melhor confirmar com os guias antes de agendar passeio.', 'ALERTA'),
(15, 'PROMOÇÃO imperdível em Gramado! Reserve 3 noites e ganhe um jantar colonial completo em um dos cafés artesanais parceiros da nova rota gourmet.', 'PROMOÇÃO'),
(91, 'Visitei Ouro Preto no último fim de semana e recomendo muito a nova rota noturna com luzes cênicas. Caminhar pelas ladeiras históricas à noite foi mágico!', 'NOVIDADES'),
(43, 'ALERTA: Trilha principal da Chapada dos Veadeiros está com interdição parcial para manutenção das passarelas ecológicas. Só está liberado o acesso ao Vale da Lua.', 'ALERTA'),
(108, 'Fui na FLIP em Paraty e participei de um sarau literário incrível em um dos casarões restaurados. A cidade respira cultura o tempo todo.', 'NOVIDADES'),
(7, 'PROMOÇÃO em Alter do Chão! Hospedagem flutuante com desconto para reservas feitas até o fim do mês. Ideal pra quem quer dormir com vista pro rio.', 'PROMOÇÃO'),
(59, 'Recife está um espetáculo com o Festival Recife na Rua. Tem música, teatro e comidinhas típicas em cada esquina do bairro antigo. Vale muito a visita!', 'NOVIDADES'),
(102, 'ALERTA: Praia da Joaquina em Florianópolis com forte correnteza nesta semana. Evitem nadar em áreas sem sinalização de segurança.', 'ALERTA'),
(26, 'Achei ótima a nova ciclovia entre a Praia Mole e Lagoa da Conceição. Pedalei com a família inteira e foi super tranquilo!', 'NOVIDADES'),
(12, 'Visitei o Jalapão (TO) semana passada e fiquei impressionado com os fervedouros! A água parece te empurrar pra cima. Experiência surreal!', 'NOVIDADES'),
(67, 'PROMOÇÃO em Porto de Galinhas (PE): pacotes com desconto de 30% para quem reserva até domingo. Ótimo para famílias com crianças!', 'PROMOÇÃO'),
(88, 'ALERTA: Em Ilhabela (SP), a travessia de balsa está com longas filas nos fins de semana. Recomendo ir bem cedo pra evitar atrasos.', 'ALERTA'),
(29, 'Passei o feriado em São Miguel do Gostoso (RN) e foi incrível! Praia calma, vento constante, ótima pra kitesurf e descanso total.', 'NOVIDADES'),
(105, 'PROMOÇÃO rolando em Foz do Iguaçu (PR): desconto para quem visitar as Cataratas e o Parque das Aves no mesmo dia. Entrada combinada vale a pena!', 'PROMOÇÃO'),
(53, 'ALERTA: Em Manaus (AM), o porto está parcialmente fechado para embarques turísticos devido à cheia do rio Negro. Verifiquem antes de comprar passeio.', 'ALERTA'),
(36, 'A Serra do Cipó (MG) me surpreendeu! Trilhas lindas, cachoeiras de águas cristalinas e um clima perfeito pra quem curte natureza e sossego.', 'NOVIDADES'),
(110, 'PROMOÇÃO na Chapada Diamantina (BA): pousadas em Lençóis com até 40% de desconto no mês de junho. Aproveitem antes da alta temporada!', 'PROMOÇÃO'),
(21, 'ALERTA: Forte calor em Palmas (TO), especialmente nas trilhas do Parque Estadual do Lajeado. Leve bastante água e evite caminhadas no horário de pico.', 'ALERTA'),
(99, 'Acabei de conhecer o Vale dos Vinhedos (RS) e recomendo o tour noturno com degustação. As vinícolas estão lindíssimas nessa época do ano!', 'NOVIDADES'),
(114, 'ALERTA: A travessia de balsa está com longas filas nos fins de semana. (Ilhabela (SP))', 'ALERTA'),
(105, 'PROMOÇÃO em Lençóis (BA)! Nova sinalização nas trilhas da Chapada garante mais segurança.', 'PROMOÇÃO'),
(31, 'PROMOÇÃO em Canela (RS)! Nova iluminação na Catedral de Pedra está deslumbrante à noite.', 'PROMOÇÃO'),
(96, 'ALERTA: Tour noturno com degustação, vinícolas encantadoras. (Vale dos Vinhedos (RS))', 'ALERTA'),
(116, 'PROMOÇÃO em Foz do Iguaçu (PR)! Desconto especial para quem visita as Cataratas e o Parque das Aves.', 'PROMOÇÃO'),
(103, 'PROMOÇÃO em Belém (PA)! Mercado Ver-o-Peso restaurado com nova área gastronômica.', 'PROMOÇÃO'),
(88, 'PROMOÇÃO em João Pessoa (PB)! Orla nova com ciclovia e feirinhas noturnas animadas.', 'PROMOÇÃO'),
(117, 'PROMOÇÃO em Natal (RN)! Passeio de buggy pelas dunas está com 20% de desconto.', 'PROMOÇÃO'),
(103, 'Estive em Vale dos Vinhedos (RS) recentemente. Tour noturno com degustação, vinícolas encantadoras.', 'NOVIDADES'),
( 68, 'Aproveite a PROMOÇÃO em São Miguel do Gostoso (RN): Praia calma e vento constante, ótimo para kitesurf.', 'PROMOÇÃO' ),
( 115, 'Aproveite a PROMOÇÃO em Canela (RS): Nova iluminação na Catedral de Pedra está deslumbrante à noite.', 'PROMOÇÃO' ),
( 97, 'Aproveite a PROMOÇÃO em Natal (RN): Passeio de buggy pelas dunas está com 20% de desconto.', 'PROMOÇÃO' ),
( 30, 'Aproveite a PROMOÇÃO em Arraial do Cabo (RJ): ALERTA: Acesso limitado à Praia do Farol por excesso de turistas.', 'PROMOÇÃO' ),
( 23, 'ATENÇÃO: Orla nova com ciclovia e feirinhas noturnas animadas. (João Pessoa (PB))', 'ALERTA' ),
( 51, 'ATENÇÃO: Pousadas com diária reduzida durante o meio da semana. (Pipa (RN))', 'ALERTA' ),
( 18, 'Aproveite a PROMOÇÃO em Pipa (RN): Pousadas com diária reduzida durante o meio da semana.', 'PROMOÇÃO' ),
( 90, 'Visitei Arraial do Cabo (RJ) e adorei! ALERTA: Acesso limitado à Praia do Farol por excesso de turistas.', 'NOVIDADES' ),
( 109, 'ATENÇÃO: Desconto especial para quem visita as Cataratas e o Parque das Aves. (Foz do Iguaçu (PR))', 'ALERTA' ),
( 102, 'Visitei Palmas (TO) e adorei! Forte calor nas trilhas do Parque do Lajeado, leve bastante água.', 'NOVIDADES' ),
( 8, 'Aproveite a PROMOÇÃO em Pipa (RN): Pousadas com diária reduzida durante o meio da semana.', 'PROMOÇÃO' ),
( 60, 'Aproveite a PROMOÇÃO em Jalapão (TO): Os fervedouros são impressionantes e a paisagem é surreal.', 'PROMOÇÃO' ),
( 5, 'ATENÇÃO: Mercado Ver-o-Peso restaurado com nova área gastronômica. (Belém (PA))', 'ALERTA' ),
( 80, 'Aproveite a PROMOÇÃO em Natal (RN): Passeio de buggy pelas dunas está com 20% de desconto.', 'PROMOÇÃO' ),
( 23, 'ATENÇÃO: Nova iluminação na Catedral de Pedra está deslumbrante à noite. (Canela (RS))', 'ALERTA' ),
( 76, 'Aproveite a PROMOÇÃO em Vale dos Vinhedos (RS): Tour noturno com degustação, vinícolas encantadoras.', 'PROMOÇÃO' ),
( 100, 'Visitei Palmas (TO) e adorei! Forte calor nas trilhas do Parque do Lajeado, leve bastante água.', 'NOVIDADES' ),
( 86, 'Aproveite a PROMOÇÃO em Foz do Iguaçu (PR): Desconto especial para quem visita as Cataratas e o Parque das Aves.', 'PROMOÇÃO' ),
( 64, 'ATENÇÃO: Nova iluminação na Catedral de Pedra está deslumbrante à noite. (Canela (RS))', 'ALERTA' ),
( 55, 'Aproveite a PROMOÇÃO em Jalapão (TO): Os fervedouros são impressionantes e a paisagem é surreal.', 'PROMOÇÃO' ),
( 97, 'Aproveite a PROMOÇÃO em Pipa (RN): Pousadas com diária reduzida durante o meio da semana.', 'PROMOÇÃO' ),
( 12, 'Aproveite a PROMOÇÃO em Arraial do Cabo (RJ): ALERTA: Acesso limitado à Praia do Farol por excesso de turistas.', 'PROMOÇÃO' ),
( 78, 'Visitei Canela (RS) e adorei! Nova iluminação na Catedral de Pedra está deslumbrante à noite.', 'NOVIDADES' ),
( 7, 'Visitei Serra do Cipó (MG) e adorei! Trilhas lindas e cachoeiras cristalinas, perfeito para ecoturismo.', 'NOVIDADES' ),
( 111, 'ATENÇÃO: A travessia de balsa está com longas filas nos fins de semana. (Ilhabela (SP))', 'ALERTA' ),
( 106, 'Visitei Belém (PA) e adorei! Mercado Ver-o-Peso restaurado com nova área gastronômica.', 'NOVIDADES' ),
( 51, 'Aproveite a PROMOÇÃO em Ilhabela (SP): A travessia de balsa está com longas filas nos fins de semana.', 'PROMOÇÃO' ),
( 42, 'ATENÇÃO: Trilhas lindas e cachoeiras cristalinas, perfeito para ecoturismo. (Serra do Cipó (MG))', 'ALERTA' ),
( 68, 'Aproveite a PROMOÇÃO em Jalapão (TO): Os fervedouros são impressionantes e a paisagem é surreal.', 'PROMOÇÃO' ),
( 83, 'ATENÇÃO: Pacotes com desconto de 30% para reservas até domingo. (Porto de Galinhas (PE))', 'ALERTA' ),
( 96, 'ATENÇÃO: Pousadas com diária reduzida durante o meio da semana. (Pipa (RN))', 'ALERTA' ),
( 102, 'ATENÇÃO: PROMOÇÃO em passeios de teleférico na temporada de inverno. (Balneário Camboriú (SC))', 'ALERTA' ),
( 77, 'Aproveite a PROMOÇÃO em Balneário Camboriú (SC): PROMOÇÃO em passeios de teleférico na temporada de inverno.', 'PROMOÇÃO' ),
( 8, 'ATENÇÃO: Pousadas com diária reduzida durante o meio da semana. (Pipa (RN))', 'ALERTA' ),
( 86, 'Visitei Porto de Galinhas (PE) e adorei! Pacotes com desconto de 30% para reservas até domingo.', 'NOVIDADES' ),
( 19, 'ATENÇÃO: Novo circuito de tirolesas foi inaugurado no parque de aventuras. (Brotas (SP))', 'ALERTA' ),
( 2, 'Aproveite a PROMOÇÃO em Belém (PA): Mercado Ver-o-Peso restaurado com nova área gastronômica.', 'PROMOÇÃO' ),
( 45, 'Visitei Brotas (SP) e adorei! Novo circuito de tirolesas foi inaugurado no parque de aventuras.', 'NOVIDADES' ),
( 115, 'Visitei Jalapão (TO) e adorei! Os fervedouros são impressionantes e a paisagem é surreal.', 'NOVIDADES' ),
( 38, 'Aproveite a PROMOÇÃO em Foz do Iguaçu (PR): Desconto especial para quem visita as Cataratas e o Parque das Aves.', 'PROMOÇÃO' ),
( 53, 'Visitei Ilhabela (SP) e adorei! A travessia de balsa está com longas filas nos fins de semana.', 'NOVIDADES' ),
( 71, 'ATENÇÃO: Tour noturno com degustação, vinícolas encantadoras. (Vale dos Vinhedos (RS))', 'ALERTA' ),
( 96, 'Visitei Pipa (RN) e adorei! Pousadas com diária reduzida durante o meio da semana.', 'NOVIDADES' ),
( 78, 'Aproveite a PROMOÇÃO em Jalapão (TO): Os fervedouros são impressionantes e a paisagem é surreal.', 'PROMOÇÃO' ),
( 76, 'ATENÇÃO: O porto está parcialmente fechado devido à cheia do rio Negro. (Manaus (AM))', 'ALERTA' ),
( 96, 'Visitei Chapada Diamantina (BA) e adorei! Pousadas em Lençóis com até 40% de desconto em junho.', 'NOVIDADES' ),
( 27, 'Visitei Jalapão (TO) e adorei! Os fervedouros são impressionantes e a paisagem é surreal.', 'NOVIDADES' ),
( 110, 'Visitei Arraial do Cabo (RJ) e adorei! ALERTA: Acesso limitado à Praia do Farol por excesso de turistas.', 'NOVIDADES' ),
( 29, 'Aproveite a PROMOÇÃO em Manaus (AM): O porto está parcialmente fechado devido à cheia do rio Negro.', 'PROMOÇÃO' ),
( 82, 'ATENÇÃO: Praia calma e vento constante, ótimo para kitesurf. (São Miguel do Gostoso (RN))', 'ALERTA' ),
( 94, 'Aproveite a PROMOÇÃO em Arraial do Cabo (RJ): ALERTA: Acesso limitado à Praia do Farol por excesso de turistas.', 'PROMOÇÃO' ),
( 82, 'Visitei Belém (PA) e adorei! Mercado Ver-o-Peso restaurado com nova área gastronômica.', 'NOVIDADES' ),
( 42, 'ATENÇÃO: Orla nova com ciclovia e feirinhas noturnas animadas. (João Pessoa (PB))', 'ALERTA' ),
( 113, 'ATENÇÃO: Orla nova com ciclovia e feirinhas noturnas animadas. (João Pessoa (PB))', 'ALERTA' ),
( 72, 'ATENÇÃO: Trilhas lindas e cachoeiras cristalinas, perfeito para ecoturismo. (Serra do Cipó (MG))', 'ALERTA' ),
( 1, 'Aproveite a PROMOÇÃO em João Pessoa (PB): Orla nova com ciclovia e feirinhas noturnas animadas.', 'PROMOÇÃO' ),
( 59, 'Aproveite a PROMOÇÃO em Brotas (SP): Novo circuito de tirolesas foi inaugurado no parque de aventuras.', 'PROMOÇÃO' ),
( 73, 'ATENÇÃO: Passeio de buggy pelas dunas está com 20% de desconto. (Natal (RN))', 'ALERTA' ),
( 94, 'Visitei Canela (RS) e adorei! Nova iluminação na Catedral de Pedra está deslumbrante à noite.', 'NOVIDADES' ),
( 32, 'Visitei Natal (RN) e adorei! Passeio de buggy pelas dunas está com 20% de desconto.', 'NOVIDADES' ),
( 80, 'Visitei Manaus (AM) e adorei! O porto está parcialmente fechado devido à cheia do rio Negro.', 'NOVIDADES' ),
( 23, 'ATENÇÃO: Nova sinalização nas trilhas da Chapada garante mais segurança. (Lençóis (BA))', 'ALERTA' ),
( 27, 'Aproveite a PROMOÇÃO em João Pessoa (PB): Orla nova com ciclovia e feirinhas noturnas animadas.', 'PROMOÇÃO' ),
( 53, 'ATENÇÃO: O porto está parcialmente fechado devido à cheia do rio Negro. (Manaus (AM))', 'ALERTA' ),
( 92, 'ATENÇÃO: Praia calma e vento constante, ótimo para kitesurf. (São Miguel do Gostoso (RN))', 'ALERTA' ),
( 107, 'ATENÇÃO: Pacotes com desconto de 30% para reservas até domingo. (Porto de Galinhas (PE))', 'ALERTA' ),
( 54, 'Aproveite a PROMOÇÃO em Lençóis (BA): Nova sinalização nas trilhas da Chapada garante mais segurança.', 'PROMOÇÃO' ),
( 26, 'Aproveite a PROMOÇÃO em Porto de Galinhas (PE): Pacotes com desconto de 30% para reservas até domingo.', 'PROMOÇÃO' ),
( 3, 'Aproveite a PROMOÇÃO em Ilhabela (SP): A travessia de balsa está com longas filas nos fins de semana.', 'PROMOÇÃO' ),
( 11, 'ATENÇÃO: Tour noturno com degustação, vinícolas encantadoras. (Vale dos Vinhedos (RS))', 'ALERTA' ),
( 106, 'Visitei Brotas (SP) e adorei! Novo circuito de tirolesas foi inaugurado no parque de aventuras.', 'NOVIDADES' ),
( 90, 'Visitei João Pessoa (PB) e adorei! Orla nova com ciclovia e feirinhas noturnas animadas.', 'NOVIDADES' ),
( 23, 'ATENÇÃO: Pousadas em Lençóis com até 40% de desconto em junho. (Chapada Diamantina (BA))', 'ALERTA' ),
( 19, 'Visitei Palmas (TO) e adorei! Forte calor nas trilhas do Parque do Lajeado, leve bastante água.', 'NOVIDADES' ),
( 96, 'ATENÇÃO: Tour noturno com degustação, vinícolas encantadoras. (Vale dos Vinhedos (RS))', 'ALERTA' ),
( 71, 'ATENÇÃO: Os fervedouros são impressionantes e a paisagem é surreal. (Jalapão (TO))', 'ALERTA' ),
( 92, 'Visitei Ilhabela (SP) e adorei! A travessia de balsa está com longas filas nos fins de semana.', 'NOVIDADES' ),
( 106, 'ATENÇÃO: Nova sinalização nas trilhas da Chapada garante mais segurança. (Lençóis (BA))', 'ALERTA' ),
( 40, 'ATENÇÃO: PROMOÇÃO em passeios de teleférico na temporada de inverno. (Balneário Camboriú (SC))', 'ALERTA' ),
( 45, 'Aproveite a PROMOÇÃO em Lençóis (BA): Nova sinalização nas trilhas da Chapada garante mais segurança.', 'PROMOÇÃO' ),
( 117, 'Aproveite a PROMOÇÃO em Pipa (RN): Pousadas com diária reduzida durante o meio da semana.', 'PROMOÇÃO' ),
( 58, 'ATENÇÃO: Orla nova com ciclovia e feirinhas noturnas animadas. (João Pessoa (PB))', 'ALERTA' ),
( 62, 'Aproveite a PROMOÇÃO em Foz do Iguaçu (PR): Desconto especial para quem visita as Cataratas e o Parque das Aves.', 'PROMOÇÃO' ),
( 13, 'ATENÇÃO: Forte calor nas trilhas do Parque do Lajeado, leve bastante água. (Palmas (TO))', 'ALERTA' ),
( 13, 'Aproveite a PROMOÇÃO em Palmas (TO): Forte calor nas trilhas do Parque do Lajeado, leve bastante água.', 'PROMOÇÃO' ),
( 112, 'Visitei Belém (PA) e adorei! Mercado Ver-o-Peso restaurado com nova área gastronômica.', 'NOVIDADES' ),
( 36, 'Aproveite a PROMOÇÃO em Manaus (AM): O porto está parcialmente fechado devido à cheia do rio Negro.', 'PROMOÇÃO' ),
( 57, 'ATENÇÃO: Trilhas lindas e cachoeiras cristalinas, perfeito para ecoturismo. (Serra do Cipó (MG))', 'ALERTA' ),
( 89, 'ATENÇÃO: ALERTA: Acesso limitado à Praia do Farol por excesso de turistas. (Arraial do Cabo (RJ))', 'ALERTA' ),
( 1, 'Visitei Ilhabela (SP) e adorei! A travessia de balsa está com longas filas nos fins de semana.', 'NOVIDADES' ),
( 54, 'ATENÇÃO: Trilhas lindas e cachoeiras cristalinas, perfeito para ecoturismo. (Serra do Cipó (MG))', 'ALERTA' ),
( 84, 'Visitei Belém (PA) e adorei! Mercado Ver-o-Peso restaurado com nova área gastronômica.', 'NOVIDADES' ),
( 50, 'Visitei Balneário Camboriú (SC) e adorei! PROMOÇÃO em passeios de teleférico na temporada de inverno.', 'NOVIDADES' ),
( 53, 'Visitei São Miguel do Gostoso (RN) e adorei! Praia calma e vento constante, ótimo para kitesurf.', 'NOVIDADES' ),
( 22, 'Visitei Jalapão (TO) e adorei! Os fervedouros são impressionantes e a paisagem é surreal.', 'NOVIDADES' ),
( 27, 'Visitei Brotas (SP) e adorei! Novo circuito de tirolesas foi inaugurado no parque de aventuras.', 'NOVIDADES' ),
( 48, 'Aproveite a PROMOÇÃO em Ilhabela (SP): A travessia de balsa está com longas filas nos fins de semana.', 'PROMOÇÃO' ),
( 105, 'Visitei Canela (RS) e adorei! Nova iluminação na Catedral de Pedra está deslumbrante à noite.', 'NOVIDADES' ),
( 88, 'Visitei Vale dos Vinhedos (RS) e adorei! Tour noturno com degustação, vinícolas encantadoras.', 'NOVIDADES' ),
( 66, 'Aproveite a PROMOÇÃO em Ilhabela (SP): A travessia de balsa está com longas filas nos fins de semana.', 'PROMOÇÃO' ),
(42, 'Visitei Brotas (SP) e o novo circuito de tirolesas está incrível. Aventura pura!', 'NOVIDADES'),
(18, 'ALERTA: Acesso à Praia do Farol, em Arraial do Cabo (RJ), está restrito devido ao grande número de turistas. Planeje com antecedência.', 'ALERTA'),
(53, 'PROMOÇÃO em Pipa (RN): Passeios de barco com desconto para quem compra até sexta-feira!', 'PROMOÇÃO'),
(67, 'Fui a Pirenópolis (GO) no Festival de Inverno, e os shows e a comida típica me conquistaram. Uma verdadeira festa!', 'NOVIDADES'),
(85, 'ALERTA: O calor está muito intenso em Palmas (TO). Cuidado com as trilhas no Parque Estadual do Lajeado.', 'ALERTA'),
(91, 'O Mercado Ver-o-Peso em Belém (PA) ficou ainda melhor com a nova área gastronômica. Perfeito para quem ama sabores exóticos!', 'NOVIDADES'),
(28, 'PROMOÇÃO no Vale dos Vinhedos (RS): Descontos em pacotes turísticos para quem visita mais de duas vinícolas no mesmo dia.', 'PROMOÇÃO'),
(114, 'Em Canela (RS), a iluminação da Catedral de Pedra à noite está maravilhosa. Vale a pena conferir!', 'NOVIDADES'),
(19, 'ALERTA em São Miguel do Gostoso (RN): O vento está muito forte, então, se você vai praticar kitesurf, tome cuidado.', 'ALERTA'),
(78, 'Descobri uma PROMOÇÃO imperdível em Gramado (RS): Hospedagem com 25% de desconto no próximo feriado!', 'PROMOÇÃO');


-- INSERTS da tabela COMMENTS
INSERT INTO comments (post_id, user_id, comment) VALUES
(1, 101, 'Esse mirante em Bonito parece imperdível! Quero muito conhecer.'),
(2, 2, 'Adorei a ideia do passeio noturno em Ouro Preto, super diferente!'),
(3, 78, 'Sarau na FLIP é tudo! Excelente dica cultural.'),
(4, 22, 'Recife sempre surpreende com eventos criativos, amei!'),
(5, 83, 'Boa notícia para quem curte pedalar em Floripa!'),
(6, 106, 'Fervedouros do Jalapão são mesmo únicos, recomendadíssimo!'),
(7, 107, 'Kitesurf em São Miguel do Gostoso? Já quero reservar!'),
(8, 108, 'Serra do Cipó é perfeita para recarregar as energias.'),
(9, 4, 'Tour noturno com vinho? Parece super romântico!'),
(10, 110, 'Boa saber sobre a baixa das lagoas nos Lençóis, vou me programar melhor.'),
(11, 46, 'Triste pela trilha fechada, mas que bom que tem outras opções!'),
(12, 112, 'Alerta importante, principalmente para quem viaja com crianças.'),
(13, 34, 'Sempre bom lembrar dos horários de pico para a balsa de Ilhabela.'),
(14, 14, 'Notícia importante pra quem faz passeios de barco. Valeu o aviso!'),
(15, 115, 'Calor intenso em Palmas é de respeito, obrigado pelo alerta!'),
(16, 55, 'Promoção ótima pra curtir Gramado sem gastar tanto!'),
(17, 117, 'Hospedagem flutuante com desconto? Que sonho!'),
(18, 118, 'Adoro Porto de Galinhas! Com esse desconto, fica ainda melhor.'),
(19, 17, 'Ótimo combo! Cataratas e Parque das Aves são imperdíveis.'),
(20, 120, 'Desconto excelente na Chapada Diamantina, vou aproveitar!'),
(21, 114, 'A travessia de balsa em Ilhabela está com longas filas. Cuidado se for viajar no fim de semana!'),
(22 ,105, 'Ótima promoção em Lençóis, a nova sinalização nas trilhas da Chapada vai garantir mais segurança! #Promoção'),
(23, 31, 'Visitei Canela e fiquei encantado com a nova iluminação da Catedral de Pedra à noite, vale muito a pena!'),
(24, 96, 'O tour noturno com degustação no Vale dos Vinhedos foi sensacional! Vale a pena conferir as vinícolas!'),
(25, 116, 'Desconto especial para quem visitar as Cataratas e o Parque das Aves em Foz do Iguaçu! Aproveitem!'),
(26, 103, 'O Mercado Ver-o-Peso em Belém foi restaurado e está com uma nova área gastronômica incrível!'),
(27, 88, 'A orla nova de João Pessoa com ciclovia e feirinhas noturnas ficou maravilhosa. Super recomendo!'),
(28, 117, 'Passeio de buggy pelas dunas de Natal com 20% de desconto, não dá para perder!'),
(29, 103, 'Acabei de voltar do Vale dos Vinhedos e o tour noturno com degustação foi uma experiência incrível!'),
(30, 68, 'São Miguel do Gostoso é um paraíso para kitesurf! Praia calma e vento constante, perfeito!'),
(31, 115, 'A iluminação da Catedral de Pedra em Canela é ainda mais bonita à noite. Vale a pena a visita!'),
(32, 97, 'Não perca a chance de fazer o passeio de buggy pelas dunas de Natal com 20% de desconto!'),
(33, 30, 'Acesso à Praia do Farol em Arraial do Cabo está restrito por excesso de turistas. Planeje com antecedência.'),
(34, 23, 'A orla nova de João Pessoa com ciclovia e feirinhas noturnas ficou ainda mais encantadora!'),
(35, 51, 'Pousadas com diária reduzida em Pipa no meio da semana! Perfeito para quem quer aproveitar mais com menos!'),
(36, 18, 'Em Pipa, as pousadas estão com diária reduzida no meio da semana. Excelente para quem quer economizar!'),
(37, 90, 'Fui a Arraial do Cabo e adorei! Acesso à Praia do Farol está restrito por excesso de turistas, então se planeje!'),
(38, 109, 'Desconto especial para quem visita as Cataratas e o Parque das Aves em Foz do Iguaçu!'),
(39, 102, 'Forte calor nas trilhas do Parque do Lajeado em Palmas! Leve bastante água!'),
(40, 8, 'Pousadas com diária reduzida em Pipa no meio da semana! Excelente oportunidade!'),
(41, 60, 'Os fervedouros de Jalapão são incríveis! A paisagem é surreal, um lugar perfeito para aventura!'),
(42, 5, 'O Mercado Ver-o-Peso em Belém está renovado e com uma nova área gastronômica. Vale a pena visitar!'),
(43, 80, 'Aproveite o desconto em passeios de buggy em Natal! Passeio pelas dunas imperdível!'),
(44, 23, 'A iluminação da Catedral de Pedra em Canela está incrível à noite, imperdível!'),
(45, 76, 'Tour noturno com degustação nas vinícolas de Vale dos Vinhedos. Uma experiência maravilhosa!'),
(46, 100, 'Em Palmas, o calor nas trilhas do Parque do Lajeado é intenso. Leve muita água!'),
(47, 86, 'Desconto especial em Foz do Iguaçu para quem visita as Cataratas e o Parque das Aves. Não perca!'),
(48, 64, 'A iluminação da Catedral de Pedra em Canela está ainda mais deslumbrante à noite. Imperdível!'),
(49, 55, 'Fervedouros de Jalapão são impressionantes! Paisagens incríveis para quem ama ecoturismo.'),
(50, 97, 'Aproveite a promoção em Pipa com diárias reduzidas no meio da semana!'),
(51, 12, 'Acesso à Praia do Farol em Arraial do Cabo está limitado devido ao excesso de turistas. Fique atento!'),
(52, 78, 'Em Canela, a iluminação da Catedral de Pedra à noite é um espetáculo! Vale cada minuto da visita!'),
(53, 7, 'A Serra do Cipó tem trilhas lindas e cachoeiras cristalinas, ótimo para ecoturismo!'),
(54, 111, 'A travessia de balsa em Ilhabela está com longas filas nos fins de semana. Se planeje!'),
(55, 106, 'Mercado Ver-o-Peso em Belém foi renovado com uma área gastronômica incrível. Muito legal!'),
(56, 51, 'A travessia de balsa em Ilhabela está com longas filas nos fins de semana. Melhor evitar esse pico!'),
(57, 42, 'Em Serra do Cipó, as trilhas são maravilhosas e as cachoeiras cristalinas são imperdíveis!'),
(58, 68, 'Fervedouros em Jalapão são uma experiência única. Paisagens de tirar o fôlego!'),
(59, 83, 'Desconto de 30% para pacotes de reservas em Porto de Galinhas até domingo! Aproveite!'),
(60, 96, 'Pousadas em Pipa com diárias reduzidas durante a semana. Uma ótima oportunidade de aproveitar mais!'),
(61, 102, 'Desconto em passeios de teleférico em Balneário Camboriú na temporada de inverno. Não perca!'),
(62, 77, 'Promoção nos passeios de teleférico em Balneário Camboriú! Aproveite o inverno com desconto!'),
(63, 8, 'Pousadas com diária reduzida em Pipa durante o meio da semana. Super recomendada!'),
(64, 86, 'Desconto de 30% para pacotes de Porto de Galinhas até domingo! Aproveite!'),
(65, 19, 'Novo circuito de tirolesas em Brotas! Uma aventura e tanto!'),
(66, 2, 'Mercado Ver-o-Peso em Belém está com nova área gastronômica. Vale muito a pena!'),
(67, 45, 'Novo circuito de tirolesas em Brotas é uma diversão para os aventureiros!'),
(68, 115, 'Os fervedouros de Jalapão são impressionantes. Paisagens de outro mundo!'),
(69, 38, 'Desconto especial em Foz do Iguaçu para quem visita as Cataratas e o Parque das Aves. Aproveite!'),
(70, 53, 'A travessia de balsa em Ilhabela está com longas filas nos fins de semana. Se organize!'),
(71, 71, 'O tour noturno com degustação nas vinícolas do Vale dos Vinhedos é uma experiência única!'),
(72, 96, 'Pousadas com diárias reduzidas durante a semana em Pipa. Ótima oportunidade!');

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
INSERT INTO news (name, place, text) VALUES
('Festival de Cinema agita a Serra Gaúcha com novas atrações gastronômicas', 'Gramado (RS)', 'A charmosa cidade de Gramado está em clima de celebração com o aguardado Festival de Cinema de 2025. O evento, que atrai artistas e turistas de todo o Brasil, traz neste ano uma mostra dedicada ao cinema latino-americano contemporâneo. Além disso, a prefeitura lançou a Rota do Café Colonial Artesanal, reunindo 18 produtores locais que oferecem experiências únicas de sabores coloniais em ambientes rústicos e acolhedores. A iluminação temática nas ruas centrais completa o cenário encantador.' ),
('Novo mirante e passarelas ecológicas valorizam o ecoturismo', 'Bonito (MS)', 'Bonito continua sendo referência em turismo sustentável, e acaba de inaugurar o "Mirante da Nascente Azul", com passarelas suspensas que oferecem uma visão aérea das águas cristalinas e da fauna local. Com foco na preservação e na acessibilidade, o complexo agora conta também com trilhas inclusivas para cadeirantes e idosos, além de áreas de descanso com sombra e sinalização ambiental educativa. A cidade recebe ainda, neste mês, a Feira de Turismo Ecológico do Centro-Oeste, reunindo especialistas e operadores de turismo.'),
('Festival de esportes aquáticos e novas trilhas de aventura', 'Jericoacoara (CE)', 'A paradisíaca vila de Jericoacoara realizou a primeira edição do Festival de Kite e Windsurf Sustentável, que reuniu atletas de todo o país em competições que valorizam práticas de baixo impacto ambiental. Novas trilhas ecológicas para quadriciclos e caminhadas foram abertas na área da Pedra Furada, com sinalização bilíngue e mirantes panorâmicos. O pôr do sol nas dunas continua sendo uma atração imperdível, agora com apresentações culturais ao vivo nos fins de tarde.'),
('Patrimônio cultural em destaque na celebração dos 60 anos da FLIP', 'Paraty (RJ)', 'Paraty se transformou num grande palco literário com a comemoração dos 60 anos da Festa Literária Internacional. A cidade recebe autores de renome, debates sobre literatura indígena e oficinas de escrita criativa em casarões históricos. Uma das grandes novidades é a reabertura do Forte Defensor Perpétuo, agora restaurado com um museu interativo e trilhas que oferecem vista panorâmica da baía de Paraty. Restaurantes locais também entraram na festa com menus especiais inspirados em livros e personagens literários.'),
('Caribe amazônico ganha hotel flutuante e turismo sustentável cresce', 'Alter do Chão (PA)', 'As águas claras do Rio Tapajós estão ainda mais atrativas com a chegada do primeiro hotel flutuante ecológico da região, operando com energia solar, coleta de água da chuva e cardápios que valorizam a culinária ribeirinha. A alta temporada das praias de rio está a todo vapor, com destaque para a Ilha do Amor, que recebeu nova sinalização turística e quiosques padronizados com foco em limpeza e organização. Passeios guiados de canoa agora incluem oficinas sobre plantas medicinais da floresta.'),
('Concertos barrocos e nova rota noturna celebram 40 anos de patrimônio mundial', 'Ouro Preto (MG)', 'Ouro Preto comemora quatro décadas como Patrimônio Mundial da UNESCO com uma agenda intensa de atrações. As igrejas do centro histórico sediam concertos noturnos com música barroca ao vivo, criando uma atmosfera mágica nas ladeiras coloniais. A nova "Rota da Luz e História", um passeio noturno guiado, utiliza iluminação cênica para valorizar os principais monumentos e casarões. A Casa dos Contos também abriu uma nova exposição interativa sobre a Inconfidência Mineira.'),
('Realidade aumentada e novas trilhas inclusivas encantam visitantes', 'Chapada dos Veadeiros (GO)', 'O Parque Nacional da Chapada dos Veadeiros acaba de ganhar um moderno centro de visitantes com experiências em realidade aumentada, simulando voos de drone sobre os cânions e cachoeiras mais icônicos da região. As trilhas principais foram reformadas com passarelas ecológicas e sinalização em braile, tornando o ecoturismo ainda mais acessível. Restaurantes e pousadas locais estão adotando práticas sustentáveis, com destaque para a gastronomia baseada em ingredientes do cerrado.'),
('Recife Antigo revive com arte de rua e nova fase do Cais do Sertão', 'Recife (PE)', 'O bairro histórico do Recife Antigo vive um momento vibrante com a reabertura ampliada do museu Cais do Sertão, que agora conta com salas interativas sobre o ciclo do forró e da poesia nordestina. As ruas do bairro estão tomadas pelo Festival Recife na Rua, com música ao vivo, gastronomia regional, teatro de rua e maracatus que desfilam entre os casarões coloniais. A ciclovia recém-inaugurada ligando o Marco Zero à Praia de Boa Viagem estimula o turismo sustentável.'),
('Ilha da Magia promove festival vegano e amplia ciclovias litorâneas', 'Florianópolis (SC)', 'Florianópolis está em clima de consciência ecológica com o Floripa Veg Festival, que reúne chefs renomados, produtores locais e painéis sobre alimentação consciente e saúde. O evento ocorre simultaneamente em várias praias e centros culturais da cidade. Novas ciclovias foram concluídas entre a Praia Mole, Joaquina e o centrinho da Lagoa da Conceição, promovendo o transporte alternativo e o contato com a natureza. Trilhas autoguiadas com QR Codes foram instaladas no Morro da Cruz e no Costão do Santinho.'),
('Temporada de lagoas cheias traz passaporte turístico e novos voos', 'Lençóis Maranhenses (MA)', 'A beleza única dos Lençóis Maranhenses está ainda mais acessível com a chegada de novos voos diretos para Barreirinhas, principal porta de entrada do parque. A temporada de lagoas cheias está deslumbrante, e os visitantes agora podem participar do programa “Passaporte dos Lençóis”, que premia quem explora diferentes circuitos como Lagoa Azul, Lagoa Bonita e Canto do Atins. Barqueiros e guias locais estão sendo capacitados para oferecer experiências mais seguras e informativas aos turistas.');