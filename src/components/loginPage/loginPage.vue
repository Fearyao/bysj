<template>
<div class='loginPage'>
  <div class="formDivLogin">
    <h1>登陆</h1>
    <div class="el-row">
      <span class="closeSpan" @click="goBack()">X</span>
    </div>
    <el-form :model="login" :rules="rules2" ref="login" label-width="70px" class="demo-ruleForm">
      <el-form-item label="帐号" prop="name">
        <el-input v-model.number="login.name"></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="pass">
        <el-input type="password" v-model="login.pass" auto-complete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm(login)">登陆</el-button>
        <a href="#/registerPage" target="_self">
          <el-button>注册</el-button>
        </a>
      </el-form-item>
    </el-form>
  </div>
</div>
</template>

<style scoped>
   .loginPage .formDivLogin {
    width: 400px;
    height: 300px;
    margin-top:150px;
    margin-left: 300px;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
  }

  .loginPage .formDivLogin .closeSpan {
    cursor: pointer;
    float: right;
    position: relative;
    top: -100px;
    right: -10px;
  }

</style>

<script>
  export default {
    data() {
      var checkName = (rule, value, callback) => {
        if (!value) {
          return callback(new Error('帐号不能为空'))
        }
        setTimeout(() => {
          if (value.length > 18) {
            callback(new Error('帐号须小于18位'))
          }
        }, 1000)
      }
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'))
        }
      }
      return {
        login: {
          pass: '',
          name: ''
        },
        rules2: {
          pass: [{
            validator: validatePass,
            trigger: 'blur'
          }],
          name: [{
            validator: checkName,
            trigger: 'blur'
          }]
        }
      }
    },
    methods: {
      submitForm(user) {
        if(!user.name||!user.pass){
          return;
        }
        this.$http.post('/api/login', {
          username: user.name,
          password: user.pass
        }).then(response => {
          // get body data
          var bbsUser = response.body;
          console.log(bbsUser,'fadsfadsfasdf')
          if (bbsUser.length != 0) {
            if(bbsUser[0].admin=='1'){
              console.log('此帐号被禁用')
              this.$notify({
              title: '失败',
              message: '此帐号被禁用',
              type: 'warning'
            })
              return false
            }
            this.$store.dispatch('login',{id:bbsUser[0].user_id,name:bbsUser[0].user_name,power:bbsUser[0].power})
            document.cookie = "bbsUser=" + bbsUser;
            this.$notify({
              title: '成功',
              message: '登陆成功',
              type: 'success'
            })
            history.go(-1)
          } else {
            this.$notify({
              title: '错误',
              message: '用户名或密码错误',
              type: 'error'
            })
          }
        }, response => {
          // error callback
          alert('error')
        });
      },
      goBack() {
        window.history.go(-1);
      }
    }
  }

</script>
