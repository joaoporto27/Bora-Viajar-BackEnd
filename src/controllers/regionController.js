const regionModel = require("../models/regionModel");

//Buscar todas as regiões

const getAllRegions = async (req, res) => {
    try {
        const { region } = req.query;
        const regions = await regionModel.getRegions(region);
        res.status(200).json(regions);
    } catch (error) {
        res.status(404).json({ message: "Regiões não encontradas" });
    }
};

//Buscar uma região pelo id

const getRegionById = async (req, res) => {
    try {
        const region = await regionModel.getRegionById(req.params.id);
        res.json({ message: "Região encontrada com sucesso!", region });
    } catch (error) {
        res.status(404).json({ message: "Região não encontrada" });
    }
};

//Criar uma região

const createRegion = async (req, res) => {
    try {
        const { region, name, state, text, links } = req.body;
        const image = req.file ? req.file.filename : null;
        const newRegion = await regionModel.createRegion(region, name, state, text, links, image);
        res.status(201).json({ message: "Região criada com sucesso", newRegion });
    } catch (error) {
        console.error(error);
        if (error.code === "23505") {
            return res.status(409).json({ message: "Região já cadastrada" });
        }
        res.status(404).json({ message: "Erro ao criar região" });
    }
};

//Atualizar uma região

const updateRegion = async (req, res) => {
    try {
        const { region, name, state, text, links  } = req.body;
        const image = req.file ? req.file.filename : null; 
        const {id} = req.params
        const updatedRegion = await regionModel.updateRegion(id, region, name, state, text, links, image);
        if (!updatedRegion) {
            return res.status(404).json({ message: "Região não encontrada" });
        }
        res.json({ message: "Região atualizada com sucesso!", updatedRegion });
    } catch (error) {
        res.status(404).json({ message: "Erro ao atualizar região" });
    }
};

//Deletar um usuário

const deleteRegion = async (req, res) => {
    try {
        const deletedRegion = await regionModel.deleteRegion(req.params.id);
        res.status(200).json({ message: "Região deletada com sucesso", deletedRegion });
    } catch (error) {
        res.status(404).json({ message: "Erro ao deletar região" });
    }
};

module.exports = { getAllRegions, getRegionById, createRegion, updateRegion, deleteRegion };
