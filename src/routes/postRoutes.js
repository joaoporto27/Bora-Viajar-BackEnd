const express = require("express");
const router = express.Router();
const postController = require("../controllers/postController");
const upload = require("./../config/upload.js");

/**
 * @swagger
 * tags:
 *  name: Posts
 *  description: Gerenciamento de posts
 */

// Rota para buscar todos os posts
router.get("/posts", postController.getAllPosts);
/**
 * @swagger
 * /api/posts:
 *   get:
 *     summary: Lista todas os posts
 *     tags: [Posts]
 *     responses:
 *       200:
 *         description: Posts retornados com sucesso
 */

// Rota para buscar um post pelo id
router.get("/posts/:id", postController.getPostById);
/**
 * @swagger
 * /api/posts/{id}:
 *   get:
 *     summary: Busca um post por ID
 *     tags: [Posts]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Post encontrado
 *       404:
 *         description: Post não encontrado
 */

// Rota para criar um post
router.post("/posts", upload.single("image"), postController.createPost);
/**
 * @swagger
 * /api/posts:
 *   post:
 *     summary: Cria um novo post
 *     tags: [Posts]
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               user_id:
 *                 type: number
 *               image:
 *                 type: string
 *               description:
 *                 type: string
 *               tag:
 *                 type: string
 *     responses:
 *       201:
 *         description: Post criado com sucesso
 */

// Rota para atualizar um post
router.put("/posts/:id", upload.single("image"), postController.updatePost);
/**
 * @swagger
 * /api/posts/{id}:
 *   put:
 *     summary: Atualiza um post existente
 *     tags: [Posts]
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
 *               image:
 *                 type: string
 *               description:
 *                 type: string
 *     responses:
 *       200:
 *         description: Post atualizado com sucesso
 */

// Rota para curtir um post
router.put("/posts-like/:id", postController.likePost);
/**
 * @swagger
 * /api/posts-like/{id}:
 *   put:
 *     summary: Curte um post existente
 *     tags: [Posts]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Post curtido com sucesso
 */

// Rota para deletar um post
router.delete("/posts/:id", postController.deletePost);
/**
 * @swagger
 * /api/posts/{id}:
 *   delete:
 *     summary: Deleta um Post
 *     tags: [Posts]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Post deletado
 */

module.exports = router;