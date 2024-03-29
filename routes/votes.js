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
    const sql = `SELECT * FROM question WHERE 1 ORDER BY id DESC`;
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
    const sql = `SELECT * FROM reponse WHERE id_ques = '${req.query.id}' ORDER BY id DESC`;
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
    let compt = req.user.role == "b" ? 2 : 1;
    const sql = `UPDATE reponse SET nbvotes= nbvotes + ${compt}  WHERE id = ${req.body.idreponse}`;
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

router.post(
  "/finish",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    if (req.user.role == "b") {
      next();
    } else {
      res.json({
        err: "vous devez vous connecter",
      });
    }
  },
  function (req, res, next) {
    const sql = `UPDATE question SET finished = 1  WHERE id = ${req.body.id}`;
    con.query(sql, function (err, result) {
      if (err) {
        res.json({ err: err });
      } else {
        res.send(true);
      }
    });
  }
);

router.post(
  "/begin",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    if (req.user.role == "b") {
      next();
    } else {
      res.json({
        err: "vous devez vous connecter",
      });
    }
  },
  function (req, res, next) {
    const sql = `UPDATE question SET finished = 0  WHERE id = ${req.body.id}`;
    con.query(sql, function (err, result) {
      if (err) {
        res.json({ err: err });
      } else {
        res.send(true);
      }
    });
  }
);

router.post(
  "/visible",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    if (req.user.role == "b") {
      next();
    } else {
      res.json({
        err: "vous devez vous connecter",
      });
    }
  },
  function (req, res, next) {
    const sql = `UPDATE question SET visible = 1  WHERE id = ${req.body.id}`;
    con.query(sql, function (err, result) {
      if (err) {
        res.json({ err: err });
      } else {
        res.send(true);
      }
    });
  }
);

router.post(
  "/hide",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    if (req.user.role == "b") {
      next();
    } else {
      res.json({
        err: "vous devez vous connecter",
      });
    }
  },
  function (req, res, next) {
    const sql = `UPDATE question SET visible = 0  WHERE id = ${req.body.id}`;
    con.query(sql, function (err, result) {
      if (err) {
        res.json({ err: err });
      } else {
        res.send(true);
      }
    });
  }
);

router.get(
  "/members",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    if (req.user.role == "b") {
      next();
    } else {
      res.json({
        err: "vous devez vous connecter",
      });
    }
  },
  function (req, res, next) {
    const sql = `SELECT * FROM users WHERE votant = 0 ORDER BY nom ASC`;
    con.query(sql, function (err, result) {
      if (err) {
        res.json({ err: err });
      } else {
        res.send(result);
      }
    });
  }
);

router.post(
  "/membervote",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    if (req.user.role == "b") {
      next();
    } else {
      res.json({
        err: "vous devez vous connecter",
      });
    }
  },
  function (req, res, next) {
    const sql = `UPDATE users  SET votant = 1  WHERE id = ${req.body.id}`;
    con.query(sql, function (err, result) {
      if (err) {
        res.json({ err: err });
      } else {
        res.send(true);
      }
    });
  }
);

router.post(
  "/addvote",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    if (req.user.role == "b") {
      next();
    } else {
      res.json({
        err: "vous devez vous connecter",
      });
    }
  },
  function (req, res, next) {
    const sql = `INSERT INTO question( ques) VALUES ('${req.body.question}')`;
    con.query(sql, function (err, result) {
      if (err) {
        res.json({ err: err });
      } else {
        for (let i = 0; i < req.body.reponses.length; i++) {
          const sql = `INSERT INTO reponse(id_ques, reponse) VALUES ('${result.insertId}','${req.body.reponses[i]}')`;
          con.query(sql, function (err, resulte) {
            if (err) {
              res.json({ err: err });
            }
          });
        }
        res.send(true);
      }
    });
  }
);

router.get(
  "/votant",
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
    const sql = `SELECT * FROM users WHERE id = '${req.user.id}'`;
    con.query(sql, function (err, result) {
      if (err) {
        res.json({ err: err });
      } else {
        res.send(result[0].votant == 1);
      }
    });
  }
);
module.exports = router;
