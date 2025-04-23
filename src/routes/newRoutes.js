const express = require("express");
const router = express.Router();
const newController = require("../controllers/newController");

/**
 * @swagger
 * tags:
 *  name: News
 *  description: Gerenciamento de notícias
 */

// Rota para buscar todas as notícias

router.get("/", newController.getAllNews);
/**
 * @swagger
 * /api/news:
 *   get:
 *     summary: Lista todas as notícias
 *     tags: [News]
 *     responses:
 *       200:
 *         description: Notícias retornadas com sucesso
 */

// Rota para buscar uma notícia pelo id

router.get("/:id", newController.getNewsById);
/**
 * @swagger
 * /api/news/{id}:
 *   get:
 *     summary: Busca uma notícia por ID
 *     tags: [News]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: notícia encontrado
 *       404:
 *         description: notícia não encontrado
 */

// Rota para criar um notícia

router.post("/", newController.createNews);
/**
 * @swagger
 * /api/news:
 *   post:
 *     summary: Cria uma nova notícia
 *     tags: [News]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *               place:
 *                 type: string
 *               image:
 *                 type: string
 *               text:
 *                 type: string
 *               URL:
 *                 type: string
 *     responses:
 *       201:
 *         description: notícia criada com sucesso
 */

module.exports = router;