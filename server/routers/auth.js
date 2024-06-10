const express = require('express')
const authRouter = express.Router();
const bcryptjs = require("bcryptjs");
const User = require('../models/user');
authRouter.post("/api/signup", async (req, res) => {
	try {
		const { username, email, password } = req.body;
		const existingUser = await User.findOne({ email });
		if (existingUser) {
			return res.status(400)
				.json({
					msg: "Email already exist",
				})
		}
		const hashPass = await bcryptjs.hash(password, 8);
		let user = new User({
			email,
			password: hashPass,
			username,
		});
		user = await user.save();
		res.status(200).json(user);
	} catch (err) {
		res.status(500).json({ error: err.message })
	}
})
module.exports = authRouter;
