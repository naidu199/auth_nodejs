const express = require('express');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('../models/user');

const authRouter = express.Router();

// Sign up route
authRouter.post('/api/signup', async (req, res) => {
	try {
		const { username, email, password } = req.body;

		// Check if user already exists
		const existingUser = await User.findOne({ email });
		if (existingUser) {
			return res.status(400).json({ msg: 'Email already exists' });
		}

		// Hash the password
		const hashPass = await bcryptjs.hash(password, 8);

		// Create new user
		let user = new User({ email, password: hashPass, username });
		user = await user.save();

		res.status(200).json(user);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Sign in route
authRouter.post('/api/signin', async (req, res) => {
	try {
		const { email, password } = req.body;

		// Check if user exists
		const existingUser = await User.findOne({ email });
		if (!existingUser) {
			return res.status(400).json({ msg: 'User does not exist' });
		}

		// Check if password matches
		const isMatch = await bcryptjs.compare(password, existingUser.password);
		if (!isMatch) {
			return res.status(400).json({ msg: 'Incorrect password' });
		}

		// Create and return JWT token
		const token = jwt.sign({ id: existingUser._id }, process.env.JWT_SECRET);
		res.status(200).json({ token, ...existingUser._doc });
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

module.exports = authRouter;
