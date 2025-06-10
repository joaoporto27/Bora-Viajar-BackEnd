const express = require("express");
const router = express.Router();
const commentController = require("../controllers/commentController");
const apiKeyMiddleware = require("../config/apiKey");

router.use(apiKeyMiddleware);
/**
 * @swagger
 * tags:
 *  name: Comments
 *  description: Gerenciamento de comentários
 */

// Buscar todos os comentários
router.get("/comments", commentController.getAllComments);
/**
 * @swagger
 * /api/comments:
 *   get:
 *     summary: Lista todos os comentários
 *     tags: [Comments]
 *     responses:
 *       200:
 *         description: Comentários retornados com sucesso
 */

// Buscar um comentário pelo id
router.get("/comments/:id", commentController.getCommentById);
/**
 * @swagger
 * /api/comments/{id}:
 *   get:
 *     summary: Busca um comentário por ID
 *     tags: [Comments]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Comentário encontrado
 *       404:
 *         description: Comentário não encontrado
 */

// Criar um comentário
router.post("/comments", commentController.createComment);
/**
 * @swagger
 * /api/comments:
 *   post:
 *     summary: Cria um novo comentário
 *     tags: [Comments]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               post_id:
 *                 type: number
 *               user_id:
 *                 type: number
 *               comment:
 *                 type: string
 *     responses:
 *       201:
 *         description: Comentário criado com sucesso
 */

// Atualizar um comentário
router.put("/comments/:id", commentController.updateComment);
/**
 * @swagger
 * /api/comments/{id}:
 *   put:
 *     summary: Atualiza um comentário existente
 *     tags: [Comments]
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
 *               comment:
 *                 type: string
 *     responses:
 *       200:
 *         description: Comentário atualizado com sucesso
 */

// Deletar um comentário
router.delete("/comments/:id", commentController.deleteComment);
/**
 * @swagger
 * /api/comments/{id}:
 *   delete:
 *     summary: Deleta um comentário
 *     tags: [Comments]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Comentário deletado
 */

// Buscar comentários por post_id
router.get("/comments/post/:post_id", commentController.getCommentsByPostId);

module.exports = router;