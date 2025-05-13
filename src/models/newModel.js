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

const createNews = async (name, place, text ) => {
    const result = await pool.query(
        "INSERT INTO news (name, place, text) VALUES ($1, $2, $3) RETURNING *",
        [name, place, text]
    );
    return result.rows[0];
};

//Atualizar uma notícia

const updateNews = async (id, name, place, text) => {
    const result = await pool.query(
       `UPDATE news 
        SET name = $1, place = $2, text = $3
        WHERE id = $4 RETURNING *`, 
        [name, place, text, id] 
    );
    return result.rows[0];
};

//Deletar uma notícia

const deleteNews = async (id) => {
    const result = await pool.query("DELETE FROM news WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        throw new Error("Notícia não encontrada");
    }
    return result.rows[0];
}

module.exports = { getNews, getNewsById, createNews, updateNews, deleteNews  };