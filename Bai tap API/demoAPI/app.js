// 1. nhap vao thu vien express
const express = require('express')

//2. tao ra 1 ung dung wed co bien la app
const app = express()
//3. tao ra 1 bien port
const port = 4000

//4.tao ra 1 API phuongb thuc GET co dia chi la: http://locahost:3000/
app.get('/' , (request, response) => {
    response.send('hello')
})
 

// Day la API lay ra (phuong thuoc GET) danh sach ban be
app.get('/friends', (request, response) => {
    response.send([
        {
            id: 1,
            name : "Chuong"
        }, {
            id: 2,
            name: "Linh"
        }
    ])
})


app.get()

//5.mo cong cho phep server chay tren cong da tao
app.listen(port, () => {
    console.log (`dang chay o cong ${port}`)
})

