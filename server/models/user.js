const mongoose = require('mongoose');
mongoose.set('strictQuery', false);

const userSchema = mongoose.Schema({
    userId : {
        // required : true,
        type : String,
    },
    name : {
        required : true,
        type : String,
        trim : true,
    },
    email : {
        required : true,
        type : String,
        trim : true,
        validate : {
            validator : (value)=>{
                const re =  /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message :'Please Enter a valid email address',
        }
    },
    mob : {
        required : true,
        type : String,
        validate : {
            validator : (value)=>{
                return value.length==10;
            },
            message :'Please enter a valid mobile number',
        }
    },

    password : {
        required : true,
        type : String,
        validate : {
            validator : (value)=>{
                return value.length>6;
            },
            message :'Please enter min 6 digit password',
        }

    },

})

module.exports = mongoose.model("User",userSchema);