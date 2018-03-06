<template>
  <div class="userPage">
    <div class="head">
      <el-upload class="avatar-uploader" action="/api/userhead"
      :data={id:this.$store.state.loginId} :show-file-list="false" :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
        <img v-if="imageUrl" :src="imageUrl" class="avatar">
        <i v-else class="avatar-uploader-icon">上传头像</i>
      </el-upload>
    </div>
    <div class="userInfo">
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="名称">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="form.email"></el-input>
        </el-form-item>
        <el-form-item label="生日">
          <el-col :span="11">
            <el-date-picker type="date" placeholder="生日" v-model="form.birth" style="width: 100%;"></el-date-picker>
          </el-col>
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="form.gender" class="gender">
            <el-radio label="男"></el-radio>
            <el-radio label="女"></el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="onSubmit">确定</el-button>
          <el-button>取消</el-button>
        </el-form-item>
      </el-form>
    </div>

  </div>
</template>


<script>
  export default {
    data() {
      return {
        imageUrl: '',
        form: {
          name: '',
          email: '',
          birth: '',
          gender:'',
          id:this.$store.state.loginId
        }
      };
    },
    methods: {
      handleAvatarSuccess(res, file) {
        this.imageUrl = URL.createObjectURL(file.raw);
      },
      beforeAvatarUpload(file) {
        const isJPG = file.type === 'image/jpeg';
        const isLt2M = file.size / 1024 / 1024 < 2;

        if (!isJPG) {
          this.$message.error('上传头像图片只能是 JPG 格式!');
        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isJPG && isLt2M;
      },
      onSubmit() {
        console.log(this.form);
        this.$http.post('/api/userDetail',{userDetail:this.form}).then(response => {
         this.$notify({
          title: '成功',
          message: '修改成功',
          type: 'success'
         })
         }, response => {
         alert('error')
         });
      }
    }
  }

</script>


<style>
  .userPage {
    width: 1000px;
    margin-top:100px;
  }

  .avatar-uploader .el-upload {
    border: 1px dashed #000;
    width:100px;
    height:100px;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }

  .avatar-uploader .el-upload:hover {
    border-color: #20a0ff;
  }

  .avatar-uploader-icon {
    font-size: 20px;
    color: #8c939d;
    width: 100px;
    height: 100px;
    line-height: 100px;
    text-align: center;
  }

  .avatar {
    width: 100px;
    height: 100px;
    display: block;
  }

  .userPage .userInfo{
    width:400px;
    margin-left:275px;
  }
  .userPage .userInfo .gender{
    text-align:left;
  }

</style>
