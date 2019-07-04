const express = require("express");
const pool = require("../pool.js");
var router = express.Router();


router.get("/game", (req, res) => {
  pool.query("SELECT * FROM ubi_game", (err,result) =>{
    if (err) throw err;
    res.send(result);
  })
})



module.exports = router;