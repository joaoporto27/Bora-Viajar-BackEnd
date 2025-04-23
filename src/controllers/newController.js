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

module.exports = { getAllNews };
