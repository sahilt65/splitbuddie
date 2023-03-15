const mongoose = require("mongoose");
const express = require('express');

//Files Import
const authRouter = require("./router/auth_route");
const userRouter = require("./router/user");

//Init
const PORT = 4000;
const app = express();
const DB = "mongodb+srv://sahil:sahil@cluster0.wmbdycd.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);
app.use(userRouter);


//Connection
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", function(){
    console.log(`connected at port ${PORT}` );
})
//test

app.get('/', (req,res) => {
    res.send("hello wordl");
})