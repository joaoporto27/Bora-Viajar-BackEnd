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
        doc.fontSize(20).text("Relatório de Usuários", { align: "center" });
        doc.moveDown(); 

        // Cabeçalho da Tabela
        const tableTop = 130; 
        const rowHeight = 25; 
        const columnWidths = [200, 200, 200, 200, 200];
        let y = tableTop;
        
        doc.fontSize(12).font("Helvetica-Bold");
        doc.text("Nome", 50, y, { width: columnWidths[0], align: "left" });
        doc.text("Email", 250, y, { width: columnWidths[1], align: "left" });
        doc.text("Cidade", 450, y, { width: columnWidths[2], align: "left" });
        doc.text("Estado", 550, y, { width: columnWidths[3], align: "left" });
        doc.text("Tipo de usuário", 600, y, { width: columnWidths[4], align: "left" });
        doc.moveTo(50, y + rowHeight - 5).lineTo(700, y + rowHeight - 5).stroke(); 
        
        // Dados da Tabela
        doc.font("Helvetica");
        y += rowHeight;
        users.forEach((user) => {
            doc.text(user.name, 50, y, { width: columnWidths[0], align: "left" });
            doc.text(user.email, 250, y, { width: columnWidths[1], align: "left" });
            doc.text(user.city, 450, y, { width: columnWidths[2], align: "left" });
            doc.text(user.state, 550, y, { width: columnWidths[3], align: "left" });
            doc.text(user.type_user, 600, y, { width: columnWidths[4], align: "left" });
            y += rowHeight;
        
            doc.moveTo(50, y - 5).lineTo(700, y - 5).stroke();
        });

        doc.end();
    } catch (error) {
        console.error("Erro ao gerar o PDF:", error);
        res.status(500).json({ message: "Erro ao gerar o PDF" });
    }
};

// Função para gerar o PDF de posts
const exportPostPDF = async (req, res) => {
    try {
        const posts = await postModel.getPosts();

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=posts.pdf");

        const doc = new PDFDocument({ margin: 50, layout: 'landscape' });
        doc.pipe(res);

        // Título
        doc.fontSize(20).text("Relatório de posts", { align: "center" });
        doc.moveDown(); 

        // Cabeçalho da Tabela
        const tableTop = 130; 
        const rowHeight = 25; 
        const columnWidths = [200, 300, 200];
        let y = tableTop;
        
        doc.fontSize(12).font("Helvetica-Bold");
        doc.text("Usuário", 50, y, { width: columnWidths[0], align: "left" });
        doc.text("Descrição", 250, y, { width: columnWidths[1], align: "left" });
        doc.text("Etiqueta", 600, y, { width: columnWidths[2], align: "left" });
        doc.moveTo(50, y + rowHeight - 5).lineTo(700, y + rowHeight - 5).stroke(); 
        
        // Dados da Tabela
        doc.font("Helvetica");
        y += rowHeight;
        posts.forEach((post) => {
            doc.text(post.usuario, 50, y, { width: columnWidths[0], align: "left" });
            doc.text(post.description, 250, y, { width: columnWidths[1], align: "left" });
            doc.text(post.tag, 600, y, { width: columnWidths[2], align: "left" });
            y += rowHeight;
        
            doc.moveTo(50, y - 5).lineTo(700, y - 5).stroke();
        });

        doc.end();
    } catch (error) {
        console.error("Erro ao gerar o PDF:", error);
        res.status(500).json({ message: "Erro ao gerar o PDF" });
    }
};

const exportUserCSV = async (req, res) => {
    try {
        const users = await userModel.getUsers();

        res.setHeader("Content-Disposition", "attachment; filename=users.csv");
        res.setHeader("Content-Type", "text-csv");

        const csvStream = format({ headers: true });
        csvStream.pipe(res);

        users.forEach((user) => {
            csvStream.write({
                Id: user.id,
                Nome: user.name,
                Senha: user.password
            });
        });

        csvStream.end();
    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar o CSV" });
    }
};

const exportPostCSV = async (req, res) => {
    try {
        const posts = await postModel.getPosts();

        res.setHeader("Content-Disposition", "attachment; filename=posts.csv");
        res.setHeader("Content-Type", "text-csv");

        const csvStream = format({ headers: true });
        csvStream.pipe(res);

        posts.forEach((user) => {
            csvStream.write({
                Usuário: user.usuario,
                Descrição: user.description,
                Etiqueta: user.tag
            });
        });

        csvStream.end();
    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar o CSV" });
    }
};

module.exports = {  exportUserPDF, exportPostPDF, exportUserCSV, exportPostCSV };