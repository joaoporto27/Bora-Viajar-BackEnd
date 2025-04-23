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

module.exports = { getNews, getNewsById  };