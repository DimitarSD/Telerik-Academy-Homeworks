var express = require('express'),
  students = require('./routes/students'),
  http = require('http'),
  path = require('path');

var app = express();

app.configure(function () {
  app.set('port', process.env.PORT || 3000);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(path.join(__dirname, 'public')));
  app.use(function (req, res, next) {
    if (req.headers.origin) {
      res.header('Access-Control-Allow-Origin', '*');
      res.header('Access-Control-Allow-Headers', 'X-Requested-With,Content-Type,Authorization');
      res.header('Access-Control-Allow-Methods', 'GET,PUT,PATCH,POST,DELETE,OPTIONS');
      if (req.method === 'OPTIONS') return res.send(200);
    }
    next();
  });
});

app.configure('development', function () {
  app.use(express.errorHandler());
});

app.all('*', function (req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', 'X-Requested-With,Content-type');
  res.header('Access-Control-Allow-Methods', 'DELETE'); // doesn't work
  next();
});

app.get('/students', students.getAll);
app.post('/students', students.add);
app.delete('/students/:id', students.remove);

http.createServer(app).listen(app.get('port'), function () {
  console.log("Express server listening on port " + app.get('port'));
});