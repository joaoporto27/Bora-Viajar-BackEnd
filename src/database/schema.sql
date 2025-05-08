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
    image VARCHAR(255) NOT NULL,
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
INSERT INTO posts (user_id, image, description, tag) VALUES
(1, 'https://example.com/image1.jpg', 'Descrição do post 1', 'NOVIDADE'),
(2, 'https://example.com/image2.jpg', 'Descrição do post 2', 'ALERTA'),
(3, 'https://example.com/image3.jpg', 'Descrição do post 3', 'PROMOÇÃO');

-- INSERTS da tabela COMMENTS
INSERT INTO comments (post_id, user_id, comment) VALUES
(1, 2, 'Comentário do usuário 2 no post 1'),
(1, 3, 'Comentário do usuário 3 no post 1'),
(2, 1, 'Comentário do usuário 1 no post 2'),
(3, 2, 'Comentário do usuário 2 no post 3');

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
('Curitiba (capital)', 'PR', 'Reconhecida por seu planejamento urbano, oferece atrações como o Jardim Botânico, o Museu Oscar Niemeyer e o Parque Barigui.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Foz do Iguaçu', 'PR', 'Lar das impressionantes Cataratas do Iguaçu, uma das Sete Maravilhas Naturais do Mundo, e da Represa de Itaipu. A cidade também é ponto de acesso a Ciudad del Este (Paraguai) e Puerto Iguazú (Argentina).'),
('Serra do Mar', 'PR', 'Ideal para ecoturismo, com trilhas que levam a vilarejos históricos como Morretes e Antonina, onde se pode degustar o tradicional barreado.');

INSERT INTO regions (name, state, text, links) VALUES
('Florianópolis (capital)', 'SC', ' A capital, conhecida por suas belas praias, como Joaquina e Campeche, além da Lagoa da Conceição e da Ponte Hercílio Luz.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Balneário Camboriú', 'SC', 'Famosa por sua vida noturna vibrante e pelo Parque Unipraias, que oferece vistas panorâmicas e atividades de ecoturismo.'),
('São Joaquim', 'SC', 'Destino ideal para quem deseja vivenciar o inverno brasileiro, com possibilidade de neve e temperaturas negativas.');

INSERT INTO regions (name, state, text, links) VALUES
('Porto Alegre (capital)', 'RS', 'Cidade com forte influência cultural, sendo um dos principais centros urbanos do sul do Brasil. A cidade está situada às margens do Lago Guaíba e é conhecida por sua diversidade cultural, gastronomia, e seus famosos centros históricos e espaços ao ar livre.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Vale dos Vinhedos', 'RS', 'Região produtora de vinhos, onde é possível visitar vinícolas e participar de degustações.'),
('Cânion Itaimbezinho', 'RS', 'Localizado no Parque Nacional de Aparados da Serra, oferece trilhas e vistas deslumbrantes.');

-- INSERTS da tabela REGIONS: Norte
INSERT INTO regions (name, state, text, links) VALUES
('Manaus (capital)', 'AM', 'Porta de entrada para a Amazônia, a capital amazonense oferece atrações como o Teatro Amazonas, o Mercado Municipal e o Encontro das Águas, onde os rios Negro e Solimões correm lado a lado sem se misturar.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Floresta Amazônica', 'AM', 'Possibilidade de realizar passeios de barco, caminhadas na selva e observação de fauna e flora únicas.');

INSERT INTO regions (name, state, text, links) VALUES
('Belém (capital)', 'PA', 'Capital paraense, famosa por sua culinária típica, como o tacacá e o açaí, além de pontos turísticos como o Mercado Ver-o-Peso e o Museu Paraense Emílio Goeldi.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Alter do Chão', 'PA', 'Conhecida como o "Caribe Amazônico", oferece praias de água doce com areia branca e águas cristalinas, sendo considerada uma das praias mais bonitas do Brasil.');

INSERT INTO regions (name, state, text, links) VALUES
('Rio Branco (capital)', 'AC', 'Maior cidade do estado e está localizada na região norte do Brasil, próxima à fronteira com o Peru e a Bolívia. A cidade tem uma mistura de história, cultura e natureza, sendo a principal porta de entrada para quem deseja explorar a Floresta Amazônica e as belezas naturais do Acre.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Geoglifos do Acre', 'AC', 'Estruturas geométricas misteriosas esculpidas no solo, com mais de 3.000 anos de idade, que despertam interesse arqueológico.');

INSERT INTO regions (name, state, text, links) VALUES
('Boa Vista (capital)', 'RR', 'Única capital brasileira situada completamente ao norte da linha do Equador e é conhecida por sua proximidade com a natureza e por ser uma cidade com forte presença de influências indígenas e amazônicas.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Monte Roraima', 'RR', 'Uma das formações geológicas mais antigas do planeta, oferece trilhas desafiadoras e vistas deslumbrantes, sendo inspiração para obras como "O Mundo Perdido" de Arthur Conan Doyle.');

INSERT INTO regions (name, state, text, links) VALUES
('Palmas (capital)', 'TO', 'Cidade planejada, inaugurada em 1989, e está situada às margens do Lago de Palmas, em uma região de grande beleza natural.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Jalapão', 'TO', 'Conhecido por suas dunas douradas, fervedouros (poços de água que borbulham devido à pressão da água subterrânea) e cachoeiras, é um destino ideal para quem busca aventura e contato com a natureza.');

-- INSERTS da tabela REGIONS: Nordeste
INSERT INTO regions (name, state, text, links) VALUES
('Salvador (capital)', 'BA', 'Capital cultural do Brasil, famosa pelo Pelourinho, igrejas históricas e o Elevador Lacerda.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Chapada Diamantina', 'BA', 'Parque nacional com cachoeiras, cavernas e trilhas, ideal para os amantes de ecoturismo.'),
('Ilha de Itaparica', 'BA', 'Destino tranquilo com praias de águas calmas, perfeito para relaxar.');

INSERT INTO regions (name, state, text, links) VALUES
('Recife (capital)', 'PE', 'Cidade com forte influência cultural, sendo um dos principais centros urbanos do sul do Brasil. A cidade está situada às margens do Lago Guaíba e é conhecida por sua divePEidade cultural, gastronomia, e seus famosos centros históricos e espaços ao ar livre.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Olinda', 'PE', 'Cidade histórica com igrejas barrocas e ladeiras coloridas.'),
('Porto de Galinhas', 'PE', 'Praias paradisíacas com piscinas naturais e águas cristalinas.');

INSERT INTO regions (name, state, text, links) VALUES
('Fortaleza (capital)', 'CE', 'Capital vibrante com praias urbanas como Praia do Futuro e atrações culturais como o Mercado Central.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Jericoacoara', 'CE', 'Vila charmosa com dunas, lagoas e pôr do sol deslumbrante.'),
('Canoa Quebrada', 'CE', 'Praia famosa por suas falésias vermelhas e vida noturna animada.');

INSERT INTO regions (name, state, text, links) VALUES
('São Luís (capital)', 'MA', 'Centro histórico com casarões coloniais e manifestações culturais como o Bumba Meu Boi.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Lençóis Maranhenses', 'MA', 'Parque nacional com dunas de areia branca e lagoas de água doce, criando paisagens únicas.');

INSERT INTO regions (name, state, text, links) VALUES
('Maceió (capital)', 'AL', 'Praias urbanas como Pajuçara e Ponta Verde, além de lagoas e piscinas naturais.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Maragogi', 'AL', 'Conhecida como o "Caribe Brasileiro", com suas águas transparentes e recifes de corais.');

INSERT INTO regions (name, state, text, links) VALUES
('João Pessoa (capital)', 'PB', 'Capital tranquila com praias como Tambaú e Cabo Branco, além do Centro Histórico bem preservado.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Praia de Coqueirinho', 'PB', 'Praia paradisíaca com falésias e águas calmas.');

INSERT INTO regions (name, state, text, links) VALUES
('Teresina (capital)', 'PI', 'Capital com rica culinária e proximidade com o Parque Nacional de Sete Cidades, conhecido por suas formações rochosas.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Delta do Parnaíba', 'PI', 'Único delta em mar aberto das Américas, com ilhas e igarapés.');

INSERT INTO regions (name, state, text, links) VALUES
('Natal (capital)', 'RN', 'Capital com praias urbanas como Ponta Negra e o famoso Forte dos Reis Magos.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Genipabu', 'RN', 'Conhecida por suas dunas móveis e passeios de buggy.');

INSERT INTO regions (name, state, text, links) VALUES
('Aracaju (capital)', 'SE', 'Capital com praias como Atalaia e Orla de Atalaia, além de museus e mercados artesanais.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Cânion do Xingó', 'SE', 'Formações rochosas impressionantes no Rio São Francisco.');

-- INSERTS da tabela REGIONS: Centro-Oeste
INSERT INTO regions (name, state, text, links) VALUES
('Aracaju (capital)', 'SE', 'Capital com praias como Atalaia e Orla de Atalaia, além de museus e mercados artesanais.', 'https://www.tripadvisor.com.br/Attractions-g303441-Activities-Curitiba_State_of_Parana.html');
INSERT INTO regions (name, state, text) VALUES
('Cânion do Xingó', 'SE', 'Formações rochosas impressionantes no Rio São Francisco.');

-- INSERTS da tabela NEWS
INSERT INTO news (name, place, image, text, URL) VALUES
('Notícia 1', 'São Paulo', 'https://example.com/news1.jpg', 'Texto da notícia 1', 'https://example.com/news1'),
('Notícia 2', 'Rio de Janeiro', 'https://example.com/news2.jpg', 'Texto da notícia 2', 'https://example.com/news2'),
('Notícia 3', 'Minas Gerais', 'https://example.com/news3.jpg', 'Texto da notícia 3', 'https://example.com/news3');
