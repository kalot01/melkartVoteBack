var express = require("express");
var router = express.Router();
var bcrypt = require("bcrypt");
var issueJWT = require("../utils/issueJWT");
var con = require("../config/dbConfig");

router.post("/", function (req, res, next) {
  const sql = `select * from users where email ='${req.body.email}' `;
  con.query(sql, function (err, results) {
    if (err) {
      res.send(err);
    } else if (results[0]) {
      bcrypt.compare(
        req.body.password,
        results[0].password,
        function (err, comRes) {
          if (err) {
            res.send(err);
          } else {
            if (comRes) {
              res.json({
                ...issueJWT(results[0]),
                role: results[0].role,
                votant: results[0].votant,
              });
            } else {
              res.json({ err: "email ou mot de passe incorrecte" });
            }
          }
        }
      );
    } else {
      res.json({ err: "email ou mot de passe incorrecte" });
    }
  });
});

module.exports = router;
