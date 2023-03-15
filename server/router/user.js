const express = require('express');
const auth = require("../middleware/auth");
const CreateGroup = require("../models/create_group_model");
const userRouter = express.Router();

userRouter.post("/api/user/create-group", async (req, res) => {
    try{
        console.log("sahil");
        const {userId, groupName, groupType} = req.body;
        // const existingGroupName = await User.findOne({groupName});

        // if(existingGroupName){
        //     return res.status(400).json({msg:"Group with same name already exists"});
        // }
        let createGroup = new CreateGroup({userId, groupName, groupType});

        createGroup = await createGroup.save();

        res.json(createGroup);

    }catch(e){
        console.log('sahil');
        res.status(500).json({ error: e.message });
    } 
})

module.exports = userRouter;
