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
        const { name, place, text } = req.body;
        const image = req.file ? req.file.filename : null;
        const newNews = await newModel.createNews( name, place, text, image );
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
        const { name, place, text } = req.body;
        const image = req.file ? req.file.filename : null;
        const updatedNews = await newModel.updateNews(req.params.id, name, place, text, image );
        if (!updatedNews) {
            return res.status(404).json({ message: "Notícia não encontrada" });
        }
        res.json({ message: "Notícia atualizada com sucesso!", updatedNews });
    } catch (error) {
        res.status(404).json({ message: "Erro ao atualizar Notícia" });
    }
};

//Deletar um notícia

const deleteNews = async (req, res) => {
    try {
        const deletedNews = await newModel.deleteNews(req.params.id);
        res.status(200).json({ message: "Notícia deletada com sucesso", deletedNews });
    } catch (error) {
        res.status(404).json({ message: "Erro ao deletar notícia" });
    }
};

module.exports = { getAllNews, getNewsById, createNews, updateNews, deleteNews };
