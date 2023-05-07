//搭建express服务
const express = require('express')
const app = express()
const path = require('path')




// app.all('*', function (req, res, next) {
//     // 设置允许跨域的域名，*代表允许任意域名跨域
//     res.header('Access-Control-Allow-Origin', '*');
//     // 允许的header类型
//     res.header('Access-Control-Allow-Headers', 'content-type');
//     // 解决node.js返回中文出现乱码的问题
//     res.setHeader('Content-Type', 'text/html; charset=utf-8')
//     // 跨域允许的请求方式
//     res.header('Access-Control-Allow-Methods', 'DELETE,PUT,POST,GET,OPTIONS');
//     if (req.method.toLowerCase() === 'options') {
//         res.sendStatus(200);
//     } else {
//         next();
//     }
// });
//post 请求表单数据
app.use(express.urlencoded({ extended: true }))
//资源共享
const cors = require('cors')
app.use(cors())
//静态文件托管 ----  访问：http:localhost:8989/图片.jpg
app.use(express.static(path.join(__dirname, 'upload')))

//路由
const router = require('./router')

app.use('/api', router)


app.listen(8989, () => {
    console.log('8989服务器启动成功!');
})
