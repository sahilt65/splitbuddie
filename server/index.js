const mongoose = require("mongoose");
const express = require('express');

//Files Import
const authRouter = require("./router/auth_route");
const userRouter = require("./router/user");
const groupRouter = require("./router/group_route");

//Init
const PORT = 4000;
const app = express();
const DB = "mongodb+srv://sahil:sahil@cluster0.0x6a6qt.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);
app.use(userRouter);
app.use(groupRouter);


app.listen(PORT, "0.0.0.0", function(){
  console.log(`connected at port ${PORT}` );
})
//Connection
mongoose
  .connect(DB,{
    useNewUrlParser: true,
    useUnifiedTopology: true
  })
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log("sdfdsff");
    console.log(e);
  });


//test
