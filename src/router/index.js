import Vue from 'vue'
import VueRouter from 'vue-router'
//
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)
}

Vue.use(VueRouter)
const router = new VueRouter({
    routes: [
        {
            path: '',
            //redirect: '/home',name: 'index', 把/home设置为首页
            redirect: '/home',
            name: 'index',
            component: () => import('../views/Layout/index'),
            children: [{
                path: '/home',
                name: 'home',
                component: () => import('../views/components/Home/Home')
            },
            // {
            //     path: 'addblog',
            //     name: 'addblog',
            //     component: () => import('../views/components/Article/AddArticle')  
            // },
            {
                path: 'todos',
                name: 'todos',
                component: () => import('../components/Todos/Todos')
            },
            {
                path: 'tools',
                name: 'tools',
                component: () => import('../components/Tools/index'),
                children: [{
                    path: 'fanyi',
                    name: 'fanyi',
                    component: () => import('../components/Tools/Fanyi')
                },
                {
                    path: 'weather',
                    name: 'weather',
                    component: () => import('../components/Tools/Weather')
                },
                {
                    path: 'photos',
                    name: 'photos',
                    component: () => import('../components/Tools/Photo')
                }, {
                    path: 'word',
                    name: 'word',
                    component: () => import('../components/Tools/Word')
                },]
            },


            {
                path: 'usercenter',
                name: 'usercenter',

                meta: { isLogin: true },
                component: () => import('../../src/views/components/Usercenter/Usercenter'),
                // children: [{
                //     path: 'collection',
                //     name: 'collection',
                //     component: () => import('../../src/views/components/Usercenter/Collection'),
                // }, {
                //     path: 'basic',
                //     name: 'basic',
                //     component: () => import('../../src/views/components/Usercenter/Basic'),
                // }, {
                //     path: 'usercentercomment',
                //     name: 'usercentercomment',
                //     component: () => import('../../src/views/components/Usercenter/Comment'),
                // }, {
                //     path: 'usercentermessage',
                //     name: 'usercentermessage',
                //     component: () => import('../../src/views/components/Usercenter/Message'),
                // }]
            },
            {
                name: 'userinfoedit',
                path: 'userinfoedit',
                component: () => import('../components/Userinfoedit/Userinfoedit')
            },
            {
                name: 'photo',
                path: 'photo',
                component: () => import('../views/components/Photo/Photo')
            },
            {
                name: 'video',
                path: 'video',
                component: () => import('../views/components/Video/Video')
            },
            {
                name: 'article',
                path: 'article',
                component: () => import('../../src/views/components/Article/Article')
            },
            {
                name: 'articleinfo',
                path: 'articleinfo',
                component: () => import('../../src/components/ArticleInfo/ArticleInfo')
            },
            {
                name: 'search',
                path: 'search',
                component: () => import('../../src/components/Search/Search')
            },
            {
                name: 'messageinfo',
                path: 'messageinfo',
                component: () => import('../../src/components/Message/MessageInfo')
            },
            ]

        },

        {
            path: '/login',
            name: 'login',
            component: () => import('../views/components/Login/Login')
        },
        {
            path: '/register',
            name: 'register',
            component: () => import('../views/components/Register/Register')
        },
        {
            path: '/adminlogin',
            name: 'adminlogin',
            component: () => import('../Admin/AdminLogin/AdminLogin')
        },
        {
            path: '/admin',
            name: 'admin',
            meta: { isAdminLogin: true },
            component: () => import('../Admin/Layout/index'),
            children: [{
                path: 'userlist',
                name: 'userlist',
                component: () => import('../Admin/User/UserList')
            },
            {
                path: 'adduser',
                name: 'adduser',
                component: () => import('../Admin/User/AddUser')
            },
            {
                path: 'updateuser',
                name: 'updateuser',
                component: () => import('../Admin/User/UpdateUser')
            },
            {
                path: 'addphoto',
                name: 'addphoto',
                component: () => import('../Admin/Photo/AddPhoto')
            },
            {
                path: 'photolist',
                name: 'photolist',
                component: () => import('../Admin/Photo/PhotoList')
            },

            {
                path: 'home',
                name: '/admin/home',
                component: () => import('../Admin/Home/Home')
            },
            {
                path: 'articlelist',
                name: 'articlelist',
                component: () => import('../Admin/Article/ArticleList')
            },
            {
                path: 'huishouzhan',
                name: 'huishouzhan',
                component: () => import('../Admin/Article/Huishouzhan')
            },
            {
                path: 'addarticle',
                name: 'addarticle',
                component: () => import('../Admin/Article/Add')
            },
            {
                path: 'editarticle',
                name: 'editarticle',
                component: () => import('../Admin/Article/Edit')
            },
            {
                path: 'comment',
                name: 'comment',
                component: () => import('../Admin/Article/Comment')
            },
            {
                path: 'system',
                name: 'system',
                component: () => import('../Admin/System/System')
            },
            {
                path: 'videolist',
                name: 'videolist',
                component: () => import('../Admin/Video/VideoList')
            },
            {
                path: 'addvideo',
                name: 'addvideo',
                component: () => import('../Admin/Video/AddVideo')
            },
            {
                path: 'message',
                name: 'message',
                component: () => import('../Admin/Message/Message')
            },
            {
                path: 'category',
                name: 'category',
                component: () => import('../Admin/Category/Category')
            },
            ]
        }

    ]
})
//获取vuex数据
import store from '../store/index'
//用户路由拦截
router.beforeEach((to, from, next) => {
    // to and from are both route objects. must call `next`.
    //需要登录
    if (to.meta.isLogin) {
        let token = store.state.loginModule.userinfo.token
        if (token) {
            next()
        } else if (confirm('您还没有登录，确定登录吗？')) {
            next('/login')
            this.$router.go(-1)
        }
    } else {//不需要登录
        next()
    }
})
//管理员登录拦截
// router.beforeEach((to, from, next) => {
//     if (to.meta.isAdminLogin) {
//         let admintoken = store.state.loginModule.admininfo.token
//         if (admintoken) {
//             next()
//         }
//         else if (confirm('您还没有登录，确定登录吗？')) {
//             next('/adminlogin')
//         }
//     } else {//不需要登录
//         next()
//     }
// })
export default router