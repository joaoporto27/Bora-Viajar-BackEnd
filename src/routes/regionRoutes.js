const express = require("express");
const router = express.Router();
const regionController = require("../controllers/regionController");

/**
 * @swagger
 * tags:
 *  name: Regions
 *  description: Gerenciamento de regiões
 */

// Rota para buscar todas as regiões

router.get("/", regionController.getAllRegions);
/**
 * @swagger
 * /api/regions:
 *   get:
 *     summary: Lista todas as regiões
 *     tags: [Regions]
 *     responses:
 *       200:
 *         description: Regiões retornadas com sucesso
 */


// Rota para buscar uma região pelo id

router.get("/:id", regionController.getRegionById);
/**
 * @swagger
 * /api/regions/{id}:
 *   get:
 *     summary: Busca uma região por ID
 *     tags: [Regions]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: região encontrado
 *       404:
 *         description: região não encontrado
 */

// Rota para criar um região

router.post("/", regionController.createRegion);
/**
 * @swagger
 * /api/regions:
 *   post:
 *     summary: Cria uma nova região
 *     tags: [Regions]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *               state:
 *                 type: string
 *               image:
 *                 type: string
 *               text:
 *                 type: string
 *               links:
 *                 type: string
 *     responses:
 *       201:
 *         description: região criada com sucesso
 */

// Rota para atualizar uma região

router.put("/:id", regionController.updateRegion);
/**
 * @swagger
 * /api/regions/{id}:
 *   put:
 *     summary: Atualiza uma região existente
 *     tags: [Regions]
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
 *               state:
 *                 type: string
 *               image:
 *                 type: string
 *               text:
 *                 type: string
 *               links:
 *                 type: string
 *     responses:
 *       200:
 *         description: Região atualizada com sucesso
 *       404:
 *         description: Região não encontrada
 *       500:
 *         description: Erro ao atualizar a região
 */

// Rota para deletar um região

router.delete("/:id", regionController.deleteRegion);
/**
 * @swagger
 * /api/regions/{id}:
 *   delete:
 *     summary: Deleta uma região
 *     tags: [Regions]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: região deletada
 */

module.exports = router;