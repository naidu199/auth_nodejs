const express = require('express')
const authRouter = express.Router();
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
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
});

authRouter.get("/api/signin", async (req, res) => {
	try {
		const { email, password } = req.body;
		const existingUser = await User.findOne({ email });
		if (!existingUser) {
			return res.status(400).json({ msg: "user not exists" });
		}
		const isMatch = await bcryptjs.compare(password, existingUser.password);
		if (!isMatch) {
			return res.status(400).json({ msg: "Incorrect password" });
		}
		const token = jwt.sign({ id: existingUser._id }, "passwordKey")
		res.status(200).json({ token, ...existingUser._doc });
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});
module.exports = authRouter;
