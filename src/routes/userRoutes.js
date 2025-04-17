const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController");

// Rota para buscar todos os usuários
router.get("/users", userController.getAllUsers);
// Rota para buscar um usuário pelo id
router.get("/users/:id", userController.getUserById);
// Rota para criar um usuário
router.post("/users", userController.createUser);
// Rota para atualizar um usuário
router.put("/users/:id", userController.updateUser);
// Rota para deletar um usuário
router.delete("/users/:id", userController.deleteUser);

module.exports = router;