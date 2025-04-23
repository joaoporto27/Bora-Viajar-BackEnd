const pool = require("../config/database");

//Buscar todas as Notícias

const getNews = async () => {
    const result = await pool.query("SELECT * FROM news");
    return result.rows;
};

//Buscar uma notícia pelo id

const getNewsById = async (id) => {
    const result = await pool.query("SELECT * FROM news WHERE id = $1", [id]);
    return result.rows[0];
};

//Criar uma notícia

const createNews = async (name, place, image, text, URL) => {
    const result = await pool.query(
        "INSERT INTO news (name, place, image, text, URL) VALUES ($1, $2, $3, $4, $5) RETURNING *",
        [name, place, image, text, URL]
    );
    return result.rows[0];
};

//Atualizar uma notícia

const updateNews = async (id, name, place, image, text, URL) => {
    const result = await pool.query(
       `UPDATE news 
        SET name = $1, place = $2, image = $3, text = $4, URL = $5
        WHERE id = $6 RETURNING *`, 
        [name, place, image, text, URL, id] 
    );
    return result.rows[0];
};

module.exports = { getNews, getNewsById, createNews, updateNews  };