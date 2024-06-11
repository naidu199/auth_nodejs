const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const authRouter = require('./routers/auth');

const app = express();
const port = process.env.PORT || 3000;
const db = "mongodb+srv://naidu1909:naidu1909@authentication.vezdnvp.mongodb.net/?retryWrites=true&w=majority&appName=authentication";

// Middleware
app.use(express.json());
app.use(cors());

// Connect to MongoDB
mongoose.connect(db, { useNewUrlParser: true, useUnifiedTopology: true })
	.then(() => console.log("connected to mongodb"))
	.catch((error) => console.log(`${error} error while connecting to db`));

// Routes
app.use(authRouter);
app.get('/', (req, res) => res.send('Fire nodejs project'));

// Start server
app.listen(port, "0.0.0.0", () => console.log(`connected on port ${port}!`));
