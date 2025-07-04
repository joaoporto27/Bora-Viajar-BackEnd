require("dotenv").config();
const express = require("express");
const cors = require("cors");
const userRoutes = require("./src/routes/userRoutes");
const postRouter = require("./src/routes/postRoutes");
const commentsRouter = require("./src/routes/commentRoutes");
const regionRouter = require("./src/routes/regionRoutes");
const newRouter = require("./src/routes/newRoutes");
const feedbackRouter = require("./src/routes/feedbackRoutes");
const reportRoutes = require("./src/routes/reportRoutes");
const setupSwagger = require('./src/config/swagger');
const path = require("path");

const app = express();
app.use(cors());
app.use(express.json());
setupSwagger(app);
app.use("/uploads", express.static(path.join(__dirname, "uploads")));


app.use("/api", userRoutes);
app.use("/api", postRouter);
app.use("/api", reportRoutes);
app.use("/api", commentsRouter);
app.use("/api/regions", regionRouter);
app.use("/api/news", newRouter);
app.use("/api/feedbacks", feedbackRouter);

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
    console.log(`✈️  Servidor rodando em http://localhost:${PORT}`);
});
