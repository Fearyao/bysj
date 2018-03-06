import Vue from 'vue'
import Router from 'vue-router'

//page
import Hello from '@/components/Hello'
import myPage from '@/components/myPage'
import loginPage from '@/components/loginPage/loginPage'
import userPage from '@/components/loginPage/userPage'
import indexPage from '@/components/indexPage/indexPage'
import registerPage from '@/components/registerPage/registerPage'
import forumDetail from '@/components/forumDetail/forumDetail'
import forumAdd from '@/components/forumAdd/forumAdd'
import userAdmin from '@/components/adminPage/userAdmin'
import forumAdmin from '@/components/adminPage/forumAdmin'
import lifePage from '@/components/forumList/lifePage'
import artPage from '@/components/forumList/artPage'
import gamePage from '@/components/forumList/gamePage'
import otherPage from '@/components/forumList/otherPage'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: indexPage
    },
    {
      path: '/myPage',
      name: 'myPage',
      component: myPage
    },
    {
      path: '/loginPage',
      name: 'loginPage',
      component: loginPage
    },
    {
      path: '/userPage',
      name: 'userPage',
      component: userPage
    },
    {
      path: '/indexPage',
      name: 'indexPage',
      component: indexPage
    },
    {
      path: '/registerPage',
      name: 'registerPage',
      component: registerPage
    },
    {
      path: '/forumDetail',
      name: 'forumDetail',
      component: forumDetail
    },
    {
      path: '/forumAdd',
      name: 'forumAdd',
      component: forumAdd
    },
    {
      path: '/userAdmin',
      name: 'userAdmin',
      component: userAdmin
    },
    {
      path: '/forumAdmin',
      name: 'forumAdmin',
      component: forumAdmin
    },
    {
      path: '/lifePage',
      name: 'lifePage',
      component: lifePage
    },
    {
      path: '/artPage',
      name: 'artPage',
      component: artPage
    },
    {
      path: '/gamePage',
      name: 'gamePage',
      component: gamePage
    },
    {
      path: '/otherPage',
      name: 'otherPage',
      component: otherPage
    }
  ]
})
