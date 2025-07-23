const express = require('express')

const app = express()
app.get('/',(req,res)=>{
    res.json({message:'welcome to the home route'})
})
app.listen(9000,()=>console.log('server is up and running on 9000'))