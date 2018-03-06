<template lang="html">
<div class="forumAdmin" v-if="this.$store.state.loginPower=='管理员'">
  <table cellspacing="0">
    <tr style='background:#ccc;height:40px;font-size:20px'>
      <td style='width:150px'>举报者</td>
      <td style='width:150px'>举报类型</td>
      <td style='width:250px'>原因</td>
      <td style='width:300px'>内容</td>
      <td style='width:150px'>操作</td>
    </tr>
    <tr v-for="forum in forumList" style='height:40px'>
      <td style='width:150px'>{{forum.user_name}}</td>
      <td style='width:150px'>{{forum.reportType}}</td>
      <td style='width:250px'>{{forum.reportReason}}</td>
      <td style='width:300px'><a href="#">{{forum.TContent}}</a></td>
      <td style='width:100px'>
        <el-button type="success" @click="ignore(forum)">忽略</el-button>
        <el-button type="danger" @click='deleteForum(forum)'>删帖</el-button>
      </td>
    </tr>
  </table>
  <h3 v-if='!this.forumList.length' style="color:#aaa;margin-top:200px">暂时没有被举报的帖子</h3>
</div>
</template>

<script>
export default {
  data() {
    return {
      forumList:''
    }
  },
  methods: {
    deleteForum(forum) {
      this.$http.post('/api/deleteForum', {
        TID: forum.TID
      }).then(function() {
        this.loadData()
      });
    },
    ignore(forum){
      console.log(forum)
      this.$http.post('/api/ignoreForum', {
        report_id:forum.report_id
      }).then(function() {
        this.loadData()
      });
    },
    loadData(){
      this.$http.post('/api/forumAdmin').then(response => {
        this.forumList = response.body;
        console.log(this.forumList)
      }, response => {
        alert('error')
      });
    }
  },
  beforeCreate() {
    this.$http.post('/api/forumAdmin').then(response => {
      this.forumList = response.body;
      console.log(this.forumList)
    }, response => {
      alert('error')
    });
  }
}
</script>

<style lang="stylus">
.forumAdmin
    width:1000px
      border:1px solid #ccc
    table tr:nth-child(odd)
      background:#c9e5f5
    table tr:hover
      background:#e2f0e4
</style>
