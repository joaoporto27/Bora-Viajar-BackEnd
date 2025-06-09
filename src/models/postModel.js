const pool = require("../config/database");

//Buscar todos os posts
const getPosts = async (tag, user_id) => {
    let query = `SELECT posts.id, users.name AS usuario, users.photo AS foto, posts.image, posts.description, posts.tag, posts.likes_count
        FROM posts 
        LEFT JOIN users ON posts.user_id = users.id`;
    let params = [];
    let conditions = [];

    if (tag) {
        conditions.push(`posts.tag ILIKE $${params.length + 1}`);
        params.push(`%${tag}%`);
    }
    if (user_id) {
        conditions.push(`posts.user_id = $${params.length + 1}`);
        params.push(user_id);
    }
    if (conditions.length > 0) {
        query += " WHERE " + conditions.join(" AND ");
    }

    const result = await pool.query(query, params);
    return result.rows;
};

//Buscar um post pelo id
const getPostById = async (id) => {
    const result = await pool.query(`SELECT posts.id, users.name AS usuario, users.photo AS foto, posts.image, posts.description, posts.tag, posts.likes_count
        FROM posts 
        LEFT JOIN users ON posts.user_id = users.id 
        WHERE posts.id = $1`, [id]);
    return result.rows[0];
};

//Criar um post
const createPost = async (user_id, image, description, tag) => {
    const result = await pool.query("INSERT INTO posts (user_id, image, description, tag) VALUES ($1, $2, $3, $4) RETURNING *",
        [user_id, image, description, tag]
    );
    return result.rows[0];
};

//Atualizar um post
const updatePost = async (id, image, description, tag) => {
    const result = await pool.query("UPDATE posts SET image = $1, description = $2, tag = $3 WHERE id = $4 RETURNING *",
        [image, description, tag, id]
    );
    return result.rows[0];
};

//Curtir um post
const likePost = async (id) => {
    const result = await pool.query("UPDATE posts SET likes_count = likes_count + 1 WHERE id = $1 RETURNING *", [id]);
    return result.rows[0];
};

//Deletar um post
const deletePost = async (id) => {
    const result = await pool.query("DELETE FROM posts WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        throw new Error("Post não encontrado");
    }
    return result.rows[0];
};

module.exports = { getPosts, getPostById, createPost, updatePost, likePost, deletePost };