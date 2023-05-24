const express = require("express");
const User = require("../models/user");
const jwt = require("jsonwebtoken");
const authRouter = express.Router();
const auth = require("../middleware/auth");

authRouter.post("/api/signup", async (req, res)=>{
    try{
        console.log("hey0");
        const { userId, name, email, mob, password } = req.body;
        console.log("hey");
        console.log(req.body);

        
        const existingUser = await User.findOne({email});
        if(existingUser){
            return res.status(400).json({msg:"User with same email address already exists"});
        }
        console.log("hey1");


        let user = new User({
            userId, name, email, mob, password
        });
        user = await user.save();
        res.json(user);
    }catch(e){
        res.status(500).json({ error: e.message });
    }
})

authRouter.post("/api/signin" , async (req, res)=>{
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

authRouter.get("/api/get-user/:userId" , async (req, res)=>{
    console.log("sahil");
    try{
        console.log("sahil");
        const user = await User.findById(req.params.userId);
        res.status(200).json(user)
    }catch(e){
        res.status(500).json({ error: e.message });
    }
})

authRouter.post("/tokenIsValid", async (req, res) => {
    try {
      const token = req.header("x-auth-token");
      if (!token) return res.json(false);
      const verified = jwt.verify(token, "passwordKey");
      if (!verified) return res.json(false);
  
      const user = await User.findById(verified.id);
      if (!user) return res.json(false);
      res.json(true);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
});

authRouter.get("/" , auth , async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
});

// authRouter

module.exports = authRouter;
