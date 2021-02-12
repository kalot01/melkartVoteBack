var express = require("express");
var router = express.Router();
var passport = require("passport");
var con = require("../config/dbConfig");

router.get(
  "/questions",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    if (req.user.role) {
      next();
    } else {
      res.json({
        err: "vous devez vous connecter",
      });
    }
  },
  function (req, res, next) {
    const sql = `SELECT * FROM question WHERE 1`;
    con.query(sql, function (err, result) {
      if (err) {
        res.json({ err: err });
      } else {
        res.send(result);
      }
    });
  }
);

router.get(
  "/reponses",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    if (req.user.role) {
      next();
    } else {
      res.json({
        err: "vous devez vous connecter",
      });
    }
  },
  function (req, res, next) {
    const sql = `SELECT * FROM reponse WHERE id_ques = '${req.query.id}'`;
    con.query(sql, function (err, result) {
      if (err) {
        res.json({ err: err });
      } else {
        const sql = `SELECT * FROM vota WHERE id_membre = '${req.user.id}' AND id_ques = '${req.query.id}'`;
        con.query(sql, function (err, resultlen) {
          if (err) {
            res.json({ err: err });
          } else {
            res.json({ res: result, vota: resultlen.length });
          }
        });
      }
    });
  }
);
router.post(
  "/voter",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    if (req.user.role) {
      next();
    } else {
      res.json({
        err: "vous devez vous connecter",
      });
    }
  },
  function (req, res, next) {
    const sql = `UPDATE reponse SET nbvotes= nbvotes + ${req.body.compt}  WHERE id = ${req.body.idreponse}`;
    con.query(sql, function (err, result) {
      if (err) {
        res.json({ err: err });
      } else {
        const sql = `INSERT INTO vota(id_membre, id_ques) VALUES ('${req.user.id}','${req.body.idquestion}')`;
        con.query(sql, function (err, result) {
          if (err) {
            res.json({ err: err });
          } else {
            res.send(true);
          }
        });
      }
    });
  }
);
module.exports = router;
