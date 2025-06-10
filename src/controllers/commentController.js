const commentModel = require('../models/commentModel');

// Buscar todos os comentários
const getAllComments = async (req, res) => {
    try {
        const comments = await commentModel.getComments();
        res.status(200).json(comments);
    } catch (error) {
        res.status(404).json({ message: 'Comentários não encontrados' });
    }
};

// Buscar um comentário pelo id
const getCommentById = async (req, res) => {
    try {
        const comment = await commentModel.getCommentById(req.params.id);
        if (!comment) {
            return res.status(404).json({ message: "Comentário não encontrado" });
        }
        res.json({ message: "Comentário encontrado com sucesso!", comment });
    } catch (error) {
        res.status(404).json({ message: "Comentário não encontrado" });
    }
};

// Criar um comentário
const createComment = async (req, res) => {
    try {
        const { post_id, user_id, comment } = req.body;
        const newComment = await commentModel.createComment(post_id, user_id, comment);
        res.status(201).json({ message: "Comentário criado com sucesso!", newComment });
    } catch (error) {
        console.error(error);
        res.status(404).json({ message: "Erro ao criar comentário" });
    }
};

// Atualizar um comentário
const updateComment = async (req, res) => {
    try {
        const { comment } = req.body;
        const updatedComment = await commentModel.updateComment(req.params.id, comment);
        if (!updatedComment) {
            return res.status(404).json({ message: "Comentário não encontrado" });
        }
        res.json({ message: "Comentário atualizado com sucesso!", updatedComment });
    } catch (error) {
        res.status(404).json({ message: "Erro ao atualizar comentário" });
    }
};

// Deletar um comentário
const deleteComment = async (req, res) => {
    try {
        const deletedComment = await commentModel.deleteComment(req.params.id);
        res.status(200).json({ message: "Comentário deletado com sucesso", deletedComment });
    } catch (error) {
        res.status(404).json({ message: "Erro ao deletar comentário" });
    }
};

const getCommentsByPostId = async (req, res) => {
    try {
        const postId = req.params.post_id;
        const comments = await commentModel.getCommentsByPostId(postId);
        if (!comments || comments.length === 0) {
            return res.status(404).json({ message: "Nenhum comentário encontrado para este post" });
        }
        res.status(200).json(comments);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar comentários" });
    }
}

module.exports = { getAllComments, getCommentById, createComment, updateComment, deleteComment, getCommentsByPostId };