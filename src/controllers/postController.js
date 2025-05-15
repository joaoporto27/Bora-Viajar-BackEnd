const postModel = require("../models/postModel");

//Buscar todos os posts
const getAllPosts = async (req, res) => {
    try {
        const { tag } = req.query; 
        const posts = await postModel.getPosts(tag);
        res.status(200).json(posts);
    } catch (error) {
        res.status(404).json({ message: "Não foi possível rodar a Timeline" });
    }
};

//Buscar um post pelo id
const getPostById = async (req, res) => {
    try {
        const post = await postModel.getPostById(req.params.id);
        if (!post) {
            return res.status(404).json({ message: "Post não encontrado" });
        }
        res.json({ message: "Post encontrado com sucesso!", post });
    } catch (error) {
        res.status(404).json({ message: "Post não encontrado" });
    }
};

//Criar um post
const createPost = async (req, res) => {
    try {
        const image = req.file ? req.file.filename : null;
        const { user_id, description, tag} = req.body;
        const newPost = await postModel.createPost(user_id, image, description, tag);
        res.status(201).json({ message: "Post criado com sucesso!", newPost });
    } catch (error) {
        if (error.code === "23505") {
            return res.status(409).json({ message: "Post já cadastrado" });
        }
        res.status(404).json({ message: "Erro ao criar post" });
    }
};

//Atualizar um post
const updatePost = async (req, res) => {
    try {
        const { image, description } = req.body;
        const updatedPost = await postModel.updatePost(req.params.id, image, description);
        if (!updatedPost) {
            return res.status(404).json({ message: "Post não encontrado" });
        }
        res.json({ message: "Post atualizado com sucesso!", updatedPost });
    } catch (error) {
        res.status(404).json({ message: "Erro ao atualizar post" });
    }
};

//Curtir um post
const likePost = async (req, res) => {
    try {
        const likedPost = await postModel.likePost(req.params.id);
        if (!likedPost) {
            return res.status(404).json({ message: "Post não encontrado" });
        }
        res.json({ message: "Post curtido com sucesso!", likedPost });
    } catch (error) {
        res.status(404).json({ message: "Erro ao curtir post" });
    }
};

//Deletar um post
const deletePost = async (req, res) => {
    try {
        const deletedPost = await postModel.deletePost(req.params.id);
        res.status(200).json({ message: "Post deletado com sucesso", deletedPost });
    } catch (error) {
        res.status(404).json({ message: "Erro ao deletar post" });
    }
};

module.exports = { getAllPosts, getPostById, createPost, updatePost, likePost, deletePost };