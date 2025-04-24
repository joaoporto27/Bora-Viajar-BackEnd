const userModel = require("../models/userModel");

//Buscar todos os usuários
const getAllUsers = async (req, res) => {
    try {
        const users = await userModel.getUsers();
        res.status(200).json(users);
    } catch (error) {
        res.status(404).json({ message: "Usuários não encontrados" });
    }
};

//Buscar um usuário pelo id
const getUserById = async (req, res) => {
    try {
        const user = await userModel.getUserById(req.params.id);
        if (!user) {
            return res.status(404).json({ message: "Usuário não encontrado" });
        }
        res.json({ meaasge: "Usuário encontrado com sucesso!", user });
    } catch (error) {
        res.status(404).json({ message: "Usuário não encontrado" });
    }
};

//Criar um usuário
const createUser = async (req, res) => {
    try {
        const { name, email, city, state, type_user ,password } = req.body;
        if (!email.includes("@gmail.com" || "@hotmail.com" || "@outlook.com")) {
            return res.status(400).json({ message: "Email inválido, deve conter @gmail.com, @hotmail.com ou outlook.com" });
        }
        if (password.length < 6 || password.length > 20){
            return res.status(400).json({ message: "Senha deve conter somente entre 6 a 20 caracteres"})
        }
        if (password.includes(" ")) {
            return res.status(400).json({ message: "Senha não pode conter espaços" });
        }
        if (!password.includes("@") && !password.includes("#") && !password.includes("$") && !password.includes("%") && !password.includes("&")) {
            return res.status(400).json({ message: "Senha deve conter pelo menos um caractere especial (@,!,#,$,%,&)" });
        }
        const newUser = await userModel.createUser(name, email, city, state, type_user, password);
        res.status(201).json({ message: "Bem vindo a Bora Viajar!", newUser });
    } catch (error) {
        console.error(error);
        if (error.code === "23505") {
            return res.status(409).json({ message: "Email já cadastrado" });
        }
        res.status(404).json({ message: "Erro ao criar usuário" });
    }
};

//Atualizar um usuário
const updateUser = async (req, res) => {
    try {
        const { password } = req.body;
        const updatedUser = await userModel.updateUser(req.params.id, password);
        if (!updatedUser) {
            return res.status(404).json({ message: "Usuário não encontrado" });
        }
        res.json({ message: "Email ou senha atualizado com sucesso!", updatedUser });
    } catch (error) {
        res.status(404).json({ message: "Erro ao atualizar email ou senha" });
    }
};

//Deletar um usuário
const deleteUser = async (req, res) => {
    try {
        const deletedUser = await userModel.deleteUser(req.params.id);
        res.status(200).json({ message: "Usuário deletado com sucesso", deletedUser });
    } catch (error) {
        res.status(404).json({ message: "Erro ao deletar usuário" });
    }
};

module.exports = { getAllUsers, getUserById, createUser, updateUser, deleteUser };