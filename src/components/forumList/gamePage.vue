<template>
<div class="indexPage ">

  <el-row type="flex">
    <div class="user" style='border:0;background:white;margin-top:40px'>
    <el-card class="box-card" style='width:98%;padding:0'>
      <div v-if='this.$store.state.loginId' style='background:#ddd;padding:10px 0'>
        <img :src='userShow.head' style='width:100px;height:100px;border:1px solid #ccc;'>
        <p style='color:red;font-weight:400;font-size:14px;padding:0;margin:0'><el-tag type="success">{{userShow.level|levelFilter}}</el-tag>{{userShow.user_name}}</p>
        <p style='padding:0;margin:0'>
          <span v-if='userShow.power' style='boder:1px solid yellow'>{{userShow.power}}</span>
        </p>
      </div>
      <ul style='list-style:none;text-align:center;padding:0' class='forumlist'>
        <li @click='lifePage()'>生活</li>
        <li @click='artPage()'>学习</li>
        <li @click='gamePage()'>游戏</li>
        <li @click='otherPage()'>其他</li>
        <li><el-button @click='gotoForumAdd()' style='font-size:12px;padding:5px;'>发帖</el-button></li>
      </ul>  
      
      </el-card>
    </div>
    <div class="content">
      <div class="forumSearch">
        <el-row :gutter="4">
          <el-col :span="8" :offset="13">
            <el-input v-model="search" placeholder=''></el-input>
          </el-col>
          <el-col :span="2">
            <el-button type="primary" @click='forumSearch()'>查找</el-button>
          </el-col>
        </el-row>
      </div>
      <ul v-for="bbs in bbsinfo" style='margin-top:10px'>
        <li @click="gotoBbs(bbs)" style='border:0;margin:0;padding:5px;margin-top:-10px'>
        <el-card class="box-card" style='width:100%'>
          <h2 style='font-size:14px'>
            <el-tag style='float:left' type="primary" v-if='bbs.TTYPE==1'>生活</el-tag>
            <el-tag style='float:left' type="success" v-if='bbs.TTYPE==2'>学习</el-tag>
            <el-tag style='float:left' type="warning" v-if='bbs.TTYPE==3'>游戏</el-tag>
            <el-tag style='float:left' type="" v-if='bbs.TTYPE==4'>其他</el-tag>                                           
            {{bbs.TTopic}}
          </h2>
          <p style='font-size:12px;margin-left:50px' v-if=''>{{bbs.TContent}}</p>
          <p style='overflow:hidden;padding-left:50px' v-if='0'><img v-if='bbs.TEmotion' style='' v-bind:src="bbs.TEmotion" /></p>
          <span class='el-icon-time' style='font-size:12px'> {{bbs.Ttime|timeFilter}}</span>
          <span style='color:#ffa640;font-size:12px'>{{bbs.user_name}}</span>
          </el-card>
        </li>
      </ul>
    </div>
  </el-row>

  <div class="block" v-if='pageShow'>
    <el-pagination @current-change="handleCurrentChange" :current-page="currentPage" :page-size="10" layout="prev, pager, next, jumper" :total="total">
    </el-pagination>
  </div>

</div>
</template>


<script>
export default {
  name: 'indexPage',
  data() {
    return {
      bbsinfo: [],
      currentPage: 1,
      total: 0,
      search: '',
      pageShow:true,
      userShow:[]
    }
  },
  methods: {
    lifePage(){
      this.$store.dispatch('changeTSID',{tsid:1})
      console.log(this.$store.state.currentTSID)
      this.$router.push('/lifePage')
    },
    artPage(){
      this.$store.dispatch('changeTSID',{tsid:2})
      console.log(this.$store.state.currentTSID)
      this.$router.push('/artPage')
    },
    gamePage(){
      this.$store.dispatch('changeTSID',{tsid:3})
      console.log(this.$store.state.currentTSID)
      this.$router.push('/gamePage')
    },
    otherPage(){
      this.$store.dispatch('changeTSID',{tsid:4})
      console.log(this.$store.state.currentTSID)
      this.$router.push('/otherPage')
    },
    loadData() {
      this.$http.post('/api/forumTypeList', {
        current: this.page
      }).then(response => {
        // get body data
        var forumList = response.body;
        console.log(forumList);
        this.bbsinfo = forumList
      }, response => {
        // error callback
        alert('error')
      });
    },
    handleCurrentChange(val) {
      this.currentPage = val;
      console.log(`当前页: ${val}`);
      this.page = (this.currentPage - 1) * 10;
      this.$http.post('/api/forumTypeList', {
        current: this.page
      }).then(response => {
        var forumList = response.body;
        console.log(forumList);
        this.bbsinfo = forumList
      }, response => {
        // error callback
        alert('error')
      });
    },
    forumSearch() {
      this.$http.post('/api/forumSearch', {
        search: this.search
      }).then(response => {
        var forumList = response.body;
        console.log(forumList);
        this.bbsinfo = forumList;
        this.pageShow=false
      }, response => {
        // error callback
        alert('error')
      });
    },
    gotoBbs(bbs) {
      var url = '/#/forumDetail?RTID=' + bbs.TID
      location.href = url;
    },
    gotoForumAdd(){
      if (!this.$store.state.loginId) {
        this.$alert('登陆后才能发表言论哦', '登陆', {
          confirmButtonText: '确定',
          callback: action => {
            this.$router.push('/loginPage');
          }
        });
        return
      }``
      this.$router.push('/forumAdd')
    }
  },
  beforeCreate() {
    this.$http.post('/api/forumTypeListInit', {type:this.$store.state.currentTSID}).then(response => {
      // get body data
      var forumList = response.body;
      console.log(forumList);
      if (forumList.length > 10) {
        this.total = forumList.length;
        forumList.length = 10
      }
      this.bbsinfo = forumList
    }, response => {
      // error callback
      alert('error')
    });
    this.$http.post('/api/userShow',{id:this.$store.state.loginId}).then(response=>{
      this.userShow=response.body[0]
    })
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


<style>
.indexPage {
  margin: 0;
  padding: 0;
}

.indexPage .carousel {
  width: 100%;
}

.indexPage .carousel div {
  height: 98%;
  border: 1px solid #ccc;
}

.indexPage .user {
  width: 210px;
  margin: 0;
  padding: 0;
  border: 1px dotted #ccc;
  height: 1000px;
  background: rgb(246, 246, 251)
}

.indexPage .content {
  width: 780px;
}

.indexPage .content ul {
  list-style: none;
  padding: 0;
  margin: 5px;
}

.indexPage .content ul li {
  border-bottom: 1px solid #ccc;
  margin: 0;
  padding: 10px;
  text-align: left;
  cursor: pointer;
  border-radius: 5px;
  overflow: hidden
}

.indexPage .content ul li span {
  float: right;
  margin-right: 10px;
}
</style>
