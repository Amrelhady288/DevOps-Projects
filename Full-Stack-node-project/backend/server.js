const express = require("express");
const app = express();

app.get("/", (req, res) => {
    res.json({
        message: "DevOps Project is Running 🚀",
        status: "OK"
    });
});

app.get("/health", (req, res) => {
    res.json({ status: "healthy" });
});

app.listen(3000, () => {
    console.log("Server running on port 3000");
});
