const express = require('express');
const auth = require("../middleware/auth");

const userRouter = express.Router();
const CreateGroup = require("../models/create_group_model");
const FriendModel = require('../models/friend_model');
const User = require("../models/user");

userRouter.post("/api/user/create-group", async (req, res) => {
    try{
        // console.log("sahil");
        const {userId, groupName, groupType} = req.body;
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

//Add Friends to user model
userRouter.post("/api/user/add-friends-to-user", async (req, res) => {
    try{

        console.log(req.body);
        
        const {userId, friendsList} = req.body;

        let existingUser = await FriendModel.findOne({userId : userId});

        if(existingUser){
            let friendsss =  await FriendModel.findOneAndUpdate(
                {
                    userId : userId
                },
                {
                    $addToSet : {
                        friendList : friendsList
                    }
                }
            )
            res.json(friendsss);
        }else{
            let friendsss = await  FriendModel({
                userId : userId,
                friendList : friendsList
            })
    
            friendsss = await friendsss.save();
    
            res.json(friendsss);
        }
    }catch(e){
        console.log('sahil');
        console.log(e.message);
        res.status(500).json({ error: e.message });
    } 
})

//Get User friend List
userRouter.get("/api/user/get-user-friend-list/:userId", async  (req, res) => {
    try{
        
        console.log(req.params.userId);
        var friendList = await FriendModel.find({userId : req.params.userId});
        console.log("qwedsfds");
        console.log(friendList);
        res.json(friendList);
    }catch(e){
        console.log('sahil');
        res.status(500).json({ error: e.message });
    } 
})

module.exports = userRouter;
