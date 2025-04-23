const pool = require("../config/database");

//Buscar todas as Notícias

const getNews = async () => {
    const result = await pool.query("SELECT * FROM news");
    return result.rows;
};

module.exports = { getNews };