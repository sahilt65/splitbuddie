const mongoose = require('mongoose');
mongoose.set('strictQuery', false); 

const expenseModel = mongoose.Schema({
    description : {
        required : true,
        type : String,
        trim : true,
        
    },
    friendsList : [
        [Map]
    ],
    groupId : {
        required : true,
        type : String,
    },
    total_expense : {
        required : true,
        type:Number

    },
    payer : {
        required : true,
        type:String
    }
})

module.exports = mongoose.model("Expense",expenseModel);


