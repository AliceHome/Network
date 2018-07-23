var http = require('http')
var server = http.createServer()

server.on('request', function(req, res) {
    var jsonData = [{
        name:'Jack',
        age: 12
    },
    {
        name:'Rose',
        age: 13
    }]
    res.end(JSON.stringify(jsonData))
})

server.listen(9000,function(){
    console.log('server is running ...')
})