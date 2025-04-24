const { format } = require("@fast-csv/format");
const PDFDocument = require("pdfkit");

const userModel = require("../models/userModel");
const postModel = require("../models/postModel");

// Função para gerar o PDF de usuários
const exportUserPDF = async (req, res) => {
    try {
        const users = await userModel.getUsers();

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=users.pdf");

        const doc = new PDFDocument({ margin: 50, layout: 'landscape' });
        doc.pipe(res);

        // Título
        doc.fontSize(20).font("Helvetica-Bold").text("Relatório de Usuários", { align: "center" });
        doc.moveDown();

        // Cabeçalho da Tabela
        const tableTop = 130;
        const rowHeight = 30;
        const columnWidths = [50, 150, 200, 100, 100, 100];
        const columnPositions = [50, 100, 250, 470, 580, 650];
        let y = tableTop;

        doc.fontSize(12).font("Helvetica-Bold");
        doc.text("ID", columnPositions[0], y, { width: columnWidths[0], align: "left" });
        doc.text("Name", columnPositions[1], y, { width: columnWidths[1], align: "left" });
        doc.text("Email", columnPositions[2], y, { width: columnWidths[2], align: "left" });
        doc.text("City", columnPositions[3], y, { width: columnWidths[3], align: "left" });
        doc.text("State", columnPositions[4], y, { width: columnWidths[4], align: "left" });
        doc.text("Type User", columnPositions[5], y, { width: columnWidths[5], align: "left" });
        doc.moveTo(50, y + rowHeight - 5).lineTo(750, y + rowHeight - 5).stroke(); // Ajuste na largura e posição

        // Dados da Tabela
        doc.font("Helvetica");
        y += rowHeight;
        users.forEach((user) => {
            if (y + rowHeight > 750) {
                doc.addPage();
                y = 50;

                doc.fontSize(12).font("Helvetica-Bold");
                doc.text("ID", columnPositions[0], y, { width: columnWidths[0], align: "left" });
                doc.text("Name", columnPositions[1], y, { width: columnWidths[1], align: "left" });
                doc.text("Email", columnPositions[2], y, { width: columnWidths[2], align: "left" });
                doc.text("City", columnPositions[3], y, { width: columnWidths[3], align: "left" });
                doc.text("State", columnPositions[4], y, { width: columnWidths[4], align: "left" });
                doc.text("Type User", columnPositions[5], y, { width: columnWidths[5], align: "left" });
                doc.moveTo(50, y + rowHeight - 5).lineTo(800, y + rowHeight - 5).stroke();
                y += rowHeight;
            }

            doc.font("Helvetica");
            doc.text(user.id, columnPositions[0], y, { width: columnWidths[0], align: "left" });
            doc.text(user.name, columnPositions[1], y, { width: columnWidths[1], align: "left" });
            doc.text(user.email, columnPositions[2], y, { width: columnWidths[2], align: "left" });
            doc.text(user.city, columnPositions[3], y, { width: columnWidths[3], align: "left" });
            doc.text(user.state, columnPositions[4], y, { width: columnWidths[4], align: "left" });
            doc.text(user.type_user, columnPositions[5], y, { width: columnWidths[5], align: "left" });
            y += rowHeight;

            doc.moveTo(50, y - 2).lineTo(750, y - 2).stroke();
        });

        doc.end();
    } catch (error) {
        console.error("Erro ao gerar o PDF:", error);
        res.status(500).json({ message: "Erro ao gerar o PDF" });
    }
};

// Função para gerar o PDF de posts
const exportPotsPDF = async (req, res) => {
    try {
        const posts = await postModel.getPosts();

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=posts.pdf");

        const doc = new PDFDocument();
        doc.pipe(res);

        // Título
        doc.fontSize(20).text("Relatório de Posts", { align: "center" });
        doc.moveDown(); 

        // Cabeçalho da Tabela
        const tableTop = 150;
        const rowHeight = 20;
        const rowHeightTable = 130;
        const columnWidths = [50, 100, 150, 100, 100];
        let y = tableTop;

        doc.fontSize(12).font("Helvetica-Bold");
        doc.text("Id", 50, y, { width: columnWidths[0], align: "left" });
        doc.text("Image", 100, y, { width: columnWidths[1], align: "left" });
        doc.text("Description", 220, y, { width: columnWidths[2], align: "left" });
        doc.text("Add Person", 400, y, { width: columnWidths[3], align: "left" });
        doc.text("Localization", 500, y, { width: columnWidths[4], align: "left" });
        doc.moveTo(50, y + rowHeight - 5).lineTo(600, y + rowHeight - 5).stroke(); 

        // Dados da Tabela
        doc.font("Helvetica");
        y += rowHeight;
        posts.forEach((post) => {
            doc.text(post.id, 50, y, { width: columnWidths[0], align: "left" });
            doc.text(post.image, 100, y, { width: columnWidths[1], align: "left" });
            doc.text(post.description, 220, y, { width: columnWidths[2], align: "left" });
            doc.text(post.add_person, 400, y, { width: columnWidths[3], align: "left" });
            doc.text(post.localization, 500, y, { width: columnWidths[4], align: "left" });
            y += rowHeightTable;
            
            doc.moveTo(50, y - 5).lineTo(600, y - 5).stroke();
        });

        doc.end();
    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar o PDF" });
    }
};

module.exports = {  exportUserPDF, exportPotsPDF };