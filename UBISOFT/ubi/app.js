
const express = require("express");
const bodyParser=require("body-parser")
const userRouter = require("./routes/user.js");
const gamesRouter=require("./routes/games.js")
const cors = require("cors");

var server = express();  //创建服务器
server.listen(8888);

server.use(cors({
  origin: "http://127.0.0.1:5501"
}))

server.use(bodyParser.urlencoded({
  extended: false
}))

//托管静态资源到public下
server.use(express.static("../public"));


//挂载路由器
server.use("/user", userRouter);
server.use("/games", gamesRouter);

