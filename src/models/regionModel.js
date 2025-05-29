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

const createRegion = async (region, name, state, text, links, image) => {
    const result = await pool.query(
        "INSERT INTO regions (region, name, state, text, links, image) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *",
        [region, name, state, text, links, image]
    );
    return result.rows[0];
};

//Atualizar uma região

const updateRegion = async (id, region, name, state, text, links, image) => {
    const result = await pool.query(
       `UPDATE regions 
        SET region = $1, name = $2, state = $3, text = $4, links = $5, image = $6
        WHERE id = $7 RETURNING *`, 
        [region, name, state, text, links, image, id] 
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