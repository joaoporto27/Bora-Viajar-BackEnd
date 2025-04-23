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
 *         description: Regiões retornadas com sucesso
 */

module.exports = router;