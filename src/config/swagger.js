const swaggerJsdoc = require("swagger-jsdoc");
const swaggerUi = require("swagger-ui-express");

const options = {
    definition: {
        openapi: "3.0.0",
        info: {
            title: "Projeto: Bora Viajar! ✈️",
            version: "1.0.0",
            description:
                "API para o projeto Bora Viajar!",
        },
    },
    apis: ["./src/routes/*.js"], 
};

const swaggerSpec = swaggerJsdoc(options);

const setupSwagger = (app) => {
    app.use("/doc", swaggerUi.serve, swaggerUi.setup(swaggerSpec));
};

module.exports = setupSwagger;
