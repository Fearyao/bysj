<template>
<div class="forumAdd" style='margin-top:20px'>
<el-row>
<template style='float:left'>
  <el-select v-model="topicType" placeholder="发帖类型" style='float:left'>
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.label"
      :value="item.value">
    </el-option>
  </el-select>
</template>
</el-row>
  <el-row style='margin:10px 0'>
    <el-input type="text" placeholder="标题" v-model="forumTopic"></el-input> 
  </el-row>
  <el-row>
  </el-row>
  <el-row>
    <textarea cols="100" rows="10" v-model='forumContent'></textarea><br>
  </el-row>
  <el-row>
    <el-upload class="upload-demo" ref="upload" action="/api/topicImg" :on-preview="handlePreview" :on-remove="handleRemove" :file-list="file" :data={id:this.$store.state.loginId} :auto-upload="false">
        <el-button slot="trigger" size="small" type="" style='padding:11px' @click='clearList()'>选取图片</el-button>
    <el-button @click="forumAdd()">发表</el-button>
      </el-upload>
  </el-row>
</div>
</template>

<script>
export default {
  name: 'forumAdd',
  data() {
    return {
      forumTopic: '',
      forumContent: '',
      topicType:'',
      options: [{
          value: '1',
          label: '生活'
        }, {
          value: '2',
          label: '学习'
        }, {
          value: '3',
          label: '游戏'
        }, {
          value: '4',
          label: '其他'
        }],
        file:[]
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
    forumAdd() {
      console.log(this.$store.state);
      this.$http.post('/api/forumAdd', {
        TUID: this.$store.state.loginId,
        forumTopic: this.forumTopic,
        forumContent: this.forumContent,
        Ttype:this.topicType
      }).then(response => {
        this.submitUpload()
        history.go(-1)
      }, response => {
        // error callback
        alert('error')
      });
    }
  },
  beforeCreate() {

  }
}
</script>

<style lang="stylus">
.forumAdd
    .el-input
        width:200px
        float:left
        margin-left:160px
    ul
        padding-left:160px
        li
            list-style:none
            float:left
            margin-right:20px
            cursor:pointer
    textarea



</style>
