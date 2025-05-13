const express = require("express");
const router = express.Router();
const reportController = require("./../controllers/reportController");

//Rota para gerar CSV
router.get("/report/users/csv", reportController.exportUserCSV);
router.get("/report/posts/csv", reportController.exportPostCSV);

//Rota para gerar PDF
router.get("/report/users/pdf", reportController.exportUserPDF);
router.get("/report/posts/pdf", reportController.exportPostPDF)

module.exports = router;