const mongoose = require('mongoose');
mongoose.set('strictQuery', false); 

const friendSchema = mongoose.Schema({
    userId : {
        required : true,
        type : String,
        trim : true,
    },
    friendList : [Map]
})

module.exports = mongoose.model("FriendsModel",friendSchema);