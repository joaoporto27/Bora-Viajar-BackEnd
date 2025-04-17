const pool = require("../config/database");

//Buscar todos os usuários
const getUsers = async () => {
    const result = await pool.query("SELECT * FROM users");
    return result.rows;
};

//Buscar um usuário pelo id
const getUserById = async () => {
    const result = await pool.query("SELECT * FROM users WHERE id = $1", [id]);
    return result.rows[0];
};

//Criar um usuário
const createUser = async (name, email, city, state, password) => {
    const result = await pool.query(
        "INSERT INTO users (name, email, city, state, password) VALUES ($1, $2, $3, $4, $5) RETURNING *",
        [name, email, city, state, password]
    );
    return result.rows[0];
};

//Atualizar um usuário
const updateUser = async (id, email, password) => {
    const result = await pool.query("UPDATE users SET email = $1, password = $2 WHERE id = $3 RETURNING *", [email, password, id]);
    return result.rows[0];
};

//Deletar um usuário
const deleteUser = async (id) => {
    const result = await pool.query("DELETE FROM users WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        throw new Error("Usuário não encontrado");
    }
    return {message: "Usuário deletado com sucesso!"};
}

module.exports = { getUsers, getUserById, createUser, updateUser, deleteUser };