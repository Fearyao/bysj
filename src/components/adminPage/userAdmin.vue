<template>
<div class="userAdmin" v-if="this.$store.state.loginPower=='管理员'" style='margin-top:40px'>
  <div class="userSearch">
    <el-row :gutter="4">
      <el-col :span="8" :offset="13"><el-input v-model="search" placeholder=''></el-input></el-col>
      <el-col :span="2"><el-button type="primary" @click='userSearch()'>查找</el-button></el-col>
    </el-row>
  </div>
  <table cellspacing="0">
    <tr style='background:#ccc;height:40px;font-size:20px'>
      <td style='width:249px'>用户ID</td>
      <td style='width:249px'>用户名</td>
      <td style='width:249px'>Email</td>
      <td style='width:249px'>操作</td>
    </tr>
    <tr v-for="user in userList" style='height:40px'>
      <td style='width:249px'>{{user.user_id}}</td>
      <td style='width:249px'>{{user.user_name}}</td>
      <td style='width:249px'>{{user.email}}</td>
      <td style='width:249px'>
        <el-button type="info" @click="editUser(user)">设置</el-button>
        <el-button type="danger" v-if="user.admin!=1" @click='disableUser(user.user_id,user.email)'>封号</el-button>
        <el-button type="success" v-if="user.admin==1" @click='enableUser(user.user_id)'>解封</el-button>
      </td>
    </tr>
  </table>
  <el-dialog title="编辑用户信息" v-model="editShow">
    <el-form ref="form" :model="form" label-width="80px">
      <el-form-item label="名称">
        <el-input v-model="form.user_name"></el-input>
      </el-form-item>
      <el-form-item label="密码">
        <el-input v-model="form.password"></el-input>
      </el-form-item>
      <el-form-item label="邮箱">
        <el-input v-model="form.email"></el-input>
      </el-form-item>
      <el-form-item label="权限">
        <el-radio-group v-model="form.power" class="power">
          <el-radio label="用户"></el-radio>
          <el-radio label="管理员"></el-radio>
        </el-radio-group>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="editSubmit(form)">确定</el-button>
        <el-button @click='editCancle()'>取消</el-button>
      </el-form-item>
    </el-form>
  </el-dialog>
</div>
</template>

<script>
export default {
  data() {
    return {
      userList: '',
      editShow: false,
      form: '',
      search:''
    }
  },
  methods: {
    disableUser(id, email) {
      this.$http.post('/api/userDisable', {
        userId: id,
        email: email
      }).then(function() {
        this.loadData()
      });
    },
    enableUser(id) {
      this.$http.post('/api/userEnable', {
        userId: id
      }).then(function() {
        this.loadData()
      });
    },
    editUser(user) {
      this.editShow = false;
      this.editShow = true;
      this.form = user
    },
    editSubmit(form) {
      console.log(form)
      this.$http.post('/api/userEdit', {
        form:form
      }).then(function() {
        this.editShow=false;
        this.loadData()
      });
    },
    editCancle() {
      this.editShow = false
    },
    userSearch(){
      this.$http.post('/api/userSearch',{search:this.search}).then(response => {
          var userList = response.body;
          this.userList = userList
          }, response => {
          alert('error')
      });
    },
    loadData() {
      this.$http.post('/api/userAdmin').then(response => {
        var userList = response.body;
        this.userList = userList
      }, response => {
        alert('error')
      });
    }
  },
  beforeCreate() {
    console.log(this.$store.state)
      this.$http.post('/api/userAdmin').then(response => {
          var userList = response.body;
          this.userList = userList
          }, response => {
          // error callback
          alert('error')
      });
  }
}
</script>

<style lang="stylus">
.userAdmin
    width:1000px
    border:1px solid #ccc
    table tr:nth-child(odd)
        background:#c9e5f5
    table tr:hover
        background:#e2f0e4

</style>
