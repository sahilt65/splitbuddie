const express = require('express');
const auth = require("../middleware/auth");
const userRouter = express.Router();
const CreateGroup = require("../models/create_group_model");
const User = require("../models/user");

userRouter.post("/api/user/create-group", async (req, res) => {
    try{
        // console.log("sahil");
        const {userId, groupName, groupType} = req.body;
        // const existingGroupName = await User.findOne({groupName});

        // if(existingGroupName){
        //     return res.status(400).json({msg:"Group with same name already exists"});
        // }
        let createGroup = new CreateGroup({
            userId : userId, 
            groupName : groupName, 
            groupType : groupType
        });

        createGroup = await createGroup.save();

        res.json(createGroup);

    }catch(e){
        console.log('sahil');
        res.status(500).json({ error: e.message });
    } 
})

userRouter.get("/api/user/get-groups-details/:userId", async  (req, res) => {
    try{
        console.log("sahil");
        console.log(req.params.userId);
        var groups = await CreateGroup.find({userId : req.params.userId})
        console.log(groups);
        res.json({groups});

    }catch(e){
        console.log('sahil');
        res.status(500).json({ error: e.message });
    } 
})

module.exports = userRouter;
