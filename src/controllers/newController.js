const newModel = require("../models/newModel");

//Buscar todas as Notícias

const getAllNews = async (req, res) => {
    try {
        const news = await newModel.getNews();
        res.status(200).json(news);
    } catch (error) {
        res.status(404).json({ message: "Notícias não encontradas" });
    }
};

//Buscar uma notícia pelo id

const getNewsById = async (req, res) => {
    try {
         const news = await newModel.getNewsById(req.params.id);
               res.json({ message: "Notícia encontrada com sucesso!", news });
    } catch (error) {
        res.status(404).json({ message: "Notícia não encontrada" });
    }
};

//Criar uma notícia

const createNews = async (req, res) => {
    try {
        const { name, place, image, text, URL } = req.body;
        const newNews = await newModel.createNews( name, place, image, text, URL );
        res.status(201).json({ message: "Notícia criada com sucesso", newNews });
    } catch (error) {
        console.error(error);
        if (error.code === "23505") {
            return res.status(409).json({ message: "Notícia já existente" });
        }
        res.status(404).json({ message: "Erro ao criar Notícia" });
    }
};

//Atualizar uma Notícia

const updateNews = async (req, res) => {
    try {
        const { name, place, image, text, URL } = req.body;
        const {id} = req.params
        const updatedNews = await newModel.updateNews(req.params.id, id, name, place, image, text, URL );
        if (!updatedNews) {
            return res.status(404).json({ message: "Notícia não encontrada" });
        }
        res.json({ message: "Notícia atualizada com sucesso!", updatedNews });
    } catch (error) {
        res.status(404).json({ message: "Erro ao atualizar Notícia" });
    }
};

module.exports = { getAllNews, getNewsById, createNews, updateNews };
