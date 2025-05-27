const feedbackModel = require("../models/feedbackModel");

//Buscar todos os feedbacks

const getAllFeedbacks = async (req, res) => {
    try {
        const feedbacks = await feedbackModel.getAllFeedbacks();
        res.status(200).json(feedbacks);
    } catch (error) {
        res.status(404).json({ message: "Feedbacks não encontrados" });
    }
};

//Buscar um feedback pelo id

const getFeedbacksById = async (req, res) => {
    try {
         const feedbacks = await feedbackModel.getFeedbacksById(req.params.id);
               res.json({ message: "Feedback encontrado com sucesso!", feedbacks });
    } catch (error) {
        res.status(404).json({ message: "Feedback não encontrada" });
    }
};

//Criar um feedback

const createFeedback = async (req, res) => {
    try {
        const { user_id, feedback, rating } = req.body;
        const newFeedback = await feedbackModel.createFeedback( user_id, feedback, rating );
        res.status(201).json({ message: "Feedback criado com sucesso", newFeedback });
    } catch (error) {
        res.status(404).json({ message: "Erro ao criar Feedback" });
    }
};

//Atualizar um feedback

const updateFeedback = async (req, res) => {
    try {
        const { user_id, feedback, rating } = req.body;
        const {id} = req.params;
        const updatedFeedback = await feedbackModel.updateFeedback(id, user_id, feedback, rating);
        if (!updatedFeedback) {
            return res.status(404).json({ message: "Feedback não encontrado" });
        }
        res.json({ message: "Feedback atualizado com sucesso!", updatedFeedback });
    } catch (error) {
        res.status(404).json({ message: "Erro ao atualizar Feedback" });
    }
};

//Deletar um feedback

const deleteFeedback = async (req, res) => {
    try {
        const deletedFeedback = await feedbackModel.deleteFeedback(req.params.id);
        res.status(200).json({ message: "Feedback deletado com sucesso", deletedFeedback });
    } catch (error) {
        res.status(404).json({ message: "Erro ao deletar Feedback" });
    }
};

module.exports = { getAllFeedbacks, getFeedbacksById, createFeedback, updateFeedback, deleteFeedback };
