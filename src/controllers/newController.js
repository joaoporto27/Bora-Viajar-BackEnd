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
               res.json({ message: "Região encontrada com sucesso!", news });
    } catch (error) {
        res.status(404).json({ message: "Notícia não encontrada" });
    }
};


module.exports = { getAllNews, getNewsById };
