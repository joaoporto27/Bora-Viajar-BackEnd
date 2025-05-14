const express = require("express");
const router = express.Router();
const reportController = require("./../controllers/reportController");

//Rota para gerar CSV
router.get("/report/users/csv", reportController.exportUserCSV);
router.get("/report/posts/csv", reportController.exportPostCSV);
router.get("/report/comments/csv", reportController.exportCommentCSV);
router.get("/report/regions/csv", reportController.exportRegionCSV);
router.get("/report/news/csv", reportController.exportNewCSV);

//Rota para gerar PDF
router.get("/report/users/pdf", reportController.exportUserPDF);
router.get("/report/posts/pdf", reportController.exportPostPDF);
router.get("/report/comments/pdf", reportController.exportCommentPDF);
router.get("/report/regions/pdf", reportController.exportRegionPDF);
router.get("/report/news/pdf", reportController.exportNewPDF);

module.exports = router;