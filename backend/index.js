const express = require('express')
const cors = require('cors')
require('dotenv').config()

const app = express()
const PORT = process.env.PORT || 3001;  
const conn = require('./conn')

app.use(express.json())
app.use(cors())

const tripRoutes = require('./routes/trip.routes')

app.use('/trip', tripRoutes) // http://localhost:3001/trip --> POST/GET/GET by ID

// Add a default route for '/'
app.get('/', (req, res) => {
    res.send('Welcome to the backend server!');
});

app.get('/hello', (req,res)=>{
    res.send('Hello World!')
});

app.listen(PORT, ()=>{
    console.log(`Server started at http://localhost:${PORT}`)
});
