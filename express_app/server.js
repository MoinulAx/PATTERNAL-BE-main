const app = require('./app')
require('dotenv').config()

const PORT = process.env.PORT

app.listen(PORT , ()=> {
    console.log(`App Patternal is running on PORT: ${PORT}`)
}) 

