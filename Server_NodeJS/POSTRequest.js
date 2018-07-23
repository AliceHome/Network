var http = require('http')
var queryString = require('querystring')

//创建服务器
var server = http.createServer(function(req, res) {
    console.log('connection 0')
    console.log(req.url)
    console.log(req.method.toLocaleLowerCase())
    if (req.method.toLocaleLowerCase() === 'post') {

        console.log('connection 1')
        var alldata = ''
        req.on('data', function(chunk) {
            alldata += chunk
        })


        req.on('end', function() {
            res.end('Success')
            console.log('connection 2')
            var dataString = alldata.toString()
            var dataObjc = queryString.parse(dataString)
            console.log(dataObjc)
            console.log(dataObjc.username)
            console.log(dataObjc.password)
        })

    }
})


server.listen(9000, function() {
    console.log('server is running ')
})