<template>
<div class="forumDetail">
  <ul>
    <li style='border:0'>
    <el-card class="box-card" style='width:100%'>
      <el-row type="flex">
        <el-col :span="5" class="replyer">
          <img style='width:120px;height:120px;margin:0 auto' v-if='topicDetail.head' :src='topicDetail.head' />
          <h1 style='color:#ffa640;padding:0;margin:0;font-size:20px'><el-tag style='position:relative;top:-5px' type="success">{{topicDetail.level|levelFilter}}</el-tag> {{topicDetail.user_name}}</h1>
          <p style='font-size:20px;margin:0'>楼主</p>
        </el-col>
        <el-col :span="19" class="replyContent" style="position:relative">
          <div class="reply">
            <p style="margin-left:30px;font-size:20px;font-weight:400">
              {{topicDetail.TContent}}
            </p>
            <p v-if='topicDetail.TEmotion'><img style='height:150px;margin-left:50px' v-bind:src="topicDetail.TEmotion" /></p>
            <div style="position:absolute;bottom:10px;right:20px">
              <el-button icon="edit" @click='gotoReplyTopic()' style="float:right;margin-bottom:10px;font-size:14px">回复</el-button>
              <el-button icon="warning" @click='reportDivShow()' style="float:right;margin-right:20px;font-size:14px">举报</el-button>
              <el-dialog title="举报" v-model="reportShow">
                <el-form :model="report">
                  <el-form-item label="举报类型" label-width="100px">
                    <el-select v-model="report.type" placeholder="举报类型">
                      <el-option label="恶心" value="恶心"></el-option>
                      <el-option label="反动" value="反动"></el-option>
                      <el-option label="其他" value="其他"></el-option>
                    </el-select>
                  </el-form-item>
                  <el-form-item label="举报原因" label-width="100px">
                    <el-input v-model="report.reason" auto-complete="off" style='width:500px'></el-input>
                  </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer" style='text-align:center'>
                  <el-button @click="reportCancle()">取 消</el-button>
                  <el-button type="primary" @click="reportSubmit()">确 定</el-button>
                </div>
              </el-dialog>
            </div>
          </div>
        </el-col>
      </el-row>
    </el-card>
    </li>
  </ul>
  <ul v-for="(reply,index) in replys" style="position:relative">
    <li style='border:0;margin-top:0'>
     <el-card class="box-card" style='width:100%'>
      <el-row type="flex">
        <el-col :span="5" class="replyer">
          <img style='width:120px;height:120px;margin:0 auto' v-bind:src="reply.head" />
          <h1 style='color:#ffa640;padding:0;margin:0;font-size:20px'><el-tag style='position:relative;top:-5px' type="success">{{reply.level|levelFilter}}</el-tag> {{reply.user_name}}</h1>
          <p style='font-size:20px'>{{index+1}}楼</p>
        </el-col>
        <el-col :span="19" class="replyContent">
          <div class="replyTo" style='padding:20px'>
            {{reply.RToUser}}:<br>
            <span style="margin-left:20px;">{{reply.RToContent}}</span>
          </div>
          <div class="reply">
            <p style="margin-left:20px;word-wrap:break-word">
              {{reply.RContent}}
            </p>
            <p style="margin-left:20px" v-if='reply.TEmotion'>
              <img style='height:150px' :src="reply.TEmotion">
            </p>
            <div style="position:absolute;bottom:-5px;right:20px">
              <span class='el-icon-time' style='font-size:12px'>{{reply.RTime|timeFilter}}</span>
              <span style="border:1px solid #ddd;padding:5px;border-radius:2px;cursor:pointer;margin-left:10px" @click="gotoReply(reply)"><i class="el-icon-edit"></i>回复</span>
            </div>
          </div>
        </el-col>
      </el-row>
      </el-card>
    </li>
  </ul>
  <div class="replyWrite">
  
    <el-input type='textarea' style='width:982px;font-size:20px' cols="100" rows="5" :placeholder='replyToWho' v-model='replyContent'></el-input>
    <div class="forumPicUp">
      <el-upload class="upload-demo" ref="upload" action="/api/forumImg" :on-preview="handlePreview" :on-remove="handleRemove" :file-list="fileList" :data={id:this.$store.state.loginId} :auto-upload="false">
        <el-button slot="trigger" size="small" type="" style='padding:11px' @click='clearList()'>选取图片</el-button>
        <el-button @click="replyAdd()">回复</el-button>
      </el-upload>
    </div>
  </div>
</div>
</template>

<script>
export default {
  name: 'forumDetail',
  data() {
    return {
      btshow: '',
      replys: [],
      replyContent: '',
      replyToReply: '',
      topicDetail: '',
      replyto: 0,
      replyToWho:'@楼主',
      reportShow: false,
      report: {
        reportUid: '',
        reportedTid: '',
        type: '',
        reason: ''
      },
      fileList: []
    }
  },
  methods: {
    submitUpload() {
      this.$refs.upload.submit();
    },
    handleRemove(file, fileList) {
      console.log(file, fileList);
    },
    handlePreview(file) {
      console.log(file);
    },
    clearList(){
      this.fileList=[]
    },
    gotoReply(reply) {
      this.replyto = 1;
      this.replyToWho = '@'+reply.user_name
      if (!this.$store.state.loginId) {
        this.$alert('登陆后才能发表言论哦', '登陆', {
          confirmButtonText: '确定',
          callback: action => {
            this.$router.push('/loginPage');
          }
        });
        return
      }
      this.replyToReply = reply;
      var replyWrite = this.$el.querySelector('.replyWrite');
      document.body.scrollTop = replyWrite.offsetTop;
    },
    gotoReplyTopic(reply) {
      this.replyto = 0;
      this.replyToWho = '回复楼主'
      if (!this.$store.state.loginId) {
        this.$alert('登陆后才能发表言论哦', '登陆', {
          confirmButtonText: '确定',
          callback: action => {
            this.$router.push('/loginPage');
          }
        });
        return
      }
      this.replyToReply = this.topicDetail;
      var replyWrite = this.$el.querySelector('.replyWrite');
      document.body.scrollTop = replyWrite.offsetTop;
    },
    replyAdd() {
      if(!this.replyContent){
        return
      }
       if (!this.$store.state.loginId) {
        this.$alert('登陆后才能发表言论哦', '登陆', {
          confirmButtonText: '确定',
          callback: action => {
            this.$router.push('/loginPage');
          }
        });
        return
      }
      if (this.replyto == 0) {
        console.log(this.topicDetail)
        this.$http.post('/api/replyAdd', {
          RUID: this.$store.state.loginId,
          RContent: this.replyContent,
          RToUser: this.topicDetail.user_name,
          RToContent: this.topicDetail.TContent,
          RTID: this.topicDetail.TID
        }).then(response => {
          this.submitUpload()
        }, response => {
          // error callback
          alert('error')
        })
      } else {
        this.$http.post('/api/replyAdd', {
          RUID: this.$store.state.loginId,
          RContent: this.replyContent,
          RToUser: this.replyToReply.user_name,
          RToContent: this.replyToReply.RContent,
          RTID: this.$route.query.RTID
        }).then(function(){
          this.submitUpload()
        })
      }
      let self=this
      setTimeout(function(){
           self.loadData()
      },1000)
    },
    reportDivShow() {
      if (!this.$store.state.loginId) {
        this.$alert('登陆后才能举报', '登陆', {
          confirmButtonText: '确定',
          callback: action => {
            this.$router.push('/loginPage');
          }
        });
        return
      }
      this.reportShow = false;
      this.reportShow = true;
      this.report.reportUid = this.$store.state.loginId;
      this.report.reportedTid = this.topicDetail.TID;
    },
    reportCancle() {
      this.reportShow = false;
    },
    reportSubmit() {
      console.log(this.report)
      this.$http.post('/api/forumReport', {
        report: this.report
      }).then(response => {
        this.reportShow = false
      }, response => {
        alert('error')
      });
    },
    loadData() {
      var rtid = this.$route.query.RTID;
      this.$http.post('/api/forumDetail', {
        RTID: rtid
      }).then(response => {
        // get body data
        var forumDetail = response.body;
        console.log(forumDetail);
        this.replys = forumDetail
      }, response => {
        // error callback
        alert('error')
      });
      this.replyto=0;
      this.replyContent='';
      this.fileList=[]
    }
  },
  beforeCreate() {
    var rtid = this.$route.query.RTID;
    //获取楼主发言
    console.log('louzhu')
    this.$http.post('/api/topicDetail', {
      RTID: rtid
    }).then(response => {
      // get body data
      var topicDetail = response.body;
      console.log(topicDetail);
      this.topicDetail = topicDetail[0]
    }, response => {
      // error callback
      alert('error')
    });
    //跟帖者发言
    console.log('gengtieze')
    this.$http.post('/api/forumDetail', {
      RTID: rtid
    }).then(response => {
      // get body data
      var forumDetail = response.body;
      console.log(forumDetail);
      this.replys = forumDetail
    }, response => {
      // error callback
      alert('error')
    });
  },
  filters:{
    timeFilter:function(value){
    var str,colorhead,colorfoot;
    var objD = new Date(value*1)
    var yy = objD.getYear();
    if(yy<1900) yy = yy+1900;
    var MM = objD.getMonth()+1;
    if(MM<10) MM = '0' + MM;
    var dd = objD.getDate();
    if(dd<10) dd = '0' + dd;
    var hh = objD.getHours();
    if(hh<10) hh = '0' + hh;
    var mm = objD.getMinutes();
    if(mm<10) mm = '0' + mm;
    var ss = objD.getSeconds();
    if(ss<10) ss = '0' + ss;
    str =  yy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss;
    return(str);
    },
    levelFilter:function(value){
      let level;
      if(value>1024){
        return level=10
      }
      else if(value>512){
        return level=9
      }
      else if(value>256){
        return level=9
      }
      else if(value>128){
        return level=8
      }
      else if(value>64){
        return level=7
      }
      else if(value>32){
        return level=6
      }
      else if(value>16){
        return level=5
      }
      else if(value>8){
        return level=4
      }
      else if(value>4){
        return level=3
      }
      else if(value>2){
        return level=2
      }
      else if(value>0){
        return level=1
      }
    }
  }
}
</script>




<style scoped>
.forumDetail ul {
  padding: 0;
  margin: 0;
  list-style: none;
}

.forumDetail ul li {
  padding: 5px;
  margin: 5px;
  border: 1px solid #ccc;
    font-size:14px;
}

.forumDetail ul li .replyer {
  padding: 0;
  margin: 0;
  background:rgb(247,248,250)
}

.forumDetail .replyContent {
  text-align: left;
}

.forumDetail .replyContent .replyTo {
  padding: 5px;
  margin: 10px;
  border: 1px solid #eee;
}

img {
  height: 150px;
}
</style>
