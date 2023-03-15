const mongoose = require('mongoose');
mongoose.set('strictQuery', false);

const createGroupSchema = mongoose.Schema({
    userId : {
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
})

module.exports = mongoose.model("CreateGroup",createGroupSchema);