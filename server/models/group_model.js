const mongoose = require('mongoose');
mongoose.set('strictQuery', false);

const Group = mongoose.Schema({
    adminUserId : {
        required : true,
        type : String,
        trim : true,
    },
    groupId : {
        required : true,
        type : String,
        trim : true,
    },
    groupName : {
        required : true,
        type : String,
        trim : true,
        
    },
    groupType : {
        required : true,
        type : String,
    },
    groupMembers : [Map,]
})

module.exports = mongoose.model("Group",Group);