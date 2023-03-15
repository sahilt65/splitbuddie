const express = require("express");
const User = require("../models/user");
const jwt = require("jsonwebtoken");
const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res)=>{
    try{
        const { userId, name, email, mob, password } = req.body;
        const existingUser = await User.findOne({email});
        if(existingUser){
            return req.status(400).json({msg:"User with same email address already exists"});
        }

        let user = new User({
            userId, name, email, mob, password
        });
        user = await user.save();
        res.json(user);
    }catch(e){
        res.status(500).json({ error: e.message });
    }
})

authRouter.post("/api/signin", async (req, res)=>{
    try{
        console.log("sahil");
        console.log(req.body);
        const {email, password} = req.body;
        const user = await User.findOne({email});

        if(!user){
            return res.status(400).json({msg : "User with this email address does not exists"});
        }
        console.log(password);
        console.log(user.password);
        if(password != user.password){
            return res.status(400).json({ msg: "Incorrect password." }); 
        }

        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({token, ...user._doc})
    }catch(e){
        res.status(500).json({ error: e.message });
    }
})

module.exports = authRouter;
