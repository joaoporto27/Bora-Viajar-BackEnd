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
    region VARCHAR(70) NOT NULL,
    name VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    text TEXT NOT NULL,
    links VARCHAR(255)
);

-- Alteração da tabela REGIONS

ALTER TABLE regions ADD COLUMN image TEXT;
ALTER TABLE regions CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Tabela de NEWS
CREATE TABLE news (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    place VARCHAR(255) NOT NULL,
    text TEXT NOT NULL
);

-- Tabela de FEEDBACKS
CREATE TABLE feedbacks (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    feedback TEXT NOT NULL,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5)
);

INSERT INTO feedbacks (user_id, feedback, rating) VALUES
(11, 'O Bora Viajar me ajudou muito a montar um roteiro incrível pelo litoral nordestino!', 5),
(42, 'Achei as informações sobre segurança muito úteis durante minha viagem a Manaus.', 4),
(3, 'O app travou algumas vezes durante o uso, mas no geral é bom.', 3),
(88, 'Fiquei encantado com as dicas de outros viajantes. Super recomendo!', 5),
(1 'Faltam informações sobre transporte local em algumas cidades.', 2),
(96, 'Os roteiros criados pelos profissionais são bem completos e fáceis de seguir.', 5),
(53, 'Gostei bastante da interface do site, muito intuitiva.', 4),
(27, 'Tive dificuldade em encontrar excursões atualizadas para o Jalapão.', 2),
(89, 'Excelente ferramenta para planejar viagens em família!', 5),
(79, 'O sistema de avaliação dos destinos poderia ser mais transparente.', 3),
(8, 'Usei o app para planejar minha lua de mel e foi perfeito!', 5),
(15, 'Algumas informações estavam desatualizadas, principalmente sobre hospedagem.', 3),
(21, 'Adorei poder ver relatos de outros usuários antes de decidir meu roteiro.', 5),
(32, 'A opção de roteiros personalizados foi o que mais me atraiu no aplicativo.', 4),
(44, 'Precisa melhorar o suporte ao cliente dentro do app.', 2),
(72, 'Com o Bora Viajar descobri lugares incríveis que nunca tinha ouvido falar.', 5),
(49, 'Muito bom para quem viaja sozinho. As dicas são bem específicas e práticas.', 4),
(37, 'Fiquei decepcionada com a falta de opções para o interior de alguns estados.', 2),
(77, 'Facilitou muito meu mochilão pelo sul do Brasil.', 5),
(87, 'Poderia ter integração com apps de mapas como Google Maps ou Waze.', 3);


-- INSERTS da tabela USERS: usuários
INSERT INTO users (name, email, city, state, type_user, password) VALUES
('Amanda Gomes Mechi', 'amanda.mechi@gmail.com', 'Campinas', 'SP', 'Usuário','123456@'),
('Andre Lucca Santos', 'andre.l.santos45@gmail.com', 'Campinas', 'SP', 'Usuário','234561$'),
('Flavia Regina Alexandre Mendes', 'flavia.r.mendes@gmail.com', 'Campinas', 'SP', 'Usuário','345612%'),
('Giovanna Caron de Barros', 'giovanna.c.barros@gmail.com', 'Valinhos', 'SP', 'Usuário','456123@'),
('Isabella Borin de Moraes Rosa', 'isabella.b.rosa6@gmail.com', 'Valinhos', 'SP', 'Usuário','567234%'),
('João Vitor Porto Sales', 'joao.v.sales15@gmail.com', 'Campinas', 'SP', 'Usuário','678345#'),
('Laura Ferreira Violla', 'laura.violla@gmail.com', 'Valinhos', 'SP', 'Usuário','789456#'),
('Carlos Silva', 'carlos.silva435@gmail.com', 'São Paulo', 'SP', 'Usuário', '512735$'),
('Vinícius Andrade', 'vinicius.andrade101@gmail.com', 'Campinas', 'SP', 'Usuário', '180577%'),
('Matheus Rocha', 'matheus.rocha217@gmail.com', 'São Bernardo do Campo', 'SP', 'Usuário', '698730&'),
('Ana Oliveira', 'ana.oliveira2@gmail.com', 'Rio de Janeiro', 'RJ', 'Usuário', '184767#'),
('Marcos Souza', 'marcos.souza3@gmail.com', 'Belo Horizonte', 'MG', 'Usuário', '941291#'),
('Juliana Lima', 'juliana.lima4@gmail.com', 'Curitiba', 'PR', 'Usuário', '408734#'),
('Bruna Costa', 'bruna.costa205@gmail.com', 'Maringá', 'PR', 'Usuário', '370614#'),
('André Souza', 'andre.souza206@gmail.com', 'Londrina', 'PR', 'Usuário', '939015#'),
('Rafael Costa', 'rafael.costa5@gmail.com', 'Porto Alegre', 'RS', 'Usuário', '089987@'),
('Tatiane Silva', 'tatiane.silva207@gmail.com', 'Caxias do Sul', 'RS', 'Usuário', '905764@'),
('Fernanda Rocha', 'fernanda.rocha6@gmail.com', 'Recife', 'PE', 'Usuário', '555133@'),
('Lucas Martins', 'lucas.martins7@gmail.com', 'Salvador', 'BA', 'Usuário', '576843$'),
('Camila Ribeiro', 'camila.ribeiro8@gmail.com', 'Brasília', 'DF', 'Usuário', '216441$'),
('Pedro Almeida', 'pedro.almeida9@gmail.com', 'Fortaleza', 'CE', 'Usuário', '418251$'),
('Aline Mendes', 'aline.mendes10@gmail.com', 'Manaus', 'AM', 'Usuário', '442272#'),
('Patrícia Moraes', 'patricia.moraes102@gmail.com', 'Maceió', 'AL', 'Usuário', '900128#'),
('Bruno Teixeira', 'bruno.teixeira103@gmail.com', 'João Pessoa', 'PB', 'Usuário', '769424#'),
('Larissa Pires', 'larissa.pires104@gmail.com', 'São Luís', 'MA', 'Usuário', '638515@'),
('Tiago Nunes', 'tiago.nunes105@gmail.com', 'Goiânia', 'GO', 'Usuário', '378299@'),
('Amanda Barreto', 'amanda.barreto201@gmail.com', 'Blumenau', 'SC', 'Usuário', '717463@'),
('João Vitor Sales', 'joao.sales202@gmail.com', 'Cuiabá', 'MT', 'Usuário', '5049215%'),
('Luana Neves', 'luana.neves203@gmail.com', 'Palmas', 'TO', 'Usuário', '137840%'),
('Letícia Gomes', 'leticia.gomes209@gmail.com', 'Santarém', 'PA', 'Usuário', '304881$'),
('Rayssa Lopes', 'rayssa.lopes213@gmail.com', 'Aracaju', 'SE', 'Usuário', '181202#'),
('Caio Antunes', 'caio.antunes214@gmail.com', 'Macapá', 'AP', 'Usuário', '641973#'),
('Yasmin Duarte', 'yasmin.duarte218@gmail.com', 'Teresina', 'PI', 'Usuário', '390458#');


-- INSERTS da tabela USERS: guia turístico
INSERT INTO users (name, email, city, state, type_user, password) VALUES
('Cíntia Fernandes', 'cintia.fernandes190@gmail.com', 'Ilhabela', 'SP', 'Guia turístico', '300742@'),
('Rodrigo Leal', 'rodrigo.leal183@gmail.com', 'Paraty', 'RJ', 'Guia turístico', '430872@'),
('Marcelo Barros', 'marcelo.barros187@gmail.com', 'Ouro Preto', 'MG', 'Guia turístico', '811935@'),
('Eduardo Campos', 'eduardo.campos181@gmail.com', 'Foz do Iguaçu', 'PR', 'Guia turístico', '781304@'),
('Beatriz Tavares', 'beatriz.tavares186@gmail.com', 'Gramado', 'RS', 'Guia turístico', '540161#'),
('Daniela Freitas', 'daniela.freitas182@gmail.com', 'Olinda', 'PE', 'Guia turístico', '954702#'),
('Tatiane Lopes', 'tatiane.lopes188@gmail.com', 'Fernando de Noronha', 'PE', 'Guia turístico', '731508%'),
('Sérgio Araújo', 'sergio.araujo185@gmail.com', 'Lençóis', 'BA', 'Guia turístico', '206187%'),
('Vanessa Prado', 'vanessa.prado184@gmail.com', 'Bonito', 'MS', 'Guia turístico', '629103%'),
('Rogério Melo', 'rogerio.melo189@gmail.com', 'Chapada dos Veadeiros', 'GO', 'Guia turístico', '647091%'),
('Gustavo Reis', 'gustavo.reis191@gmail.com', 'Petrolina', 'PE', 'Guia turístico', '284105%');


-- INSERTS da tabela USERS: sem fotos
INSERT INTO users (name, email, city, state, type_user, password) VALUES
('Douglas Fernandes', 'douglas.fernandes208@gmail.com', 'Ribeirão Preto', 'SP', 'Usuário', '425876'),
('Gabriel Monteiro', 'gabriel.monteiro210@gmail.com', 'São José dos Campos', 'SP', 'Usuário', '717008'),
('Fábio Pimentel', 'fabio.pimentel212@gmail.com', 'Bauru', 'SP', 'Usuário', '382112'),
('Murilo Batista', 'murilo.batista199@gmail.com', 'Ubatuba', 'SP', 'guia turístico', '794320'),
('Natália Gomes', 'natalia.gomes196@gmail.com', 'Arraial do Cabo', 'RJ', 'guia turístico', '602513'),
('Lorena Dias', 'lorena.dias211@gmail.com', 'Uberlândia', 'MG', 'Usuário', '643917'),
('Priscila Martins', 'priscila.martins194@gmail.com', 'Tiradentes', 'MG', 'guia turístico', '810026'),
('Ricardo Farias', 'ricardo.farias195@gmail.com', 'Canela', 'RS', 'guia turístico', '990348'),
('Diego Cunha', 'diego.cunha219@gmail.com', 'Caruaru', 'PE', 'Usuário', '952316'),
('Alexandre Duarte', 'alexandre.duarte193@gmail.com', 'Ilhéus', 'BA', 'guia turístico', '457680'),
('Helena Carvalho', 'helena.carvalho200@gmail.com', 'Itacaré', 'BA', 'guia turístico', '239851'),
('Isis Ferreira', 'isis.ferreira215@gmail.com', 'Boa Vista', 'RR', 'Usuário', '104559'),
('Eduarda Martins', 'eduarda.martins216@gmail.com', 'Joinville', 'SC', 'Usuário', '178194'),
('Rebeca Vasconcelos', 'rebeca.vasconcelos220@gmail.com', 'Juazeiro do Norte', 'CE', 'Usuário', '820013'),
('Felipe Soares', 'felipe.soares197@gmail.com', 'Jericoacoara', 'CE', 'guia turístico', '928471'),
('Jéssica Castro', 'jessica.castro198@gmail.com', 'São Miguel dos Milagres', 'AL', 'guia turístico', '153709'),
('Rafael Castro', 'rafael.castro234@gmail.com', 'Palmas', 'TO', 'Usuário', '785412#'),
('Juliana Paiva', 'juliana.paiva235@gmail.com', 'São Paulo', 'SP', 'Usuário', '634291#'),
('André Nascimento', 'andre.nascimento236@gmail.com', 'Rio de Janeiro', 'RJ', 'Usuário', '981276#'),
('Bruna Oliveira', 'bruna.oliveira237@gmail.com', 'Curitiba', 'PR', 'Usuário', '453018#'),
('Henrique Souza', 'henrique.souza238@gmail.com', 'Recife', 'PE', 'Usuário', '719830#'),
('Letícia Andrade', 'leticia.andrade239@gmail.com', 'Porto Seguro', 'BA', 'Usuário', '168392#'),
('Gustavo Moura', 'gustavo.moura240@gmail.com', 'João Pessoa', 'PB', 'Usuário', '823105#'),
('Marina Duarte', 'marina.duarte241@gmail.com', 'Aracaju', 'SE', 'Usuário', '290186#'),
('Eduardo Pinto', 'eduardo.pinto242@gmail.com', 'Macapá', 'AP', 'Usuário', '331094#'),
('Talita Ribeiro', 'talita.ribeiro243@gmail.com', 'Rio Branco', 'AC', 'Usuário', '557319#'),
('César Martins', 'cesar.martins244@gmail.com', 'Boa Vista', 'RR', 'Usuário', '671042#'),
('Mirela Cardoso', 'mirela.cardoso245@gmail.com', 'Petrolina', 'PE', 'Usuário', '442011#'),
('Paulo Henrique', 'paulo.henrique246@gmail.com', 'Maragogi', 'AL', 'Usuário', '799034#'),
('Nina Bastos', 'nina.bastos247@gmail.com', 'Chapada dos Veadeiros', 'GO', 'Usuário', '915376#'),
('Alana Cruz', 'alana.cruz248@gmail.com', 'Foz do Iguaçu', 'PR', 'Usuário', '348190#'),
('Sabrina Teles', 'sabrina.teles249@gmail.com', 'Paraty', 'RJ', 'Usuário', '624781#'),
('Fernando Mello', 'fernando.mello250@gmail.com', 'São Luís', 'MA', 'Usuário', '813470#'),
('Amanda Prado', 'amanda.prado251@gmail.com', 'Balneário Camboriú', 'SC', 'Usuário', '938624#'),
('Tatiana Correia', 'tatiana.correia253@gmail.com', 'Vitória da Conquista', 'BA', 'Usuário', '409782#'),
('Cristiano Neves', 'cristiano.neves254@gmail.com', 'Campina Grande', 'PB', 'Usuário', '517209#'),
('Elisa Martins', 'elisa.martins255@gmail.com', 'Altamira', 'PA', 'Usuário', '374821#'),
('Rodrigo Sales', 'rodrigo.sales256@gmail.com', 'Rondonópolis', 'MT', 'Usuário', '902184#'),
('Marcela Luz', 'marcela.luz258@gmail.com', 'Teresópolis', 'RJ', 'Usuário', '281905@'),
('Eduardo Lima', 'eduardo.lima259@gmail.com', 'Caxias do Sul', 'RS', 'Usuário', '650378@'),
('Júlia Viana', 'julia.viana260@gmail.com', 'Franca', 'SP', 'Usuário', '195024@'),
('Mariane Costa', 'mariane.costa262@gmail.com', 'Itabuna', 'BA', 'Usuário', '347902@'),
('Leandro Rocha', 'leandro.rocha252@gmail.com', 'Porto Velho', 'RO', 'guia turístico', '110348#'),
('Daniela Furtado', 'daniela.furtado257@gmail.com', 'São João del-Rei', 'MG', 'guia turístico', '764392@'),
('Pedro Cunha', 'pedro.cunha261@gmail.com', 'Piracicaba', 'SP', 'guia turístico', '817402@'),
('Larissa Freitas', 'larissa.freitas233@gmail.com', 'Vitória', 'ES', 'Usuário', '213904#'),
('Otávio Nunes', 'otavio.nunes263@gmail.com', 'Penedo', 'AL', 'guia turístico', '713289@'),
('Larissa Almeida', 'larissa.almeida123@gmail.com', 'Campinas', 'SP', 'Usuário', '983214@'),
('Renato Cardoso', 'renato.cardoso99@gmail.com', 'Belo Horizonte', 'MG', 'Usuário', '612347@'),
('Juliana Mendes', 'juliana.mendes@gmail.com', 'Curitiba', 'PR', 'Usuário', '704128@'),
('Tiago Oliveira', 'tiago.oliveira87@gmail.com', 'Porto Alegre', 'RS', 'Usuário', '559876@'),
('Bruna Souza', 'bruna.souza@gmail.com', 'Salvador', 'BA', 'Usuário', '347281@'),
('Marcelo Ribeiro', 'marcelo.ribeiro@hotmail.com', 'Recife', 'PE', 'Usuário', '890173$'),
('Diego Nascimento', 'diego.nascimento@gmail.com', 'João Pessoa', 'PB', 'Usuário', '519283$'),
('Camila Duarte', 'camila.duarte@gmail.com', 'Fortaleza', 'CE', 'Usuário', '209134$'),
('André Lima', 'andre.lima@gmail.com', 'Goiânia', 'GO', 'Usuário', '381947$');




-- INSERTS da tabela POSTS
INSERT INTO posts (user_id, description, tag) VALUES
(38, 'ALERTA: Algumas lagoas dos Lençóis Maranhenses estão com menor volume de água este mês por causa das chuvas irregulares. Melhor confirmar com os guias antes de agendar passeio.', 'ALERTA'),
(88, 'PROMOÇÃO imperdível em Gramado! Reserve 3 noites e ganhe um jantar colonial completo em um dos cafés artesanais parceiros da nova rota gourmet.', 'PROMOÇÃO'),
(7, 'PROMOÇÃO em Alter do Chão! Hospedagem flutuante com desconto para reservas feitas até o fim do mês. Ideal pra quem quer dormir com vista pro rio.', 'PROMOÇÃO'),
(61, 'PROMOÇÃO em Porto de Galinhas (PE): pacotes com desconto de 30% para quem reserva até domingo. Ótimo para famílias com crianças!', 'PROMOÇÃO'),
(53, 'ALERTA: Em Manaus (AM), o porto está parcialmente fechado para embarques turísticos devido à cheia do rio Negro. Verifiquem antes de comprar passeio.', 'ALERTA'),
(78, 'A Serra do Cipó (MG) me surpreendeu! Trilhas lindas, cachoeiras de águas cristalinas e um clima perfeito pra quem curte natureza e sossego.', 'NOVIDADES'),
(76, 'PROMOÇÃO na Chapada Diamantina (BA): pousadas em Lençóis com até 40% de desconto no mês de junho. Aproveitem antes da alta temporada!', 'PROMOÇÃO'),
(21, 'ALERTA: Forte calor em Palmas (TO), especialmente nas trilhas do Parque Estadual do Lajeado. Leve bastante água e evite caminhadas no horário de pico.', 'ALERTA'),
(14, 'ALERTA: A travessia de balsa está com longas filas nos fins de semana. (Ilhabela (SP))', 'ALERTA'),
(10, 'PROMOÇÃO em Lençóis (BA)! Nova sinalização nas trilhas da Chapada garante mais segurança.', 'PROMOÇÃO'),
(31, 'PROMOÇÃO em Canela (RS)! Nova iluminação na Catedral de Pedra está deslumbrante à noite.', 'PROMOÇÃO'),
(90, 'ALERTA: Tour noturno com degustação, vinícolas encantadoras. (Vale dos Vinhedos (RS))', 'ALERTA'),
(56, 'PROMOÇÃO em Foz do Iguaçu (PR)! Desconto especial para quem visita as Cataratas e o Parque das Aves.', 'PROMOÇÃO'),
(13, 'PROMOÇÃO em Belém (PA)! Mercado Ver-o-Peso restaurado com nova área gastronômica.', 'PROMOÇÃO'),
(48, 'PROMOÇÃO em João Pessoa (PB)! Orla nova com ciclovia e feirinhas noturnas animadas.', 'PROMOÇÃO'),
(17, 'PROMOÇÃO em Natal (RN)! Passeio de buggy pelas dunas está com 20% de desconto.', 'PROMOÇÃO'),
(8, 'Aproveite a PROMOÇÃO em São Miguel do Gostoso (RN): Praia calma e vento constante, ótimo para kitesurf.', 'PROMOÇÃO' ),
(88, 'Aproveite a PROMOÇÃO em Canela (RS): Nova iluminação na Catedral de Pedra está deslumbrante à noite.', 'PROMOÇÃO' ),
(7, 'Aproveite a PROMOÇÃO em Natal (RN): Passeio de buggy pelas dunas está com 20% de desconto.', 'PROMOÇÃO' ),
(30, 'Aproveite a PROMOÇÃO em Arraial do Cabo (RJ): ALERTA: Acesso limitado à Praia do Farol por excesso de turistas.', 'PROMOÇÃO' ),
(23, 'ATENÇÃO: Orla nova com ciclovia e feirinhas noturnas animadas. (João Pessoa (PB))', 'ALERTA' ),
(51, 'ATENÇÃO: Pousadas com diária reduzida durante o meio da semana. (Pipa (RN))', 'ALERTA' ),
(18, 'Aproveite a PROMOÇÃO em Pipa (RN): Pousadas com diária reduzida durante o meio da semana.', 'PROMOÇÃO' ),
(8, 'Aproveite a PROMOÇÃO em Pipa (RN): Pousadas com diária reduzida durante o meio da semana.', 'PROMOÇÃO' ),
(60, 'Aproveite a PROMOÇÃO em Jalapão (TO): Os fervedouros são impressionantes e a paisagem é surreal.', 'PROMOÇÃO' ),
(5, 'ATENÇÃO: Mercado Ver-o-Peso restaurado com nova área gastronômica. (Belém (PA))', 'ALERTA' ),
(40, 'Aproveite a PROMOÇÃO em Natal (RN): Passeio de buggy pelas dunas está com 20% de desconto.', 'PROMOÇÃO' ),
(23, 'ATENÇÃO: Nova iluminação na Catedral de Pedra está deslumbrante à noite. (Canela (RS))', 'ALERTA' ),
(78, 'Aproveite a PROMOÇÃO em Vale dos Vinhedos (RS): Tour noturno com degustação, vinícolas encantadoras.', 'PROMOÇÃO' ),
(4, 'ATENÇÃO: Nova iluminação na Catedral de Pedra está deslumbrante à noite. (Canela (RS))', 'ALERTA' ),
(55, 'Aproveite a PROMOÇÃO em Jalapão (TO): Os fervedouros são impressionantes e a paisagem é surreal.', 'PROMOÇÃO' ),
(7, 'Aproveite a PROMOÇÃO em Pipa (RN): Pousadas com diária reduzida durante o meio da semana.', 'PROMOÇÃO' ),
(12, 'Aproveite a PROMOÇÃO em Arraial do Cabo (RJ): ALERTA: Acesso limitado à Praia do Farol por excesso de turistas.', 'PROMOÇÃO' ),
(31, 'ATENÇÃO: A travessia de balsa está com longas filas nos fins de semana. (Ilhabela (SP))', 'ALERTA' ),
(51, 'Aproveite a PROMOÇÃO em Ilhabela (SP): A travessia de balsa está com longas filas nos fins de semana.', 'PROMOÇÃO' ),
(42, 'ATENÇÃO: Trilhas lindas e cachoeiras cristalinas, perfeito para ecoturismo. (Serra do Cipó (MG))', 'ALERTA' ),
(32, 'Aproveite a PROMOÇÃO em Jalapão (TO): Os fervedouros são impressionantes e a paisagem é surreal.', 'PROMOÇÃO' ),
(53, 'ATENÇÃO: Pacotes com desconto de 30% para reservas até domingo. (Porto de Galinhas (PE))', 'ALERTA' ),
(33, 'ATENÇÃO: Pousadas com diária reduzida durante o meio da semana. (Pipa (RN))', 'ALERTA' ),
(22, 'ATENÇÃO: PROMOÇÃO em passeios de teleférico na temporada de inverno. (Balneário Camboriú (SC))', 'ALERTA' ),
(37, 'Aproveite a PROMOÇÃO em Balneário Camboriú (SC): PROMOÇÃO em passeios de teleférico na temporada de inverno.', 'PROMOÇÃO' ),
(8, 'ATENÇÃO: Pousadas com diária reduzida durante o meio da semana. (Pipa (RN))', 'ALERTA' ),
(19, 'ATENÇÃO: Novo circuito de tirolesas foi inaugurado no parque de aventuras. (Brotas (SP))', 'ALERTA' ),
(2, 'Aproveite a PROMOÇÃO em Belém (PA): Mercado Ver-o-Peso restaurado com nova área gastronômica.', 'PROMOÇÃO' ),
(38, 'Aproveite a PROMOÇÃO em Foz do Iguaçu (PR): Desconto especial para quem visita as Cataratas e o Parque das Aves.', 'PROMOÇÃO' ),
(21, 'ATENÇÃO: Tour noturno com degustação, vinícolas encantadoras. (Vale dos Vinhedos (RS))', 'ALERTA' ),
(58, 'Aproveite a PROMOÇÃO em Jalapão (TO): Os fervedouros são impressionantes e a paisagem é surreal.', 'PROMOÇÃO' ),
(78, 'ATENÇÃO: O porto está parcialmente fechado devido à cheia do rio Negro. (Manaus (AM))', 'ALERTA' ),
(29, 'Aproveite a PROMOÇÃO em Manaus (AM): O porto está parcialmente fechado devido à cheia do rio Negro.', 'PROMOÇÃO' ),
(22, 'ATENÇÃO: Praia calma e vento constante, ótimo para kitesurf. (São Miguel do Gostoso (RN))', 'ALERTA' ),
(44, 'Aproveite a PROMOÇÃO em Arraial do Cabo (RJ): ALERTA: Acesso limitado à Praia do Farol por excesso de turistas.', 'PROMOÇÃO' ),
(42, 'ATENÇÃO: Orla nova com ciclovia e feirinhas noturnas animadas. (João Pessoa (PB))', 'ALERTA' ),
(13, 'ATENÇÃO: Orla nova com ciclovia e feirinhas noturnas animadas. (João Pessoa (PB))', 'ALERTA' ),
(52, 'ATENÇÃO: Trilhas lindas e cachoeiras cristalinas, perfeito para ecoturismo. (Serra do Cipó (MG))', 'ALERTA' ),
(1, 'Aproveite a PROMOÇÃO em João Pessoa (PB): Orla nova com ciclovia e feirinhas noturnas animadas.', 'PROMOÇÃO' ),
(59, 'Aproveite a PROMOÇÃO em Brotas (SP): Novo circuito de tirolesas foi inaugurado no parque de aventuras.', 'PROMOÇÃO' ),
(3, 'ATENÇÃO: Passeio de buggy pelas dunas está com 20% de desconto. (Natal (RN))', 'ALERTA' ),
(23, 'ATENÇÃO: Nova sinalização nas trilhas da Chapada garante mais segurança. (Lençóis (BA))', 'ALERTA' ),
(27, 'Aproveite a PROMOÇÃO em João Pessoa (PB): Orla nova com ciclovia e feirinhas noturnas animadas.', 'PROMOÇÃO' ),
(53, 'ATENÇÃO: O porto está parcialmente fechado devido à cheia do rio Negro. (Manaus (AM))', 'ALERTA' ),
(32, 'ATENÇÃO: Praia calma e vento constante, ótimo para kitesurf. (São Miguel do Gostoso (RN))', 'ALERTA' ),
(17, 'ATENÇÃO: Pacotes com desconto de 30% para reservas até domingo. (Porto de Galinhas (PE))', 'ALERTA' ),
(54, 'Aproveite a PROMOÇÃO em Lençóis (BA): Nova sinalização nas trilhas da Chapada garante mais segurança.', 'PROMOÇÃO' ),
(26, 'Aproveite a PROMOÇÃO em Porto de Galinhas (PE): Pacotes com desconto de 30% para reservas até domingo.', 'PROMOÇÃO' ),
(3, 'Aproveite a PROMOÇÃO em Ilhabela (SP): A travessia de balsa está com longas filas nos fins de semana.', 'PROMOÇÃO' ),
(96, 'ATENÇÃO: Tour noturno com degustação, vinícolas encantadoras. (Vale dos Vinhedos (RS))', 'ALERTA' ),
(23, 'ATENÇÃO: Pousadas em Lençóis com até 40% de desconto em junho. (Chapada Diamantina (BA))', 'ALERTA' ),
(56, 'ATENÇÃO: Tour noturno com degustação, vinícolas encantadoras. (Vale dos Vinhedos (RS))', 'ALERTA' ),
(7, 'ATENÇÃO: Os fervedouros são impressionantes e a paisagem é surreal. (Jalapão (TO))', 'ALERTA' ),
(16, 'ATENÇÃO: Nova sinalização nas trilhas da Chapada garante mais segurança. (Lençóis (BA))', 'ALERTA' ),
(40, 'ATENÇÃO: PROMOÇÃO em passeios de teleférico na temporada de inverno. (Balneário Camboriú (SC))', 'ALERTA' ),
(45, 'Aproveite a PROMOÇÃO em Lençóis (BA): Nova sinalização nas trilhas da Chapada garante mais segurança.', 'PROMOÇÃO' ),
(17, 'Aproveite a PROMOÇÃO em Pipa (RN): Pousadas com diária reduzida durante o meio da semana.', 'PROMOÇÃO' ),
(58, 'ATENÇÃO: Orla nova com ciclovia e feirinhas noturnas animadas. (João Pessoa (PB))', 'ALERTA' ),
(82, 'Aproveite a PROMOÇÃO em Foz do Iguaçu (PR): Desconto especial para quem visita as Cataratas e o Parque das Aves.', 'PROMOÇÃO' ),
(13, 'ATENÇÃO: Forte calor nas trilhas do Parque do Lajeado, leve bastante água. (Palmas (TO))', 'ALERTA' ),
(13, 'Aproveite a PROMOÇÃO em Palmas (TO): Forte calor nas trilhas do Parque do Lajeado, leve bastante água.', 'PROMOÇÃO' ),
(78, 'Aproveite a PROMOÇÃO em Manaus (AM): O porto está parcialmente fechado devido à cheia do rio Negro.', 'PROMOÇÃO' ),
(57, 'ATENÇÃO: Trilhas lindas e cachoeiras cristalinas, perfeito para ecoturismo. (Serra do Cipó (MG))', 'ALERTA' ),
(55, 'ATENÇÃO: ALERTA: Acesso limitado à Praia do Farol por excesso de turistas. (Arraial do Cabo (RJ))', 'ALERTA' ),
(54, 'ATENÇÃO: Trilhas lindas e cachoeiras cristalinas, perfeito para ecoturismo. (Serra do Cipó (MG))', 'ALERTA' ),
(48, 'Aproveite a PROMOÇÃO em Ilhabela (SP): A travessia de balsa está com longas filas nos fins de semana.', 'PROMOÇÃO' ),
(6, 'Aproveite a PROMOÇÃO em Ilhabela (SP): A travessia de balsa está com longas filas nos fins de semana.', 'PROMOÇÃO' ),
(18, 'ALERTA: Acesso à Praia do Farol, em Arraial do Cabo (RJ), está restrito devido ao grande número de turistas. Planeje com antecedência.', 'ALERTA'),
(53, 'PROMOÇÃO em Pipa (RN): Passeios de barco com desconto para quem compra até sexta-feira!', 'PROMOÇÃO'),
(82, 'Fui a Pirenópolis (GO) no Festival de Inverno, e os shows e a comida típica me conquistaram. Uma verdadeira festa!', 'NOVIDADES'),
(59, 'ALERTA: O calor está muito intenso em Palmas (TO). Cuidado com as trilhas no Parque Estadual do Lajeado.', 'ALERTA'),
(44, 'O Mercado Ver-o-Peso em Belém (PA) ficou ainda melhor com a nova área gastronômica. Perfeito para quem ama sabores exóticos!', 'NOVIDADES'),
(28, 'PROMOÇÃO no Vale dos Vinhedos (RS): Descontos em pacotes turísticos para quem visita mais de duas vinícolas no mesmo dia.', 'PROMOÇÃO'),
(19, 'ALERTA em São Miguel do Gostoso (RN): O vento está muito forte, então, se você vai praticar kitesurf, tome cuidado.', 'ALERTA'),
(58, 'Descobri uma PROMOÇÃO imperdível em Gramado (RS): Hospedagem com 25% de desconto no próximo feriado!', 'PROMOÇÃO'),
(08, 'Descubra a histórica cidade de Goiás Velho, repleta de charme colonial.', 'NOVIDADES'),
(09, 'Promoção especial para o Jalapão! Pacotes com até 30% de desconto.', 'PROMOÇÃO'),
(10, 'ALERTA: Praia do Gunga está com acesso limitado devido à maré alta.', 'ALERTA'),
(76, 'Nova rota gastronômica em Tiradentes promete encantar os visitantes.', 'NOVIDADES'),
(12, 'Descontos imperdíveis para conhecer os Lençóis Maranhenses!', 'PROMOÇÃO'),
(13, 'ALERTA: Forte temporal previsto para a região de Paraty neste fim de semana.', 'ALERTA'),
(14, 'Explore as belezas naturais da Chapada das Mesas com nossos novos pacotes.', 'NOVIDADES'),
(88, 'Descontos de até 40% para viagens à Serra do Cipó!', 'PROMOÇÃO'),
(16, 'ALERTA: Interdição temporária da estrada para o Pico da Bandeira por deslizamento.', 'ALERTA'),
(17, 'Nova trilha ecológica aberta no Parque Estadual do Ibitipoca!', 'NOVIDADES'),
(18, 'Pacotes promocionais para conhecer o Jalapão com guias locais.', 'PROMOÇÃO'),
(19, 'ALERTA: Chuva forte e risco de enchente em Manaus. Redobre os cuidados.', 'ALERTA'),
(20, 'Lançamento de circuito cultural em Salvador com foco na herança afro-brasileira.', 'NOVIDADES'),
(21, 'Aproveite a super oferta para conhecer a Rota das Emoções!', 'PROMOÇÃO'),
(22, 'ALERTA: Temporada de algas atinge praias de Alagoas, com impacto na balneabilidade.', 'ALERTA'),
(24, 'Pacotes com desconto para visitas à Serra do Roncador disponíveis!', 'PROMOÇÃO'),
(25, 'ALERTA: Praia de Copacabana está temporariamente fechada para eventos oficiais.', 'ALERTA'),
(27, 'Super promoção para excursões escolares à Floresta Nacional do Tapajós!', 'PROMOÇÃO'),
(28, 'ALERTA: Interdição parcial da trilha da Pedra da Gávea por manutenção.', 'ALERTA'),
(29, 'Reabertura do Museu do Mar em São Francisco do Sul com exposições inéditas.', 'NOVIDADES'),
(90, 'Descontos exclusivos para casais em pousadas da Serra Gaúcha.', 'PROMOÇÃO'),
(31, 'ALERTA: Área de mergulho em Maragogi fechada temporariamente por preservação.', 'ALERTA'),
(32, 'Festival de música ao ar livre chega ao Vale dos Vinhedos neste mês!', 'NOVIDADES'),
(33, 'Pacotes promocionais para o Pantanal durante o mês de junho!', 'PROMOÇÃO'),
(34, 'ALERTA: Forte calor atinge o litoral do Espírito Santo. Evite exposição prolongada.', 'ALERTA'),
(78, 'Oferta imperdível para explorar a Ilha do Cardoso com desconto!', 'PROMOÇÃO'),
(37, 'ALERTA: Acesso à Cachoeira da Fumaça restrito por riscos de queda de rochas.', 'ALERTA'),
(39, 'Hospedagem em Alter do Chão com até 35% de desconto por tempo limitado.', 'PROMOÇÃO'),
(40, 'ALERTA: Interdição da travessia para Ilha de Itamaracá por manutenção na balsa.', 'ALERTA'),
(41, 'Lançamento de roteiro sustentável na região do Jalapão em parceria com comunidades locais.', 'NOVIDADES'),
(42, 'Promoção especial para roteiros de aventura no Parque do Cantão!', 'PROMOÇÃO'),
(43, 'ALERTA: Forte correnteza no Rio São Francisco. Cuidado ao praticar esportes aquáticos.', 'ALERTA'),
(45, 'Hospedagens em pousadas de charme em Paraty com preços especiais!', 'PROMOÇÃO'),
(90, 'ALERTA: Níveis de poluição do ar elevados em Belo Horizonte. Evite atividades ao ar livre.', 'ALERTA'),
(48, 'Viagens para Bonito com descontos especiais neste mês!', 'PROMOÇÃO'),
(49, 'ALERTA: Aviso de ressaca para o litoral sul de São Paulo. Cuidado com o banho de mar.', 'ALERTA'),
(51, 'Descontos de até 50% para passeios na Rota das Cachoeiras em Goiás!', 'PROMOÇÃO'),
(88, 'ALERTA: Fauna silvestre visível em áreas urbanas de Florianópolis. Mantenha distância.', 'ALERTA'),
(54, 'Pacotes promocionais para conhecer o Vale Europeu em SC!', 'PROMOÇÃO'),
(55, 'ALERTA: Interdição parcial do bondinho do Pão de Açúcar por manutenção preventiva.', 'ALERTA'),
(56, 'Evento especial de observação de aves no Parque Nacional do Viruá.', 'NOVIDADES'),
(34, 'Super desconto para visitas guiadas ao Parque Nacional da Serra da Capivara!', 'PROMOÇÃO'),
(27, 'ALERTA: Trecho da Estrada Real interditado por obras de revitalização.', 'ALERTA'),
(13, 'Pacotes com até 45% de desconto para visitar a Serra do Espinhaço!', 'PROMOÇÃO'),
(48, 'ALERTA: Possibilidade de neblina densa na região da Serra do Mar durante a madrugada.', 'ALERTA'),
(19, 'Ofertas imperdíveis para hospedagem em Fernando de Noronha neste mês!', 'PROMOÇÃO'),
(4, 'ALERTA: Trilha da Pedra Redonda fechada temporariamente por risco de deslizamento.', 'ALERTA'),
(35, 'Festival de inverno em Campos do Jordão começa com atrações musicais e gastronômicas.', 'NOVIDADES'),
(61, 'Descontos de baixa temporada para destinos de ecoturismo em Rondônia.', 'PROMOÇÃO'),
(88, 'ALERTA: Queimadas afetam visibilidade na Chapada dos Guimarães.', 'ALERTA'),
(10, 'Hospedagens em Morro de São Paulo com promoções para grupos!', 'PROMOÇÃO'),
(3, 'ALERTA: Animais silvestres avistados em trilhas do Parque Nacional do Caparaó. Atenção redobrada.', 'ALERTA'),
(38, 'Pacotes com valores reduzidos para conhecer o Vale do Ribeira!', 'PROMOÇÃO'),
(24, 'ALERTA: Interdição parcial do Elevador Lacerda em Salvador por manutenção elétrica.', 'ALERTA'),
(57, 'Pacotes promocionais para o São João em Caruaru já estão disponíveis!', 'PROMOÇÃO'),
(2, 'ALERTA: Forte vento na orla de Fortaleza. Redobre o cuidado com barracas e guarda-sóis.', 'ALERTA'),
(41, 'Inauguração de centro de visitantes no Parque Estadual do Jalapão.', 'NOVIDADES'),
(16, 'Viagens para Porto Seguro com até 50% OFF para reservas antecipadas!', 'PROMOÇÃO'),
(50, 'ALERTA: Aviso de maré alta em praias do norte do Pará. Acesso restrito em alguns pontos.', 'ALERTA'),
(21, 'Pacotes para turismo de aventura na Serra do Mar com valores reduzidos.', 'PROMOÇÃO'),
(9, 'ALERTA: Mosquitos transmissores de doenças tropicais em alta no litoral do Amapá.', 'ALERTA'),
(6, 'Promoções exclusivas para destinos históricos no interior paulista.', 'PROMOÇÃO'),
(18, 'ALERTA: Obras na BR-101 provocam lentidão no acesso a destinos do litoral sul.', 'ALERTA'),
(17, 'Hospedagens em Caraíva com pacotes promocionais de fim de semana.', 'PROMOÇÃO'),
(44, 'ALERTA: Forte correnteza no litoral norte da Bahia. Cuidado com crianças e idosos.', 'ALERTA'),
(14, 'Reabertura de centro histórico em São Luís após restauração de casarões coloniais.', 'NOVIDADES'),
(31, 'Pacotes para a Chapada dos Veadeiros com até 35% de desconto.', 'PROMOÇÃO'),
(76, 'ALERTA: Alta concentração de águas-vivas em praias do sul de Santa Catarina.', 'ALERTA'),
(60, 'Inauguração de ciclofaixa turística em Florianópolis com vista para o mar.', 'NOVIDADES'),
(55, 'Descontos em pacotes para conhecer o Delta do Parnaíba!', 'PROMOÇÃO'),
(90, 'ALERTA: Interrupção no fornecimento de energia em pontos turísticos de Natal.', 'ALERTA'),
(22, 'Pacotes com valores especiais para turismo de base comunitária no Xingu!', 'PROMOÇÃO'),
(30, 'ALERTA: Restrição de visitas em áreas indígenas por motivos sanitários.', 'ALERTA'),
(1, 'Reabertura de passarela sobre o Rio Tocantins com nova iluminação noturna.', 'NOVIDADES'),
(40, 'Hospedagens com até 40% de desconto no Vale do Itajaí!', 'PROMOÇÃO'),
(43, 'ALERTA: Forte calor no sertão nordestino. Hidratação e proteção solar são essenciais.', 'ALERTA'),
(7, 'Lançamento de aplicativo de turismo para o interior de Minas Gerais.', 'NOVIDADES'),
(5, 'Promoção para pacotes de ecoturismo com foco em observação de aves.', 'PROMOÇÃO'),
(58, 'ALERTA: Interdição temporária no Parque Nacional da Serra da Bocaina por manutenção.', 'ALERTA'),
(28, 'Festival indígena em Tocantins celebra cultura com atividades abertas ao público.', 'NOVIDADES'),
(17, 'NOVIDADE em Foz do Iguaçu! O novo centro de visitantes do Parque Nacional está incrível, com experiências imersivas e interativas sobre a fauna local.', 'NOVIDADES'),
(22, 'ALERTA: Estrada de acesso ao Pico da Bandeira está com trechos escorregadios devido às chuvas intensas. Redobrem a atenção ao subir.', 'ALERTA'),
(36, 'Participei da Festa do Divino em Alcântara (MA) neste mês e foi emocionante. As tradições locais seguem vivas e encantadoras.', 'NOVIDADES'),
(91, 'PROMOÇÃO: Pacotes com 30% de desconto para passeios de barco pelo Delta do Parnaíba até o final deste mês. Imperdível!', 'PROMOÇÃO'),
(4, 'Descobri um café novo em Tiradentes com vista para as montanhas e ambiente colonial. Ótima parada depois das trilhas culturais.', 'NOVIDADES'),
(55, 'ALERTA: O acesso à Cachoeira do Formiga, em Jalapão, está restrito durante a semana para recuperação da trilha. Planejem-se para visitar aos fins de semana.', 'ALERTA'),
(12, 'PROMOÇÃO especial em Jericoacoara: pousadas com diária grátis na terceira noite durante a baixa temporada. Uma ótima oportunidade para relaxar!', 'PROMOÇÃO'),
(67, 'NOVIDADES em Belém! O Mercado Ver-o-Peso agora conta com um espaço gourmet reformado, reunindo chefs locais e ingredientes típicos amazônicos.', 'NOVIDADES'),
(23, 'PROMOÇÃO: Passeios guiados pelo centro histórico de Salvador com 50% de desconto durante o mês de junho. Aproveite para conhecer mais da cultura baiana!', 'PROMOÇÃO'),
(38, 'ALERTA: Sobe para nível máximo o risco de incêndios na região do Jalapão (TO). Evite acampamentos e não faça fogueiras.', 'ALERTA'),
(10, 'Nova passarela panorâmica inaugurada na Serra do Rio do Rastro! Agora dá pra ter uma vista completa dos cânions com segurança.', 'NOVIDADES'),
(47, 'PROMOÇÃO: Resort em Caldas Novas com tarifa reduzida para famílias e cortesia para crianças menores de 10 anos durante os fins de semana.', 'PROMOÇÃO'),
(61, 'ALERTA: Temporada de chuvas fortes no litoral do Espírito Santo. Algumas praias estão com acesso restrito devido a deslizamentos.', 'ALERTA'),
(30, 'Participei de um festival de culinária caiçara em Ilhabela com pratos típicos e música ao vivo. Um ótimo programa para quem ama gastronomia regional.', 'NOVIDADES'),
(5, 'PROMOÇÃO relâmpago para trilha guiada na Serra da Canastra: grupos com até 4 pessoas pagam o preço de 3!', 'PROMOÇÃO'),
(75, 'ALERTA: Observação de baleias em Abrolhos suspensa temporariamente por conta do aumento da atividade marítima irregular na área.', 'ALERTA'),
(18, 'NOVIDADES em Curitiba: o Jardim Botânico agora oferece visitas noturnas com iluminação artística e trilhas sensoriais. Uma experiência única!', 'NOVIDADES'),
(52, 'ALERTA: A travessia do Parque Nacional de Itatiaia está fechada por tempo indeterminado devido a deslizamentos recentes.', 'ALERTA'),
(7, 'PROMOÇÃO: City tour por Belo Horizonte com degustação de queijos e doces mineiros incluso no pacote. Descontos válidos até o final do mês.', 'PROMOÇÃO'),
(33, 'Descobri um novo circuito de bike em Bento Gonçalves entre vinhedos e paisagens incríveis. Ideal para quem curte pedal e enoturismo.', 'NOVIDADES'),
(26, 'ALERTA: Forte neblina nas estradas da Serra Gaúcha. Redobrem a atenção e evitem dirigir à noite neste período.', 'ALERTA'),
(89, 'PROMOÇÃO: Hospedagem em hostels de São Paulo com 20% OFF para reservas feitas pelo app até sexta-feira.', 'PROMOÇÃO'),
(41, 'A rota do cangaço em Piranhas (AL) está com novas sinalizações e painéis interativos contando a história de Lampião e Maria Bonita. Muito bem feita!', 'NOVIDADES'),
(13, 'ALERTA: A travessia do Vale do Pati, na Chapada Diamantina, requer guias credenciados obrigatoriamente a partir deste mês. Fiscalização aumentada.', 'ALERTA');


-- INSERTS da tabela POSTS: com fotos
INSERT INTO posts (user_id, description, tag) VALUES
(34, 'Acabei de voltar de Bonito (MS) e fiquei encantado com o novo Mirante da Nascente Azul! A passarela suspensa é incrível e a vista é de tirar o fôlego.', 'NOVIDADES'),
(1, 'Visitei Ouro Preto no último fim de semana e recomendo muito a nova rota noturna com luzes cênicas. Caminhar pelas ladeiras históricas à noite foi mágico!', 'NOVIDADES'),
(43, 'ALERTA: Trilha principal da Chapada dos Veadeiros está com interdição parcial para manutenção das passarelas ecológicas. Só está liberado o acesso ao Vale da Lua.', 'ALERTA'),
(28, 'Fui na FLIP em Paraty e participei de um sarau literário incrível em um dos casarões restaurados. A cidade respira cultura o tempo todo.', 'NOVIDADES'),
(59, 'Recife está um espetáculo com o Festival Recife na Rua. Tem música, teatro e comidinhas típicas em cada esquina do bairro antigo. Vale muito a visita!', 'NOVIDADES'),
(82, 'ALERTA: Praia da Joaquina em Florianópolis com forte correnteza nesta semana. Evitem nadar em áreas sem sinalização de segurança.', 'ALERTA'),
(26, 'Achei ótima a nova ciclovia entre a Praia Mole e Lagoa da Conceição. Pedalei com a família inteira e foi super tranquilo!', 'NOVIDADES'),
(12, 'Visitei o Jalapão (TO) semana passada e fiquei impressionado com os fervedouros! A água parece te empurrar pra cima. Experiência surreal!', 'NOVIDADES'),
(98, 'ALERTA: Em Ilhabela (SP), a travessia de balsa está com longas filas nos fins de semana. Recomendo ir bem cedo pra evitar atrasos.', 'ALERTA'),
(29, 'Passei o feriado em São Miguel do Gostoso (RN) e foi incrível! Praia calma, vento constante, ótima pra kitesurf e descanso total.', 'NOVIDADES'),
(5, 'PROMOÇÃO rolando em Foz do Iguaçu (PR): desconto para quem visitar as Cataratas e o Parque das Aves no mesmo dia. Entrada combinada vale a pena!', 'PROMOÇÃO'),
(13, 'Estive em Vale dos Vinhedos (RS) recentemente. Tour noturno com degustação, vinícolas encantadoras.', 'NOVIDADES'),
(9, 'Visitei Arraial do Cabo (RJ) e adorei! ALERTA: Acesso limitado à Praia do Farol por excesso de turistas.', 'NOVIDADES' )
(39, 'ATENÇÃO: Desconto especial para quem visita as Cataratas e o Parque das Aves. (Foz do Iguaçu (PR))', 'PROMOÇÃO' ),
(12, 'Visitei Palmas (TO) e adorei! Forte calor nas trilhas do Parque do Lajeado, leve bastante água.', 'NOVIDADES' ),
(26, 'Visitei Pipa (RN) e adorei! Pousadas com diária reduzida durante o meio da semana.', 'NOVIDADES' ),
(58, 'Visitei Canela (RS) e adorei! Nova iluminação na Catedral de Pedra está deslumbrante à noite.', 'NOVIDADES' ),
(37, 'Visitei Serra do Cipó (MG) e adorei! Trilhas lindas e cachoeiras cristalinas, perfeito para ecoturismo.', 'NOVIDADES' ),
(56, 'Visitei Belém (PA) e adorei! Mercado Ver-o-Peso restaurado com nova área gastronômica.', 'NOVIDADES' ),
(6, 'Visitei Porto de Galinhas (PE) e adorei! Pacotes com desconto de 30% para reservas até domingo.', 'NOVIDADES' ),
(45, 'Visitei Brotas (SP) e adorei! Novo circuito de tirolesas foi inaugurado no parque de aventuras.', 'NOVIDADES' ),
(78, 'Visitei Chapada Diamantina (BA) e adorei! Pousadas em Lençóis com até 40% de desconto em junho.', 'NOVIDADES' ),
(11, 'Visitei Arraial do Cabo (RJ) e adorei! ALERTA: Acesso limitado à Praia do Farol por excesso de turistas.', 'NOVIDADES' ),
(32, 'Visitei Natal (RN) e adorei! Passeio de buggy pelas dunas está com 20% de desconto.', 'NOVIDADES' ),
(8, 'Visitei Manaus (AM) e adorei! O porto está parcialmente fechado devido à cheia do rio Negro.', 'NOVIDADES' ),
(9, 'Visitei João Pessoa (PB) e adorei! Orla nova com ciclovia e feirinhas noturnas animadas.', 'NOVIDADES' ),
(19, 'Visitei Palmas (TO) e adorei! Forte calor nas trilhas do Parque do Lajeado, leve bastante água.', 'NOVIDADES' ),
(80, 'Visitei Balneário Camboriú (SC) e adorei! PROMOÇÃO em passeios de teleférico na temporada de inverno.', 'NOVIDADES' ),
(53, 'Visitei São Miguel do Gostoso (RN) e adorei! Praia calma e vento constante, ótimo para kitesurf.', 'NOVIDADES' ),
(8, 'Visitei Vale dos Vinhedos (RS) e adorei! Tour noturno com degustação, vinícolas encantadoras.', 'NOVIDADES' ),
(35, 'Novo mirante aberto ao público no Parque Nacional de Aparados da Serra.', 'NOVIDADES'),
(44, 'Novo centro de visitantes no Parque Nacional da Serra dos Órgãos oferece experiências imersivas.', 'NOVIDADES'),
(47, 'Reabertura da Rota do Vinho em São Roque com novos empreendimentos.', 'NOVIDADES'),
(29, 'Novo passeio de barco em Arraial do Cabo oferece experiências ao pôr do sol.', 'NOVIDADES'),
(45, 'Rota dos Cânions é ampliada com novos mirantes e áreas de descanso.', 'NOVIDADES'),
(12, 'Novo roteiro de ecoturismo no Acre oferece experiências únicas na floresta.', 'NOVIDADES'),
(76, 'Inaugurado o novo teleférico panorâmico no Parque Nacional de Itatiaia.', 'NOVIDADES'),
(38, 'Inaugurado o circuito de cicloturismo na Serra da Mantiqueira.', 'NOVIDADES'),
(23, 'Nova atração turística em São João del Rei celebra a cultura mineira.', 'NOVIDADES'),
(53, 'Abertura de nova trilha acessível para pessoas com deficiência no Parque da Tijuca.', 'NOVIDADES'),
(8, 'Reinauguração do Museu da Imigração em São Paulo com novas exposições interativas.', 'NOVIDADES'),
(59, 'Nova feira cultural em Olinda destaca artistas locais e artesanato regional.', 'NOVIDADES'),
(20, 'Nova rota de turismo religioso no interior do Paraná é lançada.', 'NOVIDADES'),
(36, 'Nova atração interativa no Instituto Inhotim atrai visitantes de todas as idades.', 'NOVIDADES'),
(32, 'Nova linha de trem turístico ligando Curitiba a Morretes é reinaugurada.', 'NOVIDADES'),
(26, 'Nova exposição sobre biodiversidade marinha no Museu Nacional da UFRJ.', 'NOVIDADES'),
(20, 'PROMOÇÃO em Bonito (MS): agências locais estão oferecendo combos de flutuação + trilha com 25% de desconto durante a semana.', 'PROMOÇÃO'),
(64, 'NOVIDADES em São Luís (MA): reabertura do Teatro Arthur Azevedo com programação cultural gratuita nas noites de sexta-feira.', 'NOVIDADES'),
(11, 'ALERTA: Praia do Rosa (SC) com alta concentração de águas-vivas nesta temporada. Atenção redobrada para quem for entrar no mar.', 'ALERTA'),
(58, 'PROMOÇÃO: Passeios de buggy nas dunas de Natal com valores promocionais para grupos a partir de 3 pessoas. Ideal para famílias!', 'PROMOÇÃO'),
(39, 'NOVIDADE em Manaus: novo mirante do Encontro das Águas oferece vista privilegiada e acesso facilitado com estacionamento.', 'NOVIDADES'),
(6, 'ALERTA: Interdição temporária do acesso ao Morro do Pai Inácio, na Chapada Diamantina, para manutenção nas escadarias e corrimãos.', 'ALERTA'),
(95, 'PROMOÇÃO para amantes do frio: pousadas na Serra Catarinense com café colonial incluso e descontos de até 40% na baixa temporada.', 'PROMOÇÃO'),
(72, 'NOVIDADES em Brasília: o Eixo Cultural Ibero-americano foi inaugurado com exposições permanentes sobre arte e arquitetura latino-americana.', 'NOVIDADES'),
(14, 'ALERTA: Forte ressaca atinge a orla do Rio de Janeiro, especialmente entre o Leme e o Leblon. Evitem a faixa de areia e áreas de pedras.', 'ALERTA');



-- INSERTS da tabela COMMENTS
INSERT INTO comments (post_id, user_id, comment) VALUES
(1, 10, 'Esse mirante em Bonito parece imperdível! Quero muito conhecer.'),
(2, 2, 'Adorei a ideia do passeio noturno em Ouro Preto, super diferente!'),
(3, 7, 'Sarau na FLIP é tudo! Excelente dica cultural.'),
(4, 22, 'Recife sempre surpreende com eventos criativos, amei!'),
(5, 3, 'Boa notícia para quem curte pedalar em Floripa!'),
(6, 16, 'Fervedouros do Jalapão são mesmo únicos, recomendadíssimo!'),
(7, 17, 'Kitesurf em São Miguel do Gostoso? Já quero reservar!'),
(8, 18, 'Serra do Cipó é perfeita para recarregar as energias.'),
(9, 4, 'Tour noturno com vinho? Parece super romântico!'),
(10, 11, 'Boa saber sobre a baixa das lagoas nos Lençóis, vou me programar melhor.'),
(11, 46, 'Triste pela trilha fechada, mas que bom que tem outras opções!'),
(12, 12, 'Alerta importante, principalmente para quem viaja com crianças.'),
(13, 34, 'Sempre bom lembrar dos horários de pico para a balsa de Ilhabela.'),
(14, 14, 'Notícia importante pra quem faz passeios de barco. Valeu o aviso!'),
(15, 15, 'Calor intenso em Palmas é de respeito, obrigado pelo alerta!'),
(16, 55, 'Promoção ótima pra curtir Gramado sem gastar tanto!'),
(17, 17, 'Hospedagem flutuante com desconto? Que sonho!'),
(18, 18, 'Adoro Porto de Galinhas! Com esse desconto, fica ainda melhor.'),
(19, 17, 'Ótimo combo! Cataratas e Parque das Aves são imperdíveis.'),
(20, 20, 'Desconto excelente na Chapada Diamantina, vou aproveitar!'),
(21, 44, 'A travessia de balsa em Ilhabela está com longas filas. Cuidado se for viajar no fim de semana!'),
(22 ,15, 'Ótima promoção em Lençóis, a nova sinalização nas trilhas da Chapada vai garantir mais segurança! #Promoção'),
(23, 31, 'Visitei Canela e fiquei encantado com a nova iluminação da Catedral de Pedra à noite, vale muito a pena!'),
(24, 6, 'O tour noturno com degustação no Vale dos Vinhedos foi sensacional! Vale a pena conferir as vinícolas!'),
(25, 11, 'Desconto especial para quem visitar as Cataratas e o Parque das Aves em Foz do Iguaçu! Aproveitem!'),
(26, 3, 'O Mercado Ver-o-Peso em Belém foi restaurado e está com uma nova área gastronômica incrível!'),
(27, 8, 'A orla nova de João Pessoa com ciclovia e feirinhas noturnas ficou maravilhosa. Super recomendo!'),
(28, 17, 'Passeio de buggy pelas dunas de Natal com 20% de desconto, não dá para perder!'),
(29, 33, 'Acabei de voltar do Vale dos Vinhedos e o tour noturno com degustação foi uma experiência incrível!'),
(30, 6, 'São Miguel do Gostoso é um paraíso para kitesurf! Praia calma e vento constante, perfeito!'),
(31, 45, 'A iluminação da Catedral de Pedra em Canela é ainda mais bonita à noite. Vale a pena a visita!'),
(32, 37, 'Não perca a chance de fazer o passeio de buggy pelas dunas de Natal com 20% de desconto!'),
(33, 30, 'Acesso à Praia do Farol em Arraial do Cabo está restrito por excesso de turistas. Planeje com antecedência.'),
(34, 23, 'A orla nova de João Pessoa com ciclovia e feirinhas noturnas ficou ainda mais encantadora!'),
(35, 51, 'Pousadas com diária reduzida em Pipa no meio da semana! Perfeito para quem quer aproveitar mais com menos!'),
(36, 18, 'Em Pipa, as pousadas estão com diária reduzida no meio da semana. Excelente para quem quer economizar!'),
(37, 20, 'Fui a Arraial do Cabo e adorei! Acesso à Praia do Farol está restrito por excesso de turistas, então se planeje!'),
(38, 19, 'Desconto especial para quem visita as Cataratas e o Parque das Aves em Foz do Iguaçu!'),
(39, 12, 'Forte calor nas trilhas do Parque do Lajeado em Palmas! Leve bastante água!'),
(40, 8, 'Pousadas com diária reduzida em Pipa no meio da semana! Excelente oportunidade!'),
(41, 60, 'Os fervedouros de Jalapão são incríveis! A paisagem é surreal, um lugar perfeito para aventura!'),
(42, 5, 'O Mercado Ver-o-Peso em Belém está renovado e com uma nova área gastronômica. Vale a pena visitar!'),
(43, 40, 'Aproveite o desconto em passeios de buggy em Natal! Passeio pelas dunas imperdível!'),
(44, 23, 'A iluminação da Catedral de Pedra em Canela está incrível à noite, imperdível!'),
(45, 26, 'Tour noturno com degustação nas vinícolas de Vale dos Vinhedos. Uma experiência maravilhosa!'),
(46, 10, 'Em Palmas, o calor nas trilhas do Parque do Lajeado é intenso. Leve muita água!'),
(47, 16, 'Desconto especial em Foz do Iguaçu para quem visita as Cataratas e o Parque das Aves. Não perca!'),
(48, 4, 'A iluminação da Catedral de Pedra em Canela está ainda mais deslumbrante à noite. Imperdível!'),
(49, 55, 'Fervedouros de Jalapão são impressionantes! Paisagens incríveis para quem ama ecoturismo.'),
(50, 57, 'Aproveite a promoção em Pipa com diárias reduzidas no meio da semana!'),
(51, 12, 'Acesso à Praia do Farol em Arraial do Cabo está limitado devido ao excesso de turistas. Fique atento!'),
(52, 38, 'Em Canela, a iluminação da Catedral de Pedra à noite é um espetáculo! Vale cada minuto da visita!'),
(53, 7, 'A Serra do Cipó tem trilhas lindas e cachoeiras cristalinas, ótimo para ecoturismo!'),
(54, 11, 'A travessia de balsa em Ilhabela está com longas filas nos fins de semana. Se planeje!'),
(55, 46, 'Mercado Ver-o-Peso em Belém foi renovado com uma área gastronômica incrível. Muito legal!'),
(56, 51, 'A travessia de balsa em Ilhabela está com longas filas nos fins de semana. Melhor evitar esse pico!'),
(57, 42, 'Em Serra do Cipó, as trilhas são maravilhosas e as cachoeiras cristalinas são imperdíveis!'),
(58, 18, 'Fervedouros em Jalapão são uma experiência única. Paisagens de tirar o fôlego!'),
(59, 53, 'Desconto de 30% para pacotes de reservas em Porto de Galinhas até domingo! Aproveite!'),
(60, 26, 'Pousadas em Pipa com diárias reduzidas durante a semana. Uma ótima oportunidade de aproveitar mais!'),
(61, 12, 'Desconto em passeios de teleférico em Balneário Camboriú na temporada de inverno. Não perca!'),
(82, 47, 'Promoção nos passeios de teleférico em Balneário Camboriú! Aproveite o inverno com desconto!'),
(63, 8, 'Pousadas com diária reduzida em Pipa durante o meio da semana. Super recomendada!'),
(64, 26, 'Desconto de 30% para pacotes de Porto de Galinhas até domingo! Aproveite!'),
(65, 19, 'Novo circuito de tirolesas em Brotas! Uma aventura e tanto!'),
(66, 2, 'Mercado Ver-o-Peso em Belém está com nova área gastronômica. Vale muito a pena!'),
(67, 45, 'Novo circuito de tirolesas em Brotas é uma diversão para os aventureiros!'),
(68, 15, 'Os fervedouros de Jalapão são impressionantes. Paisagens de outro mundo!'),
(69, 38, 'Desconto especial em Foz do Iguaçu para quem visita as Cataratas e o Parque das Aves. Aproveite!'),
(70, 53, 'A travessia de balsa em Ilhabela está com longas filas nos fins de semana. Se organize!'),
(71, 41, 'O tour noturno com degustação nas vinícolas do Vale dos Vinhedos é uma experiência única!'),
(72, 36, 'Pousadas com diárias reduzidas durante a semana em Pipa. Ótima oportunidade!'),
(172, 1, 'Esse mirante da Nascente Azul em Bonito parece incrível! Mal posso esperar para visitar.'),
(173, 12, 'A rota noturna em Ouro Preto parece mágica, já está na minha lista!'),
(174, 53, 'Boa dica sobre a interdição da trilha na Chapada dos Veadeiros, obrigado pelo alerta!'),
(175, 14, 'Sarau literário na FLIP deve ser maravilhoso, Paraty é realmente um lugar cultural.'),
(176, 55, 'Festival Recife na Rua é um dos melhores eventos, ótima dica para quem ama cultura local!'),
(177, 26, 'Obrigado pelo alerta da correnteza na Praia da Joaquina, segurança em primeiro lugar.'),
(178, 97, 'A nova ciclovia em Florianópolis vai facilitar muito os passeios em família.'),
(179, 18, 'Os fervedouros do Jalapão são espetaculares, uma experiência única!'),
(180, 9, 'Valeu pelo aviso das filas na balsa em Ilhabela, vou planejar para sair cedo.'),
(181, 11, 'São Miguel do Gostoso parece o destino perfeito para relaxar e curtir o kitesurf.'),
(182, 61, 'Ótima promoção para quem quer aproveitar as Cataratas e o Parque das Aves juntos!'),
(183, 82, 'Degustação noturna no Vale dos Vinhedos deve ser uma experiência inesquecível!'),
(184, 13, 'Acesso restrito na Praia do Farol é importante para preservar o local, obrigado pelo aviso!');



-- INSERTS da tabela REGIONS: Sudeste
INSERT INTO regions (region, name, state, text, links) VALUES
('Sudeste', 'Sao Paulo (capital)', 'SP', 'Centro cultural e economico do pais, com atracoes como o MASP, Mercado Municipal, Parque Ibirapuera e a Avenida Paulista.', 'https://www.tripadvisor.com.br/Attractions-g303631-Activities-Sao_Paulo_State_of_Sao_Paulo.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Sudeste', 'Ilhabela', 'SP', 'Ilha paradisiaca com praias intocadas, trilhas na Mata Atlantica e otimos locais para mergulho e esportes aquaticos.', NULL),
('Sudeste', 'Campos do Jordao', 'SP', 'Conhecida como a Suica Brasileira, oferece clima ameno, arquitetura europeia e o famoso Festival de Inverno.', NULL),
('Sudeste', 'Holambra', 'SP', 'Capital das Flores, com campos floridos e o maior moinho da America Latina, refletindo a heranca holandesa.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Sudeste', 'Rio de Janeiro (capital)', 'RJ', 'Famosa mundialmente por suas belezas naturais, como o Pao de Acucar, Cristo Redentor e praias como Copacabana e Ipanema.', 'https://www.tripadvisor.com.br/Attractions-g303506-Activities-Rio_de_Janeiro_State_of_Rio_de_Janeiro.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Sudeste', 'Paraty', 'RJ', 'Cidade colonial charmosa, reconhecida como Patrimonio Mundial da UNESCO, com centro historico preservado e belas praias.', NULL),
('Sudeste', 'Regiao dos Lagos', 'RJ', 'Inclui destinos como Buzios, Arraial do Cabo e Cabo Frio, conhecidos por suas praias paradisiacas e excelente infraestrutura turistica.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Sudeste', 'Belo Horizonte (capital)', 'MG', 'Famosa por sua hospitalidade, culinaria e vida noturna animada. Ponto de partida para cidades historicas como Ouro Preto e Mariana.', 'https://www.tripadvisor.com.br/Attractions-g303370-Activities-State_of_Minas_Gerais.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Sudeste', 'Ouro Preto', 'MG', 'Cidade colonial que preserva a rica heranca do periodo do ouro no Brasil, com igrejas barrocas e ruas de paralelepipedos.', NULL),
('Sudeste', 'Parques Nacionais', 'MG', 'Como o da Serra da Canastra, onde nasce o Rio Sao Francisco, e o da Serra do Cipo, conhecidos por suas belezas naturais e biodiversidade.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Sudeste', 'Vitoria (capital)', 'ES', 'Cidade litoranea com praias tranquilas, como a Ilha do Boi e a Ilha do Frade, alem de uma rica gastronomia baseada em frutos do mar.', 'https://www.tripadvisor.com.br/Attractions-g303308-Activities-State_of_Espirito_Santo.html');


-- INSERTS da tabela REGIONS: Sul
INSERT INTO regions (region, name, state, text, links) VALUES
('Sul', 'Curitiba (capital)', 'PR', 'Reconhecida por seu planejamento urbano, oferece atrações como o Jardim Botânico, o Museu Oscar Niemeyer e o Parque Barigui.', 'https://www.tripadvisor.com.br/Attractions-g303435-Activities-State_of_Parana.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Sul', 'Foz do Iguaçu', 'PR', 'Lar das impressionantes Cataratas do Iguaçu, uma das Sete Maravilhas Naturais do Mundo, e da Represa de Itaipu. A cidade também é ponto de acesso a Ciudad del Este (Paraguai) e Puerto Iguazú (Argentina).', NULL),
('Sul', 'Serra do Mar', 'PR', 'Ideal para ecoturismo, com trilhas que levam a vilarejos históricos como Morretes e Antonina, onde se pode degustar o tradicional barreado.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Sul', 'Florianópolis (capital)', 'SC', 'A capital, conhecida por suas belas praias, como Joaquina e Campeche, além da Lagoa da Conceição e da Ponte Hercílio Luz.', 'https://www.tripadvisor.com.br/Attractions-g303570-Activities-State_of_Santa_Catarina.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Sul', 'Balneário Camboriú', 'SC', 'Famosa por sua vida noturna vibrante e pelo Parque Unipraias, que oferece vistas panorâmicas e atividades de ecoturismo.', NULL),
('Sul', 'São Joaquim', 'SC', 'Destino ideal para quem deseja vivenciar o inverno brasileiro, com possibilidade de neve e temperaturas negativas.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Sul', 'Porto Alegre (capital)', 'RS', 'Cidade com forte influência cultural, sendo um dos principais centros urbanos do sul do Brasil. A cidade está situada às margens do Lago Guaíba e é conhecida por sua diversidade cultural, gastronomia, e seus famosos centros históricos e espaços ao ar livre.', 'https://www.tripadvisor.com.br/Attractions-g303530-Activities-State_of_Rio_Grande_do_Sul.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Sul', 'Vale dos Vinhedos', 'RS', 'Região produtora de vinhos, onde é possível visitar vinícolas e participar de degustações.', NULL),
('Sul', 'Cânion Itaimbezinho', 'RS', 'Localizado no Parque Nacional de Aparados da Serra, oferece trilhas e vistas deslumbrantes.', NULL);

-- INSERTS da tabela REGIONS: Norte
INSERT INTO regions (region, name, state, text, links) VALUES
('Norte', 'Manaus (capital)', 'AM', 'Porta de entrada para a Amazônia, a capital amazonense oferece atrações como o Teatro Amazonas, o Mercado Municipal e o Encontro das Águas, onde os rios Negro e Solimões correm lado a lado sem se misturar.', 'https://www.tripadvisor.com.br/Attractions-g303226-Activities-State_of_Amazonas.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Norte', 'Floresta Amazônica', 'AM', 'Possibilidade de realizar passeios de barco, caminhadas na selva e observação de fauna e flora únicas.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Norte', 'Belém (capital)', 'PA', 'Capital paraense, famosa por sua culinária típica, como o tacacá e o açaí, além de pontos turísticos como o Mercado Ver-o-Peso e o Museu Paraense Emílio Goeldi.', 'https://www.tripadvisor.com.br/Attractions-g303402-Activities-State_of_Para.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Norte', 'Alter do Chão', 'PA', 'Conhecida como o Caribe Amazônico, oferece praias de água doce com areia branca e águas cristalinas, sendo considerada uma das praias mais bonitas do Brasil.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Norte', 'Rio Branco (capital)', 'AC', 'Maior cidade do estado e está localizada na região norte do Brasil, próxima à fronteira com o Peru e a Bolívia. A cidade tem uma mistura de história, cultura e natureza, sendo a principal porta de entrada para quem deseja explorar a Floresta Amazônica e as belezas naturais do Acre.', 'https://www.tripadvisor.com.br/Attractions-g303199-Activities-State_of_Acre.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Norte', 'Geoglifos do Acre', 'AC', 'Estruturas geométricas misteriosas esculpidas no solo, com mais de 3.000 anos de idade, que despertam interesse arqueológico.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Norte', 'Boa Vista (capital)', 'RR', 'Única capital brasileira situada completamente ao norte da linha do Equador e é conhecida por sua proximidade com a natureza e por ser uma cidade com forte presença de influências indígenas e amazônicas.', 'https://www.tripadvisor.com.br/Attractions-g30362-Activities-State_of_Roraima.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Norte', 'Monte Roraima', 'RR', 'Uma das formações geológicas mais antigas do planeta, oferece trilhas desafiadoras e vistas deslumbrantes, sendo inspiração para obras como O Mundo Perdido de Arthur Conan Doyle.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Norte', 'Palmas (capital)', 'TO', 'Cidade planejada, inaugurada em 1989, e está situada às margens do Lago de Palmas, em uma região de grande beleza natural.', 'https://www.tripadvisor.com.br/Attractions-g303645-Activities-State_of_Tocantins.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Norte', 'Jalapão', 'TO', 'Conhecido por suas dunas douradas, fervedouros (poços de água que borbulham devido à pressão da água subterrânea) e cachoeiras, é um destino ideal para quem busca aventura e contato com a natureza.', NULL);

-- INSERTS da tabela REGIONS: Nordeste
INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Salvador (capital)', 'BA', 'Capital cultural do Brasil, famosa pelo Pelourinho, igrejas históricas e o Elevador Lacerda.', 'https://www.tripadvisor.com.br/Attractions-g303251-Activities-State_of_Bahia.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Chapada Diamantina', 'BA', 'Parque nacional com cachoeiras, cavernas e trilhas, ideal para os amantes de ecoturismo.', NULL),
('Nordeste', 'Ilha de Itaparica', 'BA', 'Destino tranquilo com praias de águas calmas, perfeito para relaxar.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Recife (capital)', 'PE', 'Cidade com forte influência cultural, sendo um dos principais centros urbanos do sul do Brasil. A cidade está situada às margens do Lago Guaíba e é conhecida por sua divePEidade cultural, gastronomia, e seus famosos centros históricos e espaços ao ar livre.', 'https://www.tripadvisor.com.br/Attractions-g303459-Activities-State_of_Pernambuco.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Olinda', 'PE', 'Cidade histórica com igrejas barrocas e ladeiras coloridas.', NULL),
('Nordeste', 'Porto de Galinhas', 'PE', 'Praias paradisíacas com piscinas naturais e águas cristalinas.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Fortaleza (capital)', 'CE', 'Capital vibrante com praias urbanas como Praia do Futuro e atrações culturais como o Mercado Central.', 'https://www.tripadvisor.com.br/Attractions-g303284-Activities-State_of_Ceara.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Jericoacoara', 'CE', 'Vila charmosa com dunas, lagoas e pôr do sol deslumbrante.', NULL),
('Nordeste', 'Canoa Quebrada', 'CE', 'Praia famosa por suas falésias vermelhas e vida noturna animada.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'São Luís (capital)', 'MA', 'Centro histórico com casarões coloniais e manifestações culturais como o Bumba Meu Boi.', 'https://www.tripadvisor.com.br/Attractions-g303325-Activities-State_of_Maranhao.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Lençóis Maranhenses', 'MA', 'Parque nacional com dunas de areia branca e lagoas de água doce, criando paisagens únicas.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Maceió (capital)', 'AL', 'Praias urbanas como Pajuçara e Ponta Verde, além de lagoas e piscinas naturais.', 'https://www.tripadvisor.com.br/Attractions-g303208-Activities-State_of_Alagoas.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Maragogi', 'AL', 'Conhecida como o Caribe Brasileiro, com suas águas transparentes e recifes de corais.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'João Pessoa (capital)', 'PB', 'Capital tranquila com praias como Tambaú e Cabo Branco, além do Centro Histórico bem preservado.', 'https://www.tripadvisor.com.br/Attractions-g303422-Activities-State_of_Paraiba.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Praia de Coqueirinho', 'PB', 'Praia paradisíaca com falésias e águas calmas.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Teresina (capital)', 'PI', 'Capital com rica culinária e proximidade com o Parque Nacional de Sete Cidades, conhecido por suas formações rochosas.', 'https://www.tripadvisor.com.br/Attractions-g303462-Activities-State_of_Piaui.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Delta do Parnaíba', 'PI', 'Único delta em mar aberto das Américas, com ilhas e igarapés.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Natal (capital)', 'RN', 'Capital com praias urbanas como Ponta Negra e o famoso Forte dos Reis Magos.', 'https://www.tripadvisor.com.br/Attractions-g303510-Activities-State_of_Rio_Grande_do_Norte.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Genipabu', 'RN', 'Conhecida por suas dunas móveis e passeios de buggy.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Aracaju (capital)', 'SE', 'Capital com praias como Atalaia e Orla de Atalaia, além de museus e mercados artesanais.', 'https://www.tripadvisor.com.br/Attractions-g303637-Activities-State_of_Sergipe.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Nordeste', 'Cânion do Xingó', 'SE', 'Formações rochosas impressionantes no Rio São Francisco.', NULL);

-- INSERTS da tabela REGIONS: Centro-Oeste
INSERT INTO regions (region, name, state, text, links) VALUES
('Centro-Oeste', 'Goiania (capital)', 'GO', 'Cidade moderna, planejada, e um dos principais centros urbanos da regiao Centro-Oeste do Brasil.', 'https://www.tripadvisor.com.br/Attractions-g303323-Activities-State_of_Goias.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Centro-Oeste', 'Chapada dos Veadeiros', 'GO', 'Localizada no estado de Goias, a Chapada dos Veadeiros e um parque nacional famoso por suas cachoeiras, trilhas e formacoes rochosas. Destinos como a Cachoeira de Santa Barbara e a Cachoeira do Segredo sao altamente recomendados para os amantes de natureza.', NULL),
('Centro-Oeste', 'Rio Quente', 'GO', 'Situado no estado de Goias, Rio Quente e famoso por suas aguas termais, com temperaturas que chegam a 38°C. O Hot Park e um dos maiores parques aquaticos da regiao e oferece diversas atracoes para todas as idades.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Centro-Oeste', 'Cuiaba (capital)', 'MT', 'Conhecida como a porta de entrada para o Pantanal e tambem pela sua localizacao geografica unica: e considerada o centro da America do Sul.', 'https://www.tripadvisor.com.br/Attractions-g303346-Activities-State_of_Mato_Grosso.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Centro-Oeste', 'Chapada dos Guimaraes', 'MT', 'Proxima a Cuiaba, a Chapada dos Guimaraes e conhecida por suas cachoeiras, cavernas e mirantes. O Parque Nacional da Chapada dos Guimaraes e um local ideal para trilhas e observacao da fauna local.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Centro-Oeste', 'Campo Grande (capital)', 'MS', 'Conhecida como a Cidade Morena devido a coloracao avermelhada de seu solo, Campo Grande e um importante centro urbano e economico do Centro-Oeste do Brasil. A cidade e uma mistura de culturas indigenas, sul-mato-grossense, paraguaia e pantaneira.', 'https://www.tripadvisor.com.br/Attractions-g303368-Activities-State_of_Mato_Grosso_do_Sul.html');
INSERT INTO regions (region, name, state, text, links) VALUES
('Centro-Oeste', 'Bonito', 'MS', 'Famosa por suas aguas, Bonito oferece atividades como flutuacao em rios, visita a cavernas e cachoeiras. A Gruta da Lagoa Azul e o Abismo Anhumas sao atracoes renomadas.', NULL);

INSERT INTO regions (region, name, state, text, links) VALUES
('Centro-Oeste', 'Brasilia (distrito federal)', 'DF', 'A capital federal do Brasil e reconhecida por sua arquitetura modernista, projetada por Oscar Niemeyer. Pontos turisticos como a Catedral Metropolitana, o Congresso Nacional e o Palacio da Alvorada sao imperdiveis.', 'https://www.tripadvisor.com.br/Attractions-g303322-Activities-Brasilia_Federal_District.html');


-- INSERTS da tabela NEWS
INSERT INTO news (name, place, text) VALUES
('Festival de Cinema agita a Serra Gaucha com novas atracoes gastronomicas', 'Gramado (RS)', 'A charmosa cidade de Gramado esta em clima de celebracao com o aguardado Festival de Cinema de 2025. O evento, que atrai artistas e turistas de todo o Brasil, traz neste ano uma mostra dedicada ao cinema latino-americano contemporaneo. Alem disso, a prefeitura lancou a Rota do Cafe Colonial Artesanal, reunindo 18 produtores locais que oferecem experiencias unicas de sabores coloniais em ambientes rusticos e acolhedores. A iluminacao tematica nas ruas centrais completa o cenario encantador.'),
('Novo mirante e passarelas ecologicas valorizam o ecoturismo', 'Bonito (MS)', 'Bonito continua sendo referencia em turismo sustentavel, e acaba de inaugurar o "Mirante da Nascente Azul", com passarelas suspensas que oferecem uma visao aerea das aguas cristalinas e da fauna local. Com foco na preservacao e na acessibilidade, o complexo agora conta tambem com trilhas inclusivas para cadeirantes e idosos, alem de areas de descanso com sombra e sinalizacao ambiental educativa. A cidade recebe ainda, neste mes, a Feira de Turismo Ecologico do Centro-Oeste, reunindo especialistas e operadores de turismo.'),
('Festival de esportes aquaticos e novas trilhas de aventura', 'Jericoacoara (CE)', 'A paradisiaca vila de Jericoacoara realizou a primeira edicao do Festival de Kite e Windsurf Sustentavel, que reuniu atletas de todo o pais em competicoes que valorizam praticas de baixo impacto ambiental. Novas trilhas ecologicas para quadriciclos e caminhadas foram abertas na area da Pedra Furada, com sinalizacao bilingue e mirantes panoramicoss. O por do sol nas dunas continua sendo uma atracao imperdivel, agora com apresentacoes culturais ao vivo nos fins de tarde.'),
('Patrimonio cultural em destaque na celebracao dos 60 anos da FLIP', 'Paraty (RJ)', 'Paraty se transformou num grande palco literario com a comemoracao dos 60 anos da Festa Literaria Internacional. A cidade recebe autores de renome, debates sobre literatura indigena e oficinas de escrita criativa em casaroes historicos. Uma das grandes novidades e a reabertura do Forte Defensor Perpetuo, agora restaurado com um museu interativo e trilhas que oferecem vista panoramica da baia de Paraty. Restaurantes locais tambem entraram na festa com menus especiais inspirados em livros e personagens literarios.'),
('Caribe amazonico ganha hotel flutuante e turismo sustentavel cresce', 'Alter do Chao (PA)', 'As aguas claras do Rio Tapajos estao ainda mais atrativas com a chegada do primeiro hotel flutuante ecologico da regiao, operando com energia solar, coleta de agua da chuva e cardapios que valorizam a culinaria ribeirinha. A alta temporada das praias de rio esta a todo vapor, com destaque para a Ilha do Amor, que recebeu nova sinalizacao turistica e quiosques padronizados com foco em limpeza e organizacao. Passeios guiados de canoa agora incluem oficinas sobre plantas medicinais da floresta.'),
('Concertos barrocos e nova rota noturna celebram 40 anos de patrimonio mundial', 'Ouro Preto (MG)', 'Ouro Preto comemora quatro decadas como Patrimonio Mundial da UNESCO com uma agenda intensa de atracoes. As igrejas do centro historico sediam concertos noturnos com musica barroca ao vivo, criando uma atmosfera magica nas ladeiras coloniais. A nova "Rota da Luz e Historia", um passeio noturno guiado, utiliza iluminacao cenica para valorizar os principais monumentos e casaroes. A Casa dos Contos tambem abriu uma nova exposicao interativa sobre a Inconfidencia Mineira.'),
('Realidade aumentada e novas trilhas inclusivas encantam visitantes', 'Chapada dos Veadeiros (GO)', 'O Parque Nacional da Chapada dos Veadeiros acaba de ganhar um moderno centro de visitantes com experiencias em realidade aumentada, simulando voos de drone sobre os canions e cachoeiras mais iconicos da regiao. As trilhas principais foram reformadas com passarelas ecologicas e sinalizacao em braile, tornando o ecoturismo ainda mais acessivel. Restaurantes e pousadas locais estao adotando praticas sustentaveis, com destaque para a gastronomia baseada em ingredientes do cerrado.'),
('Recife Antigo revive com arte de rua e nova fase do Cais do Sertao', 'Recife (PE)', 'O bairro historico do Recife Antigo vive um momento vibrante com a reabertura ampliada do museu Cais do Sertao, que agora conta com salas interativas sobre o ciclo do forro e da poesia nordestina. As ruas do bairro estao tomadas pelo Festival Recife na Rua, com musica ao vivo, gastronomia regional, teatro de rua e maracatus que desfilam entre os casaroes coloniais. A ciclovia recem-inaugurada ligando o Marco Zero a Praia de Boa Viagem estimula o turismo sustentavel.'),
('Ilha da Magia promove festival vegano e amplia ciclovias litoraneas', 'Florianopolis (SC)', 'Florianopolis esta em clima de consciencia ecologica com o Floripa Veg Festival, que reune chefs renomados, produtores locais e paineis sobre alimentacao consciente e saude. O evento ocorre simultaneamente em varias praias e centros culturais da cidade. Novas ciclovias foram concluidas entre a Praia Mole, Joaquina e o centrinho da Lagoa da Conceicao, promovendo o transporte alternativo e o contato com a natureza. Trilhas autoguiadas com QR Codes foram instaladas no Morro da Cruz e no Costao do Santinho.'),
('Temporada de lagoas cheias traz passaporte turistico e novos voos', 'Lencois Maranhenses (MA)', 'A beleza unica dos Lencois Maranhenses esta ainda mais acessivel com a chegada de novos voos diretos para Barreirinhas, principal porta de entrada do parque. A temporada de lagoas cheias esta deslumbrante, e os visitantes agora podem participar do programa "Passaporte dos Lencois", que premia quem explora diferentes circuitos como Lagoa Azul, Lagoa Bonita e Canto do Atins. Barqueiros e guias locais estao sendo capacitados para oferecer experiencias mais seguras e informativas aos turistas.');
