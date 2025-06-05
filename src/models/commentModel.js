const pool = require("../config/database");

// Buscar todos os comentários
const getComments = async () => {
    const result = await pool.query(`SELECT 
            dono.name AS dono_post,
            posts.image, 
            posts.description, 
            posts.tag, 
            users.name AS usuario, 
            users.photo AS foto_comentario,
            comments.comment AS comentario
        FROM comments
        INNER JOIN users ON comments.user_id = users.id
        INNER JOIN posts ON comments.post_id = posts.id
        INNER JOIN users AS dono ON posts.user_id = dono.id`);
    return result.rows;
};

// Buscar um comentário pelo id
const getCommentById = async (id) => {
    const result = await pool.query(`        SELECT 
            dono.name AS dono_post,
            posts.image, 
            posts.description, 
            posts.tag, 
            users.name AS usuario, 
            users.photo AS foto_comentario,
            comments.comment AS comentario
        FROM comments
        INNER JOIN users ON comments.user_id = users.id
        INNER JOIN posts ON comments.post_id = posts.id
        INNER JOIN users AS dono ON posts.user_id = dono.id
        WHERE comments.id = $1 `, [id]);
    return result.rows[0];
};

// Criar um comentário
const createComment = async (post_id, user_id, comment) => {
    const result = await pool.query(
        "INSERT INTO comments (post_id, user_id, comment) VALUES ($1, $2, $3) RETURNING *",
        [post_id, user_id, comment]
    );
    return result.rows[0];
};

// Atualizar um comentário
const updateComment = async (id, comment) => {
    const result = await pool.query(
        "UPDATE comments SET comment = $1 WHERE id = $2 RETURNING *",
        [comment, id]
    );
    return result.rows[0];
};

// Deletar um comentário
const deleteComment = async (id) => {
    const result = await pool.query("DELETE FROM comments WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        throw new Error("Comentário não encontrado");
    }
    return result.rows[0];
};

module.exports = { getComments, getCommentById, createComment, updateComment, deleteComment };