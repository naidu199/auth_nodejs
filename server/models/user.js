const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
	username: {
		required: true,
		type: String,
		trim: true,
	},
	email: {
		required: true,
		type: String,
		trim: true,
		validate: {
			validator: (email) => {
				var re = /\S+@\S+\.\S+/;
				return email.match(re);
			},
			message: "please enter a validate email",
		},
	},
	password: {
		required: true,
		type: String,
		trim: true,
	},
});

const User = mongoose.model("User", userSchema);

module.exports = User;
