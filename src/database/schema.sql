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

-- INSERTS da tabela USERS
INSERT INTO users (name, email, city, state, type_user, password) VALUES
('Amanda Gomes Mechi', 'amanda.mechi@aluno.senai.br', 'Campinas', 'SP', 'usuário','123456'),
('Andre Lucca Santos', 'andre.l.santos45@aluno.senai.br', 'Campinas', 'SP', 'guia turístico','234561'),
('Flavia Regina Alexandre Mendes', 'flavia.r.mendes@aluno.senai.br', 'Campinas', 'SP', 'usuário','345612'),
('Giovanna Caron de Barros', 'giovanna.c.barros@aluno.senai.br', 'Valinhos', 'SP', 'guia turístico','456123'),
('Isabella Borin de Moraes Rosa', 'isabella.b.rosa6@aluno.senai.br', 'Valinhos', 'SP', 'usuário','567234'),
('João Vitor Porto Sales', 'joao.v.sales15@aluno.senai.br', 'Campinas', 'SP', 'guia turístico','678345'),
('Laura Ferreira Violla', 'laura.violla@aluno.senai.br', 'Valinhos', 'SP', 'usuário','789456');

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

-- INSERTS da tabela REGIONS
INSERT INTO regions (name, state, image, text, links) VALUES
('São Paulo', 'SP', 'https://example.com/image1.jpg', 'Texto sobre São Paulo', 'https://example.com/sp'),
('Rio de Janeiro', 'RJ', 'https://example.com/image2.jpg', 'Texto sobre Rio de Janeiro', 'https://example.com/rj'),
('Minas Gerais', 'MG', 'https://example.com/image3.jpg', 'Texto sobre Minas Gerais', 'https://example.com/mg');

-- INSERTS da tabela NEWS
INSERT INTO news (name, place, image, text, URL) VALUES
('Notícia 1', 'São Paulo', 'https://example.com/news1.jpg', 'Texto da notícia 1', 'https://example.com/news1'),
('Notícia 2', 'Rio de Janeiro', 'https://example.com/news2.jpg', 'Texto da notícia 2', 'https://example.com/news2'),
('Notícia 3', 'Minas Gerais', 'https://example.com/news3.jpg', 'Texto da notícia 3', 'https://example.com/news3');
