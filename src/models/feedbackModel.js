const pool = require("../config/database");

//Buscar todos os feedbacks

const getAllFeedbacks = async () => {
    const result = await pool.query(`SELECT users.name AS usuario, feedbacks.feedback, feedbacks.rating
            FROM feedbacks 
            LEFT JOIN users ON feedbacks.user_id = users.id`);
    return result.rows;
};

//Buscar um feedback pelo id

const getFeedbacksById = async (id) => {
    const result = await pool.query("SELECT * FROM feedbacks WHERE id = $1", [id]);
    return result.rows[0];
};

//Criar um feedback

const createFeedback = async (user_id, feedback, rating ) => {
    const result = await pool.query(
        "INSERT INTO feedbacks (user_id, feedback, rating) VALUES ($1, $2, $3) RETURNING *",
        [user_id, feedback, rating]
    );
    return result.rows[0];
};

//Atualizar um feedback

const updateFeedback = async (id, user_id, feedback, rating) => {
    const result = await pool.query(
       `UPDATE feedbacks 
        SET user_id = $1, feedback = $2, rating = $3
        WHERE id = $4 RETURNING *`, 
        [user_id, feedback, rating, id] 
    );
    return result.rows[0];
};

//Deletar um feedback

const deleteFeedback = async (id) => {
    const result = await pool.query("DELETE FROM feedbacks WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        throw new Error("Feedback não encontrado");
    }
    return result.rows[0];
}

module.exports = { getAllFeedbacks, getFeedbacksById, createFeedback, updateFeedback, deleteFeedback  };