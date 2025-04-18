CREATE DATABASE bora_viajar;

\c bora_viajar;

-- Tabela de USERS
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    city VARCHAR(120) NOT NULL,
    state VARCHAR(120) NOT NULL,
    password VARCHAR(15) NOT NULL
);

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
    URL VARCHAR(255)
);

-- Tabela de NEWS
CREATE TABLE news (
    name VARCHAR(255) NOT NULL,
    place VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    text TEXT NOT NULL,
    URL VARCHAR(255)
);

-- INSERTS da tabela USERS
INSERT INTO users (name, email, city, state, password) VALUES
('Amanda Gomes Mechi', 'amanda.mechi@aluno.senai.br', 'Campinas', 'SP', '123456'),
('Andre Lucca Santos', 'andre.l.santos45@aluno.senai.br', 'Campinas', 'SP', '234561'),
('Flavia Regina Alexandre Mendes', 'flavia.r.mendes@aluno.senai.br', 'Campinas', 'SP', '345612'),
('Giovanna Caron de Barros', 'giovanna.c.barros@aluno.senai.br', 'Valinhos', 'SP', '456123'),
('Isabella Borin de Moraes Rosa', 'isabella.b.rosa6@aluno.senai.br', 'Valinhos', 'SP', '567234'),
('João Vitor Porto Sales', 'joao.v.sales15@aluno.senai.br', 'Campinas', 'SP', '678345');   

INSERT INTO users (name, email, city, state, password) VALUES
('Laura Ferreira Violla', 'laura.violla@aluno.senai.br', 'Valinhos', 'SP', '789456');

-- INSERTS da tabela POSTS
INSERT INTO posts (user_id, image, description, tag) VALUES
(1, 'https://example.com/image1.jpg', 'Descrição do post 1', 'NOVIDADE'),
(2, 'https://example.com/image2.jpg', 'Descrição do post 2', 'ALERTA'),
(3, 'https://example.com/image3.jpg', 'Descrição do post 3', 'PROMOÇÃO');