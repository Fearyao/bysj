// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import Vuex from 'vuex'
import vueResource from 'vue-resource'
import ElementUI from 'element-ui'
// import bootstrap from 'bootstrap/dist/css/bootstrap.css'
import 'element-ui/lib/theme-default/index.css'
import App from './App'
import router from './router'

Vue.config.productionTip = false
Vue.use(ElementUI)
Vue.use(Vuex)
Vue.use(vueResource)

var loginStore = new Vuex.Store({
  state: {
    isLogined: false,
    loginId:'',
    loginName:'',
    loginPower:'',
    currentTSID:1
  },
  mutations: {
    LOGIN (state,user) {
      state.isLogined=true;
      state.loginId=user.id;
      state.loginName=user.name;
      state.loginPower=user.power
    },
    LOGOUT (state){
      state.isLogined=false;
      state.loginId='';
      state.loginName='';
      state.loginPower='';
    },
    CHANGETSID(state,tsid){
      state.currentTSID=tsid.tsid
    }
  },
  actions:{
    login({commit},user){
      console.log(user,'sdfasdfasd')
      commit('LOGIN',user)
    },
    logout({commit}){
      commit('LOGOUT')
    },
    changeTSID({commit},tsid){
      commit('CHANGETSID',tsid)
    }

  }
})


new Vue({
  el: '#app',
  router,
  store:loginStore,
  template: '<App/>',
  components: { App }
})
