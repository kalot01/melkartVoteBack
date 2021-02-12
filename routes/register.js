var express = require("express");
var router = express.Router();
var bcrypt = require("bcrypt");
var con = require("../config/dbConfig");
var passport = require("passport");
router.post(
  "/",
  function (req, res, next) {
    const sql = `select * from users where email ='${req.body.email}'`;
    con.query(sql, function (err, results) {
      if (err) {
        res.send(err);
      } else if (results.length == 0) {
        next();
      } else {
        res.json({ err: "cet email est déja utilisé" });
      }
    });
  },
  function (req, res, next) {
    bcrypt.hash(req.body.password, 10, function (err, password) {
      const sql = `INSERT INTO users( email, password,nom,prenom) VALUES ('${req.body.email}','${password}','${req.body.nom}','${req.body.prenom}')`;
      con.query(sql, function (err, result) {
        if (err) {
          res.json({ err: err });
        } else {
          res.send(true);
        }
      });
    });
  }
);
module.exports = router;
