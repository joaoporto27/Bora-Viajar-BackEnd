const pool = require("../config/database");

//Buscar todas as regiões

const getRegions = async (region) => {
    if (!region){
        const result = await pool.query("SELECT * FROM regions");
        return result.rows;
    } else {
        const result = await pool.query("SELECT * FROM regions WHERE region ILIKE $1", [`%${region}%`]);
        return result.rows;
    }
};

//Buscar uma região pelo id

const getRegionById = async (id) => {
    const result = await pool.query("SELECT * FROM regions WHERE id = $1", [id]);
    return result.rows[0];
};

//Criar uma região

const createRegion = async (name, state, image, text, links) => {
    const result = await pool.query(
        "INSERT INTO regions (name, state, image, text, links) VALUES ($1, $2, $3, $4, $5) RETURNING *",
        [name, state, image, text, links]
    );
    return result.rows[0];
};

//Atualizar uma região

const updateRegion = async (id, name, state, image, text, links) => {
    const result = await pool.query(
       `UPDATE regions 
        SET name = $1, state = $2, image = $3, text = $4, links = $5
        WHERE id = $6 RETURNING *`, 
        [name, state, image, text, links, id] 
    );
    return result.rows[0];
};

//Deletar uma região

const deleteRegion = async (id) => {
    const result = await pool.query("DELETE FROM regions WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        throw new Error("Região não encontrada");
    }
    return result.rows[0];
}

module.exports = { getRegions, getRegionById, createRegion, updateRegion, deleteRegion };