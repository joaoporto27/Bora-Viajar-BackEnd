const { format } = require("@fast-csv/format");
const PDFDocument = require("pdfkit");

const userModel = require("../models/userModel");
const postModel = require("../models/postModel");
const commentModel = require("../models/commentModel");
const regionModel = require("../models/regionModel");
const newModel = require("../models/newModel");

// Função para gerar documento PDF
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
        const tableTop = 110;
        const rowHeight = 25;
        const columnWidths = [200, 200, 200, 200, 200];
        let y = tableTop;

        const drawTableHeader = () => {
            doc.fontSize(12).font("Helvetica-Bold");
            doc.text("Nome", 50, y, { width: columnWidths[0], align: "left" });
            doc.text("Email", 240, y, { width: columnWidths[1], align: "left" });
            doc.text("Cidade", 450, y, { width: columnWidths[2], align: "left" });
            doc.text("Estado", 550, y, { width: columnWidths[3], align: "left" });
            doc.text("Tipo de usuário", 600, y, { width: columnWidths[4], align: "left" });
            doc.moveTo(50, y + rowHeight - 5).lineTo(730, y + rowHeight - 5).stroke();
        };

        drawTableHeader();

        const checkPageOverflow = () => {
            if (y + rowHeight > doc.page.height - 50) {
                doc.addPage();
                y = tableTop;
                drawTableHeader();
                y += rowHeight; 
                doc.font("Helvetica");
            }
        };

        // Dados da tabela
        doc.font("Helvetica");
        y += rowHeight;
        users.forEach((user) => {
            checkPageOverflow(); 
            doc.text(user.name, 50, y, { width: columnWidths[0], align: "left" });
            doc.text(user.email, 240, y, { width: columnWidths[1], align: "left" });
            doc.text(user.city, 450, y, { width: columnWidths[2], align: "left" });
            doc.text(user.state, 550, y, { width: columnWidths[3], align: "left" });
            doc.text(user.type_user, 600, y, { width: columnWidths[4], align: "left" });
            y += rowHeight;
        
            doc.moveTo(50, y - 5).lineTo(730, y - 5).stroke();
        });

        doc.end();
    } catch (error) {
        console.error("Erro ao gerar o PDF:", error);
        res.status(500).json({ message: "Erro ao gerar o PDF" });
    }
};

const exportPostPDF = async (req, res) => {
    try {
        const posts = await postModel.getPosts();

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=posts.pdf");

        const doc = new PDFDocument({ margin: 50, layout: 'landscape' });
        doc.pipe(res);

        // Título
        doc.fontSize(20).text("Relatório de Posts", { align: "center" });
        doc.moveDown();

        // Cabeçalho da Tabela
        const tableTop = 110;
        const rowHeight = 55;
        const columnWidths = [200, 300, 200];
        let y = tableTop;

        const drawTableHeader = () => {
            doc.fontSize(12).font("Helvetica-Bold");
            doc.text("Usuário", 50, y, { width: columnWidths[0], align: "left" });
            doc.text("Descrição", 240, y, { width: columnWidths[1], align: "left" });
            doc.text("Etiqueta", 600, y, { width: columnWidths[2], align: "left" });
            doc.moveTo(50, y + rowHeight - 5).lineTo(730, y + rowHeight - 5).stroke();
        };

        drawTableHeader();

        const checkPageOverflow = () => {
            if (y + rowHeight > doc.page.height - 50) {
                doc.addPage();
                y = tableTop;
                drawTableHeader();
                y += rowHeight; 
                doc.font("Helvetica");
            }
        };

        // Dados da tabela
        doc.font("Helvetica");
        y += rowHeight;
        posts.forEach((post) => {
            checkPageOverflow(); 
            doc.text(post.usuario, 50, y, { width: columnWidths[0], align: "left" });
            doc.text(post.description, 240, y, { width: columnWidths[1], align: "left" });
            doc.text(post.tag, 600, y, { width: columnWidths[2], align: "left" });
            y += rowHeight;
        
            doc.moveTo(50, y - 5).lineTo(730, y - 5).stroke();
        });

        doc.end();
    } catch (error) {
        console.error("Erro ao gerar o PDF:", error);
        res.status(500).json({ message: "Erro ao gerar o PDF" });
    }
};

const exportCommentPDF = async (req, res) => {
    try {
        const comments = await commentModel.getComments();

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=comments.pdf");

        const doc = new PDFDocument({ margin: 50, layout: 'landscape' });
        doc.pipe(res);

        // Título
        doc.fontSize(20).text("Relatório de Comentários", { align: "center" });
        doc.moveDown();

        // Cabeçalho da Tabela
        const tableTop = 110;
        const rowHeight = 55;
        const columnWidths = [300, 100, 200];
        let y = tableTop;

        const drawTableHeader = () => {
            doc.fontSize(12).font("Helvetica-Bold");
            doc.text("Post", 50, y, { width: columnWidths[0], align: "left" });
            doc.text("Usuário", 380, y, { width: columnWidths[1], align: "left" });
            doc.text("Comentário", 530, y, { width: columnWidths[2], align: "left" });
            doc.moveTo(50, y + rowHeight - 5).lineTo(730, y + rowHeight - 5).stroke();
        };

        drawTableHeader();

        const checkPageOverflow = () => {
            if (y + rowHeight > doc.page.height - 50) {
                doc.addPage();
                y = tableTop;
                drawTableHeader();
                y += rowHeight; 
                doc.font("Helvetica");
            }
        };

        // Dados da tabela
        doc.font("Helvetica");
        y += rowHeight;
        comments.forEach((comment) => {
            checkPageOverflow(); 
            doc.text(comment.description, 50, y, { width: columnWidths[0], align: "left" });
            doc.text(comment.usuario, 380, y, { width: columnWidths[1], align: "left" });
            doc.text(comment.comentario, 530, y, { width: columnWidths[2], align: "left" });
            y += rowHeight;
        
            doc.moveTo(50, y - 5).lineTo(730, y - 5).stroke();
        });

        doc.end();
    } catch (error) {
        console.error("Erro ao gerar o PDF:", error);
        res.status(500).json({ message: "Erro ao gerar o PDF" });
    }
};

const exportRegionPDF = async (req, res) => {
    try {
        const regions = await regionModel.getRegions();

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=regions.pdf");

        const doc = new PDFDocument({ margin: 50, layout: 'landscape' });
        doc.pipe(res);

        // Título
        doc.fontSize(20).text("Relatório de Regiões", { align: "center" });
        doc.moveDown();

        // Cabeçalho da Tabela
        const tableTop = 110;
        const rowHeight = 90;
        const columnWidths = [100, 50, 250, 230];
        let y = tableTop;

        const drawTableHeader = () => {
            doc.fontSize(12).font("Helvetica-Bold");
            doc.text("Cidade", 50, y, { width: columnWidths[0], align: "left" });
            doc.text("Estado", 130, y, { width: columnWidths[1], align: "left" });
            doc.text("Texto", 210, y, { width: columnWidths[2], align: "left" });
            doc.text("Link", 500, y, { width: columnWidths[3], align: "left" });
            doc.moveTo(50, y + rowHeight - 5).lineTo(730, y + rowHeight - 5).stroke();
        };

        drawTableHeader();

        const checkPageOverflow = () => {
            if (y + rowHeight > doc.page.height - 50) {
                doc.addPage();
                y = tableTop;
                drawTableHeader();
                y += rowHeight; 
                doc.font("Helvetica");
            }
        };

        // Dados da tabela
        doc.font("Helvetica");
        y += rowHeight;
        regions.forEach((region) => {
            checkPageOverflow(); 
            doc.text(region.name, 50, y, { width: columnWidths[0], align: "left" });
            doc.text(region.state, 130, y, { width: columnWidths[1], align: "left" });
            doc.text(region.text, 210, y, { width: columnWidths[2], align: "left" });
            doc.text(region.links, 500, y, { width: columnWidths[3], align: "left" });
            y += rowHeight;
        
            doc.moveTo(50, y - 5).lineTo(730, y - 5).stroke();
        });

        doc.end();
    } catch (error) {
        console.error("Erro ao gerar o PDF:", error);
        res.status(500).json({ message: "Erro ao gerar o PDF" });
    }
};

const exportNewPDF = async (req, res) => {
    try {
        const news = await newModel.getNews();

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=news.pdf");

        const doc = new PDFDocument({ margin: 50, layout: 'landscape' });
        doc.pipe(res);

        // Título
        doc.fontSize(20).text("Relatório de Regiões", { align: "center" });
        doc.moveDown();

        // Cabeçalho da Tabela
        const tableTop = 110;
        const rowHeight = 100;
        const columnWidths = [100, 50, 500];
        let y = tableTop;

        const drawTableHeader = () => {
            doc.fontSize(12).font("Helvetica-Bold");
            doc.text("Titulo", 50, y, { width: columnWidths[0], align: "left" });
            doc.text("Lugar", 150, y, { width: columnWidths[1], align: "left" });
            doc.text("Texto", 240, y, { width: columnWidths[2], align: "left" });
            doc.moveTo(50, y + rowHeight - 5).lineTo(730, y + rowHeight - 5).stroke();
        };

        drawTableHeader();

        const checkPageOverflow = () => {
            if (y + rowHeight > doc.page.height - 50) {
                doc.addPage();
                y = tableTop;
                drawTableHeader();
                y += rowHeight; 
                doc.font("Helvetica");
            }
        };

        // Dados da tabela
        doc.font("Helvetica");
        y += rowHeight;
        news.forEach((news) => {
            checkPageOverflow(); 
            doc.text(news.name, 50, y, { width: columnWidths[0], align: "left" });
            doc.text(news.place, 150, y, { width: columnWidths[1], align: "left" });
            doc.text(news.text, 240, y, { width: columnWidths[2], align: "left" });
            y += rowHeight;
        
            doc.moveTo(50, y - 5).lineTo(730, y - 5).stroke();
        });

        doc.end();
    } catch (error) {
        console.error("Erro ao gerar o PDF:", error);
        res.status(500).json({ message: "Erro ao gerar o PDF" });
    }
};

// Função para gerar documento CSV 
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

const exportCommentCSV = async (req, res) => {
    try {
        const comments = await commentModel.getComments();

        res.setHeader("Content-Disposition", "attachment; filename=comments.csv");
        res.setHeader("Content-Type", "text-csv");

        const csvStream = format({ headers: true });
        csvStream.pipe(res);

        comments.forEach((comment) => {
            csvStream.write({
                Post: comment.description,
                Usuário: comment.usuario,
                Comentário: comment.comentario
            });
        });

        csvStream.end();
    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar o CSV" });
    }
};

const exportRegionCSV = async (req, res) => {
    try {
        const regions = await regionModel.getRegions();

        res.setHeader("Content-Disposition", "attachment; filename=regions.csv");
        res.setHeader("Content-Type", "text-csv");

        const csvStream = format({ headers: true });
        csvStream.pipe(res);

        regions.forEach((region) => {
            csvStream.write({
                Cidade: region.name,
                Estado: region.state,
                Texto: region.text,
                Link: region.links,
            });
        });

        csvStream.end();
    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar o CSV" });
    }
};

const exportNewCSV = async (req, res) => {
    try {
        const news = await newModel.getNews();

        res.setHeader("Content-Disposition", "attachment; filename=news.csv");
        res.setHeader("Content-Type", "text-csv");

        const csvStream = format({ headers: true });
        csvStream.pipe(res);

        news.forEach((news) => {
            csvStream.write({
                Titulo: news.name,
                Lugar: news.state,
                Texto: news.text,
            });
        });

        csvStream.end();
    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar o CSV" });
    }
};

module.exports = {  exportUserPDF, exportPostPDF, exportCommentPDF, exportRegionPDF, exportNewPDF, exportUserCSV, exportPostCSV, exportCommentCSV, exportRegionCSV, exportNewCSV };