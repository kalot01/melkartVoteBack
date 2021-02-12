var express = require("express");
var router = express.Router();

router.use("/login", require("./login")); //handle login
router.use("/register", require("./register")); //handle register
router.use("/votes", require("./votes")); //handle votes

module.exports = router;
