<template>
  <div id="app">
    <el-menu theme="dark" class="el-menu-demo topBar" mode="horizontal" style='text-align:center'>
      <el-menu-item index="1" @click="this.$router.push('/indexPage')">
        <a href="#/indexPage" target="_self"><img class="brandImg" src="./assets/band.png" alt="">首页</a>
      </el-menu-item>
      <el-submenu-item  index="2" v-if='this.$store.state.isLogined'>
        <template slot="title">个人中心
        </template>
        <el-menu-item index="2-4" @click='userDetail' style='color:white'>欢迎回来：{{this.$store.state.loginName}}<span v-if='this.$store.state.loginPower'>({{this.$store.state.loginPower}})</span></el-menu-item>
        <el-menu-item index="2-1" @click='userAdmin()' v-if="this.$store.state.loginPower=='管理员'">用户管理页面</el-menu-item>
        <el-menu-item index="2-1" @click='forumAdmin()' v-if="this.$store.state.loginPower=='管理员'">帖子管理页面</el-menu-item>
        <el-menu-item index="2-2" @click='userDetail'>个人中心</el-menu-item>
        <el-menu-item index="2-3" @click="logout">退出登陆</el-menu-item>
      </el-submenu-item>
      <el-menu-item index="3" v-if='!this.$store.state.isLogined'><a href="#/loginPage" target="_self" id="login">登陆/注册</a></el-menu-item>
    </el-menu>
    <div class="mainContent">
    <router-view class="router-view"></router-view>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'app',
    data () {
      return {

      }
    },
    methods : {
      logout () {
        console.log('logout')
         this.$store.dispatch('logout')
      },
      userDetail(){
        location.href = '/#/userPage';
      },
      userAdmin(){
        location.href = '/#/userAdmin';
      },
      forumAdmin(){
        location.href = '/#/forumAdmin';
      }
    }
  }


</script>

<style scoped>
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    color: #2c3e50;
    padding:0;
    margin:0;
    padding-top:55px;
  }
  #app .mainContent{
    width:100%;
    text-align:center;
  }
  #app .router-view{
    width:998px;
    display:inline-block;
  }
  .brandImg {
    width: 30px;
    position: relative;
    top: 10px;

  }

  .topBar{
    position:fixed;
    top:0;
    width:100%;
    padding:0;
    margin:0;
    z-index:1000;
    padding-left:120px;
    left:-8px;

  }
  .el-menu-item{
    cursor:pointer
  }
  .el-menu-item:hover{
    color:white;
    font-weight:bold
  }


</style>
