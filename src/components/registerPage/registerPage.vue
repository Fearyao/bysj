<template>
<div class="registerPage">
  <div class="formDivRegister">
    <h1>注册</h1>
    <el-form :model="ruleForm2" :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm">
      <el-form-item prop="email" label="邮箱" :rules="[{ required: true, message: '请输入邮箱地址', trigger: 'blur' },{ type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur,change' }]">
        <el-input v-model="ruleForm2.email"></el-input>
      </el-form-item>
      <el-form-item label="用户名" prop="name">
        <el-input v-model="ruleForm2.name"></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="pass">
        <el-input type="password" v-model="ruleForm2.pass" auto-complete="off"></el-input>
      </el-form-item>
      <el-form-item label="确认密码" prop="checkPass">
        <el-input type="password" v-model="ruleForm2.checkPass" auto-complete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="register(ruleForm2)">注册</el-button>
        <el-button @click="goBack()">取消</el-button>
      </el-form-item>
    </el-form>
  </div>
</div>
</template>

<style scoped>
.formDivRegister {
  width: 400px;
  height: 400px;
  margin-left: 300px;
  margin-top: 150px;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 20px 30px 0px;
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
        if (value.length > 8) {
          callback(new Error('帐号须小于8位'))
        }
      }, 1000)
    }
    var validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'))
      } else {
        if (this.ruleForm2.checkPass !== '') {
          this.$refs.ruleForm2.validateField('checkPass')
        }
        callback()
      }
    }
    var validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'));
      } else if (value == this.password) {
        callback(new Error('两次输入密码不一致!'));
      } else {
        callback();
      }
    }
    return {
      ruleForm2: {
        name: '',
        pass: '',
        checkPass: '',
        email: ''
      },
      rules2: {
        pass: [{
          validator: validatePass,
          trigger: 'blur'
        }],
        name: [{
          validator: checkName,
          trigger: 'blur'
        }],
        checkPass: [{
          validator: validatePass2,
          trigger: 'blur'
        }]
      },
      imageUrl: ''
    };
  },
  methods: {
    goBack() {
      window.history.go(-2)
    },
    success() {
      this.$notify({
        title: '成功',
        message: '注册成功,您可以登陆啦',
        type: 'success'
      });
    },
    register(ruleForm2) {
      if (ruleForm2.checkPass && ruleForm2.pass && ruleForm2.name && ruleForm2.email) {
        console.log(ruleForm2)
        this.$http.post('/api/register', {
          username: ruleForm2.name,
          password: ruleForm2.pass,
          email: ruleForm2.email
        }).then(response => {
          // get body data
          var exist = response.body;
          console.log(exist)
          if (exist == 'EXISTED') {
            this.$message({
              message: '用户名已存在',
              type: 'warning'
            });
            return
          }
          this.$notify({
            title: '成功',
            message: '注册成功,您可以登陆啦',
            type: 'success'
          })
          history.go(-1);
        }, response => {
          // error callback
          alert('error')
        });
      }

    }
  }
}
</script>
