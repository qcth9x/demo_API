const express = require('express')
const app = express()
app.use(express.json())
const { request, response } = require('express')
const mysql = require('mysql2')
const port = 3000
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password : '123456789',
    database : 'Phim'
})

connection.connect()
 



app.get('/films',(request,response) => {
    connection.query("SELECT * FROM Movie " , (err , data) => {
        if (err){
            response.send("err")
        }else{
            response.send(data)
        }
    })
})


app.post('/films' , (request , response) => {
    connection.query ("INSERT INTO Movie (`id` , `tenPhim` , `idTheLoai` , `idDanhMuc` , `ngaySanXuat` , `giaPhim` ) VALUES (? , ? , ? ,? , ? , ?)" , 
    [
        request.body.id,request.body.tenPhim, request.body.idTheLoai,request.body.idDanhMuc , request.body.ngaySanXuat , request.body.giaPhim
    ], (err) => {
        if (err){
            response.send("err")
        }else{
            response.send("them thanh cong")
        }
    }
    )
}) 

app.put('/film', (request, response) => {
    connection.query('UPDATE `Movie` SET `tenPhim`=(?),`idTheLoai`=(?),`idDanhMuc`=(?),`ngaySanXuat`=(?),`giaPhim`=(?) WHERE `id` = (?)', 
    [ request.body.tenPhim, request.body.idTheLoai,request.body.idDanhMuc, request.body.ngaySanXuat, request.body.giaPhim, request.body.id], (err) => {
    if (err) {
        response.send(err);
    } else {
        response.send("Sua thanh cong!");
    }
    })
})



app.delete(`/films:id` , (request , response) => {
    connection.query("delete from `Movie` where id = (?)" , [
        request.params.id
    ], (err) => {
        if(err) {
            response.send(err)
        }else{
            response.send("xoa thanh cong")
        }
    }
    )
})

app.listen(port, () => {
    console.log (`server app listening on port ${port}`)
})


