const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController");

/**
 * @swagger
 * tags:
 *  name: Users
 *  description: Gerenciamento de usuários
 */

// Rota para buscar todos os usuários
router.get("/users", userController.getAllUsers);
/**
 * @swagger
 * /api/users:
 *   get:
 *     summary: Lista todas os usuários
 *     tags: [Users]
 *     responses:
 *       200:
 *         description: Usuários retornados com sucesso
 */

// Rota para buscar um usuário pelo id
router.get("/users/:id", userController.getUserById);
/**
 * @swagger
 * /api/users/{id}:
 *   get:
 *     summary: Busca um usuário por ID
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Usuário encontrado
 *       404:
 *         description: Usuário não encontrado
 */

// Rota para criar um usuário
router.post("/users", userController.createUser);
/**
 * @swagger
 * /api/users:
 *   post:
 *     summary: Cria um novo usuário
 *     tags: [Users]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *               email:
 *                 type: string
 *               city:
 *                 type: string
 *               state:
 *                 type: string
 *               password:
 *                 type: string
 *     responses:
 *       201:
 *         description: Usuário criado com sucesso
 */

// Rota para atualizar um usuário
router.put("/users/:id", userController.updateUser);
/**
 * @swagger
 * /api/users/{id}:
 *   put:
 *     summary: Atualiza um usuário existente
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               password:
 *                 type: string
 *     responses:
 *       200:
 *         description: Usuário atualizado com sucesso
 */

// Rota para deletar um usuário
router.delete("/users/:id", userController.deleteUser);
/**
 * @swagger
 * /api/users/{id}:
 *   delete:
 *     summary: Deleta um Usuário
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Usuário deletado
 */

module.exports = router;