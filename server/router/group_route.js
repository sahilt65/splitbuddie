const express  = require("express");
const groupRouter = express.Router();
const Group = require("../models/group_model");

groupRouter.post("/api/group/post-group-details", async (req, res)=>{
    try{
        console.log("sahil");

        const {adminUserId, groupId, groupName, groupType, groupMembers} = req.body;
        let group = new Group({
            adminUserId : adminUserId,
            groupId : groupId, 
            groupName : groupName, 
            groupType : groupType,
            groupMembers : groupMembers,
        });

        group = await group.save();

        res.json(group);

    }catch(e){
        console.log('sahil');
        res.status(500).json({ error: e.message });
    } 
});

groupRouter.get("/api/group/get-group-info/:groupId", async  (req, res) => {
    try{
        console.log(req.params.groupId);
        var group = await Group.find({groupId : req.params.groupId});
        // find({userId : req.params.userId});
        console.log("qwedsfds");
        console.log(group);
        res.json(group);
    }catch(e){
        console.log('sahil');
        res.status(500).json({ error: e.message });
    } 
})

module.exports = groupRouter;