const express = require("express");
const router = express.Router();
const newController = require("../controllers/newController");
const upload = require("./../config/upload.js");
const apiKeyMiddleware = require("../config/apiKey");

router.use(apiKeyMiddleware);
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

router.post("/", upload.single("image"), newController.createNews);
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
 *               text:
 *                 type: string
 *     responses:
 *       201:
 *         description: notícia criada com sucesso
 */

// Rota para atualizar uma notícia

router.put("/:id", upload.single("image"), newController.updateNews);
/**
 * @swagger
 * /api/news/{id}:
 *   put:
 *     summary: Atualiza uma notícia existente
 *     tags: [News]
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
 *               name:
 *                 type: string
 *               place:
 *                 type: string
 *               text:
 *                 type: string
 *     responses:
 *       200:
 *         description: Notícia atualizada com sucesso
 *       404:
 *         description: Notícia não encontrada
 *       500:
 *         description: Erro ao atualizar a Notícia
 */

// Rota para deletar um notícia

router.delete("/:id", newController.deleteNews);
/**
 * @swagger
 * /api/news/{id}:
 *   delete:
 *     summary: Deleta uma notícia
 *     tags: [News]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: notícia deletada
 */

module.exports = router;