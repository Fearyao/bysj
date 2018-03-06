require('./check-versions')()

var config = require('../config')
if (!process.env.NODE_ENV) {
  process.env.NODE_ENV = JSON.parse(config.dev.env.NODE_ENV)
}
const domain = require('domain');
var opn = require('opn')
var path = require('path')
var express = require('express')
var webpack = require('webpack')
var multer = require('multer')
var fs = require('fs')


var proxyMiddleware = require('http-proxy-middleware')
var webpackConfig = process.env.NODE_ENV === 'testing' ?
  require('./webpack.prod.conf') :
  require('./webpack.dev.conf')

// default port where dev server listens for incoming traffic
var port = process.env.PORT || config.dev.port
  // automatically open browser, if not set will be false
var autoOpenBrowser = !!config.dev.autoOpenBrowser
  // Define HTTP proxies to your custom API backend
  // https://github.com/chimurai/http-proxy-middleware
var proxyTable = config.dev.proxyTable

var app = express()
var bodyParser = require('body-parser')
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: false
}));



app.use((req, res, next) => {
  const reqDomain = domain.create();
  // next抛出的异常在这里被捕获,触发此事件
  reqDomain.on('error', e => {
    // ... 这里统一处理错误，比如渲染或跳转到404，500页面
  });
  return reqDomain.run(next);
});
// mysql相关
var apiRoutes = express.Router();
var mysql = require('mysql');
var pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'bbs',
  port: 3306
});
function query(sql, callback) {
  pool.getConnection(function(err, connection) {
    // Use the connection
    connection.query(sql, function(err, rows) {
      callback(err, rows);
      connection.release(); //释放链接
    });
  });
}

var storage = multer.diskStorage({
  destination: function(req, file, cb) {
    cb(null, 'static/uploads')
  }
  ,
  filename: function(req, file, cb) {
    var fileFormat = (file.originalname).split(".");
    cb(null, file.fieldname + '-' + Date.now() + '.' + fileFormat[fileFormat.length - 1])
  }
})
var upload = multer({
  storage: storage
})
//上传用户头像
apiRoutes.post('/userhead', upload.any(), function(req, res, next) {
  var file = req.files[0].filename;
  query(`update user_info set head='/static/uploads/${file}' where user_id='${req.body.id}'`, function(err, rows) {
    if (err) throw err;
  })
  res.send(file); //打印file
});
//上传回复内容的图片
apiRoutes.post('/forumImg', upload.any(), function(req, res, next) {
  var file = req.files[0].filename;
  query(`select RID FROM bbs_reply WHERE RUID='${req.body.id}' ORDER BY RID DESC LIMIT 1`, function(err, rows) {
    console.log(err,'1233333')
    console.log(rows[0].RID,'erijwqeltqhwejk')
    var RID = rows[0].RID
    if (err) throw err;
    query(`update bbs_reply set TEmotion='/static/uploads/${file}' where RID='${RID}'`, function(err, rows) {
      console.log(err)
      if (err) throw err;
    })
  })
  res.send(file); //打印file
});
//上传发帖内容的图片
apiRoutes.post('/topicImg', upload.any(), function(req, res, next) {
  var file = req.files[0].filename;
  query(`select TID FROM bbs_topic WHERE TUID='${req.body.id}' ORDER BY TID DESC LIMIT 1`, function(err, rows) {
    console.log(err,'1233333')
    console.log(rows[0].TID,'erijwqeltqhwejk')
    var TID = rows[0].TID
    if (err) throw err;
    query(`update bbs_topic set TEmotion='/static/uploads/${file}' where TID='${TID}'`, function(err, rows) {
      console.log(err)
      if (err) throw err;
    })
  })
  res.send(file); //打印file
});

//登陆
apiRoutes.post('/login', function(req, res) {
  var user = req.body
  query(`select * from user_info where user_name='${user.username}' and password = '${user.password}'`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//注册
apiRoutes.post('/register', function(req, res) {
  var user = req.body
  query(`select * from user_info where user_name='${user.username}'`, function(err, rows) {
    if (err) throw err;
    console.log(rows.length)
    if(rows.length<1){
      query(`insert into user_info(user_name,password,email,power,level) values('${user.username}','${user.password}','${user.email}','用户',1)`, function(err, rows) {
        if (err) throw err;
        res.send(rows)
      })
    }else{
      res.send('EXISTED')
    }
  })
});
//用户详情
apiRoutes.post('/userDetail', function(req, res) {
  var user = req.body.userDetail;
  query(`update user_info set user_name='${user.name}',email='${user.email}',gender='${user.gender}',birthday='${user.birth}'where user_id=${user.id}`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//论坛列表的用户展示
apiRoutes.post('/userShow', function(req, res) {
  var id = req.body.id
  query(`select * from user_info where user_id = '${id}'`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//论坛列表
apiRoutes.post('/forumList', function(req, res) {
  var current = req.body.current
  query(`select user_info.*,bbs_topic.* from user_info,bbs_topic where user_info.user_id=bbs_topic.TUID order by bbs_topic.Ttime desc limit ${current}, 10`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//论坛列表初次
apiRoutes.post('/forumListInit', function(req, res) {
  query(`select user_info.*,bbs_topic.* from user_info,bbs_topic where user_info.user_id=bbs_topic.TUID order by bbs_topic.Ttime desc`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//论坛列表初次-带帖子类型
apiRoutes.post('/forumTypeListInit', function(req, res) {
  var type=req.body.type
  query(`select user_info.*,bbs_topic.* from user_info,bbs_topic where user_info.user_id=bbs_topic.TUID and TTYPE = '${type}' order by bbs_topic.Ttime desc`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//论坛回复列表
apiRoutes.post('/forumDetail', function(req, res) {
  var RTID = req.body.RTID;
  query(`select  user_info.*,bbs_topic.*,bbs_reply.* from bbs_reply,bbs_topic,user_info where bbs_reply.RTID=bbs_topic.TID and bbs_reply.RUID=user_info.user_id and bbs_reply.RTID='${RTID}'`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//论坛回复列表楼主部分
apiRoutes.post('/topicDetail', function(req, res) {
  var RTID = req.body.RTID;
  var RUID = req.body.RUID;
  query(`UPDATE  user_info set user_info.level=(user_info.level*1+1) where user_id=${RUID}`,function(){
  query(`select user_info.*,bbs_topic.* from user_info, bbs_topic where user_info.user_id=bbs_topic.TUID and  bbs_topic.TID='${RTID}'`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
  })
});
//论坛发表模块
apiRoutes.post('/forumAdd', function(req, res) {
  var forum = req.body
  query(`insert into bbs_topic(TUID,TTopic,TContent,Ttime,TTYPE) values('${forum.TUID}','${forum.forumTopic}','${forum.forumContent}','${Date.now()}','${forum.Ttype}')`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//论坛回复模块
apiRoutes.post('/replyAdd', function(req, res) {
  var reply = req.body
  var RTime=Date.now()
  query(`update user_info set level=level+1 where user_id=${reply.RUID}`)
  query(`update bbs_topic set Ttime=${RTime} where TID=${reply.RTID}`)
  query(`insert into bbs_reply(RTID,RUID,RContent,RToContent,RToUser,RTime) values('${reply.RTID}','${reply.RUID}','${reply.RContent}','${reply.RToContent}','${reply.RToUser}','${RTime}')`, function(err, rows) {
    console.log(err)
    if (err) throw err
    res.send(rows)
  })
});
//管理员页面用户管理
apiRoutes.post('/userAdmin', function(req, res) {
  query(`select * from user_info`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//封号
apiRoutes.post('/userDisable', function(req, res) {
  var id = req.body.userId
  var email = req.body.email
    //发送封号邮件
  var message = {
    text: "由于你在Feary论坛的言论，您的帐号已被禁用，如有误禁，请联系管理员965113581@qq.com",
    from: "965113581@qq.com",
    to: email,
    subject: "Feary论坛封号提醒"
  };
  server.send(message, function(err, message) {
    console.log(err || message);
  });
  query(`update user_info set admin = '1' where user_id=${id}`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//解封
apiRoutes.post('/userEnable', function(req, res) {
  var id = req.body.userId
  console.log(id)
  query(`update user_info set admin = '0' where user_id=${id}`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//用户信息操作
apiRoutes.post('/userEdit', function(req, res) {
  var user = req.body.form
  console.log(user)
  query(
    `update user_info set user_name = '${user.user_name}', password='${user.password}', email='${user.email}', power='${user.power}'  where user_id=${user.user_id}`,
    function(err, rows) {
      if (err) throw err;
      console.log(err)
      res.send(rows)
    })
});
//管理员界面搜索
apiRoutes.post('/userSearch', function(req, res) {
  var search = req.body.search
  console.log(search)
  query(`select * from user_info where user_name like '%${search}%' or user_id like '%${search}%' or email like '%${search}%'`, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//帖子列表界面搜索
apiRoutes.post('/forumSearch', function(req, res) {
  var search = req.body.search;
  console.log(search);
  query(`select user_info.*,bbs_topic.* from user_info,bbs_topic where user_info.user_id=bbs_topic.TUID and (user_info.user_name like '%${search}%' or bbs_topic.Ttopic like '%${search}%' or bbs_topic.TContent like '%${search}%')
    `, function(err, rows) {
    if (err) throw err;
    res.send(rows)
  })
});
//举报帖子
apiRoutes.post('/forumReport', function(req, res) {
  var report = req.body.report
  query(`insert into report(reportUid,reportedTid,reportType,reportReason) value(${report.reportUid},${report.reportedTid},'${report.type}','${report.reason}')`, function(err, rows) {
    console.log(err,rows)
    if (err) throw err;
    res.send(rows)
  })
});
//帖子管理界面
apiRoutes.post('/forumAdmin', function(req, res) {
  query(`select user_info.*, bbs_topic.*, report.* from user_info,bbs_topic,report where user_info.user_id=report.reportUid and bbs_topic.TID=report.reportedTid`, function(err, rows) {
    console.log(rows)
    if (err) throw err;
    res.send(rows)
  })
});
//删除被举报的帖子
apiRoutes.post('/deleteForum', function(req, res) {
  var TID = req.body.TID
  query(`delete from bbs_topic where TID = ${TID}`, function(err, rows) {
    console.log(rows)
    if (err) throw err;
    res.send(rows)
  })
});
//忽略被举报的帖子
apiRoutes.post('/ignoreForum', function(req, res) {
  var report_id = req.body.report_id
  query(`delete from report where report_id = ${report_id}`, function(err, rows) {
    console.log(rows)
    if (err) throw err;
    res.send(rows)
  })
});

app.use('/api', apiRoutes);


var compiler = webpack(webpackConfig)

var devMiddleware = require('webpack-dev-middleware')(compiler, {
  publicPath: webpackConfig.output.publicPath,
  quiet: true
})

var hotMiddleware = require('webpack-hot-middleware')(compiler, {
    log: () => {}
  })
  // force page reload when html-webpack-plugin template changes
compiler.plugin('compilation', function(compilation) {
  compilation.plugin('html-webpack-plugin-after-emit', function(data, cb) {
    hotMiddleware.publish({
      action: 'reload'
    })
    cb()
  })
})

// proxy api requests
Object.keys(proxyTable).forEach(function(context) {
  var options = proxyTable[context]
  if (typeof options === 'string') {
    options = {
      target: options
    }
  }
  app.use(proxyMiddleware(options.filter || context, options))
})

// handle fallback for HTML5 history API
app.use(require('connect-history-api-fallback')())

// serve webpack bundle output
app.use(devMiddleware)

// enable hot-reload and state-preserving
// compilation error display
app.use(hotMiddleware)

// serve pure static assets
var staticPath = path.posix.join(config.dev.assetsPublicPath, config.dev.assetsSubDirectory)
app.use(staticPath, express.static('static'))

var uri = 'http://localhost:' + port

devMiddleware.waitUntilValid(function() {
  console.log('> Listening at ' + uri + '\n')
})

module.exports = app.listen(port, function(err) {
  if (err) {
    console.log(err)
    return
  }

  // when env is testing, don't need open it
  if (autoOpenBrowser && process.env.NODE_ENV !== 'testing') {
    opn(uri)
  }
})


var email = require("emailjs");
var server = email.server.connect({
  user: "965113581@qq.com",
  password: "oxwbedplzbigbdfh",
  host: "smtp.qq.com",
  tls: {
    ciphers: "SSLv3"
  }
});

var message = {
  text: "由于你在Feary论坛的言论不当，您的帐号已被禁用，如有误禁，请联系管理员965113581@qq.com",
  from: "965113581@qq.com",
  to: "1614200424@qq.com",
  subject: "Feary论坛封号提醒"
};
// server.send(message, function(err, message) { console.log(err || message); });
