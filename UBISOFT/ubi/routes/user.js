
const express = require("express");
const pool = require("../pool.js");
var router = express.Router();


//用户登录
router.post("/login", (req, res) => {
  var obj = req.body;
  if (!obj.email) {
    res.send("邮箱不能为空");
    return;
  }
  if (!obj.upwd) {
    res.send("密码不能为空");
    return;
  }
  pool.query("SELECT uid FROM ubi_user WHERE email=? and upwd=?", [obj.email, obj.upwd], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send(result[0].uid.toString());
    } else {
      res.send("0");
    }
  })
});


//用户注册
router.post("/register", (req, res) => { 
  var obj = req.body;
  console.log(obj);
  pool.query("INSERT INTO ubi_user SET ?",[obj], (err, result) => { 
    if (err) throw err;
    res.send("注册成功");
  })
})
//用户名重复验证
router.get("/vali_uname", (req, res) => { 
  pool.query("SELECT uname FROM ubi_user WHERE uname=?", [req.query.uname], (err,result) => { 
    if (err) throw err;
    if (result.length > 0) {
      res.send("1");
    } else { 
      res.send("0");
    }
  })
})
router.get("/vali_email", (req, res) => { 
  pool.query("SELECT email FROM ubi_user WHERE email=?", [req.query.email], (err,result) => { 
    if (err) throw err;
    if (result.length > 0) {
      res.send("1");
    } else {
      res.send("0");
    }
  })
})


//邮箱验证
// router.get("/vali_email", (req, res) => { 
//   var $email = req.query.email;
//   pool.query("SELECT email FROM ubi_user WHERE email=?", [$email], (err, result) => { 
//     if (err) throw err;
//     if (result.length > 0) {
//       res.send("1");
//     } else { 
//       res.send("0");
//     }
//   })
// })


module.exports = router;



