require("dotenv").config();
const express = require("express");
const cors = require("cors");
const userRoutes = require("./src/routes/userRoutes");
//const postsRouter = require("./src/routes/postsRouter");
//const regionsRouter = require("./src/routes/regionsRouter");
//const commentsRouter = require("./src/routes/commentsRouter");
//const newsRouter = require("./src/routes/newsRouter")
const setupSwagger = require('./src/config/swagger');

const app = express();
app.use(cors());
app.use(express.json());
setupSwagger(app);

app.use("/api", userRoutes);
//app.use("/api/posts", postsRouter);
//app.use("/api/regions", regionsRouter);
//app.use("/api/comments", commentsRouter);
//app.use("/api/news", newsRouter)

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor rodando em http://localhost:${PORT}`);
});
