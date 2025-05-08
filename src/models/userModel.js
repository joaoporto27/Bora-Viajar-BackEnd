const pool = require("../config/database");

//Buscar todos os usuários
const getUsers = async () => {
    const result = await pool.query("SELECT * FROM users");
    return result.rows;
};

//Buscar um usuário pelo id
const getUserById = async (id) => {
    const result = await pool.query("SELECT * FROM users WHERE id = $1", [id]);
    return result.rows[0];
};

//Criar um usuário
const createUser = async (name, email, city, state, type_user, photo, password) => {
    const result = await pool.query(
        "INSERT INTO users (name, email, city, state, type_user, photo, password) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *",
        [name, email, city, state, type_user, photo, password]
    );  
    return result.rows[0];
};

//Atualizar um usuário
const updateUser = async (id, photo, password) => {
    const result = await pool.query(
        "UPDATE users SET password = $1, photo = $2 WHERE id = $3 RETURNING *", 
        [password, photo, id] 
    );
    return result.rows[0];
};

//Deletar um usuário
const deleteUser = async (id) => {
    const result = await pool.query("DELETE FROM users WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        throw new Error("Usuário não encontrado");
    }
    return result.rows[0];
}

module.exports = { getUsers, getUserById, createUser, updateUser, deleteUser };