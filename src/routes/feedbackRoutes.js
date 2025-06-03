const express = require("express");
const router = express.Router();
const feedbackController = require("../controllers/feedbackController");
const apiKeyMiddleware = require("../config/apiKey");

router.use(apiKeyMiddleware);
/**
 * @swagger
 * tags:
 *   name: Feedbacks
 *   description: Gerenciamento de feedbacks
 */

// Rota para buscar todos os feedbacks
router.get("/", feedbackController.getAllFeedbacks);
/**
 * @swagger
 * /api/feedbacks:
 *   get:
 *     summary: Lista todos os feedbacks
 *     tags: [Feedbacks]
 *     responses:
 *       200:
 *         description: Feedbacks retornados com sucesso
 */

// Rota para buscar um feedback pelo ID
router.get("/:id", feedbackController.getFeedbacksById);
/**
 * @swagger
 * /api/feedbacks/{id}:
 *   get:
 *     summary: Busca um feedback por ID
 *     tags: [Feedbacks]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Feedback encontrado
 *       404:
 *         description: Feedback não encontrado
 */

// Rota para criar um feedback
router.post("/", feedbackController.createFeedback);
/**
 * @swagger
 * /api/feedbacks:
 *   post:
 *     summary: Cria um novo feedback
 *     tags: [Feedbacks]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - user_id
 *               - feedback
 *               - rating
 *             properties:
 *               user_id:
 *                 type: integer
 *               feedback:
 *                 type: string
 *               rating:
 *                 type: integer
 *                 minimum: 1
 *                 maximum: 5
 *     responses:
 *       201:
 *         description: Feedback criado com sucesso
 */

// Rota para atualizar um feedback
router.put("/:id", feedbackController.updateFeedback);
/**
 * @swagger
 * /api/feedbacks/{id}:
 *   put:
 *     summary: Atualiza um feedback existente
 *     tags: [Feedbacks]
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
 *               user_id:
 *                 type: integer
 *               feedback:
 *                 type: string
 *               rating:
 *                 type: integer
 *                 minimum: 1
 *                 maximum: 5
 *     responses:
 *       200:
 *         description: Feedback atualizado com sucesso
 *       404:
 *         description: Feedback não encontrado
 *       500:
 *         description: Erro ao atualizar o feedback
 */

// Rota para deletar um feedback
router.delete("/:id", feedbackController.deleteFeedback);
/**
 * @swagger
 * /api/feedbacks/{id}:
 *   delete:
 *     summary: Deleta um feedback
 *     tags: [Feedbacks]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Feedback deletado com sucesso
 *       404:
 *         description: Feedback não encontrado
 */

module.exports = router;