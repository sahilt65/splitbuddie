const express = require('express');
const userRouter = express.Router();
const auth = require("../middleware/auth");
const User = require("../models/user");

userRouter.post("api/user/create-group", auth, async (req, res) => {
    
})
